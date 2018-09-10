Class {
	#name : #PPContextMemento,
	#superclass : #Object,
	#instVars : [
		'stream',
		'position',
		'properties'
	],
	#category : #'PetitParser-Core'
}

{ #category : #comparing }
PPContextMemento >> = anObject [
	
	(self == anObject) ifTrue: [ ^ true ].
	(anObject class = PPContextMemento) ifFalse: [ ^ false ].
	
	(anObject stream == stream) ifFalse: [ ^ false ].
	(anObject position == position) ifFalse: [ ^ false ].
	
	(self propertiesSize == anObject propertiesSize) ifFalse: [ ^ false ].

	self keysAndValuesDo: [ :key :value |
		(anObject hasProperty: key) ifFalse: [ ^ false ].
		((anObject propertyAt: key) = value) ifFalse: [ ^ false ]. 
 	].
	
	^ true.

]

{ #category : #'accessing - properties' }
PPContextMemento >> hasProperty: aKey [
	"Test if the property aKey is present."
	
	^ properties notNil and: [ properties includesKey: aKey ]
]

{ #category : #comparing }
PPContextMemento >> hash [
	^ (position hash bitXor: stream hash) bitXor: properties hash.
]

{ #category : #'accessing - properties' }
PPContextMemento >> keysAndValuesDo: aBlock [
	properties ifNil: [ ^ self ].
	properties keysAndValuesDo: [ :key :value | aBlock value: key value: value copy ] 
]

{ #category : #accessing }
PPContextMemento >> position [
	^ position
]

{ #category : #accessing }
PPContextMemento >> position: anInteger [
	position := anInteger 
]

{ #category : #'accessing - properties' }
PPContextMemento >> propertiesSize [
	properties ifNil: [ ^ 0 ].
	^ properties size.
]

{ #category : #'accessing - properties' }
PPContextMemento >> propertyAt: aKey [
	"Answer the property value associated with aKey."
	
	^ self propertyAt: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - properties' }
PPContextMemento >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	properties isNil
		ifTrue: [ ^ aBlock value ]
		ifFalse: [ 
			(properties includesKey: aKey) ifTrue: [ 
				^ (properties at: aKey) copy
			].
			^ aBlock value
		]
]

{ #category : #'accessing - properties' }
PPContextMemento >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{ #category : #'accessing - properties' }
PPContextMemento >> propertyAt: aKey put: anObject [
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (properties ifNil: [ properties := Dictionary new: 1 ])
		at: aKey put: (anObject copy)
]

{ #category : #'accessing - properties' }
PPContextMemento >> removeProperty: aKey [
	"Remove the property with aKey. Answer the property or raise an error if aKey isn't found."
	
	^ self removeProperty: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing - properties' }
PPContextMemento >> removeProperty: aKey ifAbsent: aBlock [
	"Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	properties isNil ifTrue: [ ^ aBlock value ].
	answer := properties removeKey: aKey ifAbsent: aBlock.
	properties isEmpty ifTrue: [ properties := nil ].
	^ answer
]

{ #category : #accessing }
PPContextMemento >> stream [
	^ stream
]

{ #category : #accessing }
PPContextMemento >> stream: aStream [
	stream := aStream
]
