"
DudeDeveloper represents a developer of the system under analysis who wrote or modified a line of code. The developer is associated to the lines of code he is responsible of. 


Instance Variables:
	name	<ProtoObject>
"
Class {
	#name : #DudeDeveloper,
	#superclass : #MooseEntity,
	#instVars : [
		'name'
	],
	#category : #'SmallDude-Text'
}

{ #category : #meta }
DudeDeveloper class >> annotation [
	<MSEClass: #Developer super: #MooseEntity>
	<package: #Dude>
]

{ #category : #accessing }
DudeDeveloper >> name [
	^ name
]

{ #category : #accessing }
DudeDeveloper >> name: anObject [
	name := anObject
]
