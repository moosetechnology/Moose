"
A MooseWizardControl is the Wizard control of the moose wizard. It subclass the generic class WizardControl to make a specific action when the terminate button is pressed: open the moose finder. This class initialize itself its components (WizarPanes and WizardPart). Therefore, to use the moose wizard you just have to evaluate: 'MooseWizardControl new openFirstFrame'.

Instance Variables

"
Class {
	#name : #MooseImportFromSmalltalkImageWizard,
	#superclass : #WizardControl,
	#instVars : [
		'mooseModel'
	],
	#category : #'Moose-Finder'
}

{ #category : #initialization }
MooseImportFromSmalltalkImageWizard >> buildMooseWizardControl [
	
	self buildMooseWizardPackageControl.
	self buildMooseWizardModelAttributes.
]

{ #category : #initialization }
MooseImportFromSmalltalkImageWizard >> buildMooseWizardModelAttributes [

	| lastPane modelNameTextField mergeClassesCheckbox importSubclassesCheckbox computeAttributesCheckbox importerList importerAttributes strategyDropList metamodelFactoryList |
	lastPane := WizardLastPane new.
	
	metamodelFactoryList := DropListPart new
		list: (self listOfMetamodelFactories collect: #name);
		defaultValue: 1;
		inGroupboxNamed: 'Metamodel factory';
		yourself.
		
	modelNameTextField := TextFieldPart new 
		inGroupboxNamed: 'Type the name of the model'; 
		defaultValue: 'MooseModel'.
	
	mergeClassesCheckbox := CheckboxPart new
		label: 'Merge classes and metaclasses'";
		inGroupboxNamed: 'Class / Metaclass'".
	importSubclassesCheckbox := CheckboxPart new
		label: 'Import subclasses'";
		inGroupboxNamed: 'Class / Subclasses'".
	computeAttributesCheckbox := CheckboxPart new
		label: 'Compute type of attributes (using RoelTyper)';
		defaultValue: false;
		"inGroupboxNamed: 'Attributes declared type';"
		yourself.

	" IMPORTER "
	importerList := DropListPart new
		list: { MoosePharoImporterTask name };
		defaultValue: 1;
		inGroupboxNamed: 'Choose an importer';
		yourself.
	importerAttributes := MultiDependentCheckboxesPart new
		labelsAndDependencies: MooseImportingContext entityDependencies;
		inGroupboxNamed: 'Importing Context';  
		yourself.

	strategyDropList := DropListPart new 
		list: self listOfInvocationStrategies; 
		inGroupboxNamed: 'Select a strategy to compute invocation candidates'; 
		defaultValue: 2;
		yourself.

	lastPane 
		addPart: modelNameTextField
		associatedTo: #modelName.
	lastPane 
		addPart: metamodelFactoryList
		associatedTo: #metamodelFactory.
	lastPane 
		addPart: mergeClassesCheckbox
		associatedTo: #mergeClassMetaclass.
	lastPane 
		addPart: importSubclassesCheckbox
		associatedTo: #importSubclasses.
	lastPane 
		addPart: computeAttributesCheckbox
		associatedTo: #computeTypeOfAttributes.
	lastPane 
		addPart: importerList
		associatedTo: #importer.
	lastPane 
		addPart: importerAttributes
		associatedTo: #contextToImport.
	lastPane
		addPart: strategyDropList
		associatedTo: #candidateInvocationStrategy.
		
	self addPane: lastPane.
]

{ #category : #initialization }
MooseImportFromSmalltalkImageWizard >> buildMooseWizardPackageControl [
	"Here we initialize the first wizard panel, which is related to selecting the packages
	 that will be added to the model"

	| firstPane packageList packagePanel scriptCheckbox |
	firstPane := WizardFirstPane new.
	
	packageList := RPackage organizer packageNames asSortedCollection: [ :a :b | a < b ].
	packagePanel := MultiSelectionItemSelectorPart new 
		initialList: packageList;
		yourself.
		
	scriptCheckbox := CheckboxPart new 
		label: 'Create a script before importing the model';
		defaultValue: false.
		
	firstPane 
		addPart: packagePanel
		associatedTo: #packagesSelected.
	firstPane 
		addPart: scriptCheckbox 
		associatedTo: #createScript.
		
	self addPane: firstPane
]

{ #category : #'private - utilities' }
MooseImportFromSmalltalkImageWizard >> candidateListOperatorClass [
	"return the class corresponding to the strategy selected to compute candidates for invocations"
	
	| strategy |
	strategy := wizardInformations at: #candidateInvocationStrategy.
	strategy = 'Do not compute any candidate'
		ifTrue: [^ CandidateListOperatorNotAcceptingAnyReceiver ].
	strategy = 'Use the standard CandidateListOperator'
		ifTrue: [^ CandidateListOperator ].
	strategy = 'Compute for simple receivers ("self" "super" or a Class ) '
		ifTrue: [^ CandidateListOperatorAcceptingSimpleKindsOfReceiver  ].
	strategy = 'Compute for simple receivers and variables'
		ifTrue: [^ CandidateListOperatorAcceptingBasicAndVariableReceivers ].
	strategy = 'Compute for any kind of receiver'
		ifTrue: [^ CandidateListOperatorAcceptingAnyKindOfReceiver ].
	
]

{ #category : #'private - utilities' }
MooseImportFromSmalltalkImageWizard >> createImportingContext [
	<lint: 'String concatenation instead of streams' rationale: 'few concatenations' author: 'cyrille.delaunay'>
	"return an object ImportingContext coorresponding to the context selected by the user and the choice of merging or not classes and metaclasses "
	| tmpImportingContext |
	tmpImportingContext := MooseImportingContext new.
	((wizardInformations at: #contextToImport) select: [:anAssoc | anAssoc value = true] thenCollect: [:each | each key]) do: [ :each | tmpImportingContext perform: (#import , each) asSymbol ].
	(wizardInformations at: #mergeClassMetaclass)  ifTrue: [ tmpImportingContext mergeClassAndMetaclass ].
	(wizardInformations at: #importSubclasses) 
		ifTrue: [ tmpImportingContext importSubclasses ]
		ifFalse: [ tmpImportingContext doNotImportSubclasses].
	(wizardInformations at: #computeTypeOfAttributes) ifTrue: [tmpImportingContext computeTypeOfAttributes].
	^ tmpImportingContext
]

{ #category : #actions }
MooseImportFromSmalltalkImageWizard >> generateScriptForPackages: aCollectionOfPackageNames [

	| className scriptClass modelName packageNames methodSourceString contextItems |
	className := UIManager default 
		request: 'Enter class where to install the script'
		initialAnswer: 'MooseScripts'.
	scriptClass := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
	modelName := UIManager default 
		request: 'Enter name of the selector created class-side'
		initialAnswer: 'NewModel'.
	(modelName isNil or: [ modelName size = 0 ]) ifTrue: [ ^ self ].
	
	packageNames := '. ' join: (aCollectionOfPackageNames collect: [ :each | each surroundedBySingleQuotes ] ).
	contextItems := '. ' join: ((wizardInformations at: #contextToImport) collect: [ :each | each asString ] ) .

	methodSourceString := String new: 200 streamContents: [:str |
		str nextPutAll: 'create'; nextPutAll: modelName capitalized; cr.
		str tab.
		
		str nextPutAll: '^ MooseScripts createModelNamed: '.
		str nextPutAll: modelName surroundedBySingleQuotes.
		str cr ; tab ; tab.
		str nextPutAll: ' withPackages: {'.
		str nextPutAll: packageNames; nextPut: $}. 
		str cr ; tab ; tab.
		str nextPutAll: ' importer: '.
		str nextPutAll: self importerSelected asString.
		str cr ; tab ; tab.
		str nextPutAll: ' candidateClass: '.
		str nextPutAll: self candidateListOperatorClass asString.
		str cr ; tab ; tab.
		str nextPutAll: ' mergeClassMetaClass: '.
		str nextPutAll: (wizardInformations at: #mergeClassMetaclass) asString.
		str cr ; tab ; tab.
		str nextPutAll: ' contextItems: {'.
		str nextPutAll: contextItems ; nextPut: $}.
		str cr.
	].
	
	scriptClass class
			compile: methodSourceString
			classified: 'model'.
]

{ #category : #'private - utilities' }
MooseImportFromSmalltalkImageWizard >> importerSelected [
	"return the class of the importer selected by tthe user"
	^ Smalltalk at: (wizardInformations at: #importer)
]

{ #category : #initialization }
MooseImportFromSmalltalkImageWizard >> initialize [
	super initialize.
	self buildMooseWizardControl
]

{ #category : #accessing }
MooseImportFromSmalltalkImageWizard >> listOfInvocationStrategies [
	
	^ { 'Do not compute any candidate'. 
		'Use the standard CandidateListOperator'. 
		'Compute for simple receivers ("self" "super" or a Class ) '.
		'Compute for simple receivers and variables'.
		'Compute for any kind of receiver' }
]

{ #category : #accessing }
MooseImportFromSmalltalkImageWizard >> listOfMetamodelFactories [
	^ FMMetamodelFactory allFactories
]

{ #category : #accessing }
MooseImportFromSmalltalkImageWizard >> mooseModel [ 

	^ mooseModel 
]

{ #category : #'private - utilities' }
MooseImportFromSmalltalkImageWizard >> mooseModelNameFor: aCollectionOfPackageNames [ 
	"return the name that will be give to the moose model"
	| stream |
	stream := WriteStream on: ''.
	stream nextPutAll: 'Moose model for '.
	aCollectionOfPackageNames do: 
		[ :each | 
		(aCollectionOfPackageNames indexOf: each) = aCollectionOfPackageNames size 
			ifTrue: [ stream nextPutAll: each ]
			ifFalse: 
				[ stream
					nextPutAll: each;
					nextPutAll: ' - ' ] ].
	^ stream contents
]

{ #category : #'wizard panes transition' }
MooseImportFromSmalltalkImageWizard >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"
	"^self subclassResponsibility"
	super performTerminateButtonAction .
	self validateImportation.
	
]

{ #category : #actions }
MooseImportFromSmalltalkImageWizard >> validateImportation [
	"final action when the user click on the button ok: open a corresponding mooseFinder"

	| importer selectedPackages factory |
	factory := (self class environment at: (wizardInformations at: #metamodelFactory)) new.

	selectedPackages := wizardInformations at: #packagesSelected.

	(wizardInformations at: #createScript) ifTrue: [ self generateScriptForPackages: selectedPackages ].

	"we create the moose model with an appopriate name"
	mooseModel := factory modelClass named: (wizardInformations at: #modelName).

	"we create the importer"
	importer := self importerSelected new.

	"we set all the inportation parameters to the importer"
	importer
		importingContext: self createImportingContext;
		model: mooseModel;
		addFromPackagesNamed: selectedPackages;
		candidateClass: self candidateListOperatorClass;
		runWithProgress.

	mooseModel install
]
