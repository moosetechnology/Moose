Class {
	#name : #MerlinExamples,
	#superclass : #Object,
	#category : #'Merlin-Examples'
}

{ #category : #'basic morphic examples' }
MerlinExamples class >> branchesExample [  
	"self branchesExample"

	^ self branchesExampleUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> branchesExampleUsing: aMerlinRenderer [
	"self branchesExample"
	| wizardControl  wizardPane1  dropListPart textFieldPart wizardPane2 wizardPane3 dropListPart2 |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	
	wizardPane1 := WizardSinglePane new.
	wizardPane2 := WizardFirstPane new.
	wizardPane3 := WizardLastPane new.
	
	dropListPart := DropListPart new
						list: #(a b c d e f);
						callback: [:value :tmpPart |
							(#(a b c d e) includes: value) ifTrue: [
								wizardControl selectBranch: 2.
								dropListPart2 defaultItemSelected: value.
								tmpPart wizardPane refresh.
								]
							ifFalse: [
								tmpPart wizardPane refresh
								]
							];
						yourself.
						
	dropListPart2 := DropListPart new
						list: #(a b c d e f);
						callback: [:value :tmpPart |
							(#(a b c d e) includes: value) ifFalse: [
								wizardControl selectBranch: 1.
								dropListPart defaultItemSelected: value.
								tmpPart wizardPane refresh.
								]
							];
						yourself.
						
	textFieldPart := TextFieldPart new
						inGroupboxNamed: 'Enter your own value';
						defaultValue: 'g';
						yourself.    
	
	wizardPane1 row: dropListPart.
	wizardPane2 row: dropListPart2.
	wizardPane3 row: textFieldPart. 
	
	wizardControl addPane: wizardPane1.
	wizardControl addBranch.
	wizardControl selectBranch: 2.
	wizardControl addPane: wizardPane2.
	wizardControl addPane: wizardPane3.
	wizardControl selectBranch: 1.
	    
		
	wizardControl open. 
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> buttonPartUsing: aMerlinRenderer [

	| wizardControl  wizardPane1 listPart buttonPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	
	buttonPart := ButtonPart  new
						label: 'display selection';
						callback: [:requiredInputs :part | 
							part wizardPane refresh.
							UIManager default inform: ('selection : ', (#(a b c d e f g) at: (part requiredInputs at: #selection)))];
						yourself.
	
	listPart := ListPart new
				list: #(a b c d e f g);
				defaultValue: 1;
				useLatePopulateContents: false;
				yourself.
					
	wizardPane1 column: listPart associatedTo: #selection.
	wizardPane1 column: buttonPart requiring: {#selection}.	
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> chooseFilePart [
	"self chooseFilePart"

	^ self chooseFilePartUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> chooseFilePartUsing: aMerlinRenderer [
	"self chooseFilePart"

	| wizardControl  wizardPane1 checkboxPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	
	checkboxPart := ChooseFilePart  new
						validExtensions: 'mse';
						yourself.
		
	wizardPane1 row: checkboxPart.	
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> compositePart [
	"self compositePart"

	^ self compositePartUsing: MerlinMorphicWizardRenderer new
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> compositePartUsing: aMerlinRenderer [
	"self compositePart"

	| wizardControl  wizardPane1  dropListPart checkboxPart textFieldPart compositePart |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	
	checkboxPart := CheckboxPart  new
									label: 'select / unselect';
									defaultValue: true
									yourself.
	
	dropListPart := DropListPart  new
									list: #(1 2 3 4);
									defaultValue: 2;
									yourself.
				
	textFieldPart := TextFieldPart new
									defaultValue: 'hey';
									"textFieldHorizontalSize: 100"
									yourself. 
									
	compositePart := CompositePart new
									withTitlesAndParts: {'with checkbox' -> checkboxPart . 'with dropList' -> dropListPart . 'with textField' -> textFieldPart}.
		
		
	wizardPane1 row: compositePart.	
	
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> compositePartWithoutSpecifyingTabTitles [
	"self compositePartWithoutSpecifyingTabTitles"

	^ self compositePartWithoutSpecifyingTabTitlesUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> compositePartWithoutSpecifyingTabTitlesUsing: aMerlinRenderer [
	"self compositePartWithoutSpecifyingTabTitles"

	| wizardControl  wizardPane1  dropListPart checkboxPart textFieldPart compositePart |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	
	checkboxPart := CheckboxPart  new
									label: 'select / unselect';
									defaultValue: true
									yourself.
	
	dropListPart := DropListPart  new
									list: #(1 2 3 4);
									defaultValue: 2;
									yourself.
				
	textFieldPart := TextFieldPart new
									defaultValue: 'hey';
									"textFieldHorizontalSize: 100"
									yourself. 
									
	compositePart := CompositePart new
									withParts: {checkboxPart .  dropListPart .  textFieldPart}.
		
		
	wizardPane1 row: compositePart.	
	
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> compositeWithParametrizedParts [
	"self compositeWithParametrizedParts"

	^ self compositeWithParametrizedPartsUsing: MerlinMorphicWizardRenderer new    
	
]

{ #category : #'basic examples' }
MerlinExamples class >> compositeWithParametrizedPartsUsing: aMerlinRenderer [
	"self compositeWithParametrizedParts"

	| wizardControl  wizardPane1  dropListPart checkboxPart textFieldPart compositePart mainPart |
				
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	mainPart := DropListPart new
					list: #(true false);
					inGroupboxNamed: 'the selection will be propagated to all parts';
					defaultValue: 1;
					callback: [ :outputValue |
						checkboxPart selected: outputValue.
						dropListPart selectionIndex: (dropListPart list indexOf: outputValue).
						textFieldPart textEntryContents: outputValue asString. 
						];
					yourself.
	
	checkboxPart := CheckboxPart  new
									label: 'select / unselect';
									defaultValue: true;
									yourself.
	
	dropListPart := DropListPart  new
									list: #(true false);
									defaultValue: 2;
									yourself.
				
	textFieldPart := TextFieldPart new
									defaultValue: 'hey';
									"textFieldHorizontalSize: 100"
									yourself. 
									
	compositePart := CompositePart new
									withTitlesAndParts: {'with checkbox' -> checkboxPart . 'with dropList' -> dropListPart . 'with textField' -> textFieldPart}.
		
	wizardPane1 row: mainPart. 
	wizardPane1 row: compositePart.	
	
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> dropListsWithCondition [
	"self dropListsWithCondition"
	^ self dropListsWithConditionUsing: MerlinMorphicWizardRenderer new.
]

{ #category : #'basic examples' }
MerlinExamples class >> dropListsWithConditionUsing: aRenderer [
	"self dropListsWithCondition"

	| wizardControl  wizardPane1  firstDropListPartPart secondDropListPart textPart wizardPane2 |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstDropListPartPart := DropListPart  new
									inGroupboxNamed: 'First number';
									list: #(1 2 3 4 5 6 7 8 9);
									defaultValue: 1;
									yourself.
									
	secondDropListPart := DropListPart  new
									inGroupboxNamed: 'Second number';
									list: #(1 2 3 4 5 6 7 8 9);
									defaultValue: 1;
									yourself.
									
	textPart := TextPart new
					defaultValue: [:requiredInput |
						(requiredInput at: #firstNumber) asString , ' and ',  (requiredInput at: #secondNumber) asString
						];
					yourself.
		
		
	wizardPane1 column: firstDropListPartPart associatedTo: #firstNumber.
	wizardPane1 column: secondDropListPart associatedTo: #secondNumber.
	wizardPane2 row: textPart associatedTo: #result requiring: #(firstNumber secondNumber).
	
	wizardPane1 
		name: 'Sum should be 10';
		condition: [:wizardInformations |
			((wizardInformations at: #firstNumber) + (wizardInformations at: #secondNumber)) = 10] 
		named: 'The sum of the two number has to be equal to 10'.	
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2;
		yourself.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> itemsSelectorPart [
	"self itemsSelectorPart"

	^ self itemsSelectorPartUsing: MerlinMorphicWizardRenderer new  
]

{ #category : #'basic examples' }
MerlinExamples class >> itemsSelectorPartUsing: aMerlinRenderer [
	"self itemsSelectorPart"

	| wizardControl  wizardPane1 wizardPane2  itemsSelectorsPart listPart  |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	itemsSelectorsPart := ItemSelectorPart  new
							initialList: #(item1 item2 item3 item4);
							yourself.
							
	listPart := ListPart new
					initialList: [:requiredInputs | 
						(requiredInputs at: #selectedItems)
						];
					yourself.
		
	wizardPane1 row: itemsSelectorsPart associatedTo: #selectedItems.	
	wizardPane2 row: listPart requiring: {#selectedItems}.
		
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> modifyingWizardStructureInCallbacks [

	"self modifyingWizardStructureInCallbacks"
	^ self modifyingWizardStructureInCallbacksUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> modifyingWizardStructureInCallbacksUsing: aMerlinRenderer [

	"self modifyingWizardStructureInCallbacks"
	|wizard|
	wizard := WizardControl new.
	wizard renderer: aMerlinRenderer.
	wizard addPane: (
		WizardFirstPane new
			row: (
				DropListPart new
					inGroupboxNamed: 'How many checkboxes to you want to see ?';
					list: #(1 2 3 4 5);
					callback: [:number |
						|secondPane|
						wizard wizardPanes size > 1 ifTrue: [
							wizard removePaneAt: 2
							].
						secondPane := WizardLastPane new.
						(1 to: number) do: [:index | 
							secondPane row: CheckboxPart new.
							].
						wizard addPane: secondPane.
						];
					yourself
			)
	).
	wizard open.
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> modifyingWizardStructureInChooseFilePartCallbacks [

	"self modifyingWizardStructureInChooseFilePartCallbacks"
	^ self modifyingWizardStructureInChooseFilePartCallbacksUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> modifyingWizardStructureInChooseFilePartCallbacks2 [

	"self modifyingWizardStructureInChooseFilePartCallbacks2"
	^ self modifyingWizardStructureInChooseFilePartCallbacks2Using: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> modifyingWizardStructureInChooseFilePartCallbacks2Using: aRenderer [

	"self modifyingWizardStructureInChooseFilePartCallbacks2"
	|wizard filePart|
	wizard := WizardControl new.
	wizard renderer: aRenderer.
	filePart := ChooseFilePart new
					yourself.
					
	wizard addPane: (
		WizardFirstPane new
			row: filePart associatedTo: #path
	).
	wizard addPane: (
		WizardLastPane new
			row: (TextPart new
					defaultValue: [:requiredInputs |
						(requiredInputs at: #path) asString
						]
			) requiring: {#path}
	).
	
	wizard open.
]

{ #category : #'basic examples' }
MerlinExamples class >> modifyingWizardStructureInChooseFilePartCallbacksUsing: aRenderer [

	"self modifyingWizardStructureInChooseFilePartCallbacks"
	|wizard filePart|
	wizard := WizardControl new.
	wizard renderer: aRenderer.
	filePart := ChooseFilePart new
					callback: [:filepath :part|
						|secondPane|
						wizard wizardPanes size > 1 ifTrue: [
							wizard removePaneAt: 2
							].
						secondPane := WizardLastPane new.
						secondPane row: (TextPart new text: filepath asString; yourself).	
						wizard addPane: secondPane.
						];
					yourself.
					
	wizard addPane: (
		WizardFirstPane new
			row: filePart associatedTo: #path
	).
	
	wizard open.
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> multiCheckBoxesPart [
	"self multiCheckBoxesPart"

	^ self multiCheckBoxesPartUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> multiCheckBoxesPartUsing: aRendrer [
	"self multiCheckBoxesPart"

	| wizardControl  wizardPane1 wizardPane2  checkboxesPart textPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRendrer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	checkboxesPart := MultiCheckboxesPart  new
							labels: {'first checkbox'. 'second checkbox'. 'third checkbox'. 'fourth checkbox'};
							yourself.
							
	textPart := TextPart new
					defaultValue: [:requiredInputs | 
						|string|
						string := ''.
						(requiredInputs at: #selectedLabels) do: [:anAssoc |
							anAssoc value ifTrue: [
								string := string, ' ',anAssoc key
								].
							].
						string
						].
		
	wizardPane1 column: checkboxesPart associatedTo: #selectedLabels.	
	wizardPane2 column: textPart requiring: {#selectedLabels}.
		
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> multiCheckBoxesPartWithCallback [
	"self multiCheckBoxesPartWithCallback"

	self multiCheckBoxesPartWithCallbackUsing: MerlinMorphicWizardRenderer new  
	
]

{ #category : #'basic examples' }
MerlinExamples class >> multiCheckBoxesPartWithCallbackUsing: aRenderer [
	"self multiCheckBoxesPartWithCallback"

	| wizardControl  wizardPane1 checkboxesPart |
	wizardControl := WizardControl new.
	wizardPane1 := WizardSinglePane new.
	
	checkboxesPart := MultiCheckboxesPart  new
							labels: {'select/deselect all other checkboxes'. 'normal checkbox'. 'normal checkbox'. 'normal checkbox'};
							callback: [:output :wizardPart | 
								(output key = 'select/deselect all other checkboxes') ifTrue: [
									wizardPart options do: [:anOption |
										anOption = 'select/deselect all other checkboxes' ifFalse: [
											wizardPart setOption: anOption to:  output value  
											]
										]
									].
								
							];
							yourself.
						
		
	wizardPane1 row: checkboxesPart associatedTo: #selectedLabels.	
		
	wizardControl 
		addPane: wizardPane1.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> multiDependentCheckboxesPart [
	"self multiDependentCheckboxesPart"

	^ self multiDependentCheckboxesPartUsing: MerlinMorphicWizardRenderer new
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> multiDependentCheckboxesPartUsing: aRenderer [
	"self multiDependentCheckboxesPart"

	| wizardControl  wizardPane1 checkboxesPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardSinglePane new.
	
	checkboxesPart := MultiDependentCheckboxesPart  new
							labelsAndDependencies: (Dictionary new
								at: #label1 put: {#label2. #label3};
								at: #label2 put: {#label3};
								at: #label3 put: #();
								yourself
							);
							yourself.
							
	wizardPane1 row: checkboxesPart associatedTo: #selectedLabels.	
		
	wizardControl 
		addPane: wizardPane1.
		
	wizardControl open. 
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> multiDependentCheckboxesWithCallbackPart [

	"self multiDependentCheckboxesWithCallbackPart"
	^ self multiDependentCheckboxesWithCallbackPartUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> multiDependentCheckboxesWithCallbackPartUsing: aRenderer [
	"self multiDependentCheckboxesWithCallbackPart"

	| wizardControl  wizardPane1 wizardPane2  checkboxesPart listPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	listPart := ListPart new
				inGroupboxNamed: 'Selected options';
				list: #();
				yourself.
				
	checkboxesPart := MultiDependentCheckboxesPart  new
							labelsAndDependencies: (Dictionary new
								at: #label1 put: {#label2. #label3};
								at: #label2 put: {#label3};
								at: #label3 put: #();
								yourself
							);
							callback: [:outputValue |
								listPart list: (outputValue select: [:each | each value = true] thenCollect: [:each | each key])
								]
							yourself.
							
	
							
	wizardPane1 row: checkboxesPart associatedTo: #selectedLabels.	
	wizardPane2 row: listPart associatedTo: #selectedOptions.
	
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> multiSelectionItemsSelectorPart [
	"self multiSelectionItemsSelectorPart"

	^ self multiSelectionItemsSelectorPartUsing: MerlinMorphicWizardRenderer new  
]

{ #category : #'basic examples' }
MerlinExamples class >> multiSelectionItemsSelectorPartUsing: aRenderer [
	"self multiSelectionItemsSelectorPart"

	| wizardControl  wizardPane1 wizardPane2  itemsSelectorsPart listPart  |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	itemsSelectorsPart := MultiSelectionItemSelectorPart new
							initialList: #(item1 item2 item3 item4);
							yourself.
							
	listPart := ListPart new
					initialList: [:requiredInputs | 
						(requiredInputs at: #selectedItems)
						];
					yourself.
		
	wizardPane1 row: itemsSelectorsPart associatedTo: #selectedItems.	
	wizardPane2 row: listPart requiring: {#selectedItems}.
		
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2. 
		
	wizardControl open. 
	
	
]

{ #category : #'complete examples' }
MerlinExamples class >> numericalOperationsExample [
	"self numericalOperationsExample"
	| wizardControl firstPane middlePane lastPane firstNumberDropList operatorDropList secondNumberDropList |
	<lint: 'Long methods' rationale: 'Just an example of how to use the library ' author: 'cyrille.delaunay'>
	wizardControl := WizardControl new.
	firstPane := WizardFirstPane new.
	middlePane := WizardMiddlePane new.
	lastPane := WizardLastPane new.
	
	wizardControl addPane: firstPane.
	wizardControl addPane: middlePane.
	wizardControl addPane: lastPane.
	
	firstNumberDropList := DropListPart new
								list: #(1 2 3 4 5 6 7 8 9);
								useLatePopulateContents: false.
	operatorDropList := DropListPart new
								list: #(+ - * / );
								useLatePopulateContents: false.
	secondNumberDropList := DropListPart new
								list: #(1 2 3 4 5 6 7 8 9);
								useLatePopulateContents: false.
								
	firstPane 
		row: firstNumberDropList
		associatedTo: #firstNumber.
	middlePane
		row: operatorDropList
		associatedTo: #operator.
	lastPane 
		row: secondNumberDropList
		associatedTo: #secondNumber.
	wizardControl atEndDo: [:aDictionaryOfOutputs |
		|result|
		result := Smalltalk evaluate: 
			(aDictionaryOfOutputs at: #firstNumber) asString,
			(aDictionaryOfOutputs at: #operator) asString,
			(aDictionaryOfOutputs at: #secondNumber) asString.
		UIManager inform: 'The result is: ', result asString.
		].
	wizardControl open
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedChexboxes [
	"self parametrizedChexboxes"

	^ self parametrizedChexboxesUsing: MerlinMorphicWizardRenderer new  
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedChexboxesUsing: aRenderer [
	"self parametrizedChexboxes"

	| wizardControl  wizardPane1 wizardPane2 firstCheckBoxPart secondCheckBoxPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstCheckBoxPart := CheckboxPart new
									label: 'if selected, next one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: true;
									useLatePopulateContents: false;
									yourself.
									
	secondCheckBoxPart := CheckboxPart new
									label: 'selected if previous one not selected';
									inGroupboxNamed: 'Test';
									defaultValue: [:inputs | (inputs at: #firstCheckbocValue) not];
									yourself.
		
		
	wizardPane1 row: firstCheckBoxPart associatedTo: #firstCheckbocValue.
	wizardPane2 row: secondCheckBoxPart associatedTo: #secondCheckbocValue requiring: {#firstCheckbocValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedDropLists [
	"self parametrizedDropLists"

	^ self parametrizedDropListsUsing: MerlinMorphicWizardRenderer new
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedDropListsUsing: aRenderer [
	"self parametrizedDropLists"

	| wizardControl  wizardPane1 wizardPane2 firstDropListPartPart secondDropListPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstDropListPartPart := DropListPart  new
									inGroupboxNamed: 'Select an item';
									list: #('un' 'deux' 'trois' 'quatre');
									defaultValue: 'trois';
									useLatePopulateContents: false;
									yourself.
									
	secondDropListPart := DropListPart  new
									inGroupboxNamed: 'Same selection than previous dropList';
									defaultValue: [:inputs | (inputs at: #firstDropListValue) ];
									list: #('un' 'deux' 'trois' 'quatre');
									yourself.
		
		
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.
	wizardPane2 row: secondDropListPart associatedTo: #secondDropListValue requiring: {#firstDropListValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedLists [
	"self parametrizedLists"

	self parametrizedListsUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedListsUsing: aRenderer [
	"self parametrizedLists"

	| wizardControl  wizardPane1 wizardPane2 firstListPartPart secondListPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstListPartPart := ListPart  new
									inGroupboxNamed: 'Select an item';
									list: #('un' 'deux' 'trois' 'quatre');
									defaultValue: 1;
									useLatePopulateContents: false;
									yourself.
									
	secondListPart := ListPart  new
									inGroupboxNamed: 'Same selection than previous dropList';
									defaultValue: [:inputs | (inputs at: #firstListValue) ];
									list: #('un' 'deux' 'trois' 'quatre');
									yourself.
		
		
	wizardPane1 row: firstListPartPart associatedTo: #firstListValue.
	wizardPane2 row: secondListPart associatedTo: #secondListValue requiring: {#firstListValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedListsUsingRefresh [
	"self parametrizedListsUsingRefresh"

	^ self parametrizedListsUsingRefreshUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedListsUsingRefreshUsing: aRenderer [
	"self parametrizedListsUsingRefresh"

	| wizardControl  wizardPane1 wizardPane2 firstListPartPart secondListPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstListPartPart := ListPart  new
									inGroupboxNamed: 'Select an item';
									list: #('un' 'deux' 'trois' 'quatre');
									defaultValue: 1;
									useLatePopulateContents: false;
									callback: [:outputValue :thisPart |
										thisPart wizardPane refresh
										]
									yourself.
									
	secondListPart := ListPart  new
									inGroupboxNamed: 'Same selection than previous dropList';
									defaultValue: [:inputs | (inputs at: #firstListValue) ];
									list: #('un' 'deux' 'trois' 'quatre');
									yourself.
		
		
	wizardPane1 row: firstListPartPart associatedTo: #firstListValue.
	wizardPane2 row: secondListPart associatedTo: #secondListValue requiring: {#firstListValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedMorphDropLists [
	"self parametrizedMorphDropLists"

	^ self parametrizedMorphDropListsUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedMorphDropListsUsing: aRenderer [
	"self parametrizedMorphDropLists"

	| wizardControl  wizardPane1 wizardPane2 firstDropListPartPart secondDropListPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.

	firstDropListPartPart := MorphDropListPart  new
									inGroupboxNamed: 'Select an item';
									list: ({Color red . Color yellow . Color blue } collect: [:c | Morph new extent: 80@12; color: c]);
									defaultValue: 2;
									useLatePopulateContents: false;
									yourself.
									
	secondDropListPart := MorphDropListPart  new
									inGroupboxNamed: 'Same selection than previous dropList';
									defaultValue: [:inputs | (inputs at: #firstDropListValue) ];
									list: ({Color red . Color yellow . Color blue } collect: [:c | Morph new extent: 80@12; color: c]);
									yourself.
		
		
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.
	wizardPane2 row: secondDropListPart associatedTo: #secondDropListValue requiring: {#firstDropListValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedPrefixedSuffixedTextFields [
	"self parametrizedPrefixedSuffixedTextFields"

	^ self parametrizedPrefixedSuffixedTextFieldsUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedPrefixedSuffixedTextFieldsUsing: aRenderer [
	"self parametrizedPrefixedSuffixedTextFields"

	| wizardControl  wizardPane1 wizardPane2 firstTextFieldPart secondTextFieldPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstTextFieldPart := TextFieldPart  new
									inGroupboxNamed: 'yop';
									textEntryContents: 'default text';
									prefix: 'Enter text here : ';
									textFieldHorizontalSize: 100;
									yourself.
									
	secondTextFieldPart := TextFieldPart  new
									inGroupboxNamed: 'Same text than previous textField';
									suffix: ' is what you entered before';
									textFieldHorizontalSize: 100;
									defaultValue: [:inputs | (inputs at: #firstTextFieldValue) ];
									yourself.
		
		
	wizardPane1 row: firstTextFieldPart associatedTo: #firstTextFieldValue.
	wizardPane2 row: secondTextFieldPart associatedTo: #secondTextFieldValue requiring: {#firstTextFieldValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedTextEditorsUsing: aRenderer [
	"self parametrizedTextFields"

	| wizardControl  wizardPane1 wizardPane2 firstTextFieldPart secondTextFieldPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstTextFieldPart := TextEditorPart  new
									inGroupboxNamed: 'yop';
									defaultValue: 'default text';
									useLatePopulateContents: false;
									yourself.
									
	secondTextFieldPart := TextEditorPart  new
									inGroupboxNamed: 'Same text than previous textEditor';
									defaultValue: [:inputs | (inputs at: #firstTextFieldValue) ];
									yourself.
		
		
	wizardPane1 row: firstTextFieldPart associatedTo: #firstTextFieldValue.
	wizardPane2 row: secondTextFieldPart associatedTo: #secondTextFieldValue requiring: {#firstTextFieldValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> parametrizedTextFields [
	"self parametrizedTextFields"

	^ self parametrizedTextFieldsUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> parametrizedTextFieldsUsing: aRenderer [
	"self parametrizedTextFields"

	| wizardControl  wizardPane1 wizardPane2 firstTextFieldPart secondTextFieldPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	firstTextFieldPart := TextFieldPart  new
									inGroupboxNamed: 'yop';
									defaultValue: 'default';
									useLatePopulateContents: false;
									yourself.
									
	secondTextFieldPart := TextFieldPart  new
									inGroupboxNamed: 'Same text than previous textField';
									defaultValue: [:inputs | (inputs at: #firstTextFieldValue) ];
									yourself.
		
		
	wizardPane1 row: firstTextFieldPart associatedTo: #firstTextFieldValue.
	wizardPane2 row: secondTextFieldPart associatedTo: #secondTextFieldValue requiring: {#firstTextFieldValue}.
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> radioButtonsPart [
	"self radioButtonsPart"

	^ self radioButtonsPartUsing: MerlinMorphicWizardRenderer new  
	
]

{ #category : #'basic examples' }
MerlinExamples class >> radioButtonsPartUsing: aRenderer [
	"self radioButtonsPart"

	| wizardControl  wizardPane1 wizardPane2  radioButtonsPart textPart  |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	radioButtonsPart := RadioButtonsPart  new
							options: {#a. #b. #c};
							yourself.
						
	textPart := TextPart new
					defaultValue: [:requiredInputs |
						requiredInputs at: #optionSelected
						];
					yourself.
		
	wizardPane1 row: radioButtonsPart associatedTo: #optionSelected.
	wizardPane2 row: textPart requiring: {#optionSelected}.	
		
	wizardControl 
		addPane: wizardPane1;
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> textEditorUsing: aMerlinRenderer [
	"self itemsSelectorPart"

	| wizardControl  wizardPane1 textEditorPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aMerlinRenderer.
	wizardPane1 := WizardSinglePane new.
	
	textEditorPart := TextEditorPart  new
							defaultValue: 'type some text';
							yourself.
	
		
	wizardPane1 row: textEditorPart.	
		
	wizardControl 
		addPane: wizardPane1.
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> usingCallbackAndRefresh [
	"self usingCallbackAndRefresh"

	^ self usingCallbackAndRefreshUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> usingCallbackAndRefreshAndBlockAsDefaultValue [
	"self usingCallbackAndRefreshAndBlockAsDefaultValue"

	^ self usingCallbackAndRefreshAndBlockAsDefaultValueUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> usingCallbackAndRefreshAndBlockAsDefaultValueUsing: aRenderer [
	"self usingCallbackAndRefreshAndBlockAsDefaultValue"

	| wizardControl  wizardPane1  firstDropListPartPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardSinglePane new.
	
	firstDropListPartPart := DropListPart  new
									inGroupboxNamed: 'Select number of dropLists you want';
									list: #(1 2 3 4);
									defaultValue: 1;
									callback: [:outputValue | 
										wizardPane1 removeAllParts.
										wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.  
										1 to: outputValue do: [:index |
											wizardPane1 row: (DropListPart new list: #(1 2 3 4); defaultValue: [:requiredInputs | requiredInputs at: #firstDropListValue] ; inGroupboxNamed: index asString ; yourself) associatedTo: #doesntMatter requiring: {#firstDropListValue}. 
											].
										wizardPane1 refresh.
										];
									yourself.
									
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> usingCallbackAndRefreshUsing: aRenderer [
	"self usingCallbackAndRefresh"

	| wizardControl  wizardPane1  firstDropListPartPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardSinglePane new.
	
	firstDropListPartPart := DropListPart  new
									inGroupboxNamed: 'Select number of dropLists you want';
									list: #(1 2 3 4);
									defaultValue: 1;
									callback: [:outputValue | 
										wizardPane1 removeAllParts.
										wizardPane1 row: firstDropListPartPart.  
										1 to: outputValue do: [:index |
											wizardPane1 row: (DropListPart new list: #('hey' 'ho'); defaultValue: 1 ; inGroupboxNamed: index asString ; yourself). 
											].
										wizardPane1 refresh.
										];
									yourself.
									
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> usingCallbackOnCheckBox [
	"self usingCallbackOnCheckBox"

	^ self usingCallbackOnCheckBoxUsing: MerlinMorphicWizardRenderer new
	
	
]

{ #category : #'basic examples' }
MerlinExamples class >> usingCallbackOnCheckBoxUsing: aRenderer [
	"self usingCallbackOnCheckBox"

	| wizardControl  wizardPane1  firstDropCheckboxPart secondCheckboxPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardSinglePane new.
	
	secondCheckboxPart := CheckboxPart  new
									inGroupboxNamed: 'Same selection than checkbox on top';
									label: 'is selected according the checkbox on top'
									yourself.
	
	firstDropCheckboxPart := CheckboxPart  new
									inGroupboxNamed: 'Select or unselect';
									defaultValue: true;
									label: 'will select the checkbox below';
									callback: [:outputValue |  secondCheckboxPart selected: outputValue.   ];
									yourself.
									
	
		
		
	wizardPane1 row: firstDropCheckboxPart associatedTo: #firstCheckboxValue.
	wizardPane1 row: secondCheckboxPart associatedTo: #secondCheckValue.
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> usingCallbackOnDropList [
	"self usingCallbackOnDropList"

	^ self usingCallbackOnDropListUsing: MerlinMorphicWizardRenderer new
]

{ #category : #'basic examples' }
MerlinExamples class >> usingCallbackOnDropListUsing: aRenderer [
	"self usingCallbackOnDropList"

	| wizardControl  wizardPane1  firstDropListPartPart secondDropListPart |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardSinglePane new.
	
	firstDropListPartPart := DropListPart  new
									inGroupboxNamed: 'Select an item';
									list: #('un' 'deux' 'trois' 'quatre');
									defaultValue: 'trois';
									callback: [:outputValue :part| 
										secondDropListPart selectionIndex: (secondDropListPart list indexOf: outputValue). 
										part wizardPane refresh.
										];
									yourself.
									
	secondDropListPart := DropListPart  new
									inGroupboxNamed: 'Same selection than dropList on top';
									list: #('un' 'deux' 'trois' 'quatre');
									yourself.
		
		
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.
	wizardPane1 row: secondDropListPart associatedTo: #secondDropListValue.
		
	wizardControl 
		addPane: wizardPane1. 
		
	wizardControl open. 
	
	
]

{ #category : #'basic morphic examples' }
MerlinExamples class >> usingRowsAndColumns [
	"self usingRowsAndColumns"

	^ self usingRowsAndColumnsUsing: MerlinMorphicWizardRenderer new
	
]

{ #category : #'basic examples' }
MerlinExamples class >> usingRowsAndColumnsUsing: aRenderer [
	"self usingRowsAndColumns"

	| wizardControl  wizardPane1 wizardPane2 |
	wizardControl := WizardControl new.
	wizardControl renderer: aRenderer.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.
	
	wizardPane1 
		row: [:r | 
			r column: (TextFieldPart inGroupboxNamed: 'On my right: a DropList') ; column: (DropListPart new list: #(1 2 3 4 5); inGroupboxNamed: 'on my left: a textField')			
			];
		row: (TextPart new
				text:  'I should be alone in the second row';
				inGroupboxNamed: 'yep';
				yourself
				).
		
	wizardPane2 
		column: (TextPart new text: 'I should be alone in the first column';
					 inGroupboxNamed: 'yep';
					yourself);
		column: [:r | 
			r row: (TextFieldPart inGroupboxNamed: 'Below me: a DropList') ; row: (DropListPart new list: #(1 2 3 4 5); inGroupboxNamed: 'On top of me: a textField')			
			].
		
	wizardControl 
		addPane: wizardPane1 ; 
		addPane: wizardPane2.
		
	wizardControl open. 
	
	
]
