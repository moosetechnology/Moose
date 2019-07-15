Class {
	#name : #GLMMagrittePresentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'magritteDescription',
		'answerBlock'
	],
	#category : #'Glamour-Magritte-Presentations'
}

{ #category : #accessing }
GLMMagrittePresentation >> description: anObject [
	"convenience method for scripting"
	
	magritteDescription := anObject
]

{ #category : #accessing }
GLMMagrittePresentation >> magritteDescription [
	"By default the we read it via the #description selector"
	^ magritteDescription ifNil: [ magritteDescription := #magritteDescription ]
]

{ #category : #accessing }
GLMMagrittePresentation >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #accessing }
GLMMagrittePresentation >> reactOnAnswerFor: aValue [
	self update.
	^ answerBlock glamourValue:
		(aValue asGlamorousMultiValue, 
		self asGlamorousMultiValue, 
		self entity asGlamorousMultiValue)
]

{ #category : #rendering }
GLMMagrittePresentation >> renderGlamorouslyOn: aRenderer [ 
	^ aRenderer renderMagrittePresentation: self
]
