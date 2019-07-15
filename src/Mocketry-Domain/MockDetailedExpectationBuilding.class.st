"
I am special operation on SpecOfExpectedMessage which is used to modify given spec by my DSL api without extra actions.

I am used during group of message sends validation: 
	[mock someMessage 
	mock2 someMessage2 twice] should occur
	
Look at my superclass comment and methods
"
Class {
	#name : #MockDetailedExpectationBuilding,
	#superclass : #MockOperationWithMessageSpec,
	#category : 'Mocketry-Domain'
}

{ #category : #execution }
MockDetailedExpectationBuilding >> execute [
	
]
