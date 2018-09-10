Class {
	#name : #PPJavaTokenParser,
	#superclass : #PP2CreateTokenNode,
	#category : #'PetitJava-Core'
}

{ #category : #'as yet unclassified' }
PPJavaTokenParser >> accept: visitor [
	self halt.
	^ visitor visitUnknown: self
]

{ #category : #private }
PPJavaTokenParser >> defaultTokenClass [
	^ PPJavaToken
]

{ #category : #parsing }
PPJavaTokenParser >> parseComments: anArray on: context [
	| start comments |
	comments := anArray.
	[ 
		| peekTwice |
		[ context atEnd not and: [ context peek isSeparator ] ]whileTrue: [ context next ].
		peekTwice := self peekTwice: context. 
		((peekTwice  first = $/) and: [ (peekTwice second = $*) or: [peekTwice second = $/]])] whileTrue: [
			context next.
			start := context position.
			(context next = $*) ifTrue: [ 
				self upToCommentEnd: context.
			] ifFalse: [ 
				| position |
				position := context position.
				self upToNewline: context.
			].
			comments := comments copyWith: (start to: context position) 
		].
		^ comments

	"Modified: / 21-04-2015 / 17:23:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #parsing }
PPJavaTokenParser >> parseOn: context [
	| token comments memento   |
	
	self halt: 'deprecated'.
	memento := context position.
	comments := self
		parseComments: #()
		on: context.
	token := super parseOn: context.
	token isPetit2Failure ifTrue: [
		context position: memento.
		^ token ].
	comments := self
		parseComments: comments
		on: context.
	^ token comments: comments
]

{ #category : #private }
PPJavaTokenParser >> peekTwice: context [
	| array |
	context atEnd 
		ifTrue: [^Array with: nil with: nil].
	array := Array with: (context next) with: (context peek).
	context position: context position - 1.
	^array
]

{ #category : #private }
PPJavaTokenParser >> upToCommentEnd: context [
	[ context atEnd or: [ | peekTwice |
		peekTwice := self peekTwice: context. 
		peekTwice first = $* and: [ peekTwice second = $/ ] ] 
	] whileFalse: [ context next ].
	context next.
	context next.

]

{ #category : #private }
PPJavaTokenParser >> upToNewline: context [
	[ context atEnd or: [context peek = Character cr or: [ context peek = Character lf ] ] ] whileFalse: [ context next ].
	context next.

]
