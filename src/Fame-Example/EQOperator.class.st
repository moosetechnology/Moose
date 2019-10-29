Class {
	#name : #EQOperator,
	#superclass : #Object,
	#instVars : [
		'symbol'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQOperator class >> annotation [
	<FMClass: #Operator super: #Object>
	<package: #EQ>
]

{ #category : #printing }
EQOperator >> printOn: stream [

	stream nextPutAll: symbol
]

{ #category : #accessing }
EQOperator >> symbol [
	<FMProperty: #symbol type: #String>
	^symbol
]

{ #category : #accessing }
EQOperator >> symbol: anObject [
	symbol := anObject
]
