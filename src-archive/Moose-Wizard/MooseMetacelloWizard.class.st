Class {
	#name : #MooseMetacelloWizard,
	#superclass : #WizardControl,
	#instVars : [
		'configuration'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'instance creation' }
MooseMetacelloWizard class >> onConfiguration: aClass [
	"self onConfiguration: ConfigurationOfMoose"

	^ self onConfiguration: aClass updateProject: true
]

{ #category : #'instance creation' }
MooseMetacelloWizard class >> onConfiguration: aClass updateProject: trueOrFalse [
	"self onConfiguration: ConfigurationOfMoose updateProject: false"


	^ super new configuration: aClass; initializeContent: trueOrFalse ; open
]

{ #category : #private }
MooseMetacelloWizard >> commitPackageSpec: packageSpec into: repositoryList with: message [

	| gofer |
	gofer := Gofer new.
	gofer disablePackageCache.
	repositoryList do: [:repository | gofer repository: repository].
	gofer package: packageSpec name.
	gofer commit: message

]

{ #category : #accessing }
MooseMetacelloWizard >> configuration: aClass [

	configuration := aClass.
]

{ #category : #private }
MooseMetacelloWizard >> defaultVersionNumberFromSource: sourceVersionNumber within: versions commitType: commitType [
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
MooseMetacelloWizard >> defaultVersionSelector: aVersionNumberString commitType: aSymbol [
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
MooseMetacelloWizard >> initializeContent: shouldUpdateProject [

	| versions |
	"1) update project"
	shouldUpdateProject
		ifTrue: [ self selectedProjectInstance updateProject ].
		
	versions := self selectedProjectInstance versions.
	self addPane: (self initializeSourcePaneWith: versions).
	self addPane: (self initializeVersionPaneWith: versions).

]

{ #category : #'initialize-release' }
MooseMetacelloWizard >> initializeSourcePaneWith: versions [
	
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
MooseMetacelloWizard >> initializeVersionPaneWith: versions [

	| wizardControl firstPane part1 part2 lastPane part3 part4 part5 part6 secondPane part7 |

	lastPane := WizardLastPane named: 'New version for ' , configuration asString.

	part7 := TextPart 
					on: [:requiredInputs | self packagesNeedSavingAsStringForVersion: (requiredInputs at: #sourceVersionNumber)] 
					inGroupBoxNamed: 'Packages that will be saved'.
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
				ifTrue: ['development']
				ifFalse: ['beta']].

	part6 := (TextEditorPart inGroupboxNamed: 'Commit Message') textEditorVerticalSize: 175 ; textEditorHorizontalSize: 300; yourself.
	

	lastPane 
		column: [:c |
			c row: part3 associatedTo: #targetVersionNumber requiring: #(sourceVersionNumber commitType).
			c row: part4 associatedTo: #versionSelector requiring: #(targetVersionNumber commitType).
			c row: part5 associatedTo: #blessing requiring: #(commitType).
			c row: part6 associatedTo: #message.
			];
		column: part7 associatedTo: #packagesToBeSaved requiring: #(#sourceVersionNumber).
	
	^ lastPane
]

{ #category : #actions }
MooseMetacelloWizard >> packagesNeedSavingAsStringForVersion: aString [

	|project version dirtyPackages|
	project := self selectedProjectInstance.
	version := project version: aString.
	version ifNotNil: [
		dirtyPackages := project packagesNeedSaving: version versionString.
		dirtyPackages 
			ifEmpty: [
				^ 'None'.
				]
			ifNotEmpty: [
				^ (self stringForPackages: dirtyPackages).
				
				].
		].
	^ 'not computable'
	
]

{ #category : #'wizard panes transition' }
MooseMetacelloWizard >> performTerminateButtonAction [

	| sourceVersion targetVersion versionSelector blessing commitMessage project version dirtyPackages category projectMessage |
	
	super performTerminateButtonAction.
	sourceVersion := wizardInformations at: #sourceVersionNumber.
	targetVersion := wizardInformations at: #targetVersionNumber.
	versionSelector:= wizardInformations at: #versionSelector asSymbol. 
	blessing := wizardInformations at: #blessing.
	commitMessage := wizardInformations at: #message.
	projectMessage := versionSelector, ' ', commitMessage.
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
					blessing: blessing.

	"retrieve dirty packages"
	project := self selectedProjectInstance.
	version := project version: targetVersion.
	dirtyPackages := project packagesNeedSaving: version versionString.
	
	dirtyPackages ifEmpty: [ "save config directly if no dirty packages"
		self saveProject: project with: projectMessage.
		^ self ]. 
		
	"save packages"
	dirtyPackages do: [:assoc |
		assoc key goferCommitPackage: commitMessage ].
	"update version number"
	MetacelloVersionConstructor 
		updatePackageMethodIn: self selectedClass new
		sourceVersion: targetVersion.
	
	"save configuration"
	self saveProject: project with: projectMessage
]

{ #category : #private }
MooseMetacelloWizard >> prefixMatching: sourceVersionNumber commitType: commitType [
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
MooseMetacelloWizard >> saveProject: project with: message [

	(project projectPackage goferCommitPackage: message)
		ifTrue: [ OBInformRequest message: project label, ' saved' ]
		ifFalse: [ OBInformRequest message: project label, ' not saved' ]
]

{ #category : #accessing }
MooseMetacelloWizard >> selectedClass [

	^configuration theNonMetaClass
]

{ #category : #accessing }
MooseMetacelloWizard >> selectedProjectInstance [

	^ self selectedClass new project
]

{ #category : #private }
MooseMetacelloWizard >> stringForPackages: aSetOfPackagesAndrepositories [

	^ String streamContents: [:str |
		aSetOfPackagesAndrepositories do: [ :assoc |
			str
				nextPutAll: '*'; 
				nextPutAll: assoc key name;
				nextPutAll: ' => ';
				nextPutAll: assoc value description;
				cr ]
		]

]
