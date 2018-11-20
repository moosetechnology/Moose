Class {
	#name : #DropListPart,
	#superclass : #WizardPart,
	#instVars : [
		'list',
		'selectionIndex',
		'useRequiredInputAsDefault',
		'defaultBlock',
		'horizontalSize',
		'formatBlock'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
DropListPart class >> on: aCollectionOfItems [ 
	^ self new
		initialize; listContents: aCollectionOfItems ; yourself
]

{ #category : #'instance creation' }
DropListPart class >> on: aCollectionOfItems inGroupboxNamed: aString defaultSelected: anIndex [
	"the drop list will be put into a groupbox named aString. by default it is put into a groupbox named 'Choose an item'"
	^ self new
		initialize;
		list: aCollectionOfItems
			inGroupboxNamed: aString ; defaultIndexSelected: anIndex ;  yourself
]

{ #category : #'accessing - morph' }
DropListPart >> defaultIndexSelected: anIndex [

	self selectionIndex: anIndex
]

{ #category : #'accessing - morph' }
DropListPart >> defaultItemSelected: anItem [

	self selectionIndex: (self list indexOf: anItem)
]

{ #category : #accessing }
DropListPart >> format: aBlock [

	"use this method the string representationof the options. aBlock is a one argument block (representing the current option to format). It should return a string that will be the representation of the option"
	formatBlock := aBlock
]

{ #category : #accessing }
DropListPart >> formatBlock [

	^ formatBlock ifNil: [formatBlock := [:option | option ]]
]

{ #category : #accessing }
DropListPart >> formatedList [

	^ self list collect: [:each |
		each isNil
			ifTrue: ['']
			ifFalse: [self formatBlock meValue: each]
		 ]
]

{ #category : #accessing }
DropListPart >> horizontalSize [

	^ horizontalSize 
]

{ #category : #accessing }
DropListPart >> horizontalSize: anInteger [

	"if the default size (computed according your wizard global size) doesn't correspond to what you were expecting, you this method to fix yourself the length of the dropListMorph"
	horizontalSize := anInteger.
]

{ #category : #'initialize-release' }
DropListPart >> initialize [ 

	super initialize.  
	self list: #(default).
	self selectionIndex: 0.
	
]

{ #category : #accessing }
DropListPart >> latePopulateContents [
	
	|default|
	default := defaultValue meValue: self requiredInputs.
	default ifNotNil: [:anIndexOrAnObject |
		anIndexOrAnObject isNumber 
			ifTrue: [self selectionIndex: anIndexOrAnObject ]
			ifFalse: [self selectionIndex: (self list indexOf: anIndexOrAnObject)].	
		]. 
	
	
]

{ #category : #'list control' }
DropListPart >> list [
	"Answer the value of list"

	^ list ifEmpty: [list := {}]
]

{ #category : #'list control' }
DropListPart >> list: anObject [
	"Set the value of list"

	list := anObject.
	self changed: #list.
	self changed: #formatedList.
	anObject ifNotEmpty: [
		self selectionIndex: 1
		].
	self selectionIndex ifNotNil: [self hasChanged].
]

{ #category : #rendering }
DropListPart >> merlinRendering [

	^ self renderer merlinDropListRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
DropListPart >> outputValue [

	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	(self list isNil not and: [self list isEmpty not])
		ifTrue: [^ self selectedItem]
		ifFalse: [^ nil].
		
	
]

{ #category : #'accessing - wizard mangement' }
DropListPart >> retrieveInputRequired [
	"this method is an abstract method as only the subclass itself know what to do with the input that it needs to make its work "
	"by default do nothing"
	"make here all the thing required to build or make run this wizard part. This method will be clalled by wizardPane before opening the 'page'"
		
]

{ #category : #'list control' }
DropListPart >> safeSelectionIndex: anObject [
	"Set the value of selectionIndex"

	selectionIndex := anObject.
]

{ #category : #'list control' }
DropListPart >> selectedItem [
	"Answer the currently selected item or nil if none."

	^self selectionIndex = 0
		ifTrue: [nil]
		ifFalse: [self list at: self selectionIndex]
]

{ #category : #'list control' }
DropListPart >> selectedItem: anItem [

	(self list includes: anItem) ifTrue: [
		self selectionIndex: (self list indexOf: anItem)  
		]
]

{ #category : #'list control' }
DropListPart >> selectionIndex [
	"Answer the value of selectionIndex"

	^ selectionIndex
]

{ #category : #'list control' }
DropListPart >> selectionIndex: anObject [
	"Set the value of selectionIndex"

	selectionIndex := anObject.
	self hasChanged .
	self changed: #selectionIndex
]
