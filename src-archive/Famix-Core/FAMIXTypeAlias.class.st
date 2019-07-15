"
This entity models a typedef in C.

Instance Variables:
	aliasedType	<ProtoObject | PseudoContext>
"
Class {
	#name : #FAMIXTypeAlias,
	#superclass : #FAMIXType,
	#instVars : [
		'aliasedType'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXTypeAlias class >> annotation [
	<MSEClass: #TypeAlias super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXTypeAlias >> aliasedType [
	<MSEProperty: #aliasedType type: #FAMIXType opposite: #typeAliases>
	<MSEComment: 'Points to the actual type.'>
	^ aliasedType
]

{ #category : #accessing }
FAMIXTypeAlias >> aliasedType: aType [
	aliasedType := FMMultivalueLink on: self
					update: #typeAliases
					from: self aliasedType
					to: aType
]
