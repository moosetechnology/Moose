"
I am a form that allows user to import smalltalk packages as Moose model objects.
"
Class {
	#name : #MooseImportFromSmalltalkForm,
	#superclass : #MooseImportForm,
	#instVars : [
		'packagesButton',
		'modelNameField',
		'factoryDroplist',
		'importerDroplist',
		'mergeCheckBox',
		'subclassesCheckBox',
		'typeOfAttributesCheckBox',
		'importingContext',
		'invocationStrategyDroplist',
		'packageNames',
		'contextCheckBoxes',
		'entitiesToImport'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #specs }
MooseImportFromSmalltalkForm class >> defaultSpec [

	^ SpBoxLayout newVertical
]

{ #category : #specs }
MooseImportFromSmalltalkForm class >> title [
	^ 'Import model from Pharo image'
]

{ #category : #initialization }
MooseImportFromSmalltalkForm class >> windowExtent [

	^ 500 @ 500
]

{ #category : #updating }
MooseImportFromSmalltalkForm >> addContext: context [

	entitiesToImport add: context.
	(MooseImportingContext entityDependencies at: context) do: [ 
		:dependency | 
		(self contextCheckBoxes detect: [ :checkBox | 
			 checkBox label = dependency asString ]) state: true ]
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> contextCheckBoxes [

	^ contextCheckBoxes
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> contextLayout [

	| contextLayout context |
	contextLayout := SpBoxLayout newHorizontal.

	context := MooseImportingContext entityDependencies keys sort:
		           #yourself ascending.
	(context groupsOf: context size // 3 + 1) do: [ :group | 
		| subLayout |
		subLayout := SpBoxLayout newVertical.
		group do: [ :c | 
			| checkBox |
			checkBox := SpCheckBoxPresenter new
				            label: c;
				            state: true;
				            whenActivatedDo: [ self addContext: c ];
				            whenDeactivatedDo: [ self removeContext: c ];
				            yourself.
			subLayout add: checkBox.
			contextCheckBoxes add: checkBox ].
		contextLayout add: subLayout ].
	^ contextLayout
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 8;
		  add: self modelNameLayout height: self class buttonHeight;
		  add: self packageButtonLayout height: self class buttonHeight;
		  add: self metamodelFactoryLayout height: self class buttonHeight;
		  add: #mergeCheckBox height: self class labelHeight;
		  add: #subclassesCheckBox height: self class labelHeight;
		  add: #typeOfAttributesCheckBox height: self class labelHeight;
		  add: self importerClassLayout height: self class buttonHeight;
		  add: self contextLayout;
		  add: self invocationStrategyLayout
		  height: self class buttonHeight;
		  yourself
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> factoryClass [
	^ factoryDroplist selectedItem
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> importerClass [
	^ importerDroplist selectedItem
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> importerClassLayout [

	^ SpPanedLayout newHorizontal
		  add: 'Importer: ';
		  positionOfSlider: 1.5 / 5;
		  add: #importerDroplist;
		  yourself
]

{ #category : #initialization }
MooseImportFromSmalltalkForm >> initialize [

	packageNames := OrderedCollection new.
	importingContext := MooseImportingContext new.
	entitiesToImport := MooseImportingContext entityDependencies keys
		                    asOrderedCollection.
	contextCheckBoxes := OrderedCollection new.
	super initialize
]

{ #category : #'initialization - widgets' }
MooseImportFromSmalltalkForm >> initializeConfigurationCheckBoxes [
	mergeCheckBox := self newCheckBox
		label: 'Merge classes and metaclasses';
		whenActivatedDo: [ importingContext mergeClassAndMetaclass ];
		whenDeactivatedDo: [ importingContext distinguishClassAndMetaclass ];
		state: true;
		yourself.
	subclassesCheckBox := self newCheckBox
		label: 'Import subclasses';
		whenActivatedDo: [ importingContext importSubclasses ];
		whenDeactivatedDo: [ importingContext doNotImportSubclasses ];
		state: true;
		yourself.
	typeOfAttributesCheckBox := self newCheckBox
		label: 'Compute type of attributes (using RoelTyper)';
		whenActivatedDo: [ importingContext computeTypeOfAttributes ];
		whenDeactivatedDo: [ importingContext doNotComputeTypeOfAttributes ];
		yourself
]

{ #category : #'initialization - widgets' }
MooseImportFromSmalltalkForm >> initializeDroplists [
	factoryDroplist := self newDropList
		items: FMMetamodelFactory allFactories;
		yourself.
	importerDroplist := self newDropList
		items: {MoosePharoImporterTask};
		display: [ :item | item name ];
		yourself
]

{ #category : #'initialization - widgets' }
MooseImportFromSmalltalkForm >> initializeInvocationStrategyDroplist [
	invocationStrategyDroplist := self newDropList
		items: AbstractCandidateListOperator allSubclasses;
		display: [ :class | class description ];
		selectItem: CandidateListOperator;
		yourself
]

{ #category : #'initialization - widgets' }
MooseImportFromSmalltalkForm >> initializeModelNameField [
	modelNameField := self newTextInput
		text: 'MooseModel';
		yourself
]

{ #category : #'initialization - widgets' }
MooseImportFromSmalltalkForm >> initializePackagesButton [

	packagesButton := self newButton
		label: 'Choose packages';
		action: [ (MooseSmalltalkPackagesSelector on: self) openDialogWithSpec ];
		yourself
]

{ #category : #initialization }
MooseImportFromSmalltalkForm >> initializePresenters [

	super initializePresenters.
	self layout: self defaultLayout.
	self initializeModelNameField.
	self initializePackagesButton.
	self initializeDroplists.
	self initializeConfigurationCheckBoxes.
	self initializeInvocationStrategyDroplist
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> invocationStrategyLayout [
	^ SpBoxLayout newHorizontal
		add: 'Invocation candidates computation:';
		add: #invocationStrategyDroplist;
		yourself
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> metamodelFactoryLayout [

	^ SpPanedLayout newHorizontal
		  add: 'Metamodel factory: ';
		  positionOfSlider: 1.5 / 5;
		  add: #factoryDroplist;
		  yourself
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> modelName [
	^ modelNameField text
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> modelNameLayout [
	^ SpBoxLayout newHorizontal
		add: 'Model name: ';
		add: #modelNameField;
		yourself
]

{ #category : #layout }
MooseImportFromSmalltalkForm >> packageButtonLayout [
	^ SpBoxLayout newHorizontal
		add: SpNullPresenter new;
		add: #packagesButton width: self class buttonWidth * 2;
		add: SpNullPresenter new;
		yourself
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> packages [
	^ packageNames
]

{ #category : #accessing }
MooseImportFromSmalltalkForm >> packages: anObject [
	packageNames := anObject
]

{ #category : #action }
MooseImportFromSmalltalkForm >> privateImportModel [

	| mooseModel |
	self flag: #TODO.
	"Equivalent of (wizardInformations at: #createScript) ifTrue: [ self generateScriptForPackages: selectedPackages ]"
	self setImportingContext.

	"Create model"
	mooseModel := self factoryClass new modelClass named: self modelName.

	"Set importation parameters then import"
	self importerClass new
		importingContext: importingContext;
		model: mooseModel;
		addFromPackagesNamed: packageNames;
		candidateClass: invocationStrategyDroplist selectedItem;
		runWithProgress.

	^ mooseModel
]

{ #category : #updating }
MooseImportFromSmalltalkForm >> removeContext: context [

	entitiesToImport remove: context.
	(MooseImportingContext entityDependencies select: [ :values | 
		 values includes: context ]) keysDo: [ :dependency | 
		(self contextCheckBoxes detect: [ :checkBox | 
			 checkBox label = dependency asString ]) state: false ]
]

{ #category : #action }
MooseImportFromSmalltalkForm >> setImportingContext [
	entitiesToImport
		do: [ :each | importingContext perform: ('import' , each) asSymbol ]
]

{ #category : #updating }
MooseImportFromSmalltalkForm >> updatePackagesButton [
	packagesButton
		help:
			(String
				streamContents: [ :s | 
					packageNames
						do: [ :name | 
							s
								<< name;
								cr ] ]) trim
]
