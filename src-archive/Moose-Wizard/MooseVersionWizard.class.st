Class {
	#name : #MooseVersionWizard,
	#superclass : #WizardControl,
	#instVars : [
		'configuration'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'instance creation' }
MooseVersionWizard class >> onConfiguration: aClass [
	"self onConfiguration: ConfigurationOfMoose"

	^ self onConfiguration: aClass updateProject: true
]

{ #category : #'instance creation' }
MooseVersionWizard class >> onConfiguration: aClass updateProject: trueOrFalse [
	"self onConfiguration: ConfigurationOfMoose updateProject: false"


	^ super new configuration: aClass; initializeContent: trueOrFalse ; open
]

{ #category : #accessing }
MooseVersionWizard >> configuration: aClass [

	configuration := aClass.
]

{ #category : #private }
MooseVersionWizard >> defaultVersionNumberFromSource: sourceVersionNumber within: versions commitType: commitType [
	"1.2.2 main -> 1.2.3
	 1.2.2 branch -> 1.2.2.1
	 1.2.2.1 branch -> 1.2.2.2
	 1.2.2.1 main -> 1.2.3
	In practice, always get the max minor number + 1"

	| versionBranches prefix lineVersions |
	prefix := self prefixMatching: sourceVersionNumber commitType: commitType.
	lineVersions := (versions reject: [:v| v blessing = #baseline ]) select: [:version| version versionNumber match: prefix ].
	^ lineVersions
			ifEmpty: [ sourceVersionNumber , '.1' ]
			ifNotEmpty: [ (lineVersions detectMax: [ :version | version ]) versionNumber copy incrementMinorVersionNumber printString ]

]

{ #category : #private }
MooseVersionWizard >> defaultVersionSelector: aVersionNumberString commitType: aSymbol [
	"Inspired by Metacello default selector template"
	| selectorPrefix |
	aSymbol = #branchDev
		ifTrue: [ selectorPrefix := 'branch' ]
		ifFalse: [ selectorPrefix := 'version' ].
	^ String streamContents: [:str|
			str nextPutAll: selectorPrefix;
				nextPutAll: ((aVersionNumberString copyWithout: $.) copyWithout: $-);
				nextPut: $: ]
]

{ #category : #'initialize-release' }
MooseVersionWizard >> initializeContent: shouldUpdateProject [

	| versions |
	"1) update project"
	shouldUpdateProject
		ifTrue: [ self selectedProjectInstance updateProject ].
		
	versions := self selectedProjectInstance versions.
	self addPane: (self initializeSourcePaneWith: versions).
	self addPane: (self initializeVersionPaneWith: versions).

]

{ #category : #'initialize-release' }
MooseVersionWizard >> initializeSourcePaneWith: versions [
	
	| sourcePane part1 part2 currentVersion |		
	sourcePane := WizardFirstPane named: 'New version for ', configuration asString.
	currentVersion := self selectedProjectInstance currentVersion.
	
	"part1 := MooseMetacelloRadioButtonsPart new."
	part1 := RadioButtonsPart new
				options: {#branchDev. #mainDev. #release};
				yourself.
	"lastDevelopmentVersion is specific to ConfigurationOfMoose"
	configuration lastDevelopmentVersion = currentVersion 
		ifTrue: [part1 defaultValue: #mainDev]
		ifFalse: [part1 defaultValue: #branchDev]. 
	
	part2 := DropListPart new 	
			list: (versions collect: [:each | each versionString ]);
			inGroupboxNamed: 'Source Version';
			defaultValue: (versions indexOf: currentVersion);
			yourself.
	
	sourcePane addPart: part1 associatedTo: #commitType .
	sourcePane addPart: part2 associatedTo: #sourceVersionNumber.
	
	^ sourcePane
]

{ #category : #'initialize-release' }
MooseVersionWizard >> initializeVersionPaneWith: versions [

	| lastPane part3 part4 part5 part6 |
	lastPane := WizardLastPane named: 'New version for ' , configuration asString.

	part3 := TextFieldPart new
		inGroupboxNamed: 'Target Version Number';
		defaultValue: [:requiredInputs|
			self
				defaultVersionNumberFromSource: ( requiredInputs at: #sourceVersionNumber)
				within: versions
				commitType: ( requiredInputs at: #commitType) ].

	part4 := TextFieldPart new
		inGroupboxNamed: 'Version Selector';
		defaultValue: [:requiredInputs| 
			self
				defaultVersionSelector: (requiredInputs at: #targetVersionNumber)
				commitType: (requiredInputs at: #commitType) ].
	

	part5 := DropListPart new
		list: #('stable' 'beta' 'development' 'broken');
		inGroupboxNamed: 'Blessing';
		defaultValue: [:requiredInputs| 
			(#(mainDev branchDev) includes: (requiredInputs at: #commitType))
				ifTrue: [ 'development' ]
				ifFalse: [ 'beta' ] ];
		yourself.

	part6 := (TextEditorPart inGroupboxNamed: 'Commit Message') textEditorVerticalSize: 175 ; textEditorHorizontalSize: 300; yourself.
	

	lastPane addPart: part3 associatedTo: #targetVersionNumber requiring: #(sourceVersionNumber commitType).
	lastPane addPart: part4 associatedTo: #versionSelector requiring: #(targetVersionNumber commitType).
	lastPane addPart: part5 associatedTo: #blessing requiring: #(commitType).
	lastPane addPart: part6 associatedTo: #message.

	^ lastPane
]

{ #category : #'wizard panes transition' }
MooseVersionWizard >> performTerminateButtonAction [

	
	| sourceVersion targetVersion versionSelector blessing projectMessage category project |
	super performTerminateButtonAction.
	sourceVersion := wizardInformations at: #sourceVersionNumber.
	targetVersion := wizardInformations at: #targetVersionNumber.
	versionSelector:= wizardInformations at: #versionSelector asSymbol. 
	blessing := wizardInformations at: #blessing.
	projectMessage := versionSelector, ' ', (wizardInformations at: #message).
	category := ((wizardInformations at: #commitType) = #branchDev)
		ifTrue: [ 'branches' ]
		ifFalse: [ 'versions' ].

	"spawn new version"	
	MetacelloVersionConstructor 
					spawnPackageMethodIn: self selectedClass new 
					category: category
					named: versionSelector
					sourceVersion: sourceVersion 
					targetVersion: targetVersion
					blessing: blessing asSymbol.

	"update version number"
	MetacelloVersionConstructor 
		updatePackageMethodIn: self selectedClass new
		sourceVersion: targetVersion.
	
	"save configuration"
	self saveProject: self selectedProjectInstance with: projectMessage
]

{ #category : #private }
MooseVersionWizard >> prefixMatching: sourceVersionNumber commitType: commitType [
	"1.2.2 main -> 1.2.*
	 1.2.2.1 main -> 1.2.*
	 1.2.2 branch -> 1.2.2.*
	 1.2.2.1 branch -> 1.2.2.*
	"

	| index |
	commitType = #branchDev
		ifTrue: [ index := 3 ]
		ifFalse: [ index := 2 ].
	^ (sourceVersionNumber asMetacelloVersionNumber copyFrom: 1 to: index) printString, '.*'
]

{ #category : #private }
MooseVersionWizard >> saveProject: project with: message [

	(project projectPackage goferCommitPackage: message)
		ifTrue: [ OBInformRequest message: project label, ' saved' ]
		ifFalse: [ OBInformRequest message: project label, ' not saved' ]
]

{ #category : #accessing }
MooseVersionWizard >> selectedClass [

	^configuration theNonMetaClass
]

{ #category : #accessing }
MooseVersionWizard >> selectedProjectInstance [

	^ self selectedClass new project
]
