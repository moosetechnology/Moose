"
I am special mock to help work with other objects by explicit messages.
I created to not register myself as environment object. Because I am just helper
"
Class {
	#name : #MockHelper,
	#superclass : #Mock,
	#category : 'Mocketry-Domain'
}

{ #category : #accessing }
MockHelper >> ghostBehaviour: aMockBehaviour [
	behaviour := aMockBehaviour
]
