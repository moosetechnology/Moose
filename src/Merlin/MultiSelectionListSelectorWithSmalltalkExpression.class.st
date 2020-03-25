Class {
	#name : #MultiSelectionListSelectorWithSmalltalkExpression,
	#superclass : #MultiSelectionListSelector,
	#instVars : [
		'textEntry',
		'textEntryContents'
	],
	#category : #'Merlin-ToBeRemoved'
}

{ #category : #initialization }
MultiSelectionListSelectorWithSmalltalkExpression >> addSmalltalkExpressionRowToPackageSelector [
	self 
		addRowWithAll: { 
				((self newLabel: 'select: [ :packageName |') disable).
				(self newTextEntry).
				((self newLabel: ']') disable).
				(self newValidateButton)
			 }
		withTitle: 'Select packages with a Smalltalk condition'
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> evaluateTextEntryContents [
	"make a package selection by evaluating the text entry content"
	| selectionCollection |
	
	 [selectionCollection := Smalltalk compiler  
		evaluate: self smalltalkExpressionToEvaluate
		for: self
		logged: false.
		
	selectionCollection do: 
		[ :each | 
		(self selectionList includes: each) ifFalse: 
			[ self updateSelectionListByAdding: each.
			self updatePackagesListByRemoving: each ] ]. 
		self modifyTitleWith: 'Select packages with a Smalltalk condition' ForRowIndexedBy: 2.]
	 
		on: Error
		do: [  
			self setTitleMessage: 'Select packages with a Smalltalk condition - INVALID EXPRESSION' toGroupboxInRowIndexedBy:2 
			"self addStringMessage: 'Invalid expression' ForRowIndexedBy: 2."
			]
]

{ #category : #initialization }
MultiSelectionListSelectorWithSmalltalkExpression >> initialize: aCollectionOfItems [

	super initialize: aCollectionOfItems.
	self addSmalltalkExpressionRowToPackageSelector
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelectorWithSmalltalkExpression >> newLabel: aString [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	^LabelMorph contents: aString font: StandardFonts defaultFont
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelectorWithSmalltalkExpression >> newTextEntry [
	
	"^textEntry := PluggableTextFieldMorph new
		on: self 
		text: #textEntryContents
		accept: #textEntryContents:
		readSelection: nil
		menu: nil."
		
	| pt |
	pt := PluggableTextFieldMorph new
		convertTo: String;
		alwaysAccept: true;
		on: self
		text: #textEntryContents
		accept: #textEntryContents:
		readSelection: nil
		menu: nil;
		acceptOnCR: true;
		"getEnabledSelector: enabledSel;"
		font: StandardFonts defaultFont;
		cornerStyle:  #rounded;
		hResizing: #rigid"#spaceFill";
		vResizing: #rigid;
		borderStyle: (BorderStyle inset width: 1);
		color: Color white;
		"selectionColor: self selectionColor;"
		hideScrollBarsIndefinitely;
		extent: 280@(StandardFonts defaultFont height + 8);
		"setBalloonText: helpText."
		yourself.
		
	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (2@1 corner: 2@1).
	^textEntry := pt
		
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelectorWithSmalltalkExpression >> newValidateButton [

	"return a button opening the context frame when clicked"
	^ self newButtonNamed: 'Validate' withAction: #validateButtonAction

]

{ #category : #'accessing - wizard mangement' }
MultiSelectionListSelectorWithSmalltalkExpression >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	^ selectionList
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> smalltalkExpressionToEvaluate [

	^ 'initialList select: [ :packageName |' , textEntryContents , ']'
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> textEntryContents [
	"return the contents of the text entry used to evaluate smalltalk expressions"

	^ textEntryContents
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> textEntryContents: newContents [ 
	"set the content of the text entry "
	textEntryContents := newContents.
	self contentsChanged
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> updatePackagesListByRemoving: aPackageName [

	| tmpPackagesList |
	tmpPackagesList := self initialList.
	tmpPackagesList remove: aPackageName .
	self initialList: tmpPackagesList.
					
]

{ #category : #'text entry control' }
MultiSelectionListSelectorWithSmalltalkExpression >> updateSelectionListByAdding: aPackageName [ 

	| tmpSelectionList |
	tmpSelectionList := self selectionList.
	tmpSelectionList add: aPackageName.
	self selectionList: (tmpSelectionList asSortedCollection: [:a :b | a < b]). 
]

{ #category : #actions }
MultiSelectionListSelectorWithSmalltalkExpression >> validateButtonAction [

	textEntry acceptTextInModel.
	self evaluateTextEntryContents.
]
