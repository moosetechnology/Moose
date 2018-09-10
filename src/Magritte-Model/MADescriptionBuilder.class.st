"
A MADescriptionBuilder is an abstract class for enriching a Magritte description, e.g. setting the component class based on the description class.


Instance Variables:
	model: the root object
	target:  the object the current description belongs to
	priority: when multiple builders are used, this determines the priority.
	buildedDescription: The result
"
Class {
	#name : #MADescriptionBuilder,
	#superclass : #MAVisitor,
	#instVars : [
		'model',
		'target',
		'priority',
		'builtDescription'
	],
	#category : #'Magritte-Model-Builder'
}

{ #category : #accessing }
MADescriptionBuilder class >> buildFrom: aDescription target: aTarget [
	^ self new 
		target: aTarget;
		visit: aDescription;
		builtDescription
]

{ #category : #accessing }
MADescriptionBuilder class >> buildFrom: aDescription target: aTarget model: aModel [
	^ self new 
		target: aTarget;
		model: aModel;
		visit: aDescription;
		builtDescription
]

{ #category : #'accessing defaults' }
MADescriptionBuilder class >> defaultPriority [
	^0
]

{ #category : #accessing }
MADescriptionBuilder >> buildFrom: aDescription target: aTarget [ 
	self target: aTarget; visit: aDescription.
	^self builtDescription
]

{ #category : #visiting }
MADescriptionBuilder >> builtDescription [
	^builtDescription
]

{ #category : #accessing }
MADescriptionBuilder >> model [
	^model
]

{ #category : #accessing }
MADescriptionBuilder >> model: aModel [
	model := aModel
]

{ #category : #accessing }
MADescriptionBuilder >> priority [
	^ priority ifNil: [ ^self class defaultPriority ]
]

{ #category : #accessing }
MADescriptionBuilder >> priority: anObject [
	priority := anObject
]

{ #category : #visiting }
MADescriptionBuilder >> setBuiltDescription: aDescription [ 
	builtDescription := aDescription
]

{ #category : #accessing }
MADescriptionBuilder >> target [
	^ target
]

{ #category : #accessing }
MADescriptionBuilder >> target: anObject [
	target := anObject
]

{ #category : #visiting }
MADescriptionBuilder >> visitContainer: aContainer [
	builtDescription := aContainer copy.
	builtDescription removeAll.
	aContainer do: [ :each |
		self visit: each copy ]
]

{ #category : #visiting }
MADescriptionBuilder >> visitDescription: anObject [
	builtDescription
		ifNil: [ self setBuiltDescription: anObject]
		ifNotNil: [ builtDescription add: anObject ]
]
