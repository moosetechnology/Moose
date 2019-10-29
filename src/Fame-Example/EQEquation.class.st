Class {
	#name : #EQEquation,
	#superclass : #Object,
	#instVars : [
		'rightHandSide',
		'leftHandSide'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQEquation class >> annotation [
	<FMClass: #Equation super: #Object>
	<package: #EQ>
]

{ #category : #Fame }
EQEquation >> leftHandSide [
	<FMProperty: #leftHandSide type: #EQVariable>
	^leftHandSide
]

{ #category : #accessing }
EQEquation >> leftHandSide: anObject [
	leftHandSide := anObject
]

{ #category : #printing }
EQEquation >> printOn: stream [

	stream print: leftHandSide; space; nextPut: $=; space; print: rightHandSide
]

{ #category : #Fame }
EQEquation >> rightHandSide [
	<FMProperty: #rightHandSide type: #EQExpression>
	^rightHandSide
]

{ #category : #accessing }
EQEquation >> rightHandSide: anObject [
	rightHandSide := anObject
]
