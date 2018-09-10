Class {
	#name : #FMUtil,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #'Fame-Util'
}

{ #category : #'instance creation' }
FMUtil class >> default [
	default isNil ifTrue: [ default := self new ].
	^default
]

{ #category : #functions }
FMUtil >> createRBModel [
	^RBNamespace new
		name: 'Fame-Generated';
		yourself
]

{ #category : #functions }
FMUtil >> signal: exception [
	exception signal
]

{ #category : #functions }
FMUtil >> squeakDo: aBlock [
	aBlock value
]
