Class {
	#name : #FamixJavaSourceLanguageTest,
	#superclass : #FamixJavaEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaSourceLanguageTest >> actualClass [ 
		^ FamixJavaSourceLanguage
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testDefaultUnknownLanguage [
	self assert: MooseModel new sourceLanguage isNil
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testIsJava [
	| model |
	MooseModel resetMeta.
	model := FamixJavaMooseModel importFromMSEStream: '(
		(Famix-Java-Entities.SourceLanguage)
		(Famix-Java-Entities.Class (id: 2) (name ''ClassWithoutSourceA''))
		(Famix-Java-Entities.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream withMetamodel: FamixJavaGenerator metamodel.
	self assert: model sourceLanguage isJava
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testIsUnknown [
	self deny: self actualClass new isUnknown 
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testName [
	self assert:  self actualClass new name equals: 'Java'
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testSourcedEntities [
	| model |
	MooseModel resetMeta.
	model := FamixJavaMooseModel importFromMSEStream:
			'(
		(Famix-Java-Entities.SourceLanguage (id: 1))
		(Famix-Java-Entities.Class (id: 2) (name ''ClassWithSource'') (declaredSourceLanguage (ref: 1)))
		(Famix-Java-Entities.Class (id: 3) (name ''ClassWithoutSource''))
	)' readStream.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage class equals: FamixJavaSourceLanguage.
	self assert: (model allClasses entityNamed: 'ClassWithSource') declaredSourceLanguage isAttached.
	self assert: (model allClasses entityNamed: 'ClassWithSource') sourceLanguage class equals: FamixJavaSourceLanguage.
	self assert: (model allClasses entityNamed: 'ClassWithoutSource') sourceLanguage isNil
]
