Class {
	#name : #FMModelTower,
	#superclass : #FMTower,
	#instVars : [
		'model',
		'delegate'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'as yet unclassified' }
FMModelTower >> delegate [
	^delegate
]

{ #category : #'as yet unclassified' }
FMModelTower >> delegate: aTower [
	delegate := aTower
]

{ #category : #'as yet unclassified' }
FMModelTower >> metaMetamodel [
	^delegate metaMetamodel
]

{ #category : #'as yet unclassified' }
FMModelTower >> metamodel [
	^delegate metamodel
]

{ #category : #'as yet unclassified' }
FMModelTower >> model [
	^model
]

{ #category : #'as yet unclassified' }
FMModelTower >> model: aRepository [
	model := aRepository
]
