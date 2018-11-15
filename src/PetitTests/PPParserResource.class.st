Class {
	#name : #PPParserResource,
	#superclass : #TestResource,
	#instVars : [
		'parsers'
	],
	#category : #'PetitTests-Core'
}

{ #category : #accessing }
PPParserResource >> parserAt: aParserClass [
	"Answer a cached instance of aParserClass."
	
	^ parsers at: aParserClass name ifAbsentPut: [ aParserClass new ]
]

{ #category : #running }
PPParserResource >> setUp [
	super setUp.
	parsers := Dictionary new
]
