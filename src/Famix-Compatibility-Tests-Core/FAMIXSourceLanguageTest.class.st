Class {
	#name : #FAMIXSourceLanguageTest,
	#superclass : #FAMIXEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #tests }
FAMIXSourceLanguageTest >> actualClass [
	^ FAMIXSourceLanguage
]

{ #category : #tests }
FAMIXSourceLanguageTest >> testDefaultUnknownLanguage [
	self assert: MooseModel new sourceLanguage isNil
]

{ #category : #tests }
FAMIXSourceLanguageTest >> testIsUnknown [
	self deny: self actualClass new isUnknown 
]

{ #category : #tests }
FAMIXSourceLanguageTest >> testName [
	self assert:  self actualClass new name equals: ''
]
