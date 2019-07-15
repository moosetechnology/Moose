"
an example trait for testing purposes of StatefulTraits
"
Class {
	#name : #StatefulTraitsTestingTrait1,
	#superclass : #Object,
	#instVars : [
		'traitVar1',
		'traitVar2',
		'director'
	],
	#category : #'StatefulTraits-Tests'
}

{ #category : #'as yet unclassified' }
StatefulTraitsTestingTrait1 class >> aClassSideMethod [

	^ #aClassSideMethod
]

{ #category : #accessing }
StatefulTraitsTestingTrait1 >> initializeTrait [

	
]

{ #category : #accessing }
StatefulTraitsTestingTrait1 >> traitVar1 [
	^ traitVar1
]

{ #category : #accessing }
StatefulTraitsTestingTrait1 >> traitVar1: anObject [
	traitVar1 := anObject
]

{ #category : #accessing }
StatefulTraitsTestingTrait1 >> traitVar2 [
	^ traitVar2
]

{ #category : #accessing }
StatefulTraitsTestingTrait1 >> traitVar2: anObject [
	traitVar2 := anObject
]
