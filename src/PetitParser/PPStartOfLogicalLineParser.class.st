"
A PPStartOfLogicalLineParser is that does not fail, if the stream position is at the first non-blank character of a line. It does not consume anything.

"
Class {
	#name : #PPStartOfLogicalLineParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #'as yet unclassified' }
PPStartOfLogicalLineParser >> isBlank: character [
	^ (character == Character space or: [character == Character tab])

]

{ #category : #'as yet unclassified' }
PPStartOfLogicalLineParser >> parseOn: aPPContext [
	aPPContext peek isAlphaNumeric ifFalse: [ 
		^ PPFailure message: 'Start of logical line expected' context: aPPContext 
	].

	aPPContext isStartOfLine ifTrue: [ ^ #startOfLogicalLine ].
	
	
	[ aPPContext position ~= 0 ] whileTrue: [  
		aPPContext back.
		(self isBlank: aPPContext peek) ifFalse: [ 
			^ PPFailure message: 'Start of logical line expected' context: aPPContext
		].
		aPPContext isStartOfLine ifTrue: [ ^ #startOfLogicalLine ].
	]

]
