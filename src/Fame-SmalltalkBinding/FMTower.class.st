Class {
	#name : #FMTower,
	#superclass : #Object,
	#instVars : [
		'model',
		'metaMetamodel',
		'metamodel'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'instance creation' }
FMTower class >> fromMetamodel: aMetamodel [
	^ self new
		metaMetamodel: aMetamodel metamodel;
		metamodel: aMetamodel;
		model: (FMRepository with: aMetamodel);
		yourself
]

{ #category : #accessing }
FMTower >> fameDescriptionByClass: smalltalkClass [ 
	"Answer the Fame description which is to be returned when sending [smalltalkClass asFameDescription] within the scope of this tower. Lookup  is performed as an ordered choice of steps: first the meta-metamodel is queried, then the metamodel, and eventually the metamodel is asked to resolve the Fame description (which defaults to processing its pragmas).'"
	^ self metaMetamodel 
		descriptionOf: smalltalkClass
		ifAbsent: 
			[ self metamodel 
				descriptionOf: smalltalkClass
				ifAbsent: [ self error: 'Not found: fame-description of #{smalltalkClass}' ] ]
]

{ #category : #accessing }
FMTower >> fameDescriptionFor: element [
	^self fameDescriptionByClass: element class

	
]

{ #category : #initialization }
FMTower >> initialize [
	super initialize.
	metaMetamodel := FMMetaRepository fm3.
	metamodel := FMMetaRepository with: self metaMetamodel.
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
