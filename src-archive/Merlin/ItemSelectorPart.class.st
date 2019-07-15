Class {
	#name : #ItemSelectorPart,
	#superclass : #WizardPart,
	#instVars : [
		'addButton',
		'selectionList',
		'removeButton',
		'initialList',
		'initialListIndex',
		'selectionListIndex',
		'textEntryContents',
		'textEntryMessage'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
ItemSelectorPart class >> on: initialList [ 
	^ self new
		initialize;
		initialList: initialList;
		boxInitialization ; yourself
]

{ #category : #'control - text entry' }
ItemSelectorPart >> evaluateTextEntryContents [
	"make a selection by evaluating the text entry content"
	| selectionCollection |
	
	selectionCollection := Smalltalk compiler 
		evaluate: self smalltalkExpressionToEvaluate
		for: self
		logged: false.
		
	selectionCollection do: 
		[ :each | 
		(self selectionList includes: each) ifFalse: [ 
			self updateSelectionListByAdding: each.
			self updateInitialListByRemoving: each 
			] 
		]. 
]

{ #category : #'control - initial list ' }
ItemSelectorPart >> initialList [

	^initialList
]

{ #category : #'control - initial list ' }
ItemSelectorPart >> initialList: anObject [ 
	"Set the value of list"

	initialList := anObject.
	self changed: #initialList.

	"Here we check that the selectionIndex is updated according the new list size  "
	self initialListIndex > self initialList size ifFalse: [^self].
	self initialListIndex: self initialList size.
	self changed: #initialListIndex
]

{ #category : #'control - initial list ' }
ItemSelectorPart >> initialListIndex [
	^initialListIndex
]

{ #category : #'control - initial list ' }
ItemSelectorPart >> initialListIndex: anIndex [ 

	initialListIndex := anIndex.	
	self changed: #initialListIndex.
]

{ #category : #'initialize-release' }
ItemSelectorPart >> initialize [

	super initialize.
	initialListIndex := 0.
	selectionListIndex := 0.
	self textEntryMessage: 'Select items with a Smalltalk condition'.  
	selectionList := SortedCollection new.
	

	
]

{ #category : #'control - initial list ' }
ItemSelectorPart >> listSelectedItem [
	"Answer the currently selected item or nil if none."

	^self initialListIndex = 0 
		ifTrue: [nil]
		ifFalse: [self initialList at: self initialListIndex]
]

{ #category : #'*merlin-rendering' }
ItemSelectorPart >> merlinRendering [

	^ self renderer merlinItemsSelectorRenderingFor: self
]

{ #category : #'accessing - wizard management' }
ItemSelectorPart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	^ self selectionList
]

{ #category : #'control - selection list' }
ItemSelectorPart >> selectionList [
	^ selectionList
	
]

{ #category : #'control - selection list' }
ItemSelectorPart >> selectionList: anObject [ 
	"Set the value of selectionList"
	
	selectionList := anObject.
	self changed: #selectionList.
	
	"we check the new size of the selection list. If nothing is selected, we can't go to the next 	'page'"
	"self enableNextButton: (self selectionList isEmpty not)."
	
	"Here we check that the selectionIndex is updated according the new list size  "
	self selectionListIndex > self selectionList size
		ifFalse: [^self ].
	
	self selectionListIndex: self selectionList size.
	self changed: #selectionListIndex .
	
	
			
]

{ #category : #'control - selection list' }
ItemSelectorPart >> selectionListIndex [

	^ selectionListIndex.
]

{ #category : #'control - selection list' }
ItemSelectorPart >> selectionListIndex: anIndex [

	selectionListIndex := anIndex.
	self changed: #selectionListIndex.
	
	
	
		

]

{ #category : #'control - selection list' }
ItemSelectorPart >> selectionListSelectedItem [ 
	"Answer the currently selected item in the selection list or nil if none."

	^self selectionListIndex = 0
		ifTrue: [nil]
		ifFalse: [self selectionList at: self selectionListIndex]
]

{ #category : #'control - text entry' }
ItemSelectorPart >> smalltalkExpressionToEvaluate [

	^ 'initialList select: [ :each |' , textEntryContents , ']'
]

{ #category : #'control - text entry' }
ItemSelectorPart >> textEntryContents [
	"return the contents of the text entry used to evaluate smalltalk expressions"
	^ textEntryContents 
]

{ #category : #'control - text entry' }
ItemSelectorPart >> textEntryContents: newContents [ 
	"set the content of the text entry "
	textEntryContents := newContents.
	self contentsChanged
]

{ #category : #'control - text entry' }
ItemSelectorPart >> textEntryMessage [

	^ textEntryMessage
]

{ #category : #'control - text entry' }
ItemSelectorPart >> textEntryMessage: aString [

	textEntryMessage := aString
]

{ #category : #'control - text entry' }
ItemSelectorPart >> updateInitialListByRemoving: anItem [

	| tmpInitialList |
	tmpInitialList := self initialList asOrderedCollection.
	tmpInitialList remove: anItem .
	self initialList: tmpInitialList.
					
]

{ #category : #'control - text entry' }
ItemSelectorPart >> updateSelectionListByAdding: anItem [ 

	| tmpSelectionList |
	tmpSelectionList := self selectionList asOrderedCollection.
	tmpSelectionList add: anItem.
	self selectionList: (tmpSelectionList asSortedCollection: [:a :b | a < b]). 
]

{ #category : #actions }
ItemSelectorPart >> updateWhenAddingItem [
	| tmpItemsList item initialPackages |
	item := self listSelectedItem asString.
	tmpItemsList := OrderedCollection withAll: self selectionList.
	tmpItemsList add: item.

	" we remove the selected item from the initial list :"
	initialPackages := self initialList asOrderedCollection.
	initialPackages remove: item.
	self initialList: initialPackages.

	" we update the list of items of the selection morph list :"
	"listModel item list."
	self selectionList: tmpItemsList.

]

{ #category : #actions }
ItemSelectorPart >> updateWhenRemovingItem [
	"we remove the selected item from the selection list : "
	| list item tmpInitialList |
	item := self selectionListSelectedItem.
	list := self selectionList asOrderedCollection.
	list remove: item.
	self selectionList: list.

	"we move the removed item into the items list :"
	tmpInitialList := self initialList asOrderedCollection.
	tmpInitialList add: item.
	self initialList: tmpInitialList.

]

{ #category : #actions }
ItemSelectorPart >> validateButtonAction [

	self evaluateTextEntryContents.
]
