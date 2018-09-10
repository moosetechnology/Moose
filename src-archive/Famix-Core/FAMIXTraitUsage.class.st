Class {
	#name : #FAMIXTraitUsage,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'user',
		'trait'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXTraitUsage class >> annotation [
	<MSEClass: #TraitUsage super: #FAMIXAssociation>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXTraitUsage >> from [
	^ self user
]

{ #category : #accessing }
FAMIXTraitUsage >> from: anObject [
	self user: anObject
]

{ #category : #accessing }
FAMIXTraitUsage >> to [
	^ self trait
]

{ #category : #accessing }
FAMIXTraitUsage >> to: anObject [
	self trait: anObject
]

{ #category : #accessing }
FAMIXTraitUsage >> trait [
	<MSEProperty: #trait type: #FAMIXTrait opposite: #incomingTraitUsages>
	<source>
	^ trait
]

{ #category : #accessing }
FAMIXTraitUsage >> trait: aTrait [
	trait := FMMultivalueLink on: self
					update: #incomingTraitUsages
					from: self trait
					to: aTrait
]

{ #category : #accessing }
FAMIXTraitUsage >> user [
	<MSEProperty: #user type: #FAMIXType opposite: #outgoingTraitUsages>
	<target>
	^ user
]

{ #category : #accessing }
FAMIXTraitUsage >> user: aType [
	user := FMMultivalueLink on: self
					update: #outgoingTraitUsages
					from: self user
					to: aType
]
