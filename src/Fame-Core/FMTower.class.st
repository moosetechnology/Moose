Class {
	#name : #FMTower,
	#superclass : #Object,
	#instVars : [
		'model',
		'metaMetamodel',
		'metamodel'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMTower class >> fromMetamodel: aMetamodel [
	^ self new
		metaMetamodel: aMetamodel metamodel;
		metamodel: aMetamodel;
		model: (FMRepository with: aMetamodel);
		yourself
]

{ #category : #initialization }
FMTower >> initialize [
	super initialize.
	metamodel := FMMetaRepository new.
	metaMetamodel := metamodel metamodel.
	model := FMRepository with: self metamodel
]

{ #category : #accessing }
FMTower >> metaMetamodel [
	^ metaMetamodel
]

{ #category : #accessing }
FMTower >> metaMetamodel: anObject [
	metaMetamodel := anObject
]

{ #category : #accessing }
FMTower >> metamodel [
	^ metamodel
]

{ #category : #accessing }
FMTower >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #accessing }
FMTower >> model [
	^ model
]

{ #category : #accessing }
FMTower >> model: anObject [
	model := anObject
]
