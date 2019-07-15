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
		(FAMIX.JavaSourceLanguage)
		(FAMIX.Class (id: 2) (name ''ClassWithoutSourceA''))
		(FAMIX.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
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
