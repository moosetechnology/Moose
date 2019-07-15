Class {
	#name : #REPStakeholder,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'byName'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #'instance creation' }
REPStakeholder class >> byName [
	byName isNil ifTrue: [ self reset ].
	^ byName
]

{ #category : #'instance creation' }
REPStakeholder class >> everyone [ 
	^ self named: 'everyone'
]

{ #category : #'instance creation' }
REPStakeholder class >> named: aString [
	^ self byName at: aString ifAbsentPut: [self new name: aString]
]

{ #category : #'instance creation' }
REPStakeholder class >> reset [
	byName := Dictionary new.
]

{ #category : #accessing }
REPStakeholder >> , aStakeholder [
	^ REPGroupStakeholder with: self with: aStakeholder
]

{ #category : #accessing }
REPStakeholder >> asString [
	^ self name
]

{ #category : #accessing }
REPStakeholder >> asStrings [
	^ {self asString}
]

{ #category : #accessing }
REPStakeholder >> name [
	^ name
]

{ #category : #accessing }
REPStakeholder >> name: anObject [
	name := anObject
]
