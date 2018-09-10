"
I describe objects (numbers) which are equal to my required value with particular accuracy.

	1.1 should equal: 1 within: 0.2

My instances can be created by 

	SpecOfApproxEquality to: 1 within: 0.2
		
Internal Representation and Key Implementation Points.

    Instance Variables
	accuracy:		<Number>
"
Class {
	#name : #SpecOfApproxEquality,
	#superclass : #SpecOfObjectValue,
	#instVars : [
		'accuracy'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfApproxEquality class >> to: aNumber within: accuracyNumber [ 
	^(self requiredValue: aNumber) accuracy: accuracyNumber 
]

{ #category : #accessing }
SpecOfApproxEquality >> accuracy [
	^accuracy
]

{ #category : #accessing }
SpecOfApproxEquality >> accuracy: anObject [
	accuracy := anObject
]

{ #category : #testing }
SpecOfApproxEquality >> basicMatches: aNumber [ 
	^aNumber isEqual: requiredValue within: accuracy
]

{ #category : #displaying }
SpecOfApproxEquality >> defaultTitle [
	^'be within ' , accuracy stringForSpecTitle , ' of ' , requiredValue stringForSpecTitle
]
