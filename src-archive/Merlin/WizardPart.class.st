"
A WizardPart is an abstract class which represents a part of a WizardPane. It only provides one output (information), in other words, it deals with a maximum of one information to retrieve.However, a wizardPane can maybe deal with several output informations and should therefore be composed by several WizardPart.On the other hand, a WizardPart can require several input informations.

WizardPart is an abstract class that you should subclass to create your own component in the pane. It's up to you to build the morph contents of a WizardPart (even if some tools to create basic elements are provided by the abstract class). And it's up to you to specify what is the information you want to retrieve from this interface: to do that, you only have to implement the abstrat method 'outputValue' and put into the value you want to transmit (for example, if your wizardpart is composed by a simple drop list you may want to transmit the value of the item selected).
You may also want to override the method 'retrieveRequiredInput' to retrieve some informations and make what you want with it(by default it does nothing). This method is called by the wizardPane before each pane opening.

Instance Variables
	blockContents:		<PanelMorph>
	enableNextButton: <Boolean>

	wizardPane:		<WizardPane>

blockContents
	- is the morph contents of this wizard part. It will be added by wizardPane to the main dialog window contents .

enableNextButton:
	- is telling wether this wizard part authorize the wizardPane next button to be enable or not. By default, its value is true . But sometimes an information is required before going to the next wizard pane. In this case, override the initialize method and call the method 'enableNextButton: false'. Then, just call 'self enableNextButton: true' in your code when the next button has to enabled (for example, you can look at the class ListSelector)



wizardPane
	- the wizard pane controling this wizard part

"
Class {
	#name : #WizardPart,
	#superclass : #Object,
	#instVars : [
		'blockContents',
		'wizardPane',
		'enableNextButton',
		'requiredInputs',
		'callbackBlock',
		'defaultValue',
		'groupBoxName',
		'useLatePopulateContents',
		'numberOfContentCalls',
		'numberOfPopulateContents',
		'paneLine',
		'output',
		'isOpen',
		'hasBeenOpen',
		'transformationBlock'
	],
	#category : #'Merlin-Core'
}

