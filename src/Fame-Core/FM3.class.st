"
A FM3 is library for FM3 primitives.
Now this class mainly forwards everything to FM3MetaDescription so it seems useless.

Probably a good candidate to be remove. 



"
Class {
	#name : #FM3,
	#superclass : #Object,
	#category : #'Fame-Core'
}

{ #category : #accessing }
FM3 class >> boolean [
	^FM3MetaDescription boolean
]

{ #category : #notes }
FM3 class >> note: text [

	"do nothing"
]

{ #category : #accessing }
FM3 class >> number [
	^FM3MetaDescription number
]

{ #category : #accessing }
FM3 class >> object [
	^FM3MetaDescription object
]

{ #category : #accessing }
FM3 class >> string [
	^FM3MetaDescription string
]

{ #category : #notes }
FM3 class >> todo: text [

	"do nothing"
]
