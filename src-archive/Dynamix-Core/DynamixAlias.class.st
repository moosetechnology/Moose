"
The Alias models the usage of an instance in an event.
"
Class {
	#name : #DynamixAlias,
	#superclass : #DynamixReference,
	#instVars : [
		'subject',
		'ancestor',
		'descendants',
		'creator',
		'timestamp'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixAlias class >> annotation [
	<MSEClass: #Alias super: #DynamixReference>
	<package: #Dynamix>
]

{ #category : #'accessing-derived' }
DynamixAlias >> allDescendants [
	| collection result |
	collection := self descendants.
	result := collection isEmpty
		ifTrue: [ collection ]
		ifFalse: [ (collection flatCollect: [ :each | each allDescendants ]) , collection ].
	(result size > self subject aliases size) ifTrue: [ self error: 'Sanity check... this is impossible' ].
	^ result
]

{ #category : #accessing }
DynamixAlias >> ancestor [
	^ ancestor
]

{ #category : #accessing }
DynamixAlias >> ancestor: anObject [
	ancestor := anObject
]

{ #category : #'accessing-derived' }
DynamixAlias >> ancestorFoundIn: aCollection [
	self isRoot ifTrue: [ ^nil ].
	^ (aCollection includes: self ancestor)
		ifTrue: [ self ancestor ]
		ifFalse: [ self ancestor ancestorFoundIn: aCollection ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> ancestoryChain [
	"Including self"

	self isRoot ifTrue: [ ^ Array with: self ].
	^ (Array with: self) , self ancestor ancestoryChain
]

{ #category : #'accessing-derived' }
DynamixAlias >> cachedAllDescendants [
	^ self	
		propertyNamed: #allDescendants
		ifAbsentPut: [ self allDescendants ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> clientAlias [
	^ self creator ifNotNil: [ :each | each receiver ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> clientClass [
	"following code could be used alternatively in case clientInstance isNil, but it may return a superclass:
	self creator ifNotNil: [ self creator method belongsTo ]."
	
	^ self clientInstance ifNotNil: [ :object | object type ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> clientClassId [
	^ self clientClass isNil
		ifTrue: [ 'unknown' ]
		ifFalse: [ self clientClass name ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> clientInstance [
	^ self clientAlias ifNotNil: [ :each | each subject ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> clientName [
	| clientClassName clientClassMethod activationReturnedFrom |
	self creator ifNil: [ ^'n/a' ].
	activationReturnedFrom := self creator children detect: [ :each | each return = self ] ifNone: [ nil ].
	clientClassName := activationReturnedFrom
		ifNotNil: [ :activation | activation classOfReceiver name ] ifNil: [ '?' ].
	clientClassMethod := activationReturnedFrom
		ifNotNil: [ :activation | activation method name ] ifNil: [ '?' ].
	^ clientClassName , '>>' , clientClassMethod
]

{ #category : #accessing }
DynamixAlias >> creator [
	^ creator
]

{ #category : #accessing }
DynamixAlias >> creator: anObject [
	creator := anObject
]

{ #category : #'accessing-derived' }
DynamixAlias >> definingClass [
	"Note, in contrast to #clientMethod we get the class in which the variable is statically defined, which may be a superclass of the subject instance!"
	^ self variable isNil
		ifFalse: [ self variable definingClass ]
		ifTrue: [ self clientClass ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> depth [
	^self ancestor ifNil: [ 1 ] ifNotNil: [ 1 + self ancestor depth ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> descendants [
	descendants ifNil: [
		descendants := OrderedCollection new
		"descendants := self subject aliases select: [ :each | each ancestor == self ]" ].
	descendants asSet size = descendants size ifFalse: [ self error: 'Sanity check: how is this possible?!' ].
	^ descendants
]

{ #category : #accessing }
DynamixAlias >> descendants: anObject [
	descendants := anObject
]

{ #category : #'accessing-derived' }
DynamixAlias >> externalActivations [
	^ self activations reject: [ :each |
		each isSelfMessage ]
]

{ #category : #'accessing-derived' }
DynamixAlias >> feature [
	^ self trace
]

{ #category : #testing }
DynamixAlias >> isAlias [
	^ true
]

{ #category : #accessing }
DynamixAlias >> subject [
	^ subject
]

{ #category : #accessing }
DynamixAlias >> subject: anObject [
	subject := anObject
]

{ #category : #accessing }
DynamixAlias >> timestamp [
	"Work around wiretab missing timestamp"

	^timestamp
		ifNotNil: [ timestamp asNumber ]
		ifNil: [ self creator start + 1 ]
]

{ #category : #accessing }
DynamixAlias >> timestamp: anObject [
	timestamp := anObject
]
