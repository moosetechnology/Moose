Class {
	#name : #WizardPaneFlowTest,
	#superclass : #TestCase,
	#instVars : [
		'dropListSelectedValue'
	],
	#category : #'Merlin-Tests'
}

{ #category : #tests }
WizardPaneFlowTest >> testWizardMiddlePaneFlow [
	| wizardControl wizardPane1 wizardPane2 wizardPane3 firstDropListPart firstListPart |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardMiddlePane new.
	wizardPane3 := WizardLastPane new.

	firstDropListPart := DropListPart new
		inGroupboxNamed: 'Select a number';
		list: #(1 2 3 4);
		defaultValue: 1;
		callback: [ :outputValue | dropListSelectedValue := outputValue ];
		yourself.

	firstListPart := ListPart new
		inGroupboxNamed: 'Same selection than previous dropList';
		defaultValue: 2;
		list: #('un' 'deux' 'trois' 'quatre');
		callback: [ :outputValue | outputValue ];
		yourself.

	wizardPane1 row: firstDropListPart associatedTo: #firstDropListValue.
	wizardPane2 row: firstListPart associatedTo: #secondDropListValue.


	wizardControl
		addPane: wizardPane1;
		addPane: wizardPane2;
		addPane: wizardPane3.

	wizardControl
		atEndDo: [ :aDictionaryOfOutputs | 
			self assert: (aDictionaryOfOutputs at: #firstDropListValue) equals: 1.
			self assert: (aDictionaryOfOutputs at: #secondDropListValue) equals: 2 ].

	wizardControl open.
	wizardControl performNextButtonAction.
	wizardControl performNextButtonAction.
	wizardControl performTerminateButtonAction
]

{ #category : #tests }
WizardPaneFlowTest >> testWizardPanesFlow [
	| wizardControl wizardPane1 wizardPane2 firstDropListPartPart wizardLabel |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.

	firstDropListPartPart := DropListPart new
		inGroupboxNamed: 'Select a number';
		list: #(1 2 3 4);
		defaultValue: 4;
		callback: [ :outputValue | 
			dropListSelectedValue := outputValue.
			wizardPane2 removeAllParts.
			wizardLabel := TextPart new
				text: 'You selected ' , outputValue asString;
				yourself.
			wizardPane2 row: wizardLabel.
			wizardPane2 refresh ];
		yourself.

	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.

	wizardControl
		addPane: wizardPane1;
		addPane: wizardPane2.

	wizardControl atEndDo: [ :aDictionaryOfOutputs | self assert: (aDictionaryOfOutputs at: #firstDropListValue) equals: 4 ].
	wizardControl open.
	wizardControl performNextButtonAction.
	wizardControl performTerminateButtonAction
]

{ #category : #tests }
WizardPaneFlowTest >> testWizardPanesSecondValueFlow [
	| wizardControl wizardPane1 wizardPane2 firstDropListPartPart wizardLabel secondDropListPart |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardFirstPane new.
	wizardPane2 := WizardLastPane new.

	firstDropListPartPart := DropListPart new
		inGroupboxNamed: 'Select a number';
		list: #(1 2 3 4);
		defaultValue: 1;
		callback: [ :outputValue | 
			dropListSelectedValue := outputValue.
			wizardPane2 removeAllParts.
			wizardLabel := TextPart new
				text: 'In the second DropList you selected ' , outputValue asString;
				yourself.
			wizardPane2 row: wizardLabel.
			wizardPane2 refresh ];
		yourself.
	secondDropListPart := DropListPart new
		inGroupboxNamed: 'Select a number';
		list: #(1 2 3 4);
		defaultValue: 2;
		yourself.


	wizardPane1 row: secondDropListPart associatedTo: #firstDropListValue.
	wizardPane1 row: firstDropListPartPart associatedTo: #firstDropListValue.


	wizardControl
		addPane: wizardPane1;
		addPane: wizardPane2.

	wizardControl atEndDo: [ :aDictionaryOfOutputs | self assert: (aDictionaryOfOutputs at: #firstDropListValue) equals: 1 ].
	wizardControl open.
	wizardControl performNextButtonAction.
	wizardControl performTerminateButtonAction
]

{ #category : #tests }
WizardPaneFlowTest >> testWizardSinglePaneFlow [
	| wizardControl wizardPane1 textFieldPart |
	wizardControl := MockWizardControl new.
	wizardPane1 := WizardSinglePane new.

	textFieldPart := TextFieldPart new
		defaultValue: 'hey';
		callback: [ :outputValue | dropListSelectedValue := outputValue ];
		yourself.

	wizardPane1 row: textFieldPart associatedTo: #firstDropListValue.

	wizardControl addPane: wizardPane1.

	wizardControl atEndDo: [ :aDictionaryOfOutputs | self assert: (aDictionaryOfOutputs at: #firstDropListValue) equals: 'hey' ].
	wizardControl open.
	wizardControl performTerminateButtonAction
]
