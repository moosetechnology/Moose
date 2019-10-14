Class {
	#name : #FamixJavaSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaSourceLanguageTest >> testIsJava [
	| model |
	model := FamixJavaModel new.

	model
		importFromMSEStream:
			'(
		(Famix-Java-Entities.SourceLanguage)
		(Famix-Java-Entities.Class (id: 2) (name ''ClassWithoutSourceA''))
		(Famix-Java-Entities.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
	self assert: model sourceLanguage isJava
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testIsUnknown [
	self deny: FamixJavaSourceLanguage new isUnknown
]

{ #category : #tests }
FamixJavaSourceLanguageTest >> testName [
	self assert: FamixJavaSourceLanguage new name equals: 'Java'
]
