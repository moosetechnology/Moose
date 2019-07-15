Class {
	#name : #PPJavaWhitespace,
	#superclass : #PP2Strategy,
	#category : #'PetitJava-Core'
}

{ #category : #parsing }
PPJavaWhitespace >> parseOn: context [
	| start |

	[ 
		| peekTwice |
		[ context atEnd not and: [ context peek isSeparator ] ]
			whileTrue: [ context next ].
		peekTwice := self peekTwice: context. 
		((peekTwice  first = $/) and: 	[ (peekTwice second = $*) or: [peekTwice second = $/]])
	] whileTrue: [
		context next.
		start := context position.
		(context next = $*) ifTrue: [ 
			self upToCommentEnd: context.
		] ifFalse: [ 
			self upToNewline: context.
		].
	].
]

{ #category : #private }
PPJavaWhitespace >> peekTwice: context [
	| array |
	context atEnd 
		ifTrue: [^Array with: nil with: nil].
	array := Array with: (context next) with: (context peek).
	context position: context position - 1.
	^array
]

{ #category : #private }
PPJavaWhitespace >> upToCommentEnd: context [
	[ context atEnd or: [ | peekTwice |
		peekTwice := self peekTwice: context. 
		peekTwice first = $* and: [ peekTwice second = $/ ] ] 
	] whileFalse: [ context next ].
	context next.
	context next.

]

{ #category : #private }
PPJavaWhitespace >> upToNewline: context [
	[ context atEnd or: [context peek = Character cr or: [ context peek = Character lf ] ] ] whileFalse: [ context next ].
	context next.

]
