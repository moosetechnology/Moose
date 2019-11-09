Class {
	#name : #EQIdentifier,
	#superclass : #Object,
	#instVars : [
		'symbol'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
EQIdentifier class >> annotation [
	<FMClass: #Identifier super: #Object>
	<package: #EQ>
]

{ #category : #printing }
EQIdentifier >> printOn: stream [

	stream nextPutAll: symbol
]

{ #category : #accessing }
EQIdentifier >> symbol [
	<FMProperty: #symbol type: #String>
	^symbol
]

{ #category : #accessing }
EQIdentifier >> symbol: anObject [
	symbol := anObject
]
