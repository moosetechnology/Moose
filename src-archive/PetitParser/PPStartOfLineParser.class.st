"
A PPStartOfLineParser is that does not fail, if the stream position is at the beginning of a line. It does not consume anything.

"
Class {
	#name : #PPStartOfLineParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPStartOfLineParser >> parseOn: aPPContext [
	(aPPContext isStartOfLine) ifTrue: [ 
		^ #startOfLine
	].
	^ PPFailure message: 'Start of line expected' context: aPPContext at: aPPContext position
]
