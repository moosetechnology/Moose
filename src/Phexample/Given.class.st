Class {
	#name : #Given,
	#superclass : #TestResource,
	#instVars : [
		'cache'
	],
	#category : #'Phexample-Core'
}

{ #category : #dependencies }
Given >> consumeReturnValueAt: testMethod [
	^(cache includesKey: testMethod)
		ifTrue: [ cache removeKey: testMethod ]
		ifFalse: [ |ret|
			testMethod setUp.
			ret := testMethod perform: testMethod selector.
			testMethod tearDown.
			ret
			 ]
]

{ #category : #dependencies }
Given >> produceReturnValueAt: testMethod [
	cache at: testMethod ifAbsentPut: [ testMethod perform: testMethod selector ]
]

{ #category : #fixture }
Given >> setUp [
	cache := Dictionary new.
]

{ #category : #fixture }
Given >> tearDown [
    cache := nil
]
