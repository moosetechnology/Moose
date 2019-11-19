"
Description
--------------------

I am a relation slot representing a property containing only one element.

Examples
--------------------

	Trait named: #FamixTMethod
		slots: { #parentType => FMOne type: #FamixTWithMethods opposite: #methods }
		package: 'Famix-Traits-Method'
"
Class {
	#name : #FMOne,
	#superclass : #FMRelationSlot,
	#category : #'Fame-Core-Utilities'
}

{ #category : #testing }
FMOne >> isToOne [
	^ true
]

{ #category : #'meta-object-protocol' }
FMOne >> write: newValue to: anObject [
	| oldValue |
	oldValue := self read: anObject.

	self hasInverse
		ifTrue: [ oldValue ifNotNil: [ self removeAssociationFrom: anObject to: oldValue ].
			newValue ifNotNil: [ self addAssociationFrom: anObject to: newValue ] ].

	super write: newValue to: anObject
]

{ #category : #internal }
FMOne >> writeInverse: newValue to: anObject [
	^ anObject instVarAt: index put: newValue
]
