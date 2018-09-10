"
A PPEndOfLineParser is a parser that does not fail, if the stream position is at the end of a line. It does not consume anything.
"
Class {
	#name : #PPEndOfLineParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPEndOfLineParser >> parseOn: aPPContext [
	(aPPContext isEndOfLine) ifTrue: [ 
		^ #endOfLine
	].
	^ PPFailure message: 'End of line expected' context: aPPContext at: aPPContext position
]
