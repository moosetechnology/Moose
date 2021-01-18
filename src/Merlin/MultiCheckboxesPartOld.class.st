Class {
	#name : #MultiCheckboxesPartOld,
	#superclass : #WizardPart,
	#instVars : [
		'allCheckboxes',
		'allCheckboxLabels',
		'allCheckboxContents',
		'actionSelector',
		'actionArguments',
		'actionModel'
	],
	#category : #'Merlin-ToBeRemoved'
}

{ #category : #'instance creation' }
MultiCheckboxesPartOld class >> withAll: aCollectionOfLabels [ 

	^ super new initialize: aCollectionOfLabels .
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionArguments [

	"return a collection of arguments that should be passed when performing the action selector"
	^ actionArguments
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionArguments: aCollectionOfObjects [

	actionArguments := aCollectionOfObjects
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionModel [

	"return the model on which we should perform the action when clicking on a checkbox"
	^ actionModel
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionModel: anObject [

	actionModel := anObject.
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionSelector [

	"return the selector that should be performed when clicking on a checkbox"
	^ actionSelector
]

{ #category : #accessing }
MultiCheckboxesPartOld >> actionSelector: aSymbol [

	actionSelector  := aSymbol 
]

{ #category : #'morph content setup tools' }
MultiCheckboxesPartOld >> addVerticalSeparatorAtTheMiddleOf: aCollectionOfElements [
	"return a collection containing all initials morph elements from aCollectionOfElements including a vertical separator at the middle"

	| index result result1 result2 collectionSize |
	collectionSize := aCollectionOfElements size.
	index := collectionSize even
		ifTrue: [ collectionSize // 2 ]
		ifFalse: [ collectionSize // 2 + 1 ].

	result := OrderedCollection new.
	result1 := OrderedCollection new.
	result2 := OrderedCollection new.
	1 to: index do: [ :i | result1 add: (aCollectionOfElements at: i) ].

	index + 1 to: aCollectionOfElements size do: [ :i | result2 add: (aCollectionOfElements at: i) ].
	result
		add: (self newColumnWith: result1);
		add: self newVerticalSeparator;
		add: (self newColumnWith: result2).
	^ result
]

{ #category : #accessing }
MultiCheckboxesPartOld >> allCheckboxContents [ 

	"return a collection for each checkbox content (which can be true or false)"
	^ allCheckboxContents 
]

{ #category : #accessing }
MultiCheckboxesPartOld >> allCheckboxContents: aCollectionOfBoolean [

	allCheckboxContents := aCollectionOfBoolean
]

{ #category : #accessing }
MultiCheckboxesPartOld >> allCheckboxLabels [

	^ allCheckboxLabels 
]

{ #category : #accessing }
MultiCheckboxesPartOld >> allCheckboxLabels: aCollectionOfString [

	^ allCheckboxLabels 
]

{ #category : #initialization }
MultiCheckboxesPartOld >> initialize: aCollectionOfLabels [

	| elements |
	self actionModel: self.
	 
	self allCheckboxContents: (aCollectionOfLabels collect: [:each | true]). 
	allCheckboxes := OrderedCollection new.
	allCheckboxLabels := aCollectionOfLabels.
	aCollectionOfLabels do: [:each |
		allCheckboxes add:
			(self 
				newCheckboxFor: (ValueHolder new contents: true) 
				getSelected: #contents 
				setSelected: #contents: 
				label: each).
		].
	
	elements := self addVerticalSeparatorAtTheMiddleOf: allCheckboxes .
	
	self contents:  {self newRowWith: elements} .
	
]

{ #category : #initialization }
MultiCheckboxesPartOld >> initialize: aCollectionOfLabels inGroupBoxNamed: aName [

	| elements |
	self actionModel: self. 
	self allCheckboxContents: (aCollectionOfLabels collect: [:each | true]).
	allCheckboxes := OrderedCollection new.
	allCheckboxLabels := aCollectionOfLabels.
	aCollectionOfLabels do: [:each |
		self 
			newCheckboxFor: (ValueHolder new contents: true) 
			getSelected: #contents 
			setSelected: #contents: 
			label: each.
		].
	
	elements := self addVerticalSeparatorAtTheMiddleOf: allCheckboxes .
	
	self contents: {self newGroupboxNamed: aName  WithAll: elements}
	
]

{ #category : #rendering }
MultiCheckboxesPartOld >> merlinRendering [

	^ self renderer merlinMultiCheckboxesRenderingFor: self
]

{ #category : #'morph content setup tools' }
MultiCheckboxesPartOld >> newVerticalSeparator [
	"Answer a new vertical separator."

	^SeparatorMorph new
		fillStyle: Color transparent;
		borderStyle: (BorderStyle inset baseColor: Color blue; width: 1);
		extent: 2@2;
		vResizing: #spaceFill
]

{ #category : #'accessing - wizard mangement' }
MultiCheckboxesPartOld >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	 
	^ self selectedItems
]

{ #category : #'accessing - wizard mangement' }
MultiCheckboxesPartOld >> selectedItems [

	"return a collection containing symbols corresponding to the checkboxes selected"
	| result |
	result := OrderedCollection new.
	allCheckboxes do: [ :each | each buttonMorph selected ifTrue: [ result add: each label asSymbol ] ].
	^ result
]

{ #category : #'accessing - morph' }
MultiCheckboxesPartOld >> setActionFromModel: aModel toCheckboxes: anActionSelector withArguments: aCollectionOfArguments [
	"initialize the action to do when clicking on a checkbox. actionSelector must be implemented in this class or its subclasses"
	self actionModel: aModel.  
	self actionSelector: anActionSelector.
	self actionArguments: aCollectionOfArguments.
	allCheckboxes do: [ :each | 
		each buttonMorph
				target: self model;
				actionSelector: anActionSelector ;
				arguments: aCollectionOfArguments  ].
]

{ #category : #'accessing - morph' }
MultiCheckboxesPartOld >> setActionToCheckboxes: anActionSelector withArguments: aCollectionOfArguments [
	"initialize the action to do when clicking on a checkbox. actionSelector must be implemented in this class or its subclasses"
	self actionSelector: anActionSelector.
	self actionArguments: aCollectionOfArguments.
	allCheckboxes do: [ :each | 
		each buttonMorph
				target: self;
				actionSelector: anActionSelector ;
				arguments: aCollectionOfArguments  ].
]
