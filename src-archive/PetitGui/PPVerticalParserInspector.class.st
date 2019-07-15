"
I allow one to type in content and run the parser for the content.
The content and results are displayed on top of each other.
"
Class {
	#name : #PPVerticalParserInspector,
	#superclass : #PPParserInspector,
	#category : #'PetitGui-Core'
}

{ #category : #'as yet unclassified' }
PPVerticalParserInspector class >> exampleOpenOn [
	^ self new openOn: PPArithmeticParser new
]

{ #category : #'private building' }
PPVerticalParserInspector >> browserStructureFor: browser [
	browser
		row: #sample;
		row: #inspectors
]
