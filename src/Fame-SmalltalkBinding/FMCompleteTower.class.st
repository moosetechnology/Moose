Class {
	#name : #FMCompleteTower,
	#superclass : #FMTower,
	#instVars : [
		'model',
		'metamodel',
		'metaMetamodel'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'instance creation' }
FMCompleteTower class >> new [

	| tower |
	tower := self basicNew.
	tower metaMetamodel: FMMetaRepository fm3.
	tower metamodel: (FMMetaRepository with: tower metaMetamodel).
	tower model: (FMRepository with: tower metamodel).
	^tower
]

{ #category : #accessing }
FMCompleteTower >> metaMetamodel [
	^ metaMetamodel
]

{ #category : #accessing }
FMCompleteTower >> metaMetamodel: anObject [
	metaMetamodel := anObject
]

{ #category : #accessing }
FMCompleteTower >> metamodel [
	^ metamodel
]

{ #category : #accessing }
FMCompleteTower >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #accessing }
FMCompleteTower >> model [
	^ model
]

{ #category : #accessing }
FMCompleteTower >> model: anObject [
	model := anObject
]
