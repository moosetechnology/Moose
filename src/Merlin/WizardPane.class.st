"
A WizardPane is an abstract class which represents a 'page' that will be displayed in a Wizard. A wizardPane doesn't contain any morph imformation itself: It is composed by several WizardParts, each one containing a specific morph contents. A wizardpane only provide the common set of buttons to naviguate between the panes ('next', 'previous' , 'cancel' , 'terminate' ). It also make the transmission between the wizardParts input and outputs and the WizardControl in which the values are stored.

Instance Variables
	partsAndInformationsAssociated:		<Dictionary>
	partsAndRequiredInformations:		<Dictionary>
	cancelButton:		<Object>
	contents:		<Object>
	wizardParts:		<OrderedCollection>
	wizardControl:		<WizardControl>

partsAndInformationsAssociated
	- a dictionary to store the differents wizardParts and the SINGLE output identifiant associated.

partsAndRequiredInformations
	- a dictionary to store the differents wizardParts and the inputs identifiants required by this WizardPart .

wizardParts
	- the differents WizardParts that composed this WizardPane

wizardControl
	- the WizardControl controlling this pane.

"
Class {
	#name : #WizardPane,
	#superclass : #Object,
	#instVars : [
		'wizardControl',
		'cancelButton',
		'partsAndInformationsAssociated',
		'partsAndRequiredInformations',
		'wizardParts',
		'name',
		'displayLayout',
		'mainPaneLine',
		'isOpen',
		'renderer',
		'conditions',
		'failingConditions'
	],
	#category : #'Merlin-Core'
}

