"
I am an abstract description for descriptions representing a relation. My instance variable ==classes== references a collection of possible classes that I can relate to. If required the reference description will be automatically built from this list of classes.
"
Class {
	#name : #MARelationDescription,
	#superclass : #MAReferenceDescription,
	#instVars : [
		'classes'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MARelationDescription class >> defaultClasses [
	^ Set new
]

{ #category : #'accessing-defaults' }
MARelationDescription class >> defaultReference [
	^ nil
]

{ #category : #visiting }
MARelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitRelationDescription: self
]

{ #category : #'accessing-dynamic' }
MARelationDescription >> allClasses [
	^ (Array withAll: self classes)
		sort: [ :a :b | a label caseInsensitiveLessOrEqual: b label ];
		yourself
]

{ #category : #accessing }
MARelationDescription >> classes [
	^ classes ifNil: [ classes := self class defaultClasses ]
]

{ #category : #accessing }
MARelationDescription >> classes: aCollection [
	classes := aCollection
]

{ #category : #'accessing-dynamic' }
MARelationDescription >> commonClass [
	"Answer a common superclass of the classes of the receiver. The algorithm is implemented to be as efficient as possible. The inner loop will be only executed the first few iterations."

	| current |
	self classes isEmpty
		ifTrue: [ ^ self descriptionContainer ].
	current := self classes anyOne.
	self classes do: [ :each |
		[ each includesBehavior: current ]
			whileFalse: [ current := current superclass ] ].
	^ current
]

{ #category : #'acessing-magritte' }
MARelationDescription >> descriptionClasses [
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #classes;
		label: 'Classes';
		priority: 400;
		options: Smalltalk allClasses;
		reference: MAClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
MARelationDescription >> descriptionReference [
	<magritteDescription>
	^ super descriptionReference
		classes: MAContainer withAllConcreteClasses;
		beOptional;
		yourself
]

{ #category : #copying }
MARelationDescription >> postCopy [
	super postCopy.
	classes := classes copy
]

{ #category : #'accessing-dynamic' }
MARelationDescription >> reference [
	"The reference within a ==*MARelationDescription*== is calculated automatically from all the classes of the receiver, if set to ==nil==. By setting the reference to a ==*MAContainer*== instance it is possible to customize the reference description."

	^ super reference ifNil: [ self commonClass magritteTemplate magritteDescription ]
]
