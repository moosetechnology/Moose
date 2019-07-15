Class {
	#name : #FAMIXCSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #tests }
FAMIXCSourceLanguageTest >> testIsC [
	| model |
	MooseModel resetMeta.
	model := MooseModel new.
	
	model importFromMSEStream: '(
		(FAMIX.CSourceLanguage)
		(FAMIX.Class (id: 2) (name ''ClassWithoutSourceA''))
		(FAMIX.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
	self assert: model sourceLanguage isC
]

{ #category : #tests }
FAMIXCSourceLanguageTest >> testIsUnknown [
	self assert: FAMIXJavaSourceLanguage new isUnknown not
]

{ #category : #tests }
FAMIXCSourceLanguageTest >> testName [
	self assert: FAMIXJavaSourceLanguage new name equals: 'Java'
]
