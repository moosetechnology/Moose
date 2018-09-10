"
It models the values defined in an FAMIXEnum. These are attributes of enums with default values.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	parentEnum	<(MultivalueLink of: FAMIXEnum)>
"
Class {
	#name : #FAMIXEnumValue,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'parentEnum'
	],
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXEnumValue class >> annotation [
	<MSEClass: #EnumValue super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXEnumValue >> belongsTo [

	^ self parentEnum
]

{ #category : #printing }
FAMIXEnumValue >> mooseNameOn: aStream [
	(self belongsTo isNotNil and: [ self belongsTo name isNotNil ])
		ifTrue: [ self belongsTo mooseNameOn: aStream.
			aStream << self mooseNameSeparator ].
	super mooseNameOn: aStream
]

{ #category : #printing }
FAMIXEnumValue >> mooseNameSeparator [
	^ '::'
]

{ #category : #accessing }
FAMIXEnumValue >> parentEnum [
	<MSEProperty: #parentEnum type: #FAMIXEnum opposite: #values>
	<MSEComment: 'The Enum declaring this value. It offers the implementation of belongsTo'>
	<container>
	
	^ parentEnum
]

{ #category : #accessing }
FAMIXEnumValue >> parentEnum: anEnum [
	parentEnum := FMMultivalueLink 
		on: self
		update: #values
		from: self parentEnum
		to: anEnum
]

{ #category : #accessing }
FAMIXEnumValue >> parentType [ 

	^ self parentEnum
]
