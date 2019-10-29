Class {
	#name : #EQNumerical,
	#superclass : #EQSimple,
	#instVars : [
		'number'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQNumerical class >> annotation [
	<FMClass: #Numerical super: #EQSimple>
	<package: #EQ>
	<abstract>
]

{ #category : #accessing }
EQNumerical >> number [
	<FMProperty: #number type: #Number>
	^number
]

{ #category : #accessing }
EQNumerical >> number: anObject [
	number := anObject
]

{ #category : #printing }
EQNumerical >> printOn: stream [

	stream print: number
]
