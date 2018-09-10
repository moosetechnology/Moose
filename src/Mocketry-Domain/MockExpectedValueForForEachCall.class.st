"
I represent expected message result which will be extracted from array for every intercepted message send. So for first send it will be first item of my values array. And for second send it will be second item.

I allow easily define expected values for multiple message sends.

My instance can be created by 
	MockExpectedValueForEachCall value: anArray
	
Internal Representation and Key Implementation Points.

    Instance Variables
	values:		<Array of: <Object>>
	currentValueIndex:		<SmallInteger>
"
Class {
	#name : #MockExpectedValueForForEachCall,
	#superclass : #MockExpectedAction,
	#instVars : [
		'values',
		'currentValueIndex'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedValueForForEachCall class >> values: anArray [

	^self new 
		values: anArray
]

{ #category : #evaluating }
MockExpectedValueForForEachCall >> executeFor: anOccurredMessage [

	currentValueIndex ifNil: [ currentValueIndex := 0 ].
	
	^values at: (currentValueIndex := currentValueIndex + 1)
]

{ #category : #accessing }
MockExpectedValueForForEachCall >> values [
	^ values
]

{ #category : #accessing }
MockExpectedValueForForEachCall >> values: anObject [
	values := anObject
]
