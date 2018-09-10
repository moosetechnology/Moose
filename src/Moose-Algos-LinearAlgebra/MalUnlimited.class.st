Class {
	#name : #MalUnlimited,
	#superclass : #Magnitude,
	#instVars : [
		'positive'
	],
	#classVars : [
		'Negative',
		'Positive'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'as yet unclassified' }
MalUnlimited class >> negative [

	^Negative ifNil: [Negative := super new initializeWith: false]
]

{ #category : #'as yet unclassified' }
MalUnlimited class >> new [

	^self positive
]

{ #category : #'as yet unclassified' }
MalUnlimited class >> positive [

	^Positive ifNil: [Positive := super new initializeWith: true ]
]

{ #category : #comparing }
MalUnlimited >> < aMagnitude [
	"Any number is larger than Unlimited negative, except Unlimited negative itself."

	^(positive not) and: [ self ~~ aMagnitude ]
]

{ #category : #comparing }
MalUnlimited >> = aMagnitude [
	
	^self == aMagnitude
]

{ #category : #'as yet unclassified' }
MalUnlimited >> adaptToNumber: rcvr andSend: selector [

	selector = #< ifTrue:[
		self positive 
		ifTrue: [ ^ true ]
		ifFalse: [ ^false ].
		].
	selector = #> ifTrue: [
		self positive 
		ifTrue: [ ^ false ]
		ifFalse: [ ^true ].
		].
]

{ #category : #comparing }
MalUnlimited >> hash [

	^positive 
		ifTrue: [ 16r3FFF ]
		ifFalse: [ 16rBFFF ]
]

{ #category : #'as yet unclassified' }
MalUnlimited >> initializeWith: isPositive [

	positive := isPositive.
	^self
]

{ #category : #'as yet unclassified' }
MalUnlimited >> negated [

	^self positive 
		ifTrue: [ self class negative ] 
		ifFalse: [ self class positive ]
]

{ #category : #'as yet unclassified' }
MalUnlimited >> negative [

	^positive not
]

{ #category : #'as yet unclassified' }
MalUnlimited >> positive [

	^positive
]
