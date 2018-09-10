Class {
	#name : #MerlinMultiSelectionItemsSelectorWidget,
	#superclass : #MerlinItemsSelectorWidget,
	#category : #'Merlin-Rendering'
}

{ #category : #'control - initial list ' }
MerlinMultiSelectionItemsSelectorWidget >> changeInitialListIndex: newListIndex [ 

	self wizardPart deselectAllInSelectionList.
	self wizardPart changeInitialListIndex: newListIndex .
	self checkForEnablingAddRemoveButtons.
	"self widgetStateChanged."
]

{ #category : #'control - selection list' }
MerlinMultiSelectionItemsSelectorWidget >> changeSelectionListIndex: newListIndex [ 

	self wizardPart deselectAllInInitialList. 
	self wizardPart changeSelectionListIndex: newListIndex.
	self checkForEnablingAddRemoveButtons.
	"self widgetStateChanged."
]

{ #category : #'accessing - morphs' }
MerlinMultiSelectionItemsSelectorWidget >> checkForEnablingAddRemoveButtons [ 
	
	"we disable or enable the addButton according the selection list has selected items or not. "
	self wizardPart nothingSelectedInSelectionList 
		ifTrue: [self removeButtonMorph disable]
		ifFalse: [self removeButtonMorph enable].
		
	self wizardPart nothingSelectedInInitialList 
		ifTrue: [ self addButtonMorph disable]
		ifFalse: [self addButtonMorph enable]
		
			

	
]

{ #category : #'control - initial list ' }
MerlinMultiSelectionItemsSelectorWidget >> initialListIndex [

	^ self wizardPart initialListIndex
]

{ #category : #'accessing - morphs' }
MerlinMultiSelectionItemsSelectorWidget >> initialListMorph [ 

	^ initialListMorph ifNil: [
		initialListMorph := (self newMultiSelectionListFor: self
			list: #initialList
			primarySelection: #initialListIndex
			changePrimarySelection: #changeInitialListIndex:
			listSelection: #initialListSelectionAt:
			changeListSelection: #initialListSelectionAt:put:)
			minWidth: 250;
			minHeight: 350;
			yourself.
		]
]

{ #category : #'control - initial list ' }
MerlinMultiSelectionItemsSelectorWidget >> initialListSelectionAt: anIndex [
	
	^ self wizardPart initialListSelectionAt: anIndex
]

{ #category : #'control - initial list ' }
MerlinMultiSelectionItemsSelectorWidget >> initialListSelectionAt: anIndex put: value [

		self wizardPart initialListSelectionAt: anIndex put: value.
		"self widgetStateChanged."
]

{ #category : #'control - selection list' }
MerlinMultiSelectionItemsSelectorWidget >> selectionListIndex [

	^ self wizardPart selectionListIndex
]

{ #category : #'accessing - morphs' }
MerlinMultiSelectionItemsSelectorWidget >> selectionListMorph [ 

	^ selectionListMorph ifNil: [
		selectionListMorph := (self newMultiSelectionListFor: self
			list: #selectionList
			primarySelection: #selectionListIndex
			changePrimarySelection: #changeSelectionListIndex:
			listSelection: #selectionListSelectionAt:
			changeListSelection: #selectionListSelectionAt:put:)
			minWidth: 250;
			minHeight: 350;
			yourself.
		]
]

{ #category : #'control - selection list' }
MerlinMultiSelectionItemsSelectorWidget >> selectionListSelectionAt: anIndex [

	^ self wizardPart selectionListSelectionAt: anIndex

]

{ #category : #'control - selection list' }
MerlinMultiSelectionItemsSelectorWidget >> selectionListSelectionAt: anIndex put: value [

	self wizardPart selectionListSelectionAt: anIndex put: value.
	"self widgetStateChanged."
]
