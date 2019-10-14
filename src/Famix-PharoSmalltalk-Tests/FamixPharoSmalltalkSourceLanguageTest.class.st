Class {
	#name : #FamixPharoSmalltalkSourceLanguageTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixPharoSmalltalkSourceLanguageTest >> testIsPharo [
	| model |
	model := FamixStModel new.

	model
		importFromMSEStream:
			'(
		(Famix-PharoSmalltalk-Entities.SourceLanguage)
		(Famix-PharoSmalltalk-Entities.Class (id: 2) (name ''ClassWithoutSourceA''))
		(Famix-PharoSmalltalk-Entities.Class (id: 3) (name ''ClassWithoutSourceB''))
	)' readStream.
	self assert: model sourceLanguage isPharo
]

{ #category : #tests }
FamixPharoSmalltalkSourceLanguageTest >> testIsUnknown [
	self deny: FamixStSourceLanguage new isUnknown
]

{ #category : #tests }
FamixPharoSmalltalkSourceLanguageTest >> testName [
	self assert: FamixStSourceLanguage new name equals: 'Pharo'
]
