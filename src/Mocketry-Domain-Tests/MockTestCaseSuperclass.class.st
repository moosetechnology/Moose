Class {
	#name : #MockTestCaseSuperclass,
	#superclass : #TestCase,
	#instVars : [
		'mockFromSuperclass'
	],
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #testing }
MockTestCaseSuperclass class >> isAbstract [
	^self == MockTestCaseSuperclass 
]

{ #category : #running }
MockTestCaseSuperclass >> setUp [
	super setUp.
	
	mockFromSuperclass := Mock new.
]
