"
Tests for parsers visualisations.
"
Class {
	#name : #PPParserVisualisationTest,
	#superclass : #TestCase,
	#category : #'PetitGui-Tests'
}

{ #category : #'as yet unclassified' }
PPParserVisualisationTest >> testViewAllNamedParsers [

	self shouldnt: [ PPParser new viewAllNamedParsers delete ] raise: Error.
]
