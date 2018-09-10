"
This class reads positive hex or decimal integers up to the maximum a SmallInteger can hold from minimal streams supporting #next, #peek, and #atEnd, handling overflow with saturation. It returns nil instead of raising errors for invalid integers.
"
Class {
	#name : #XMLSmallIntegerReader,
	#superclass : #XMLIntegerReader,
	#classVars : [
		'SmallIntegerMaxValue'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #'class initialization' }
XMLSmallIntegerReader class >> initialize [
	"self initialize"

	SmallIntegerMaxValue := SmallInteger maxVal
]

{ #category : #defaults }
XMLSmallIntegerReader class >> maxIntegerValue [
	^ SmallIntegerMaxValue
]
