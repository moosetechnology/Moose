"
DynamixInstance represents an instance of a type (e.g., a class).

It is created by an Activation and maintains a list of references to all Activations that hold a ref- erence to this object (i.e., Activations reference the receiver instance of a message, Activations that hold a reference to the Instance in the return value of a message send). The Instance is associated with its defining Class entity of the structural model.
"
Class {
	#name : #DynamixInstance,
	#superclass : #DynamixReference,
	#instVars : [
		'aliases',
		'type'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixInstance class >> annotation [
	<MSEClass: #Instance super: #DynamixReference>
	<package: #Dynamix>
]

{ #category : #'accessing-aliases' }
DynamixInstance >> aliases [
	^aliases ifNil: [ aliases := OrderedCollection new ]
]

{ #category : #'accessing-aliases' }
DynamixInstance >> aliases: anObject [
	aliases := anObject
]

{ #category : #'accessing-aliases' }
DynamixInstance >> argumentAliases [
	^self aliases select: [ :each | each isArgumentAlias ]
]

{ #category : #'accessing-derived' }
DynamixInstance >> clientInstance [
	^ self
]

{ #category : #'accessing-aliases' }
DynamixInstance >> fieldAliases [
	^self aliases select: [ :each | each isFieldAlias]
]

{ #category : #'instance characterization' }
DynamixInstance >> instanceCharacterization [
	^((self aliases
		select: [ :each | each creator notNil ])
			collect: [ :each | each creator trace ]) asSet size
]

{ #category : #'instance characterization' }
DynamixInstance >> instanceCreator [
	^self rootAlias ifNotNil: [ :alias |
		alias creator ifNotNil: [ :activation | activation trace ] ]
]

{ #category : #'accessing-derived' }
DynamixInstance >> instantiationTimestamp [
	^self rootAlias
		ifNotNil: [ :alias | alias timestamp ]
		ifNil: [ -1 ]
]

{ #category : #testing }
DynamixInstance >> isInstance [
	^ true
]

{ #category : #'accessing-aliases' }
DynamixInstance >> namedAliases [
	^self fieldAliases, self tempAliases, self argumentAliases
]

{ #category : #properties }
DynamixInstance >> numberOfReferencingFeatures [
"	<property: #NORF
		longName: 'Number of referencing features'
		description: 'The number of features in which this instance is referenced'
	>"
	^self
		lookUpPropertyNamed: #NORF
		computedAs: [
			((self aliases
				select: [ :each | each creator notNil ])
					collect: [ :each | each creator trace ]) asSet size ]
]

{ #category : #printing }
DynamixInstance >> printOn: aStream [
	(self type notNil) ifTrue: [
		aStream
			nextPutAll: (self type name first isVowel ifTrue: [ 'an ' ] ifFalse: [ 'a ' ]);
			nextPutAll: self type name;
			space;
			nextPut: ${;
			nextPutAll: self name;
			nextPut: $}]
	ifFalse: [ aStream nextPutAll: 'Class not in Model'].
]

{ #category : #'accessing-aliases' }
DynamixInstance >> rootAlias [
	self aliases isEmpty ifTrue: [ ^nil ].
	^ self aliases detect: [ :each | each ancestor isNil ].
]

{ #category : #'accessing-aliases' }
DynamixInstance >> tempAliases [
	^self aliases select: [ :each | each isTempAlias]
]

{ #category : #properties }
DynamixInstance >> traceOrigin [
	^ self rootAlias creator
			ifNotNil: [ :activation | activation trace ifNil: [ 'n/a' ] ] 
			ifNil: [ 'n/a' ]
]

{ #category : #accessing }
DynamixInstance >> type [
	<MSEProperty: #type type: #FAMIXType opposite: #instances>
	<MSEComment: 'The type of this instance'>
	^ type
]

{ #category : #accessing }
DynamixInstance >> type: aType [
	type := FMMultivalueLink 
		on: self
		update: #instances
		from: self type
		to: aType
]