{ #category : #accessing }
WizardPart >> callback: aBlock [

	callbackBlock := aBlock.
]

{ #category : #accessing }
WizardPart >> contents [
	"return the morph contents of this WizardPart."

	"here, we create the morph representing this part. By doing this here, we enable the morph content to be parametrize by a value from another pane (for example, if we want the default value of a textField to depends on an output from the previous pane). "
	
	^  blockContents. 
	
]

{ #category : #actions }
WizardPart >> contents: aCollectionOfMorphElements [
	 	
	self deprecated: 'use populateContents: instead'.
	self populateContents: aCollectionOfMorphElements .
]

{ #category : #'as yet unclassified' }
WizardPart >> contentsChanged [
	self changed: #contents
]

{ #category : #'initialize-release' }
WizardPart >> defaultValue [ 

	^ defaultValue. 
]

{ #category : #'initialize-release' }
WizardPart >> defaultValue: aBlockOrObject [

	defaultValue := aBlockOrObject. 
]

{ #category : #buttons }
WizardPart >> disableNextButton [
	"enableNextButton and update the next button in the wizard pane (if the wizard pane is yet initialized)"
	
	self enableNextButton: false
]

{ #category : #buttons }
WizardPart >> enableNextButton [
	"enableNextButton and update the next button in the wizard pane (if the wizard pane is yet initialized)"
	
	self enableNextButton: true
]

{ #category : #protected }
WizardPart >> enableNextButton: trueOrFalse [
	"Set the value of enableNextButton and update the next button in the wizard pane (if the wizard pane is yet initialized)"
	
	enableNextButton := trueOrFalse.
	self wizardPane ifNotNil: [self wizardPane checkForEnablingNextButton ]
		


]

{ #category : #buttons }
WizardPart >> enableNextButtonValue [
	" return true if the next button in the wizard pane should be enable"
	^ enableNextButton.
	
	


]

{ #category : #accessing }
WizardPart >> groupBoxName [ 
		
	groupBoxName 
		ifNotNil: [:aStringOrABlock | ^ aStringOrABlock meValue: self requiredInputs ].
	^ groupBoxName 
]

{ #category : #accessing }
WizardPart >> hasBeenOpen [

	^ hasBeenOpen
]

{ #category : #accessing }
WizardPart >> hasBeenOpen: trueOrFalse [

	hasBeenOpen := trueOrFalse
]

{ #category : #actions }
WizardPart >> hasChanged [
	"when the output value of this wizardPart has changed, we first perform the callbak and then inform the wizardPane that a new value has been set"
	"before executing action, we make a pane refresh, to be sure that all parts composing the pane transmit their current value "
	"pay attention that here we use the NON TRANSFORMED output value"
	"self wizardPane ifNotNilDo: [:aPane | aPane refresh]."
	callbackBlock valueWithEnoughArguments: {self outputValue. self }.
	wizardPane ifNotNil: [ wizardPane  hasChanged: self].
]

{ #category : #actions }
WizardPart >> hasChanged: aValue [
	"when the output value of this wizardPart has changed, we first perform the callbak and then inform the wizardPane that a new value has been set"
	callbackBlock valueWithEnoughArguments: {aValue. self }.
	wizardPane ifNotNil: [ wizardPane  hasChanged: self].
]

{ #category : #'initialize-release' }
WizardPart >> inGroupboxNamed: aString [

	groupBoxName := aString. 
]

{ #category : #'initialize-release' }
WizardPart >> initialize [
	
	super initialize.
	requiredInputs := Dictionary new.
	"by default, a wizard part doesn't require anything to enable the next button of the wizard pane"
	self enableNextButton.
	self isOpen: false.
	self hasBeenOpen: false.
	callbackBlock := [:outputValue | ].
	useLatePopulateContents := true.
	numberOfPopulateContents := 0.
]

{ #category : #'initialize-release' }
WizardPart >> initializeDefault [

	"implement this method to initialize you part according the default value specified by 'defaultValue:'. This method will be executed only one time when opening the wizard. After that, your defaultValue will not be taken into account anyMore"
]

{ #category : #accessing }
WizardPart >> isOpen [

	^ isOpen
]

{ #category : #accessing }
WizardPart >> isOpen: trueOrFalse [

	isOpen := trueOrFalse
]

{ #category : #accessing }
WizardPart >> latePopulateContents [

	"here, you have to set the morph contents of this wizardPart. To do that, use 'populateContents:' with all the mrophs you want. This method will be called only when the pane will be opened. Therefore, this the good time to retrieve information from previous pane and use them (if necessary)"
	
]

{ #category : #actions }
WizardPart >> mightHasChanged [
	"The contents of a part might has changed without the part itself know it (This is the case for a textField). This method will be called by the parent wizard pane to be sure all has been corretly done before opening the next pane. By default does nothing. If you have to make something special before opening the next pane, it 's the good place to do it'"
]

{ #category : #accessing }
WizardPart >> morphContents [
	"return the morph contents of this WizardPart."

	"useLatePopulateContents 
		ifTrue: [self latePopulateContents]
		ifFalse: [
			numberOfContentCalls < 1 ifTrue: [self latePopulateContents ]
			].

	numberOfContentCalls := numberOfContentCalls + 1."
	^  blockContents. 
	
]

{ #category : #'morph content setup tools' }
WizardPart >> newButtonNamed: aString withAction: selector [
	"use this method to create a new classic button that will execute the method designed by selector when clicked. The method selector must be defined and implemented in the subclass"
	
	| button |
	button := PluggableButtonMorphPlus on: self getState: nil action: selector.
	button label: aString.
	^button
]

{ #category : #'morph content setup tools' }
WizardPart >> newButtonNamed: aString withAction: selector andArguments: aCollectionOfArguments [
	"use this method to create a new classic button that will execute the method designed by selector when pressed with the arguments aCollectionOfArguments. The method selector must define and implemented in the subclass"
	
	<lint: 'Methods implemented but not sent' rationale: 'method provided  to the user of the library' author: 'cyrille.delaunay'>
	
	| button |
	button := PluggableButtonMorphPlus on: self getState: nil action: selector.
	button label: aString.
	button arguments: aCollectionOfArguments .
	^button
]

{ #category : #'morph content setup tools' }
WizardPart >> newCheckboxFor: aModel getSelected: getSel setSelected: setSel label: label [
	"return a checkbox with the label label. the value of the checkbox will be accessed by the selector getSel (send to aModel) and set by the selector setSel (send to aModel)."
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	
	^(CheckboxMorph
			on: aModel selected: getSel changeSelected: setSel)
		font: StandardFonts defaultFont;
		label: label;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself
]

{ #category : #'morph content setup tools' }
WizardPart >> newColumnWith: aCollectionOfMorphElements [
	"use this method to create a new column in your block"
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #'morph content setup tools' }
WizardPart >> newGroupboxNamed: aString [ 
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"Answer a groupbox with the given label."
	^ GroupboxMorph new
		cornerStyle: #rounded;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		label: aString;
		yourself
		

]

{ #category : #'morph content setup tools' }
WizardPart >> newGroupboxNamed: aString With: aMorph [ 
	"Answer a groupbox with the given label and control."
	^ (self newGroupboxNamed: aString)
		addContentMorph: aMorph;
		yourself
]

{ #category : #'morph content setup tools' }
WizardPart >> newGroupboxNamed: aString WithAll: aCollectionOfMorph [ 
	"Answer a groupbox with the given label and controls."
	^ (self newGroupboxNamed: aString)
		addContentMorph: (self newColumnWith: aCollectionOfMorph);
		yourself
]

{ #category : #'morph content setup tools' }
WizardPart >> newLabel: aString [
	"return a simple label displaying the text aString"
	^LabelMorph contents: aString font: TextStyle defaultFont
]

{ #category : #'morph content setup tools' }
WizardPart >> newListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"return a PluggableListMorph. the value of the list will be accessed by the selector listSelector (send to aModel). the index of the current item selected will be accessed by getSelector (send to aModel) and set by the selector setSelector (send to aModel)."
	^PluggableListMorph new
		"selectionColor: self selectionColor;"
		font: TextStyle defaultFont;
		on: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
		menu: nil
		keystroke: nil;
		autoDeselect: false;
		cornerStyle: #rounded;
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill; yourself.
		"getEnabledSelector: enabledSel;
		setBalloonText: helpText"
]

{ #category : #'morph content setup tools' }
WizardPart >> newMultiSelectionListFor: aModel list: listSelector primarySelection: primarySelectionSelector changePrimarySelection: changePrimarySelectionSelector listSelection: listSelectionSelector changeListSelection: changeListSelectionSelector [

^ (PluggableListMorph
		on: aModel
		list: listSelector 
		primarySelection: primarySelectionSelector 
		changePrimarySelection: changePrimarySelectionSelector 
		listSelection: listSelectionSelector 
		changeListSelection: changeListSelectionSelector
		menu: nil )
		font: StandardFonts defaultFont;
		autoDeselect: false;
		cornerStyle: #rounded;
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill; yourself.
]

{ #category : #'morph content setup tools' }
WizardPart >> newNormalListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector [

	^(PluggableListMorph 
		"selectionColor: self selectionColor;
		font: self listFont;"
		on: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector)
		"menu: nil
		keystroke: nil;
		autoDeselect: false;"
		cornerStyle: #rounded;
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself
]

{ #category : #'morph content setup tools' }
WizardPart >> newRadionButtonFor: aModel getSelected: getSel setSelected: setSel label: aString [


	^(CheckboxMorph
			on: aModel selected: getSel changeSelected: setSel)
		"getEnabledSelector: enabledSel;"
		"font: self labelFont;"
		label: aString;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		"setBalloonText: helpText;"
		beRadioButton
]

{ #category : #'morph content setup tools' }
WizardPart >> newRowWith: aCollectionOfMorphElements [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"use this method to create a new row in your block"
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #'morph content setup tools' }
WizardPart >> newText: aStringOrText [
	"Answer a new text."

	^TextMorph new
		wrapFlag: true;
		contents: aStringOrText;
		"font: self textFont;"
		autoFit: true;
		lock;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]

{ #category : #'morph content setup tools' }
WizardPart >> newTextEditorFor: aModel getText: getSel setText: setSel [
	"Answer a text editor for the given model."

	^ (PluggableTextEditorMorph new)
		on: aModel
			text: getSel
			accept: setSel
			readSelection: nil
			menu: nil;
		"font: self textFont;"
		cornerStyle: #rounded;
		hResizing: #rigid;
		vResizing: #spaceFill;
		borderStyle: (BorderStyle inset width: 1);
		"extent: 800@(Preferences standardDefaultTextFont height + 8);"
		color: Color white.
		"selectionColor: self selectionColor"	
			"getEnabledSelector: enabledSel;" 
]

{ #category : #accessing }
WizardPart >> numberOfPopulateContents [

	^ numberOfPopulateContents
]

{ #category : #accessing }
WizardPart >> numberOfPopulateContents: anInteger [

	numberOfPopulateContents := anInteger
]

{ #category : #actions }
WizardPart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	self subclassResponsibility
]

{ #category : #'*Merlin-Rendering' }
WizardPart >> outputValue: anObject [

	"populate the output value of a wizardPart with aObject. Will be used by the rendering package"
	output := anObject
]

{ #category : #accessing }
WizardPart >> paneLine [ 
	"return the paneLine in which this part has been defines"
	^ paneLine
]

{ #category : #accessing }
WizardPart >> paneLine:  aPaneLine [ 
	"set the paneLine in which this part has been defines"
	paneLine := aPaneLine 
]

{ #category : #actions }
WizardPart >> populateContents: aCollectionOfMorphElement [
	"Set the morph contents of this WizardPart. Create a panel morph containing all the elements in aCollectionOfMorphElements one under the other"
	 	
	blockContents := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		cellInset: 8; yourself.
		
	aCollectionOfMorphElement do: [:each | blockContents addMorphBack: each ].
	^blockContents
]

{ #category : #accessing }
WizardPart >> renderer [

	^ self wizardPane renderer
]

{ #category : #actions }
WizardPart >> requiredInputs [

	^ requiredInputs
]

{ #category : #actions }
WizardPart >> requiredInputsAt: aSymbol put: aValue [

	requiredInputs at: aSymbol put: aValue
]

{ #category : #actions }
WizardPart >> retrieveInputRequired [
	"this method is an abstract method as only the subclass itself know what to do with the input that it needs to make its work "
	"by default do nothing"
	"make here all the thing required to build or make run this wizard part. This method will be clalled by wizardPane before opening the 'page'"
	
]

{ #category : #accessing }
WizardPart >> transformationBlock [

	^ transformationBlock ifNil: [transformationBlock := [:outputValue | outputValue]]
]

{ #category : #accessing }
WizardPart >> transformed: aBlock [

	"use this method to transform the output value of a part. aBlock is one argument block, with the value originally returned bu the part as argument. This block should return the transformed value"
	transformationBlock := aBlock
]

{ #category : #actions }
WizardPart >> transformedOutputValue [
	
	^ self transformationBlock meValue: self outputValue 
]

{ #category : #'parts layout - compatibility' }
WizardPart >> unassociatePartsFromTheirPanes [ 

	"when we want to remove a complete row or column, we have to also un-associat the removed wizardParts with their information"
	self wizardPane unassociatePart: self.
]

{ #category : #accessing }
WizardPart >> useLatePopulateContents [

	"by default, the morph contents of the part will always be re-computedt every time the pane call it, ie when the pane open. If you want to set this contents only once (and always memorize the state of your pane), use this method with 'false' "
	^ useLatePopulateContents. 
]

{ #category : #accessing }
WizardPart >> useLatePopulateContents: trueOrFalse [

	"by default, the morph contents of the part will always be re-computedt every time the pane call it, ie when the pane open. If you want to set this contents only once (and always memorize the state of your pane), use this method with 'false' "
	useLatePopulateContents := trueOrFalse. 
]

{ #category : #accessing }
WizardPart >> valueOf: anObject [

	^ anObject meValue: self requiredInputs
]

{ #category : #accessing }
WizardPart >> wizardPane [ 
	"return the wizard pane controling this wizard part"
	^wizardPane 
]

{ #category : #accessing }
WizardPart >> wizardPane: aWizardPane [ 
	"set the wizard pane controling this wizard part"
	^wizardPane := aWizardPane 
]
