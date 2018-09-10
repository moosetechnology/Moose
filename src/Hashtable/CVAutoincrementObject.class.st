Class {
	#name : #CVAutoincrementObject,
	#superclass : #Object,
	#instVars : [
		'hash'
	],
	#classVars : [
		'NextHash'
	],
	#category : #'Hashtable-Objects'
}

{ #category : #'class initialization' }
CVAutoincrementObject class >> initialize [
	"self initialize"
	NextHash := 0
]

{ #category : #comparing }
CVAutoincrementObject >> hash [
	^hash
]

{ #category : #'initialize-release' }
CVAutoincrementObject >> initialize [
	super initialize.
	NextHash = SmallInteger maxVal ifTrue: [
		NextHash := 0 ].
	NextHash := NextHash + 1.
	hash := NextHash
]
