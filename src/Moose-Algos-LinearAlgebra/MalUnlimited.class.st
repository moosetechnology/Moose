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

{ #category : #testing }
MalUnlimited class >> negative [

	^Negative ifNil: [Negative := super new initializeWith: false]
]

{ #category : #'instance creation' }
MalUnlimited class >> new [

	^self positive
]

{ #category : #testing }
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

{ #category : #converting }
MalUnlimited >> adaptToNumber: rcvr andSend: selector [
	selector = #<
		ifTrue: [ self positive
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ].
	selector = #>
		ifTrue: [ self positive
				ifTrue: [ ^ false ]
				ifFalse: [ ^ true ] ]
]

{ #category : #comparing }
MalUnlimited >> hash [

	^positive 
		ifTrue: [ 16r3FFF ]
		ifFalse: [ 16rBFFF ]
]

{ #category : #initialization }
MalUnlimited >> initializeWith: isPositive [

	positive := isPositive.
	^self
]

{ #category : #arithmetic }
MalUnlimited >> negated [

	^self positive 
		ifTrue: [ self class negative ] 
		ifFalse: [ self class positive ]
]

{ #category : #testing }
MalUnlimited >> negative [

	^positive not
]

{ #category : #accessing }
MalUnlimited >> positive [

	^positive
]