{ #category : #'instance creation' }
WizardPane class >> named: aString [

	^ super new  initialize ; name: aString ;yourself .
]

{ #category : #updating }
WizardPane >> adaptSize [
	"Adapt the size of the window to its contents. Usefull when you dynamically add elements to your window. (In fact simply re-open the window)"
	
	"self builder openModal: self dialogWindow."
]

{ #category : #'addition-removal' }
WizardPane >> addPart: aWizardPart associatedTo: aSymbol [ 
	"when a wizard part is added to a WizardPane, an output is associated to it. Each part is associate to only one output"
	
	wizardParts add: aWizardPart.
	aWizardPart wizardPane: self.
	(mainPaneLine ifNil: [mainPaneLine := PaneColumn fromPane: self])
		row: aWizardPart.
	partsAndInformationsAssociated 
		at: aWizardPart
		put: aSymbol.
]

{ #category : #'addition-removal' }
WizardPane >> addPart: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols [ 
	"when a wizard part is added to a WizardPane, an output is associated to it. Each part is associate to only one output but can require several inputs specified by aCollectionOfSymbols"

	wizardParts add: aWizardPart.
	aWizardPart wizardPane: self.
	(mainPaneLine ifNil: [mainPaneLine := PaneColumn fromPane: self])
		row: aWizardPart.
	partsAndInformationsAssociated 
		at: aWizardPart
		put: aSymbol.
	partsAndRequiredInformations 
		at: aWizardPart
		put: aCollectionOfSymbols.
	
]

{ #category : #actions }
WizardPane >> cancelButtonAction [
	"represent the action to execute when the cancel button is pressed"
	

]

{ #category : #actions }
WizardPane >> checkForEnablingNextButton [
	"this method is called each time a wizard part change is state about enabling or not the next button. Just look if all wizard parts are 'ok'"
	
	wizardParts detect: [:each | each enableNextButtonValue = false ] ifNone: [^ self enableNextButton ].
	self disableNextButton.
]

{ #category : #'addition-removal' }
WizardPane >> column: aBlockOrAPart [
	mainPaneLine
		ifNotNil: [ :aPaneRow | aPaneRow column: aBlockOrAPart ]
		ifNil: [ mainPaneLine := PaneRow fromPane: self.
			mainPaneLine column: aBlockOrAPart ]
]

{ #category : #'addition-removal' }
WizardPane >> column: aWizardPart associatedTo: aSymbol [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine 
		ifNotNil: [:aPaneRow |
			aPaneRow column: aWizardPart 
			]  
		ifNil: [
			mainPaneLine := PaneRow fromPane: self.
			mainPaneLine column: aWizardPart 
			].
		
	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart associatedTo: aSymbol 
		
	
]

{ #category : #'addition-removal' }
WizardPane >> column: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine 
		ifNotNil: [:aPaneRow |
			aPaneRow column: aWizardPart 
			]  
		ifNil: [
			mainPaneLine := PaneRow fromPane: self.
			mainPaneLine column: aWizardPart 
			].
		
	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart associatedTo: aSymbol  requiring: aCollectionOfSymbols
		
	
]

{ #category : #'addition-removal' }
WizardPane >> column: aWizardPart requiring: aCollectionOfSymbols [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine 
		ifNotNil: [:aPaneRow |
			aPaneRow column: aWizardPart 
			]  
		ifNil: [
			mainPaneLine := PaneRow fromPane: self.
			mainPaneLine column: aWizardPart 
			].
		
	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart  requiring: aCollectionOfSymbols
		
	
]

{ #category : #accessing }
WizardPane >> condition: aBlock named: aString [

	"User should use this method to specify a one argument block (pointing on the outputValues dictionary of the wizard), to specify a boolean condition that should return true to enable the next/finish button "
	self conditions at: aString put: aBlock
]

{ #category : #accessing }
WizardPane >> conditions [

	^ conditions ifNil: [conditions := Dictionary new].
]

{ #category : #'private - accessing' }
WizardPane >> contents: aCollectionOfMorphElements [ 
	"fill in the morph contents of the dialog window with morphs from aCollectionOfMorpElements. aCollectionOfMorpElements represent the morph contents of all wizard parts composing this wizardPane. Used in the method open. Each element will be diplayed one under the other"
	
	"|contents|
	contents := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; 
		changeTableLayout;
		cellInset: 8; yourself.

	aCollectionOfMorphElements do: [:each | contents addMorphBack: each].
	self dialogWindow  contentMorph: contents."
	|contents|
	(displayLayout = #column)
		ifTrue: [
			contents := self newRowWith: aCollectionOfMorphElements .
			]
		ifFalse: [
			contents := self newColumnWith: aCollectionOfMorphElements .
			]. 
	self dialogWindow  contentMorph: contents.
	^contents

	
]

{ #category : #actions }
WizardPane >> disableNextButton [
	"by default (if no next button is defined, do nothing)"
]

{ #category : #actions }
WizardPane >> distributeRequiredInputs [
	wizardParts do: [:wizardPart |
		(partsAndRequiredInformations at: wizardPart ifAbsent: [nil]) ifNotNil: [ :collOfSymbols |
			collOfSymbols do: [:symbol |
				self retrieveOutput: symbol.
				wizardPart requiredInputsAt: symbol put: (wizardControl wizardInformations at: symbol ifAbsent: [nil])].
			wizardPart retrieveInputRequired]].
	
]

{ #category : #actions }
WizardPane >> distributeRequiredInputsOf: aWizardPart [
	
	
	(partsAndRequiredInformations at: aWizardPart ifAbsent: [ ^self ]) do: [:symbol |
			"in a first time, we make sure that the part associated to the required input transmit its outputValue. Like that, we are sure that the information is present at the moment we want to acceed it. "
		self retrieveOutput: symbol.
			"then we can distribute this value. An error can occure if you have not set your  parts to the pane in  a right order"
		aWizardPart requiredInputsAt: symbol put: (wizardControl wizardInformations at: symbol)
		].
	aWizardPart retrieveInputRequired .
	
]

{ #category : #'window control' }
WizardPane >> doClose [
	
	isOpen := false.
	self doCloseWizardParts.
]

{ #category : #'window control' }
WizardPane >> doCloseWizardParts [

	self wizardParts do: [:aWizardPart |
		aWizardPart isOpen: false.
		]
	

	
]

{ #category : #'window control' }
WizardPane >> doOpen [
	"open this pane. To do that, we make sure that all the WizardParts retrieve the inputs they require"
	
	
	self distributeRequiredInputs.
	"now we populate the morph contents of each wizard part. To do that, we work on a copy of wizardPart. Indeed, populate the morph content pf a part can lauch a callback, which can add some parts to this pane. To avoid loosing informations (by iterating an a growing collection), we first iterate on a copy, and then do the job for the remaining parts "
	wizardParts copy do: [ :each | 
		self distributeRequiredInputsOf: each.
		each retrieveInputRequired.
		self populateContentsOf: each.
		"self retrieveOutputOf: each"
		 ].
	self populatePartsRemaining. 
	"self  buildDialogWindow.
	self displayButtons.
	self checkForEnablingNextButton."
	"wizardControl dialogWindowName: name."
	isOpen := true.
	self doOpenWizardParts
	"self builder openModal: self dialogWindow."
	
	

	
]

{ #category : #'window control' }
WizardPane >> doOpenWithoutPopulatingNonEmptyPartContents [
	"open this pane. To do that, we make sure that all the WizardParts retrieve the inputs they require and then"
	
	self distributeRequiredInputs .
	wizardParts do: [ :each | 
		each retrieveInputRequired.
		each hasBeenOpen ifFalse: [
			self populateContentsOf: each.
			each isOpen: true.
			].
		"each morphContents isNil ifTrue: [self populateContentsOf: each]"
		 ].
	self populatePartsRemaining. 
	"self  buildDialogWindow.
	self displayButtons.
	self checkForEnablingNextButton.
	wizardControl dialogWindowName: name.
	self builder openModal: self dialogWindow."
	
]

{ #category : #'window control' }
WizardPane >> doOpenWizardParts [

	self wizardParts do: [:aWizardPart |
		aWizardPart isOpen: true.
		aWizardPart hasBeenOpen: true.
		]
	

	
]

{ #category : #actions }
WizardPane >> enableNextButton [
]

{ #category : #accessing }
WizardPane >> failingConditions [

	^ failingConditions ifNil: [failingConditions := OrderedCollection new].
]

{ #category : #accessing }
WizardPane >> failingConditions: aCollectionOfStrings [

	failingConditions := aCollectionOfStrings.
]

{ #category : #actions }
WizardPane >> hasChanged: aWizardPart [
	"this method is used by the sub parts to inform this pane that their output value has changed. Here , we push this value to parts requiring this information"

	| informationValue informationSymbol |
	informationValue := aWizardPart transformedOutputValue.
	informationSymbol := partsAndInformationsAssociated at: aWizardPart ifAbsent: [nil].	
	
	informationSymbol ifNotNil: [
		wizardControl information: informationSymbol withValue: informationValue.
		partsAndRequiredInformations keysAndValuesDo: [:key :value |
			(value includes: informationSymbol)
				ifTrue: [ aWizardPart requiredInputsAt: informationSymbol put: informationValue]]
		]
]

{ #category : #'initialize-release' }
WizardPane >> initialize [
	"by default, the dialog window is a new empty pluggable dialog window "

	super initialize.
	name := ''.
	partsAndInformationsAssociated := Dictionary new.
	partsAndRequiredInformations := Dictionary new.	
	wizardParts := OrderedCollection new.
	
]

{ #category : #accessing }
WizardPane >> inputRequiredBy: aWizarPart [ 
	"enable a WizardPart to retrieve  from the wizard control an input required to perform its tasks."
	
	| informationsRequired |
	informationsRequired := partsAndRequiredInformations at: aWizarPart.
	^ informationsRequired collect: [ :each | self wizardControl valueOfInformation: each ]
]

{ #category : #'accessing - main pane line' }
WizardPane >> mainPaneLine [ 

	^ mainPaneLine 
]

{ #category : #rendering }
WizardPane >> merlinSpecificRenderer [

	^ self subclassResponsibility
]

{ #category : #accessing }
WizardPane >> name [

	^ name 
]

{ #category : #accessing }
WizardPane >> name: aString [

	name := aString
]

{ #category : #actions }
WizardPane >> nextButtonAction [
	"action executed when the next button is pressed"
	
	self retrievePartsOutputs. 
	self wizardControl performNextButtonAction
]

{ #category : #actions }
WizardPane >> notifyPartsMightHaveChanged [

	"this method will iterate over all the parts in the pane and notify them that their contents might have been changed"
	wizardParts do: [:each |
		each mightHasChanged
		]
]

{ #category : #'accessing - main pane line' }
WizardPane >> numberOfSubComponents [ 

	^ self mainPaneLine numberOfSubComponents 
]

{ #category : #'window control' }
WizardPane >> openWithoutPopulatingNonEmptyPartContents [
	"open this pane. To do that, we make sure that all the WizardParts retrieve the inputs they require and then, we display their morph contents"
	
	self distributeRequiredInputs .
	wizardParts do: [ :each | 
		each retrieveInputRequired.
		each morphContents isNil ifTrue: [self populateContentsOf: each]
		 ].
	self populatePartsRemaining. 
	self  buildDialogWindow.
	self displayButtons.
	self checkForEnablingNextButton.
	wizardControl dialogWindowName: name.
	self builder openModal: self dialogWindow.
	
]

{ #category : #'window control' }
WizardPane >> populateContentsOf: aWizardPart [

	aWizardPart useLatePopulateContents 
		ifTrue: [aWizardPart latePopulateContents]
		ifFalse: [
			aWizardPart numberOfPopulateContents > 1
				ifFalse: [aWizardPart latePopulateContents]
			].
	aWizardPart numberOfPopulateContents: (aWizardPart numberOfPopulateContents +1).
	
	
]

{ #category : #'window control' }
WizardPane >> populatePartsRemaining [

	"Populating a first time all parts may launch some callbacks. Those callbacks can add several parts to the pane, and some of those parts can still have an empty contents. Here we populate all thos remaining empty parts "
	self distributeRequiredInputs. 
	wizardParts  do: [:aWizardPart |
		aWizardPart hasBeenOpen
			ifFalse: [ 
				self distributeRequiredInputsOf: aWizardPart .
				aWizardPart latePopulateContents.
				]
			].
	

	
]

{ #category : #actions }
WizardPane >> previousButtonAction [
	"action executed when the previous button is pressed"
	
	self wizardControl performPreviousButtonAction 
]

{ #category : #updating }
WizardPane >> refresh [

	(isOpen = true) ifTrue: [
		self doOpenWithoutPopulatingNonEmptyPartContents.
		self renderer refresh.
		].
	
	
]

{ #category : #'addition-removal' }
WizardPane >> removeAllParts [
	

	wizardParts removeAll.
	mainPaneLine := nil.
	partsAndInformationsAssociated := Dictionary new.
	partsAndRequiredInformations := Dictionary new.
	
]

{ #category : #'accessing - main pane line' }
WizardPane >> removeSubComponentAt: anInteger [

	"when we want to remove a complete row or column, we have to also un-associat the removed wizardParts with their information"
	^ self mainPaneLine removeSubComponentAt: anInteger. 
]

{ #category : #'accessing - main pane line' }
WizardPane >> removeWithouUnassociateSubComponentAt: anInteger [
	"remove the subComponent of this this 'AbstractLine' located at the position an integer "
	"using this method, the sucomponent will only be remove from the Morphic pane, in other words it will just become non visible, but will still be associated and registred in the wizard pane"
	self mainPaneLine removeWithouUnassociateSubComponentAt: anInteger.
]

{ #category : #rendering }
WizardPane >> renderOnMerlinRenderer: aMerlinRenderer [

	self renderer: self merlinSpecificRenderer.
	^ self renderer wizardRenderer: aMerlinRenderer; render: self.

	
]

{ #category : #rendering }
WizardPane >> renderer [

	^ renderer ifNil: [renderer := self wizardControl renderer]
]

{ #category : #rendering }
WizardPane >> renderer: aMerlinRenderer [

	renderer := aMerlinRenderer
]

{ #category : #actions }
WizardPane >> retrieveOutput: anInformationSymbol [

	partsAndInformationsAssociated keysAndValuesDo: [:aPart :aSymbol |
		aSymbol = anInformationSymbol ifTrue: [self retrieveOutputOf: aPart]
		].

]

{ #category : #actions }
WizardPane >> retrieveOutputOf: aWizardPart [
	
	| informationSymbol |
	informationSymbol := partsAndInformationsAssociated at: aWizardPart ifAbsent: [nil].	
	informationSymbol ifNotNil: [
		wizardControl information: informationSymbol withValue: aWizardPart transformedOutputValue.
	].
]

{ #category : #actions }
WizardPane >> retrievePartsOutputs [
	"action executed when the next button is pressed"
	
	"The contents of a part might have been changed without the part itself know it (This is the case for a textField). So we first notify each of them that their contents mihgt have changed"
	self notifyPartsMightHaveChanged.
	partsAndInformationsAssociated keysAndValuesDo: 
		[ :key :value | 
		self wizardControl 
			information: value
			withValue: key transformedOutputValue ].
	
]

{ #category : #'addition-removal' }
WizardPane >> row: aBlockOrAPart [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use methods begining with 'row'. If you decide to divide your pane in columns, you will always use methods begining with: 'column:'. If you try another way to dispatch the parts, the order you  want might not be guaranteed "
	mainPaneLine 
		ifNotNil: [:aPaneColumn |
			aPaneColumn row: aBlockOrAPart 
			]  
		ifNil: [
			mainPaneLine := PaneColumn fromPane: self.
			mainPaneLine row: aBlockOrAPart 
			].
		
	
		
	

]

{ #category : #'addition-removal' }
WizardPane >> row: aWizardPart associatedTo: aSymbol [
	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine
		ifNotNil: [ :aPaneColumn | aPaneColumn row: aWizardPart ]
		ifNil: [ mainPaneLine := PaneColumn fromPane: self.
			mainPaneLine row: aWizardPart ].

	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart associatedTo: aSymbol
]

{ #category : #'addition-removal' }
WizardPane >> row: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine 
		ifNotNil: [:aPaneColumn |
			aPaneColumn row: aWizardPart 
			]  
		ifNil: [
			mainPaneLine := PaneColumn fromPane: self.
			mainPaneLine row: aWizardPart 
			].
		
	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart associatedTo: aSymbol  requiring: aCollectionOfSymbols
		
	
]

{ #category : #'addition-removal' }
WizardPane >> row: aWizardPart  requiring: aCollectionOfSymbols [

	"use this method to add a part (using aBlockOrAPart as a WizardPart) or several parts (using aBlockOrAPart as a block ([:row | row column: aPart ; column: anotherPart]) ) to the pane, in a new row. You should always manage the layout of the pane in the same way: you decide to divide the pane in rows and for each row you can add several columns. In this case you will always use a method begining with 'way'. If you decide to divide you pane in columns, you will always use a method begining with: 'column:'. If you try another way to dispatch the parts, the order you might want will not be guaranteed "

	mainPaneLine 
		ifNotNil: [:aPaneColumn |
			aPaneColumn row: aWizardPart 
			]  
		ifNil: [
			mainPaneLine := PaneColumn fromPane: self.
			mainPaneLine row: aWizardPart 
			].
		
	"we now focus on the information management (made by the is wizardPane itself): "
	self setPart: aWizardPart requiring: aCollectionOfSymbols
		
	
]

{ #category : #'addition-removal' }
WizardPane >> setPart: aWizardPart [ 

	wizardParts add: aWizardPart.
	aWizardPart wizardPane: self.	
	
		
	
]

{ #category : #'addition-removal' }
WizardPane >> setPart: aWizardPart associatedTo: aSymbol [ 

	self setPart: aWizardPart.	
	partsAndInformationsAssociated 
		at: aWizardPart
		put: aSymbol.
	
		
	
]

{ #category : #'addition-removal' }
WizardPane >> setPart: aWizardPart associatedTo: aSymbol requiring: aCollectionOfSymbols [

	self setPart: aWizardPart  associatedTo: aSymbol.
	partsAndRequiredInformations 
		at: aWizardPart
		put: aCollectionOfSymbols.
		
	
]

{ #category : #'addition-removal' }
WizardPane >> setPart: aWizardPart requiring: aCollectionOfSymbols [

	self setPart: aWizardPart.
	partsAndRequiredInformations 
		at: aWizardPart
		put: aCollectionOfSymbols.
		
	
]

{ #category : #'accessing - main pane line' }
WizardPane >> subComponentAt: anInteger [

	^ self mainPaneLine subComponentAt: anInteger. 
]

{ #category : #'*Merlin-Tests' }
WizardPane >> testOpen [
	"open this pane. To do that, we make sure that all the WizardParts retrieve the inputs they require and then, we display their morph contents"
	
	
	self distributeRequiredInputs.
	"now we populate the morph contents of each wizard part. To do that, we work on a copy of wizardPart. Indeed, populate the morph content pf a part can lauch a callback, which can add some parts to this pane. To avoid loosing informations (by iterating an a growing collection), we first iterate on a copy, and then do the job for the remaining parts "
	wizardParts copy do: [ :each | 
		self distributeRequiredInputsOf: each.
		each retrieveInputRequired.
		self populateContentsOf: each.
		"self retrieveOutputOf: each"
		 ].
	self populatePartsRemaining. 
	"self  buildDialogWindow."
	"self displayButtons.
	self checkForEnablingNextButton.
	wizardControl dialogWindowName: name."
	isOpen := true.
"	self builder openModal: self dialogWindow."
	
	

	
]

{ #category : #'accessing - main pane line' }
WizardPane >> unassociatePart: aWizardPart [

	|associatedInformation requiredInformation|
	associatedInformation := partsAndInformationsAssociated at: aWizardPart.
 	partsAndRequiredInformations removeKey: aWizardPart ifAbsent: [].
	partsAndInformationsAssociated removeKey: aWizardPart.
	"when unassociating a part, the outputValue might not have been yet transmit to the wizardControl (as the next button might not have been pressed):"
	self wizardControl wizardInformations removeKey: associatedInformation ifAbsent: []. 
]

{ #category : #accessing }
WizardPane >> wizardControl [
	"return the WizardControl controling this pane"
	^ wizardControl 
]

{ #category : #accessing }
WizardPane >> wizardControl: aWizardControl [
	"set the WizardControl controling this pane"
	^ wizardControl := aWizardControl.
]

{ #category : #accessing }
WizardPane >> wizardParts [

	^ wizardParts
]
