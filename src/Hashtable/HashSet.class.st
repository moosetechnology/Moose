Class {
	#name : #HashSet,
	#superclass : #HashTable,
	#category : #Hashtable
}

{ #category : #comparing }
HashSet >> = aSet [
	self == aSet ifTrue: [^ true].	"stop recursion"
	((aSet isKindOf: Set) or: [ aSet isKindOf: HashSet ])
		ifFalse: [^ false].
	self size = aSet size ifFalse: [^ false].
	self do: [:each | (aSet includes: each) ifFalse: [^ false]].
	^ true
]

{ #category : #adding }
HashSet >> add: newObject [
	newObject ifNil: [self error: 'Sets cannot meaningfully contain nil as an element'].
	^self at: newObject put: true
]

{ #category : #adding }
HashSet >> addAll: aCollection [ 
	"Include all the elements of aCollection as the receiver's elements. Answer 
	aCollection. Actually, any object responding to #do: can be used as argument."

	aCollection do: [:each | self add: each].
	^ aCollection
]

{ #category : #converting }
HashSet >> asSet [
	^self
]

{ #category : #enumerating }
HashSet >> collect: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."

	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^ newCollection
]

{ #category : #enumerating }
HashSet >> do: aBlock [
	"self keysDo: aBlock"
	self keysAndValuesDo: [ :key :value |
		aBlock value: key ]
]

{ #category : #testing }
HashSet >> includes: anObject [
	^self at: anObject ifAbsent: [ false ]
]

{ #category : #testing }
HashSet >> occurrencesOf: anObject [ 
	^ (self includes: anObject) ifTrue: [1] ifFalse: [0]
]

{ #category : #printing }
HashSet >> printOn: aStream [ 
	"printNameOn:"
	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title.
	
	"printElementsOn:"
	aStream nextPut: $(.
	self do: [:element | aStream print: element; space].
	self isEmpty ifFalse: [aStream skip: -1].
	aStream nextPut: $)
]

{ #category : #removing }
HashSet >> remove: oldObject ifAbsent: anExceptionBlock [
	^self removeKey: oldObject ifAbsent: anExceptionBlock.
]

{ #category : #enumerating }
HashSet >> select: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."

	| newCollection |
	newCollection := self species new.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection
]
