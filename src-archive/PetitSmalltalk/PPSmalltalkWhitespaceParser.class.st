Class {
	#name : #PPSmalltalkWhitespaceParser,
	#superclass : #PPParser,
	#category : #'PetitSmalltalk-Core'
}

{ #category : #initialization }
PPSmalltalkWhitespaceParser >> initialize [
	super initialize.
]

{ #category : #analysis }
PPSmalltalkWhitespaceParser >> isNullable [
	^ true
]

{ #category : #parsing }
PPSmalltalkWhitespaceParser >> name [
	^ 'smalltalk_ws'
]

{ #category : #parsing }
PPSmalltalkWhitespaceParser >> parseOn: aPPContext [
	[ [aPPContext atEnd not and: [ aPPContext uncheckedPeek isSeparator ] ]
		whileTrue: [ aPPContext next ].
		
	 aPPContext atEnd not and: [ aPPContext uncheckedPeek = $" ] ] whileTrue: [
		aPPContext next.
		aPPContext upTo: $".
	].
]
