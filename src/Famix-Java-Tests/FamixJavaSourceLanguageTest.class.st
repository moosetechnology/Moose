Class {
	#name : #FamixJavaSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

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
	self assert: FamixJavaSourceLanguage new isUnknown not
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testName [
	self assert: FamixJavaSourceLanguage new name equals: 'Java'
]
