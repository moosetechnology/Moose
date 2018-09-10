"
I am an abstract superclass for descriptions holding onto another description.

"
Class {
	#name : #MAReferenceDescription,
	#superclass : #MAElementDescription,
	#instVars : [
		'reference'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAReferenceDescription class >> defaultReference [
	^ MAStringDescription new
]

{ #category : #visiting }
MAReferenceDescription >> acceptMagritte: aVisitor [
	aVisitor visitReferenceDescription: self
]

{ #category : #'acessing-magritte' }
MAReferenceDescription >> descriptionReference [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #reference;
		classes: MADescription withAllConcreteClasses;
		label: 'Description';
		priority: 400;
		beRequired;
		yourself
]

{ #category : #accessing }
MAReferenceDescription >> initializer [
	^ self propertyAt: #initializer ifAbsent: [ #yourself ]
]

{ #category : #accessing }
MAReferenceDescription >> initializer: valuable [
	self propertyAt: #initializer put: valuable
]

{ #category : #copying }
MAReferenceDescription >> postCopy [
	super postCopy.
	reference := reference copy
]

{ #category : #accessing }
MAReferenceDescription >> reference [
	^ reference ifNil: [ reference := self class defaultReference ]
]

{ #category : #accessing }
MAReferenceDescription >> reference: aDescription [
	reference := aDescription
]
