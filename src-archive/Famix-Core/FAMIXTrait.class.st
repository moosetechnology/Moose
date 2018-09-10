"
FAMIXTrait models a trait as it can be found in Pharo or PHP.
"
Class {
	#name : #FAMIXTrait,
	#superclass : #FAMIXType,
	#instVars : [
		'incomingTraitUsages'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXTrait class >> annotation [
	<MSEClass: #Trait super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXTrait >> incomingTraitUsages [
	<MSEProperty: #incomingTraitUsages type: #FAMIXTraitUsage opposite: #trait> <multivalued> <derived>
	^ incomingTraitUsages
]

{ #category : #accessing }
FAMIXTrait >> incomingTraitUsages: aCollection [
	incomingTraitUsages value: aCollection
]

{ #category : #initialize }
FAMIXTrait >> initialize [
	super initialize.
	incomingTraitUsages := FMNullMultivalueLink on: self opposite: #trait: selector: #incomingTraitUsages
]
