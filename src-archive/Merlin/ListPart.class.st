Class {
	#name : #ListPart,
	#superclass : #WizardPart,
	#instVars : [
		'list',
		'selectionIndex',
		'listHeight',
		'listWidth'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
ListPart >> horizontalSize [

	^ self listWidth
]

{ #category : #accessing }
ListPart >> horizontalSize: anInteger [

	self listWidth: anInteger.
]

{ #category : #listControl }
ListPart >> initialList: anObject [
	"Set the value of list"

	list := anObject.
]

{ #category : #'initialize-release' }
ListPart >> initialize [

	super initialize.
	self list: #().

]

{ #category : #accessing }
ListPart >> latePopulateContents [ 

	(self valueOf: self defaultValue) ifNotNil: [:anIndex |
		self selectionIndex: anIndex
		]    
]

{ #category : #listControl }
ListPart >> list [
	"Answer the value of list"

	^ self valueOf: list
]

{ #category : #listControl }
ListPart >> list: anObject [
	"Set the value of list"

	list := anObject.
	self changed: #list
]

{ #category : #accessing }
ListPart >> listHeight [

	^ listHeight 
]

{ #category : #accessing }
ListPart >> listHeight: anInteger [

	listHeight := anInteger.
]

{ #category : #accessing }
ListPart >> listWidth [

	^ listWidth 
]

{ #category : #accessing }
ListPart >> listWidth: anInteger [

	listWidth := anInteger.
]

{ #category : #'*Merlin-Rendering' }
ListPart >> merlinRendering [

	^ self renderer merlinListRenderingFor: self
]

{ #category : #'accessing - Wizard Management' }
ListPart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	self list ifNotNil: [:tmpList | 
		
		^ "tmpList at:" self selectionIndex]
]

{ #category : #listControl }
ListPart >> safeSelectionIndex: anObject [
	"Set the value of selectionIndex"

	selectionIndex := anObject.
]

{ #category : #listControl }
ListPart >> selectedItem [
	"Answer the currently selected item or nil if none."

	^self selectionIndex = 0
		ifTrue: [nil]
		ifFalse: [self list at: self selectionIndex]
]

{ #category : #listControl }
ListPart >> selectedItem: anItem [

	(self list includes: anItem) ifTrue: [
		self selectionIndex: (self list indexOf: anItem)  
		]
]

{ #category : #listControl }
ListPart >> selectionIndex [
	"Answer the value of selectionIndex"

	^ selectionIndex ifNil: [0] "if selectionIndex has not been yet initialized, we return 0 to avoid erros".
]

{ #category : #listControl }
ListPart >> selectionIndex: anObject [
	"Set the value of selectionIndex"

	selectionIndex := anObject.
	self changed: #selectionIndex.
	self hasChanged .
]

{ #category : #accessing }
ListPart >> verticalSize [

	^ self listHeight
]

{ #category : #accessing }
ListPart >> verticalSize: anInteger [

	self listHeight: anInteger.
]
