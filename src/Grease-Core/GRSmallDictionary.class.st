"
I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating. My implementation features some ideas from the RefactoringBrowser.
"
Class {
	#name : #GRSmallDictionary,
	#superclass : #GRObject,
	#instVars : [
		'size',
		'keys',
		'values'
	],
	#category : #'Grease-Core-Collections'
}

{ #category : #'instance creation' }
GRSmallDictionary class >> new [
	^ self new: 3
]

{ #category : #'instance creation' }
GRSmallDictionary class >> new: anInteger [
	^ self basicNew initialize: anInteger; yourself
]

{ #category : #'instance creation' }
GRSmallDictionary class >> withAll: aDictionary [
	^ (self new: aDictionary size)
		addAll: aDictionary;
		yourself
]

{ #category : #accessing }
GRSmallDictionary >> add: anAssociation [
	self at: anAssociation key put: anAssociation value.
	^ anAssociation
]

{ #category : #accessing }
GRSmallDictionary >> addAll: aDictionary [
	aDictionary keysAndValuesDo: [ :key :value | self add: key -> value ].
	^ aDictionary
]

{ #category : #accessing }
GRSmallDictionary >> associations [
	"Answer a Collection containing the receiver's associations."

	| result |
	result := WriteStream on: (Array new: self size).
	self associationsDo: [ :assoc | result nextPut: assoc ].
	^ result contents
]

{ #category : #enumerating }
GRSmallDictionary >> associationsDo: aBlock [
	self keysAndValuesDo: [ :key :value | aBlock value: key -> value ]
]

{ #category : #accessing }
GRSmallDictionary >> at: aKey [
	"Answer the value associated with aKey. Raise an exception, if no such key is defined."

	^ self at: aKey ifAbsent: [ self errorKeyNotFound ]
]

{ #category : #accessing }
GRSmallDictionary >> at: aKey ifAbsent: aBlock [
	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined."

	| index |
	index := self findIndexFor: aKey.
	^ index = 0
		ifFalse: [ values at: index ]
		ifTrue: [ aBlock value ]
]

{ #category : #accessing }
GRSmallDictionary >> at: aKey ifAbsentPut: aBlock [
	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined and store the return value."

	| index |
	index := self findIndexFor: aKey.
	^ index = 0
		ifFalse: [ values at: index ]
		ifTrue: [ self privateAt: aKey put: aBlock value ]
]

{ #category : #accessing }
GRSmallDictionary >> at: aKey ifPresent: aBlock [
	"Lookup aKey in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."

	| index |
	index := self findIndexFor: aKey.
	^ index = 0 ifFalse: [ aBlock value: (values at: index) ]
]

{ #category : #accessing }
GRSmallDictionary >> at: aKey put: aValue [
	"Set the value of aKey to be aValue."

	| index |
	index := self findIndexFor: aKey.
	^ index = 0
		ifFalse: [ values at: index put: aValue ]
		ifTrue: [ self privateAt: aKey put: aValue ]
]

{ #category : #enumerating }
GRSmallDictionary >> do: aBlock [
	1 to: size do: [ :index | aBlock value: (values at: index) ]
]

{ #category : #private }
GRSmallDictionary >> errorKeyNotFound [
	self error: 'Key not found'
]

{ #category : #private }
GRSmallDictionary >> findIndexFor: aKey [
	1 to: size do: [ :index |
		(keys at: index) = aKey
			ifTrue: [ ^ index ] ].
	^ 0
]

{ #category : #private }
GRSmallDictionary >> grow [
	| newKeys newValues |
	newKeys := Array new: 2 * size.
	newValues := Array new: 2 * size.
	1 to: size do: [ :index |
		newKeys at: index put: (keys at: index).
		newValues at: index put: (values at: index) ].
	keys := newKeys.
	values := newValues
]

{ #category : #testing }
GRSmallDictionary >> includesKey: aKey [
	"Answer whether the receiver has a key equal to aKey."

	^ (self findIndexFor: aKey) ~= 0
]

{ #category : #initialization }
GRSmallDictionary >> initialize: anInteger [
	self initialize.
	size := 0.
	keys := Array new: anInteger.
	values := Array new: anInteger
]

{ #category : #testing }
GRSmallDictionary >> isCollection [
	^ true
]

{ #category : #testing }
GRSmallDictionary >> isEmpty [
	^ size = 0
]

{ #category : #enumerating }
GRSmallDictionary >> keys [
	^ keys copyFrom: 1 to: size
]

{ #category : #enumerating }
GRSmallDictionary >> keysAndValuesDo: aBlock [
	1 to: size do: [ :index | aBlock value: (keys at: index) value: (values at: index) ]
]

{ #category : #enumerating }
GRSmallDictionary >> keysDo: aBlock [
	1 to: size do: [ :each | aBlock value: (keys at: each) ]
]

{ #category : #copying }
GRSmallDictionary >> postCopy [
	super postCopy.
	keys := keys copy.
	values := values copy
]

{ #category : #printing }
GRSmallDictionary >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	self size <= 100
		ifTrue: [
			| first |
			first := true.
			self keysAndValuesDo: [ :key :value |
				"keysAndValuesDo:separatedBy: would be nice"
				first
					ifTrue: [ first := false ]
					ifFalse: [ aStream space ].
				aStream
					print: key;
					nextPutAll: '->';				
					print: value ] ]
		ifFalse: [
			aStream
				nextPutAll: 'size ';
				print: self size ].
	aStream nextPut: $)	
]

{ #category : #private }
GRSmallDictionary >> privateAt: aKey put: aValue [
	size = keys size ifTrue: [ self grow ].
	keys at: (size := size + 1) put: aKey.
	^ values at: size put: aValue
]

{ #category : #private }
GRSmallDictionary >> removeIndex: index [
	| value |
	value := values at: index.
	index to: size - 1 do:
			[ :i | 
			keys at: i put: (keys at: i + 1).
			values at: i put: (values at: i + 1) ].
	keys at: size put: nil.
	values at: size put: nil.
	size := size - 1.
	^ value
]

{ #category : #accessing }
GRSmallDictionary >> removeKey: aKey [
	"Remove aKey from the receiver, raise an exception if the element is missing."

	^ self removeKey: aKey ifAbsent: [ self errorKeyNotFound ]
]

{ #category : #accessing }
GRSmallDictionary >> removeKey: aKey ifAbsent: aBlock [
	"Remove aKey from the receiver, evaluate aBlock if the element is missing."

	| index |
	index := self findIndexFor: aKey.
	index = 0 ifTrue: [ ^ aBlock value ].
	^ self removeIndex: index
]

{ #category : #accessing }
GRSmallDictionary >> size [
	^ size
]

{ #category : #enumerating }
GRSmallDictionary >> values [
	^ values copyFrom: 1 to: size
]
