"
This models an enum in Java.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	values	<(MultivalueLink of: FAMIXEnumValue)>
"
Class {
	#name : #FAMIXEnum,
	#superclass : #FAMIXType,
	#instVars : [
		'values'
	],
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXEnum class >> annotation [
	<MSEClass: #Enum super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #'initialize-release' }
FAMIXEnum >> initialize [
	super initialize.
	values := FMNullMultivalueLink 
		on: self
		opposite: #parentEnum:
		selector: #values

]

{ #category : #accessing }
FAMIXEnum >> values [
	<MSEProperty: #values type: #FAMIXEnumValue opposite: #parentEnum> <multivalued> <derived>
	<MSEComment: 'List of the allowed enum values.'>
	^ values
]

{ #category : #accessing }
FAMIXEnum >> values: anObject [
	values value: anObject
]
