"
This class writes the external ID of a notaion. It omits empty system ID literals for ""PUBLIC"" external notation IDs.
"
Class {
	#name : #XMLNotationExternalIDWriter,
	#superclass : #XMLExternalIDWriter,
	#category : #'XML-Writer-Core'
}

{ #category : #writing }
XMLNotationExternalIDWriter >> writePublicExternalIDOn: aWriter [
	aWriter
		nextPutAll: 'PUBLIC';
		space;
		writeUnescapedString: self publicID.
	"the system ID is optional with notation public IDs"
	self hasSystemID
		ifTrue: [
			aWriter
				space;
				writeUnescapedString: self systemID].
]
