Class {
	#name : #MerlinItemsSelectorWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'initialListMorph',
		'addButtonMorph',
		'removeButtonMorph',
		'selectionListMorph',
		'widgetMorph',
		'textFieldMorph',
		'validateButtonMorph'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> addButtonMorph [
	"return the button that will be used to add a package from the packagesList to the selectionList. While no item is selected in the packagesList, this button is disable "
	
	^ addButtonMorph ifNil: [
		addButtonMorph := (PluggableButtonMorph
			on: self getState: nil action: #updateWhenAddingItem)
	 			label: '>>>';
				disable;
				yourself
		]
]

{ #category : #actions }
MerlinItemsSelectorWidget >> checkForEnablingAddRemoveButtons [
	self wizardPart initialList ifEmpty: [ self addButtonMorph disable ].
	self wizardPart selectionList ifEmpty: [ self removeButtonMorph disable ]
]

{ #category : #'control - initial list ' }
MerlinItemsSelectorWidget >> initialList [

	^ self wizardPart initialList.
]

{ #category : #'control - initial list ' }
MerlinItemsSelectorWidget >> initialListIndex [

	^ self wizardPart initialListIndex.
]

{ #category : #'control - initial list ' }
MerlinItemsSelectorWidget >> initialListIndex: anInteger [

	anInteger > 0
		ifTrue: [
			self addButtonMorph enable.
			self selectionListIndex: 0.  
			]
		ifFalse: [
			self addButtonMorph disable.
			].  
		
	self wizardPart initialListIndex: anInteger.
	self widgetStateChanged
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> initialListMorph [

	"return a new list (PluggableListMorph) that will contain the initial list of items that can be selected by the user"
	^ initialListMorph ifNil: [
		initialListMorph :=  (self newListFor: self list: #initialList  selected: #initialListIndex changeSelected: #initialListIndex: )
		minWidth: 250;
		minHeight: 350; yourself
		]
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> initializeWidgetMorphWithMessage: aString [
 
	 widgetMorph := 
			self newColumnWith:{   
				self newRowWith: { 
					((self newGroupBoxNamed: 'Initial list' translated
						with: self initialListMorph)).
					(self newColumnWith: { 
						(self newRowWith: {   }).
						(self newRowWith: {   }).
						(self newRowWith: {   }).
						(self addButtonMorph).
						(self newRowWith: {   }).
						(self removeButtonMorph)
				 	}).
					(self newColumnWith: { 
						(self 
							newGroupBoxNamed: 'Selection' translated
							with: self selectionListMorph )
				 	})
		 		}.
				self smalltalkExpressionSelectorMorphNamed: aString  .
				}
				
	
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> removeButtonMorph [
	"return the button that will be used to remove a package from the selectionList to the packagesList. While no item is selected in the selectionList, this button is disable "
	
	^ removeButtonMorph ifNil: [
		removeButtonMorph := (PluggableButtonMorph
			on: self getState: nil action: #updateWhenRemovingItem)
	 			label: '<<<';
				disable;
				yourself
		]
]

{ #category : #'control - selection list' }
MerlinItemsSelectorWidget >> selectionList [

	^ self wizardPart selectionList
]

{ #category : #'control - selection list' }
MerlinItemsSelectorWidget >> selectionListIndex [

	^ self wizardPart selectionListIndex
]

{ #category : #'control - selection list' }
MerlinItemsSelectorWidget >> selectionListIndex: anInteger [

	anInteger > 0
		ifTrue: [
			self removeButtonMorph enable.
			self initialListIndex: 0.
			]
		ifFalse: [
			self removeButtonMorph disable
			].
	self wizardPart selectionListIndex: anInteger.
	self widgetStateChanged 
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> selectionListMorph [
	"return a new list (PluggableListMorph) that will contain all the packages selected by the user"
	^selectionListMorph ifNil: [
		selectionListMorph := ( self newListFor: self 
			list: #selectionList
			selected:  #selectionListIndex
			changeSelected: #selectionListIndex:)
		minWidth: 250;
		minHeight: 350;
		yourself]
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> smalltalkExpressionSelectorMorphNamed: aString [

	^ self newRowWith: {
		self newGroupBoxNamed: aString with:   
			(self newRowWith: {  
				((self newLabel: 'select: [ :each |') disable).
				(self textFieldMorph setText:  '''*'' match: each '; yourself).
				((self newLabel: ']') disable).
				(self validateButtonMorph)}).
			(self newColumnWith: {   }).
			(self newColumnWith: {   })
	}
]

{ #category : #rendering }
MerlinItemsSelectorWidget >> specificMorphContents [ 

	^ self widgetMorph
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> textFieldMorph [
	
	^ textFieldMorph ifNil: [
		textFieldMorph := self newTextEntryFor: self wizardPart getText: #textEntryContents setText: #textEntryContents:.
		]
]

{ #category : #actions }
MerlinItemsSelectorWidget >> updateWhenAddingItem [
	self wizardPart initialList ifEmpty: [ self addButtonMorph disable ].
	self wizardPart updateWhenAddingItem.
	self checkForEnablingAddRemoveButtons.
	self widgetStateChanged
]

{ #category : #actions }
MerlinItemsSelectorWidget >> updateWhenRemovingItem [
	self wizardPart selectionList ifEmpty: [ self removeButtonMorph disable ].
	self wizardPart updateWhenRemovingItem.
	self checkForEnablingAddRemoveButtons.
	self widgetStateChanged
]

{ #category : #actions }
MerlinItemsSelectorWidget >> validateButtonAction [
	
	self textFieldMorph acceptTextInModel.
	[self wizardPart validateButtonAction] on: Error do: [
		self wizardPart textEntryMessage: 'Select items with a Smalltalk condition - INVALID EXPRESSION'.
		self wizardPart wizardPane renderer refresh.
		^ self.
		].
	self wizardPart textEntryMessage: 'Select items with a Smalltalk condition'.
	self wizardPart wizardPane renderer refresh.
	self checkForEnablingAddRemoveButtons.
	self widgetStateChanged
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> validateButtonMorph [
	"return a button opening the context frame when clicked"
	
	^ validateButtonMorph ifNil: [
		validateButtonMorph := (PluggableButtonMorph
			on: self getState: nil action: #validateButtonAction)
	 			label: 'Validate';
				enable;
				yourself
		]
]

{ #category : #'accessing - morphs' }
MerlinItemsSelectorWidget >> widgetMorph [

	^ widgetMorph ifNil:[ 
	 		self initializeWidgetMorphWithMessage: self wizardPart textEntryMessage.
			widgetMorph  
				]
]

{ #category : #actions }
MerlinItemsSelectorWidget >> widgetStateChanged [
	self changed: #initialList.
	self changed: #selectionList.
	self changed: #initialListIndex.
	self changed: #selectionListIndex
]
