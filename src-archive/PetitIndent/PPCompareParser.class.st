Class {
	#name : #PPCompareParser,
	#superclass : #PPParser,
	#instVars : [
		'compareBlock',
		'message',
		'column'
	],
	#category : #'PetitIndent-Core'
}

{ #category : #'as yet unclassified' }
PPCompareParser class >> on: compareBlock [
	^ self on: compareBlock message: compareBlock asString
]

{ #category : #'as yet unclassified' }
PPCompareParser class >> on: compareBlock message: message [
	^ (self basicNew
		initialize)
		compareBlock: compareBlock ;
		message: message;
		yourself
]

{ #category : #'as yet unclassified' }
PPCompareParser class >> on: compareBlock message: message column: column [
	^ (self basicNew
		initialize)
		compareBlock: compareBlock ;
		message: message;
		column: column;
		yourself
]

{ #category : #accessing }
PPCompareParser >> column [
	^ column
]

{ #category : #accessing }
PPCompareParser >> column: anInteger [
	column := anInteger
]

{ #category : #accessing }
PPCompareParser >> compareBlock: aBlock [
	compareBlock := aBlock
]

{ #category : #accessing }
PPCompareParser >> message: aString [
	message := aString
]

{ #category : #parsing }
PPCompareParser >> parseOn: context [
	^ (compareBlock value: context) ifTrue: [  
		compareBlock asString
	] ifFalse: [  
		PPFailure message: message context: context
	]
]
