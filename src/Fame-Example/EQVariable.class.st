Class {
	#name : #EQVariable,
	#superclass : #EQSimple,
	#instVars : [
		'identifier'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQVariable class >> annotation [
	<MSEClass: #Variable super: #EQSimple>
	<package: #EQ>
	<abstract>
]

{ #category : #Fame }
EQVariable >> identifier [
	<MSEProperty: #identifier type: #EQIdentifier>
	^identifier
]

{ #category : #accessing }
EQVariable >> identifier: anObject [
	identifier := anObject
]

{ #category : #printing }
EQVariable >> printOn: stream [

	stream print: identifier
]
