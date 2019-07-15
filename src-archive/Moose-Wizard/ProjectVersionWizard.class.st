Class {
	#name : #ProjectVersionWizard,
	#superclass : #WizardControl,
	#instVars : [
		'configuration'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'instance creation' }
ProjectVersionWizard class >> onConfiguration: aClass [
	"self onConfiguration: ConfigurationOfMoose"

	^ self onConfiguration: aClass updateProject: true
]

{ #category : #'instance creation' }
ProjectVersionWizard class >> onConfiguration: aClass updateProject: trueOrFalse [
	"self onConfiguration: ConfigurationOfMoose updateProject: false"


	^ super new configuration: aClass; initializeContent: trueOrFalse ; open
]

{ #category : #accessing }
ProjectVersionWizard >> configuration: aClass [

	configuration := aClass.
]

{ #category : #'initialize-release' }
ProjectVersionWizard >> initializeContent: shouldUpdateProject [

	| versions |
	"1) update project"
	shouldUpdateProject
		ifTrue: [ self selectedProjectInstance updateProject ].
		
	versions := self selectedProjectInstance versions.
	self addPane: (self initializeSourcePaneWith: versions).
	self addPane: (self initializeVersionPaneWith: versions).

]

{ #category : #'initialize-release' }
ProjectVersionWizard >> initializeSourcePaneWith: versions [
	
	| sourcePane part1 part2 currentVersion |		
	sourcePane := WizardFirstPane named: 'New version for ', configuration asString.
	currentVersion := self selectedProjectInstance currentVersion.
		
	part2 := DropListPart new
								list: (versions collect: [:each | each versionString ]);
								inGroupboxNamed: 'Source Version';
								defaultValue: (versions indexOf: currentVersion);
								yourself.
	
	sourcePane addPart: part2 associatedTo: #sourceVersionNumber.
	
	^ sourcePane
]

{ #category : #'initialize-release' }
ProjectVersionWizard >> initializeVersionPaneWith: versions [

	| lastPane part3 part4 part5 part6 |
	lastPane := WizardLastPane named: 'New version for ' , configuration asString.

	part3 := TextFieldPart new
		inGroupboxNamed: 'Target Version Number';
		defaultValue: [:requiredInputs|
			(requiredInputs at: #sourceVersionNumber) asMetacelloVersionNumber copy incrementMinorVersionNumber ].

	part4 := TextFieldPart new
		inGroupboxNamed: 'Version Selector';
		defaultValue: [:requiredInputs| 
			('version', ((requiredInputs at: #targetVersionNumber) asString copyWithout: $.) copyWithout: $-), ':' ].

	part5 := DropListPart new
		list: #('stable' 'beta' 'development' 'broken');
		inGroupboxNamed: 'Blessing';
		defaultValue: [:dropListPart|
				part5 list indexOf: 'development' ];
		yourself.

	part6 := (TextEditorPart new)
				inGroupboxNamed: 'Commit Message';
				textEditorVerticalSize: 175 ;
				textEditorHorizontalSize: 300;
				yourself.
	

	lastPane addPart: part3 associatedTo: #targetVersionNumber requiring: #(sourceVersionNumber).
	lastPane addPart: part4 associatedTo: #versionSelector requiring: #(targetVersionNumber).
	lastPane addPart: part5 associatedTo: #blessing.
	lastPane addPart: part6 associatedTo: #message.

	^ lastPane
]

{ #category : #'wizard panes transition' }
ProjectVersionWizard >> performTerminateButtonAction [

	
	| sourceVersion targetVersion versionSelector blessing projectMessage category project |
	super performTerminateButtonAction.
	sourceVersion := wizardInformations at: #sourceVersionNumber.
	targetVersion := wizardInformations at: #targetVersionNumber.
	versionSelector:= wizardInformations at: #versionSelector asSymbol. 
	blessing := wizardInformations at: #blessing.
	projectMessage := versionSelector, ' ', (wizardInformations at: #message).
	category := 'versions'.

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
ProjectVersionWizard >> saveProject: project with: message [

	(project projectPackage goferCommitPackage: message)
		ifTrue: [ OBInformRequest message: project label, ' saved' ]
		ifFalse: [ OBInformRequest message: project label, ' not saved' ]
]

{ #category : #accessing }
ProjectVersionWizard >> selectedClass [

	^configuration theNonMetaClass
]

{ #category : #accessing }
ProjectVersionWizard >> selectedProjectInstance [

	^ self selectedClass new project
]
