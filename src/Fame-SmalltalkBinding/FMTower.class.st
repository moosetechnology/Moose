Class {
	#name : #FMTower,
	#superclass : #Object,
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'instance creation' }
FMTower class >> new [

	^FMCompleteTower new
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

{ #category : #accessing }
FMTower >> metaMetamodel [
	^self subclassResponsibility
]

{ #category : #accessing }
FMTower >> metamodel [
	^self subclassResponsibility
]

{ #category : #accessing }
FMTower >> model [
	^self subclassResponsibility
]
