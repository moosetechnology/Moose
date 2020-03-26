Class {
	#name : #ListSelectorWithSelectionBySmalltalkExpression,
	#superclass : #ListSelector,
	#instVars : [
		'textEntry',
		'textEntryContents'
	],
	#category : #'Merlin-ToBeRemoved'
}

{ #category : #'instance creation' }
ListSelectorWithSelectionBySmalltalkExpression class >> on: collectionOfItems [

	^ (super on: collectionOfItems ) addSmalltalkExpressionRowToPackageSelector ; yourself
]

{ #category : #initialization }
ListSelectorWithSelectionBySmalltalkExpression >> addSmalltalkExpressionRowToPackageSelector [
	self 
		addRowWithAll: { 
				((self newLabel: 'select: [ :each |') disable).
				(self newTextEntry).
				((self newLabel: ']') disable).
				(self newValidateButton)
			 }
		withTitle: 'Select packages with a Smalltalk condition'
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> evaluateTextEntryContents [
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
		self  deleteStringMessageFromRowIndexedBy: 2.]
	 
		on: Error
		do: [  
			self setTitleMessage: 'Select packages with a Smalltalk condition - INVALID EXPRESSION' toGroupboxInRowIndexedBy:2 
			]
]

{ #category : #'morph content setup tools' }
ListSelectorWithSelectionBySmalltalkExpression >> newLabel: aString [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	^LabelMorph contents: aString font: TextStyle defaultFont
]

{ #category : #'morph content setup tools' }
ListSelectorWithSelectionBySmalltalkExpression >> newTextEntry [
	
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
		font: TextStyle defaultFont;
		cornerStyle:  #rounded;
		hResizing: #spaceFill;
		vResizing: #rigid;
		borderStyle: (BorderStyle inset width: 1);
		color: Color white;
		"selectionColor: self selectionColor;"
		hideScrollBarsIndefinitely;
		extent: 24@(TextStyle defaultFont height + 8);
		"setBalloonText: helpText."
		yourself.

	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (2@1 corner: 2@1).
	^textEntry := pt
		

]

{ #category : #'morph content setup tools' }
ListSelectorWithSelectionBySmalltalkExpression >> newValidateButton [

	"return a button opening the context frame when clicked"
	^ self newButtonNamed: 'Validate' withAction: #validateButtonAction

]

{ #category : #'accessing - wizard mangement' }
ListSelectorWithSelectionBySmalltalkExpression >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	^ selectionList
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> smalltalkExpressionToEvaluate [

	^ 'initialList select: [ :each |' , textEntryContents , ']'
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> textEntryContents [
	"return the contents of the text entry used to evaluate smalltalk expressions"
	^ textEntryContents
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> textEntryContents: newContents [ 
	"set the content of the text entry "
	textEntryContents := newContents.
	self contentsChanged
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> updatePackagesListByRemoving: aPackageName [

	| tmpPackagesList |
	tmpPackagesList := self list.
	tmpPackagesList remove: aPackageName .
	self list: tmpPackagesList.
					
]

{ #category : #'text entry control' }
ListSelectorWithSelectionBySmalltalkExpression >> updateSelectionListByAdding: aPackageName [ 

	| tmpSelectionList |
	tmpSelectionList := self selectionList.
	tmpSelectionList add: aPackageName.
	self selectionList: (tmpSelectionList asSortedCollection: [:a :b | a < b]). 
]

{ #category : #actions }
ListSelectorWithSelectionBySmalltalkExpression >> validateButtonAction [

	textEntry acceptTextInModel.
	self evaluateTextEntryContents.
]
