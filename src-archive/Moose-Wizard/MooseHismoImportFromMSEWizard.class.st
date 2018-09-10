Class {
	#name : #MooseHismoImportFromMSEWizard,
	#superclass : #WizardControl,
	#instVars : [
		'selectedDirectory',
		'versions',
		'selectedImporting',
		'hismoImporter',
		'importWithFilter'
	],
	#category : #'Moose-Wizard'
}

{ #category : #creating }
MooseHismoImportFromMSEWizard >> createAutomaticImportingPane [

	| wizardPane listPart datePatternPart strategyPart numberPart |
	
	wizardPane := WizardLastPane named: 'Automatic Importing (2/3)'.

	listPart := ListPart new
		inGroupboxNamed: 'MSE files found in selected folder';
		initialList: versions keys sorted; 
		yourself.

	datePatternPart := TextFieldPart new 
		inGroupboxNamed: 'Type the date pattern in the MSE files (for example: ''dd-mm-yyyy'')'; 
		defaultValue: 'dd-mm-yyyy';
		yourself.
	
	strategyPart := DropListPart  new
		inGroupboxNamed: 'Select the strategy to import the MSE files';
		list: (MooseHismoImporter strategyMethods);
		defaultValue: 1;
		yourself.
						
	numberPart := TextFieldPart new 
		inGroupboxNamed: 'Type the number of days, months or years if you selected either everyNDays:, everyNMonths: or everyNYears:'; 
		yourself.
	
	wizardPane row: listPart.
	wizardPane addPart: datePatternPart associatedTo: #datePattern.
	wizardPane addPart: strategyPart associatedTo: #strategy.
	wizardPane addPart: numberPart associatedTo: #n.
	
	self addPane: wizardPane
]

{ #category : #creating }
MooseHismoImportFromMSEWizard >> createFirstPane [

	| wizardPane directoryPart hismoNamePart |

	wizardPane := WizardFirstPane named: 'Hismo importer (1/3)'.

	hismoNamePart := TextFieldPart new 
		inGroupboxNamed: 'Type the name of the Hismo model'.

	directoryPart := DirectoryChoosePart new 
		inGroupboxNamed: 'Select the directory with the MSE files';
		callback: [ :returnedValue | 
			selectedDirectory := returnedValue.
			self createLastPane ];
		yourself.
	
	wizardPane addPart: hismoNamePart associatedTo: #hismoModelName.
	wizardPane row: directoryPart.
	self addPane: wizardPane.
	self validateInput: wizardPane
]

{ #category : #private }
MooseHismoImportFromMSEWizard >> createHismoModel [
	
	hismoImporter createHismoModel.
	hismoImporter installHismoModel
]

{ #category : #creating }
MooseHismoImportFromMSEWizard >> createLastPane [
	
	self wizardPanes size >= 3
		 ifTrue: [ self removePaneAt: 3 ].
		
	versions := ((selectedDirectory entries select: [ :each | each name endsWith: '.mse' ]) collect: [ :each | each basename -> each fullName ]) asDictionary.

	(selectedImporting = #manually) 
		ifTrue: [self createManualImportingPane]
		ifFalse: [self createAutomaticImportingPane]
]

{ #category : #creating }
MooseHismoImportFromMSEWizard >> createManualImportingPane [

	| wizardPane selectedVersionsPart |
	
	wizardPane := WizardLastPane named: 'Manual Importing (3/3)'.
	selectedVersionsPart := MultiSelectionItemSelectorPart new
		inGroupboxNamed: 'Select the MSEs';
		initialList: versions keys sorted;
		yourself.
	
	wizardPane addPart: selectedVersionsPart associatedTo: #selectedVersions.
	self addPane: wizardPane.
]

{ #category : #creating }
MooseHismoImportFromMSEWizard >> createMiddlePane [
	
	| wizardPane selectedImportingPart useFilterPart |
	
	self wizardPanes size >= 2
		 ifTrue: [ self removePaneAt: 2 ].
	
	wizardPane := WizardMiddlePane named: 'Set how to import the Hismo Model (2/3)'.

	selectedImportingPart := RadioButtonsPart  new
		inGroupboxNamed: 'Select how to import the MSE files';
		options: #(#manually #automatically);
		callback: [ :returnedValue |
			selectedImporting := returnedValue.
			self createLastPane ].

	useFilterPart := MultiCheckboxesPart  new
		inGroupboxNamed: 'Import entities using a filter?';
		labels: #('use filter');
		deselectAllOptions;
		callback: [ :outputValue |
			self setFilterPartForPane: wizardPane whenFilterIsSelected: outputValue value ]
		yourself.
		
	wizardPane row: selectedImportingPart.
	wizardPane addPart: useFilterPart associatedTo: #useFilter.
	self addPane: wizardPane
]

{ #category : #private }
MooseHismoImportFromMSEWizard >> fullNameForVersion: aVersion [

	^ versions at: aVersion
]

{ #category : #private }
MooseHismoImportFromMSEWizard >> hismoModelName [

	| hismoModelName |
	
	hismoModelName := wizardInformations at: #hismoModelName.
	hismoModelName isEmptyOrNil ifTrue: [^ 'HismoModel'].
	^ hismoModelName
]

{ #category : #private }
MooseHismoImportFromMSEWizard >> importingContext [

	| importingContext contextSelected useFilter |
	
	useFilter := wizardInformations at: #useFilter.
	useFilter first value ifFalse: [ ^ nil ].
	
	contextSelected := (wizardInformations at: #contextSelected) 
		select: [ :each | each value ] thenCollect: [ :each | each key asSymbol ].
	
	"importingContext := FAMIXStandardImportingContext new.
	importingContext importAll: contextSelected."
	
	importingContext := MooseImportingContext new.
	importingContext entityKindsToBeExtracted: contextSelected.
	
	^ importingContext
]

{ #category : #initialization }
MooseHismoImportFromMSEWizard >> initialize [
	
	super initialize.
	
	selectedDirectory := FileSystem workingDirectory.
	selectedImporting := #manually.
	importWithFilter := true.
	hismoImporter := MooseHismoImporter new.
	
	self createFirstPane.
	self createMiddlePane.
	self createLastPane
]

{ #category : #'wizard panes transition' }
MooseHismoImportFromMSEWizard >> performTerminateButtonAction [
	
	super performTerminateButtonAction.
	
	hismoImporter hismoModelName: self hismoModelName.
	hismoImporter importingContext: self importingContext.
	
	(selectedImporting = #manually) 
		ifTrue: [self terminateManualImporting ]
		ifFalse: [self terminateAutomaticImporting ]
]

{ #category : #creating }
MooseHismoImportFromMSEWizard >> setFilterPartForPane: wizardPane whenFilterIsSelected: filterIsSelected [

	| filterPart |
	
	wizardPane removeSubComponentAt: 3.
	filterIsSelected
		ifTrue: [
			
			filterPart := MultiCheckboxesPart new 
				inGroupboxNamed: 'Select the entities to be imported';
				labels: MooseImportingContext entityDependencies keys sorted;
				"labels: FAMIXStandardImportingContext new entityDependencies keys;"
				deselectAllOptions.
				
			wizardPane addPart: filterPart associatedTo: #contextSelected].
		
	wizardPane refresh
]

{ #category : #'wizard panes transition' }
MooseHismoImportFromMSEWizard >> terminateAutomaticImporting [ 

	| n datePattern strategySymbol |
	
	strategySymbol := (wizardInformations at: #strategy) asSymbol.
	datePattern := wizardInformations at: #datePattern.
	n := wizardInformations at: #n.
	
	"Include all the mses. They will be selected based on the stategy"
	hismoImporter versions: versions.
	hismoImporter datePattern: datePattern.
	"Setting the strategy. If it contains argument, set it too"
	(strategySymbol numArgs = 0)
		ifTrue: [hismoImporter perform: strategySymbol ]
		ifFalse: [hismoImporter perform: strategySymbol with: n ].
	
	self createHismoModel
]

{ #category : #'wizard panes transition' }
MooseHismoImportFromMSEWizard >> terminateManualImporting [

	| selectedVersions |
	
	selectedVersions := wizardInformations at: #selectedVersions.
	"versions is a dictionary with version name and version fullName"
	hismoImporter versions: (selectedVersions collect: [ :each | each -> (self fullNameForVersion: each)]) asDictionary.
	hismoImporter importAll.
	self createHismoModel
]

{ #category : #private }
MooseHismoImportFromMSEWizard >> validateInput: wizardPane [

	wizardPane 
		condition: [ :wi |
			(selectedDirectory entries select: [ :each | each fullName endsWith: '.mse' ]) notEmpty ] 
		named: 'You have to select a directory with MSE files'
]
