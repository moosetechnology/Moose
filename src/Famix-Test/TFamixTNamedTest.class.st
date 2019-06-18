"
This trait aims to test the elementary trait FamixTNamed.
"
Class {
	#name : #TFamixTNamedTest,
	#superclass : #Trait,
	#instVars : [
		'entity'
	],
	#category : #'Famix-Test-Traits'
}

{ #category : #accessing }
TFamixTNamedTest >> entity [
	^ entity
]

{ #category : #accessing }
TFamixTNamedTest >> entity: anObject [
	entity := anObject
]

{ #category : #tests }
TFamixTNamedTest >> testSetName [
	self entity name: 'aName'.
	self assert: self entity name equals: 'aName'.
	
]
