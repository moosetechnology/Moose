Class {
	#name : #EQCompound,
	#superclass : #EQExpression,
	#instVars : [
		'op',
		'args'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQCompound class >> annotation [
	<MSEClass: #Compound super: #EQExpression >
	<package: #EQ>
	<abstract>
]

{ #category : #Fame }
EQCompound >> args [
	<MSEProperty: #args type: #EQExpression>
	<multivalued>
	^args
]

{ #category : #accessing }
EQCompound >> args: anObject [
	args := anObject
]

{ #category : #Fame }
EQCompound >> op [
	<MSEProperty: #op type: #EQOperator>
	^op
]

{ #category : #accessing }
EQCompound >> op: anObject [
	op := anObject
]

{ #category : #printing }
EQCompound >> printOn: stream [

	stream nextPut: $(.
	args do: [ :each |
		stream print: each ]
		separatedBy: [ stream space; print: op; space ].
	stream nextPut: $).
]
