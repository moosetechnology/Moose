Class {
	#name : #MultiSelectionListSelector,
	#superclass : #WizardPart,
	#instVars : [
		'addButton',
		'selectionList',
		'removeButton',
		'initialList',
		'initialListIndex',
		'initialListSelections',
		'selectionListIndex',
		'selectionListSelections'
	],
	#category : #'Merlin-ToBeRemoved'
}

{ #category : #'instance creation' }
MultiSelectionListSelector class >> on: initialList [

	^ super new initialize: initialList ; yourself. 
]

{ #category : #'private - customization' }
MultiSelectionListSelector >> addRowWithAll: collectionOfMorphElements withTitle: aString [
	"enable the customization of this PackageSelector. Add a new row under the packages list with all elements contained in collectionOfMorphElements "
	| tmpBuilderMainContent |
	tmpBuilderMainContent := self contents submorphs asOrderedCollection .
	tmpBuilderMainContent add: 
		(self newRowWith: { 
			(self 
				newGroupboxNamed: aString
				WithAll: {  (self newRowWith: collectionOfMorphElements )  }).
			(self newColumnWith: {   }).
			(self newColumnWith: {   })
		}).

	self populateContents:(  
		tmpBuilderMainContent asArray
	).

]

{ #category : #'private - customization' }
MultiSelectionListSelector >> addStringMessage: aString ForRowIndexedBy: anIndex [
	"allow the user to dynamically add a message (wich can be for example an error message or informations missing) to the new row he created before at the anIndex position (the index one is attributed to the packageSelector stuff) "
	| initialBuilderMainContent tmpBuilderMainContent |
	
	initialBuilderMainContent := self contents submorphs asOrderedCollection .
	"tmpBuilderMainContent represent the new content of main window (in wich we will add the message)"
	tmpBuilderMainContent := initialBuilderMainContent copy.

	"We add the message to the row number anIndex"
	tmpBuilderMainContent at: anIndex put: (
		self newRowWith: {
			(initialBuilderMainContent at: anIndex) submorphs first.
			self newColumnWith: { self newGroupboxNamed:   'Information' With: (self newLabel: aString)}.
		}).
	
	"we set the new content of the window"
		self contents:(  
		tmpBuilderMainContent
	).
	self wizardPane buildDialogWindow  .
	self wizardPane adaptSize.
	
]

{ #category : #'private - customization' }
MultiSelectionListSelector >> addTitleMessage: aString toGroupboxInRowIndexedBy: anIndex [

	| initialBuilderMainContent tmpBuilderMainContent groupBox |
	
	initialBuilderMainContent := self contents submorphs asOrderedCollection .
	"tmpBuilderMainContent represent the new content of main window (in wich we will add the message)"
	tmpBuilderMainContent := initialBuilderMainContent copy.

	"We add the message to the row number anIndex"
	groupBox := (tmpBuilderMainContent at: anIndex) submorphs first.
	groupBox label: groupBox label ,' - ',aString.
	
	self wizardPane buildDialogWindow  .
	self wizardPane adaptSize.
	
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> changeInitialListIndex: newListIndex [ 
	initialListIndex ~= 0 
		ifTrue: [initialListSelections at: initialListIndex put: false].
	newListIndex ~= 0 
		ifTrue: [
			initialListSelections at: newListIndex put: true.
			
			].
		
	initialListIndex := newListIndex.
	
	
	
	"if  we disable or enable the addButton according the initial has selected items or not. "
	(self nothingSelectedInInitialList )
		ifTrue: [addButton disable]
		ifFalse: [addButton enable].			
				
	"when clicking on the initialList, we deselect all in the selection list"
	self deselectAllInSelectionList .
	
	self changed: #initialListIndex.
	self contentsChanged.	
	
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> changeSelectionListIndex: newListIndex [ 
	selectionListIndex ~= 0 
		ifTrue: [selectionListSelections at: selectionListIndex put: false].
	newListIndex ~= 0 
		ifTrue: [selectionListSelections at: newListIndex put: true].
	selectionListIndex := newListIndex.
	self changed: #selectionListIndex.
	self contentsChanged.
	
	"if  we disable or enable the addButton according the selection list has selected items or not. "
	self nothingSelectedInSelectionList 
		ifTrue: [removeButton disable]
		ifFalse: [removeButton enable].	
			
	"when clicking on the selectionList, we deselect all in the initial list"
	self deselectAllInInitialList 
		
	
]

{ #category : #'private - customization' }
MultiSelectionListSelector >> deleteStringMessageFromRowIndexedBy: anIndex [
	"allow the user to dynamically delete a message he put before at the row number anIndex (the index 1 is attributed to the PackageSelectorStuff) "
	| initialBuilderMainContent tmpBuilderMainContent |
	
	initialBuilderMainContent := self contents submorphs asOrderedCollection .
	"tmpBuilderMainContent represent the new content of main window (in wich we will delete the message)"
	tmpBuilderMainContent := initialBuilderMainContent copy.

	"We delete the message from the row number anIndex"
	tmpBuilderMainContent at: anIndex put: (
		self newRowWith: {
			(initialBuilderMainContent at: anIndex) submorphs first "detect: [:component | (component isKindOf: GroupboxMorph)  ]".
			self newColumnWith: { }.
		}).
	"we set the new content of the window"
		self contents:( 
		tmpBuilderMainContent asArray
	).
	self wizardPane buildDialogWindow .
	
	
]

{ #category : #actions }
MultiSelectionListSelector >> deselectAllInInitialList [
	initialListIndex := 0.
	self initialList: self initialList.
	
	addButton disable.
	
]

{ #category : #actions }
MultiSelectionListSelector >> deselectAllInSelectionList [
	selectionListIndex := 0.
	self selectionList: self selectionList.
	removeButton  disable.
	
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialList [

	^initialList
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialList: aCollection [

	initialList := aCollection.
	initialListSelections := Dictionary new.
	1 to: initialList size do: [:index | initialListSelections at: index put: false].
	self changed: #initialList.
	
	"Here we check that the initialListIndex is updated according the new list size  "
	self initialListIndex > self initialList size ifFalse: [^self].
	self changeInitialListIndex: self initialList size.
	"initialListIndex := 0."
	
	
	
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialListIndex [
	^initialListIndex
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialListSelectedItems [
	|indexesSelected result |

	indexesSelected := OrderedCollection new.
	initialListSelections  keysAndValuesDo: [:key :value | value ifTrue: [indexesSelected add: key]].	
	
	result := OrderedCollection new.
	indexesSelected do: [:each | result add: (initialList at: each) asString].
	
^result
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialListSelectionAt: anIndex [
	^ initialListSelections at: anIndex
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> initialListSelectionAt: anIndex put: value [

		^ initialListSelections at: anIndex put: value
]

{ #category : #initialization }
MultiSelectionListSelector >> initialize [

	super initialize.
	"initialList := OrderedCollection new."
	initialListIndex := 0.
	
	selectionList := OrderedCollection new.
	selectionListSelections := Dictionary new. 
	selectionListIndex := 0.
	
	"while no item has been selected and put into the selectionList, the nextButton doesn't have to be enabled'"
	"self enableNextButton: false."
]

{ #category : #initialization }
MultiSelectionListSelector >> initialize: aCollectionOfItems [
"initialize the initial list with aCollectionOfItems and then fill in the contents of this WizardPart"
	| morphPackagesList morphSelectionList |
	self initialize.
	initialList := aCollectionOfItems.
	initialListSelections := Dictionary new. 
	1 to: initialList size do: [:index | initialListSelections at: index put: false].
	
	
	(morphSelectionList := self newSelectionMultiSelectionList).
	(morphPackagesList := self newInitialMultiSelectionList).
	self populateContents:{ self newRowWith: { 
			((self 
					newGroupboxNamed: 'Packages' translated
					With: morphPackagesList)).
			(self newColumnWith: { 
					(self newRowWith: {   }).
					(self newRowWith: {   }).
					(self newRowWith: {   }).
					(self newAddButton).
					(self newRowWith: {   }).
					(self newRemoveButton)
				 }).
			(self newColumnWith: { 
					(self 
						newGroupboxNamed: 'Selection' translated
						With: morphSelectionList)
				 })
		 }}
]

{ #category : #'private - customization' }
MultiSelectionListSelector >> modifyTitleWith: aString ForRowIndexedBy: anIndex [

	| initialBuilderMainContent tmpBuilderMainContent groupBox |
	
	initialBuilderMainContent := self contents submorphs asOrderedCollection .
	"tmpBuilderMainContent represent the new content of main window (in wich we will add the message)"
	tmpBuilderMainContent := initialBuilderMainContent copy.

	"We add the message to the row number anIndex"
	groupBox := (tmpBuilderMainContent at: anIndex) submorphs first.
	groupBox label: aString.
	
	self wizardPane buildDialogWindow  .
	self wizardPane adaptSize.
	
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelector >> newAddButton [ 
	"return the button that will be used to add a package from the packagesList to the selectionList. While no item is selected in the packagesList, this button is disable "
	

	addButton := self newButtonNamed: '>>>' withAction: #updateWhenAddingItem.
	addButton disable.
	^addButton
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelector >> newInitialMultiSelectionList [

^ (self newMultiSelectionListFor: self
		list: #initialList
		primarySelection: #initialListIndex
		changePrimarySelection: #changeInitialListIndex:
		listSelection: #initialListSelectionAt:
		changeListSelection: #initialListSelectionAt:put:)
		minWidth: 250;
		minHeight: 350;
		yourself.
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelector >> newMultiSelectionList [

^ PluggableListMorph
		on: self
		list: #list
		primarySelection: #selectionSymbol
		changePrimarySelection: (#selectionSymbol, ':') asSymbol
		listSelection: #listSelectionSymbol
		changeListSelection: (#listSelectionSymbol, 'put:') asSymbol
		menu: nil.
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelector >> newRemoveButton [ 
	"return the button that will be used to add a package from the packagesList to the selectionList. While no item is selected in the packagesList, this button is disable "
	

	removeButton := self newButtonNamed: '<<<' withAction: #updateWhenRemovingItem.
	removeButton disable.
	^removeButton
]

{ #category : #'morph content setup tools' }
MultiSelectionListSelector >> newSelectionMultiSelectionList [

^( self newMultiSelectionListFor: self
		list: #selectionList
		primarySelection: #selectionListIndex
		changePrimarySelection: #changeSelectionListIndex:
		listSelection: #selectionListSelectionAt:
		changeListSelection: #selectionListSelectionAt:put:)
		minWidth: 250;
		minHeight: 350;
		yourself.
]

{ #category : #'initial list control' }
MultiSelectionListSelector >> nothingSelectedInInitialList [

	initialListSelections values detect: [:each | each = true] ifNone: [^true].
	
	^false
	
"	1 to: initialList size do: [:index |
		(initialListSelections at: index) = true ifTrue: [^false].
		].
	^ true. "
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> nothingSelectedInSelectionList [

	selectionListSelections values detect: [:each | each = true] ifNone: [^true].
	^ false. 
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionList [ 

	^ selectionList
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionList: aCollection [

	selectionList := aCollection.
	selectionListSelections := Dictionary new.
	1 to: selectionList size do: [:index | selectionListSelections at: index put: false].
	
	self changed: #selectionList.
	
	"Here we check that the selectionListIndex is updated according the new list size  "
	self selectionListIndex > self selectionList size ifFalse: [^self].
	self changeSelectionListIndex: self selectionList size.
	
	"if the list has become empty, we disable the next button"
	"self selectionList isEmpty
		ifTrue: [ self enableNextButton: false]
		ifFalse: [ self enableNextButton: true]."

	

]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionListIndex [

	^selectionListIndex
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionListSelectedItems [
	|indexesSelected|

	indexesSelected := OrderedCollection new.
	selectionListSelections keysAndValuesDo: [:key :value | value ifTrue: [indexesSelected add: key]].	
	
	^indexesSelected collect: [:each | selectionList at: each].
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionListSelectionAt: anIndex [
	^ selectionListSelections at: anIndex
]

{ #category : #'selection list control' }
MultiSelectionListSelector >> selectionListSelectionAt: anIndex put: value [

		^ selectionListSelections at: anIndex put: value
]

{ #category : #'private - customization' }
MultiSelectionListSelector >> setTitleMessage: aString toGroupboxInRowIndexedBy: anIndex [

	| initialBuilderMainContent tmpBuilderMainContent groupBox |
	
	initialBuilderMainContent := self contents submorphs asOrderedCollection .
	"tmpBuilderMainContent represent the new content of main window (in wich we will add the message)"
	tmpBuilderMainContent := initialBuilderMainContent copy.

	"We add the message to the row number anIndex"
	groupBox := (tmpBuilderMainContent at: anIndex) submorphs first.
	groupBox label: aString.
	
	self wizardPane buildDialogWindow  .
	self wizardPane adaptSize.
	
]

{ #category : #actions }
MultiSelectionListSelector >> updateWhenAddingItem [
	| selectedItemsInInitialList tmpList initialListOfItems |
	selectedItemsInInitialList := self initialListSelectedItems.
	tmpList := SortedCollection withAll: self selectionList.
	tmpList addAll: selectedItemsInInitialList.

	" we remove the selected package from the initial list :"
	initialListOfItems := self initialList asOrderedCollection.
	initialListOfItems removeAll: selectedItemsInInitialList.
	self initialList: initialListOfItems.

	"if the initial become empty, we disable de add button"
	initialListOfItems ifEmpty: [ addButton disable ].

	" we update the list of packages of the selection morph list :"
	self selectionList: tmpList
]

{ #category : #actions }
MultiSelectionListSelector >> updateWhenRemovingItem [
	"we remove the selected item from the selection list : "

	| selectedItems tmpSelectionList tmpList |
	selectedItems := self selectionListSelectedItems.
	tmpSelectionList := self selectionList.
	tmpSelectionList removeAll: selectedItems.
	self selectionList: tmpSelectionList.

	"if the selection become empty, we disable the remove button :"
	tmpSelectionList ifEmpty: [ removeButton disable ].

	"we move the removed package into the initial list :"
	tmpList := self initialList asSortedCollection: [ :a :b | a < b ].
	tmpList addAll: selectedItems.
	self initialList: tmpList
]
