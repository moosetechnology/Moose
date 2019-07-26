Class {
	#name : #FamixSmalltalkSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixSmalltalkSourceLanguageTest >> testSourcedEntities [
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
