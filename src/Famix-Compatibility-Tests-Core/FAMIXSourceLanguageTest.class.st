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
FAMIXSourceLanguageTest >> testDefaultSourceLanguage [
	| model |
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
		(FAMIX.CustomSourceLanguage (id: 1) (name ''SomeLanguage''))
		(FAMIX.Class (id: 2) (name ''ClassWithoutSourceA''))
		(FAMIX.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
	self assert: (model allClasses entityNamed: 'ClassWithoutSourceA') declaredSourceLanguage isNil.
	self assert: (model allClasses entityNamed: 'ClassWithoutSourceB') declaredSourceLanguage isNil.
	self
		assert: (model allClasses entityNamed: 'ClassWithoutSourceA') sourceLanguage
		equals: (model allClasses entityNamed: 'ClassWithoutSourceB') sourceLanguage.
	self assert: model sourceLanguage name equals: 'SomeLanguage'
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

{ #category : #tests }
FAMIXSourceLanguageTest >> testSourcedEntities [
	| model |
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
		(FAMIX.CustomSourceLanguage (id: 1) (name ''SomeLanguage''))
		(FAMIX.Class (id: 2) (name ''ClassWithSource'') (declaredSourceLanguage (ref: 1)))
		(FAMIX.Class (id: 3) (name ''ClassWithoutSource''))
	)' readStream.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage name equals: 'SomeLanguage'.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage isAttached.
	self assert: (model allClasses entityNamed: 'ClassWithSource') sourceLanguage name equals: 'SomeLanguage'.
	self assert: (model allClasses entityNamed: 'ClassWithoutSource') sourceLanguage isNil
]
