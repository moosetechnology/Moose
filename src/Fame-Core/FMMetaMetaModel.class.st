Class {
	#name : #FMMetaMetaModel,
	#superclass : #FMMetaModel,
	#category : #'Fame-Core-Models'
}

{ #category : #initialization }
FMMetaMetaModel >> defaultMetamodel [
	"The Meta Meta Model is its own Meta model."
	^ self
]

{ #category : #initialization }
FMMetaMetaModel >> initialize [
	super initialize.
	self
		addAll:
			(FMMetaModelBuilder new
				buildFM3;
				elements)
]

{ #category : #testing }
FMMetaMetaModel >> isMetaMetamodel [
	^ true
]
