Class {
	#name : #MooseImportFromMseWizard,
	#superclass : #WizardControl,
	#category : #'Moose-Wizard'
}

{ #category : #example }
MooseImportFromMseWizard class >> example [

	"self example"
	self new open.
]

{ #category : #'private-utilities' }
MooseImportFromMseWizard >> createImportingContext [
	<lint: 'String concatenation instead of streams' rationale: 'few concatenations' author: 'cyrille.delaunay'>
	"return an object ImportingContext coorresponding to the context selected by the user and the choice of merging or not classes and metaclasses "
	| tmpImportingContext importingContextClass contextSelected |
	importingContextClass := wizardInformations at: #importingContextClass.
	tmpImportingContext := importingContextClass  new.
	contextSelected := (wizardInformations at: #contextSelected).
	
	tmpImportingContext importAll: contextSelected .
	
	^ tmpImportingContext
]

{ #category : #'initialize-release' }
MooseImportFromMseWizard >> initialize [
	 
	| wizardPane1 wizardPart1 wizardPane2 wizardPart2 wizardPart3 wizardPart3Collection |
	super initialize.
	wizardPane1 := WizardFirstPane named: 'Select a MSE file'.
	wizardPane2 := WizardLastPane named: 'Select the context to import'.
	
	wizardPart1 := ChooseFilePart new.
	
	"wizardPart2 := MooseContextCheckboxesPart  withAll: Dictionary new."
	
	wizardPart3Collection := #('import all' 'use standard FAMIX context' 'use context from all Moose metaModel').
	wizardPart3 := DropListPart new
						list: wizardPart3Collection ; 
						inGroupboxNamed: 'Context strategy'; 
						defaultValue:  1;
						callback: [:outputValue |
							|importingContextClass|
							importingContextClass := (MooseAbstractImportingContext contextFromIndex: (wizardPart3Collection indexOf: outputValue)).
							wizardPane2 removeSubComponentAt: 2.
							importingContextClass ifNotNil: [
								wizardPane2 addPart: (MultiDependentCheckboxesPart new labelsAndDependencies: importingContextClass new entityDependencies) associatedTo: #contextSelected.
								].
							wizardPane2 refresh.
							];
						yourself.
	"wizardPart3 := MooseListOfContextsAvailablePart updatingCorrespondingContextCheckboxesFrom: wizardPart2" .
	

	wizardPane1 addPart: wizardPart1 associatedTo: #mseFilePath.
	

	"wizardPart2 := MooseImportingContextAllCheckboxesDisplayedPart new."	
	wizardPane2 addPart: wizardPart3 associatedTo: #importingContextClass.
	
	self addPane: wizardPane1.
	self addPane: wizardPane2
	


]

{ #category : #'wizard panes transition' }
MooseImportFromMseWizard >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"
	"^self subclassResponsibility"
	super performTerminateButtonAction .
	self validateImportation.
	
]

{ #category : #actions }
MooseImportFromMseWizard >> validateImportation [

	| mooseModel wizardMessagePane |
	"["
	mooseModel := MooseModel new 
		importFromMSEStream:
						(StandardFileStream readOnlyFileNamed: (wizardInformations at: #mseFilePath)) 
		filteredBy: ( self createImportingContext).
	mooseModel install.

	"]

		on: Error 
		do: [:ex |
			wizardMessagePane:= WizardMessagePane new. 
			wizardMessagePane addPart: (TextDisplayPart forText:'Invalid MSE file caued Error:  ', ex description)  associatedTo: nil.
			self addPane: wizardMessagePane .
			wizardMessagePane open.
			]."
]
