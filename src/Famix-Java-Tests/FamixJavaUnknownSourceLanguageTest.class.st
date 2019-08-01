Class {
	#name : #FamixJavaUnknownSourceLanguageTest,
	#superclass : #FamixJavaEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaUnknownSourceLanguageTest >> actualClass [ 
		^ FamixJavaUnknownSourceLanguage
]

{ #category : #tests }
FamixJavaUnknownSourceLanguageTest >> testIsUnknown [
	self assert: self actualClass new isUnknown
]
