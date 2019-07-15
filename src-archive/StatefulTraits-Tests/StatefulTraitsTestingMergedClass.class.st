"
an example class for testing purposes of StatefulTraits
"
Class {
	#name : #StatefulTraitsTestingMergedClass,
	#superclass : #Object,
	#instVars : [
		'var1',
		'var2',
		'traitVar1',
		'traitVar2',
		'director'
	],
	#category : #'StatefulTraits-Tests'
}

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass class >> aClassSideMethod [

	^ #aClassSideMethod
]

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass >> StatefulTraitsTestingTrait1_initializeTrait [

	
]

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass >> traitVar1 [
	^ traitVar1
]

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass >> traitVar1: anObject [
	traitVar1 := anObject
]

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass >> traitVar2 [
	^ traitVar2
]

{ #category : #'_fromTrait_StatefulTraitsTestingTrait1' }
StatefulTraitsTestingMergedClass >> traitVar2: anObject [
	traitVar2 := anObject
]

{ #category : #accessing }
StatefulTraitsTestingMergedClass >> var1 [
	^ var1
]

{ #category : #accessing }
StatefulTraitsTestingMergedClass >> var1: anObject [
	var1 := anObject
]

{ #category : #accessing }
StatefulTraitsTestingMergedClass >> var2 [
	^ var2
]

{ #category : #accessing }
StatefulTraitsTestingMergedClass >> var2: anObject [
	var2 := anObject
]
