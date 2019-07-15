Class {
	#name : #ASNoFill,
	#superclass : #Object,
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASNoFill class >> soleInstance [

	^ soleInstance ifNil: [ soleInstance  := self new ]
	
]

{ #category : #'as yet unclassified' }
ASNoFill >> fill: aShape on: aCanvas [
	"do nothing"
]

{ #category : #'as yet unclassified' }
ASNoFill >> resolveIds: aDictionary [ 
	^ self
]

{ #category : #'as yet unclassified' }
ASNoFill >> stroke: aShape on: aCanvas [
	"do nothing" 

]
