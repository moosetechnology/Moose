Extension { #name : #UndefinedObject }

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLChar [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLNCNameChar [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLNCNameStartChar [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLNameChar [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLNameStartChar [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLSeparator [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]

{ #category : #'*XML-Parser' }
UndefinedObject >> isXMLWhitespace [
	"hack optimization to avoid testing for nil before sending
	this to objects from streams in XMLParser"
	^ false
]
