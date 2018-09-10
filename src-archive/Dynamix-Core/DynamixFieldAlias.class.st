"
An alias dedicated to the use of a field variable.
"
Class {
	#name : #DynamixFieldAlias,
	#superclass : #DynamixAlias,
	#instVars : [
		'attribute'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixFieldAlias class >> annotation [
	<MSEClass: #FieldAlias super: #DynamixAlias>
	<package: #Dynamix>
]

{ #category : #accessing }
DynamixFieldAlias >> attribute [
	^ attribute
]

{ #category : #accessing }
DynamixFieldAlias >> attribute: anObject [
	attribute := anObject
]

{ #category : #testing }
DynamixFieldAlias >> isFieldAlias [
	^ true
]
