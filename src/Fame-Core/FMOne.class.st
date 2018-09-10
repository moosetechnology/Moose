Class {
	#name : #FMOne,
	#superclass : #FMRelationSlot,
	#category : #'Fame-Core-Slots'
}

{ #category : #testing }
FMOne >> isToOneSlot [

	^true
]

{ #category : #'meta-object-protocol' }
FMOne >> mooseProperty [

	^ self moosePropertyFor: self owningClass name multivalued: false.
]

{ #category : #'meta-object-protocol' }
FMOne >> write: newValue to: anObject [

	| oldValue |

	oldValue := self read: anObject.
	newValue notNil
		ifTrue: [ self checkValue: newValue ].
	self hasInverse 
		ifTrue: [ 
			oldValue notNil
				ifTrue: [ self removeAssociationFrom: anObject to: oldValue ].
			newValue notNil
				ifTrue: [ self addAssociationFrom: anObject to: newValue ] ].
		
	super write: newValue to: anObject
]

{ #category : #internal }
FMOne >> writeInverse: newValue to: anObject [
	^anObject instVarAt: index put: newValue
]
