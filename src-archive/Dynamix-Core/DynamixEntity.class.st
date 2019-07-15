"
The root entity.
"
Class {
	#name : #DynamixEntity,
	#superclass : #MooseEntity,
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixEntity class >> annotation [
	<MSEClass: #Entity super: #MooseEntity>
	<package: #Dynamix>
]

{ #category : #testing }
DynamixEntity >> isActivation [
	^ false
]

{ #category : #testing }
DynamixEntity >> isAlias [
	^ false
]

{ #category : #testing }
DynamixEntity >> isInstance [
	^ false
]

{ #category : #testing }
DynamixEntity >> isReference [
	^ false
]

{ #category : #testing }
DynamixEntity >> isReturn [
	^ false
]

{ #category : #testing }
DynamixEntity >> isTrace [
	^ false
]
