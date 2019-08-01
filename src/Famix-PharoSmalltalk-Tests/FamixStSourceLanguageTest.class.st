Class {
	#name : #FamixStSourceLanguageTest,
	#superclass : #FamixStEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixStSourceLanguageTest >> actualClass [ 
		^ FamixStSourceLanguage
]

{ #category : #tests }
FamixStSourceLanguageTest >> testDefaultUnknownLanguage [
	self assert: MooseModel new sourceLanguage isNil
]

{ #category : #tests }
FamixStSourceLanguageTest >> testIsUnknown [
	self deny: self actualClass new isUnknown 
]

{ #category : #tests }
FamixStSourceLanguageTest >> testName [
	self assert:  self actualClass new name equals: 'Smalltalk'
]

{ #category : #tests }
FamixStSourceLanguageTest >> testSourcedEntities [
	| model |
	MooseModel resetMeta.
	model := FamixStMooseModel importFromMSEStream:
			'(
		(Famix-PharoSmalltalk-Entities.SourceLanguage (id: 1))
		(Famix-PharoSmalltalk-Entities.Class (id: 2) (name ''ClassWithSource'') (declaredSourceLanguage (ref: 1)))
		(Famix-PharoSmalltalk-Entities.Class (id: 3) (name ''ClassWithoutSource''))
	)' readStream.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage class equals: FamixStSourceLanguage.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage isAttached.
	self assert: (model allClasses entityNamed: 'ClassWithSource') sourceLanguage class equals: FamixStSourceLanguage.
	self assert: (model allClasses entityNamed: 'ClassWithoutSource') sourceLanguage isNil
]
