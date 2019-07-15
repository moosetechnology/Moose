Class {
	#name : #CIVAutoincrementObject,
	#superclass : #Object,
	#instVars : [
		'hash'
	],
	#classInstVars : [
		'nextHash'
	],
	#category : #'Hashtable-Objects'
}

{ #category : #'class initialization' }
CIVAutoincrementObject class >> initialize [
	"self initialize"
	nextHash := 0
]

{ #category : #'instance creation' }
CIVAutoincrementObject class >> new [
	nextHash = SmallInteger maxVal ifTrue: [
		nextHash := 0 ].
	nextHash := nextHash + 1.
	^super new
		hash: nextHash;
		yourself
]

{ #category : #comparing }
CIVAutoincrementObject >> hash [
	^hash
]

{ #category : #private }
CIVAutoincrementObject >> hash: anObject [
	hash := anObject
]
