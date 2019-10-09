Class {
	#name : #FAMIXCSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #tests }
FAMIXCSourceLanguageTest >> testIsC [
	| model |
	self skip: 'Test skipped until C metamodel definition'.
	model := FAMIXModel new.
	
	model importFromMSEStream: '(
		(FAMIX.CSourceLanguage)
		(FAMIX.Class (id: 2) (name ''ClassWithoutSourceA''))
		(FAMIX.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
	self assert: model sourceLanguage isC
]

{ #category : #tests }
FAMIXCSourceLanguageTest >> testIsUnknown [
	self skip: 'Test skipped until C metamodel definition'.
	self assert: FAMIXCSourceLanguage new isUnknown not
]

{ #category : #tests }
FAMIXCSourceLanguageTest >> testName [
	self skip: 'Test skipped until C metamodel definition'.
	self assert: FAMIXCSourceLanguage new name equals: 'C'
]
