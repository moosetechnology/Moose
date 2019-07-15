Class {
	#name : #MultiSelectionItemSelectorPart,
	#superclass : #ItemSelectorPart,
	#instVars : [
		'initialListSelections',
		'selectionListSelections'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> changeInitialListIndex: newListIndex [ 

	initialListIndex ~= 0 
		ifTrue: [initialListSelections at: initialListIndex put: false].
	newListIndex ~= 0 
		ifTrue: [
			initialListSelections at: newListIndex put: true.
			
			].
		
	initialListIndex := newListIndex.

"	self contentsChanged.	"
	
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> changeSelectionListIndex: newListIndex [ 
	selectionListIndex ~= 0 
		ifTrue: [selectionListSelections at: selectionListIndex put: false].
	newListIndex ~= 0 
		ifTrue: [selectionListSelections at: newListIndex put: true].
	selectionListIndex := newListIndex.
	
	self contentsChanged.
		
	
]

{ #category : #actions }
MultiSelectionItemSelectorPart >> deselectAllInInitialList [

	initialListIndex := 0.
	self initialList: self initialList.
	

	
]

{ #category : #actions }
MultiSelectionItemSelectorPart >> deselectAllInSelectionList [

	selectionListIndex := 0.
	self selectionList: self selectionList.
]

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> initialList: aCollection [

	initialList := aCollection.
	initialListSelections := Dictionary new.
	1 to: initialList size do: [:index | initialListSelections at: index put: false].
	
	"Here we check that the initialListIndex is updated according the new list size  "
	self initialListIndex > self initialList size ifFalse: [^self].
	self changeInitialListIndex: self initialList size.
]

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> initialListSelectedItems [
	|indexesSelected result |

	indexesSelected := OrderedCollection new.
	initialListSelections  keysAndValuesDo: [:key :value | value ifTrue: [indexesSelected add: key]].	
	
	result := OrderedCollection new.
	indexesSelected do: [:each | result add: (initialList at: each) asString].
	
^result
]

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> initialListSelectionAt: anIndex [

	^ initialListSelections at: anIndex
]

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> initialListSelectionAt: anIndex put: value [

	^ initialListSelections at: anIndex put: value
]

{ #category : #'initialize-release' }
MultiSelectionItemSelectorPart >> initialize [

	super initialize.
	"initialList := OrderedCollection new."
	initialListIndex := 0.
	selectionListSelections := Dictionary new. 
	initialListSelections := Dictionary new.
	selectionListIndex := 0.
]

{ #category : #'*merlin-rendering' }
MultiSelectionItemSelectorPart >> merlinRendering [

	^ self renderer merlinMultiSelectionItemsSelectorRenderingFor: self
]

{ #category : #'control - initial list' }
MultiSelectionItemSelectorPart >> nothingSelectedInInitialList [

	initialListSelections values detect: [:each | each = true] ifNone: [^true].
	
	^false
	
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> nothingSelectedInSelectionList [

	selectionListSelections values detect: [:each | each = true] ifNone: [^true].
	^ false. 
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> selectionList: aCollection [

	selectionList := aCollection.
	selectionListSelections := Dictionary new.
	1 to: selectionList size do: [:index | selectionListSelections at: index put: false].
	
	self changed: #selectionList.
	
	"Here we check that the selectionListIndex is updated according the new list size  "
	self selectionListIndex > self selectionList size ifFalse: [^self].
	self changeSelectionListIndex: self selectionList size.
	
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> selectionListSelectedItems [
	|indexesSelected|

	indexesSelected := OrderedCollection new.
	selectionListSelections keysAndValuesDo: [:key :value | value ifTrue: [indexesSelected add: key]].	
	
	^indexesSelected collect: [:each | selectionList at: each].
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> selectionListSelectionAt: anIndex [
	^ selectionListSelections at: anIndex
]

{ #category : #'control - selection list' }
MultiSelectionItemSelectorPart >> selectionListSelectionAt: anIndex put: value [

		^ selectionListSelections at: anIndex put: value
]

{ #category : #actions }
MultiSelectionItemSelectorPart >> updateWhenAddingItem [
	|  selectedItemsInInitialList tmpList initialListOfItems |
	selectedItemsInInitialList := self initialListSelectedItems .
	tmpList := SortedCollection withAll: self selectionList.
	tmpList addAll: selectedItemsInInitialList.

	" we remove the selected package from the initial list :"
	initialListOfItems := self initialList asOrderedCollection.
	initialListOfItems removeAll: selectedItemsInInitialList.
	self initialList: initialListOfItems.

	" we update the list of packages of the selection morph list :"
	self selectionList: tmpList.
]

{ #category : #actions }
MultiSelectionItemSelectorPart >> updateWhenRemovingItem [

	"we remove the selected item from the selection list : "
	| list package tmpPackagesList selectedItems tmpSelectionList tmpList |
	selectedItems := self selectionListSelectedItems.
	tmpSelectionList := self selectionList.
	tmpSelectionList removeAll: selectedItems.
	self selectionList: tmpSelectionList.

	"we move the removed package into the initial list :"
	tmpList := self initialList asSortedCollection: [:a :b | a<b].
	tmpList addAll: selectedItems.
	self initialList: tmpList.

]
