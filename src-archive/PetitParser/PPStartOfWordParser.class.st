"
A PPStartOfWordParser is that matches a word boundary.

I return success if no word character preceeds my position and if word chracter succeeds my position.

Word characters are any alphanumeric characters.
"
Class {
	#name : #PPStartOfWordParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #'as yet unclassified' }
PPStartOfWordParser >> acceptsEpsilon [
	^ false
]

{ #category : #'as yet unclassified' }
PPStartOfWordParser >> parseOn: aPPContext [
	aPPContext atEnd ifTrue: [  
		^ PPFailure message: 'Start of word expected' context: aPPContext at: aPPContext position 
	].

	(aPPContext position == 0) ifTrue: [ 
		(aPPContext peek isAlphaNumeric) ifTrue: [ 
			^ #startOfWord
		] ifFalse: [ 
			^ PPFailure message: 'Start of word expected' context: aPPContext at: aPPContext position 
	 	]
	].

	aPPContext back.
	aPPContext peek isAlphaNumeric ifTrue: [
		^ PPFailure message: 'Start of word expected' context: aPPContext at: aPPContext position 
	].
	aPPContext next.
	
	^ aPPContext peek isAlphaNumeric ifTrue: [ #startOfWord ] ifFalse: [ 
		PPFailure message: 'Start of word expected' context: aPPContext at: aPPContext position 
	]
	

]
