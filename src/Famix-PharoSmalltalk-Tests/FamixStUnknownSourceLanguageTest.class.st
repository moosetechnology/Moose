Class {
	#name : #FamixStUnknownSourceLanguageTest,
	#superclass : #FamixStEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixStUnknownSourceLanguageTest >> actualClass [ 
		^ FamixStUnknownSourceLanguage
]

{ #category : #tests }
FamixStUnknownSourceLanguageTest >> testIsUnknown [
	self assert: self actualClass new isUnknown
]
