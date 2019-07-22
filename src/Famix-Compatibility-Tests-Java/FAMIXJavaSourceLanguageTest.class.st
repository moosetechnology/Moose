Class {
	#name : #FAMIXJavaSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Java'
}

{ #category : #tests }
FAMIXJavaSourceLanguageTest >> testIsJava [
	| model |
	MooseModel resetMeta.
	model := MooseModel new.
	
	model importFromMSEStream: '(
		(Famix-Java-Entities.JavaSourceLanguage)
		(Famix-Java-Entities.Class (id: 2) (name ''ClassWithoutSourceA''))
		(Famix-Java-Entities.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream withMetamodel: FamixJavaGenerator metamodel.
	self assert: model sourceLanguage isJava
]

{ #category : #tests }
FAMIXJavaSourceLanguageTest >> testIsUnknown [
	self assert: FAMIXJavaSourceLanguage new isUnknown not
]

{ #category : #tests }
FAMIXJavaSourceLanguageTest >> testName [
	self assert: FAMIXJavaSourceLanguage new name equals: 'Java'
]
