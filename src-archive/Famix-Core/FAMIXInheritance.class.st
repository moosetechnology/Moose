"
FAMIXInheritance represents an inheritance relationship between one subtype (e.g. a subclass) and one supertype (e.g. a superclass).

To represent multiple inheritance, multiple instances of FAMIXInheritance should be created. 
FAMIXInheritance puts in relation two types, this way inheritance, for example, between classes and between interfaces can be modelled.
"
Class {
	#name : #FAMIXInheritance,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'superclass',
		'subclass'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXInheritance class >> annotation [
	<MSEClass: #Inheritance super: #FAMIXAssociation>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXInheritance >> from [
	^ self subclass 
]

{ #category : #accessing }
FAMIXInheritance >> from: aSubclass [
	self subclass: aSubclass 
]

{ #category : #accessing }
FAMIXInheritance >> subclass [
	<MSEProperty: #subclass type: #FAMIXType opposite: #superInheritances>
	<MSEComment: 'Subclass linked to in this relationship. from-side of the association'>
	<source>
	^subclass
]

{ #category : #accessing }
FAMIXInheritance >> subclass: aType [
	subclass := FMMultivalueLink on: self
					update: #superInheritances
					from: self subclass
					to: aType
]

{ #category : #accessing }
FAMIXInheritance >> superclass [
	<MSEProperty: #superclass type: #FAMIXType opposite: #subInheritances>
	<MSEComment: 'Superclass linked to in this relationship. to-side of the association'>
	<target>
	^superclass
]

{ #category : #accessing }
FAMIXInheritance >> superclass: aType [
	superclass := FMMultivalueLink on: self
					update: #subInheritances
					from: self superclass
					to: aType
]

{ #category : #accessing }
FAMIXInheritance >> to [
	^ self superclass 
]

{ #category : #accessing }
FAMIXInheritance >> to: aSuperclass [
	self superclass: aSuperclass
]
