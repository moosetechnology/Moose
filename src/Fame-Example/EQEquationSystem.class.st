Class {
	#name : #EQEquationSystem,
	#superclass : #Object,
	#instVars : [
		'equations'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQEquationSystem class >> annotation [
	<FMClass: #EquationSystem super: #Object>
	<package: #EQ>
]

{ #category : #Fame }
EQEquationSystem >> equations [
	<FMProperty: #equations type: #EQEquation>
	<multivalued>
	^equations
]

{ #category : #accessing }
EQEquationSystem >> equations: anObject [
	equations := anObject
]

{ #category : #printing }
EQEquationSystem >> printOn: stream [

	equations do: [ :each |
		stream print: each; cr ]
]
