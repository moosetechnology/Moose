Class {
	#name : #FMMetaMetaRepository,
	#superclass : #FMMetaRepository,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Fame-Core-Repositories'
}

{ #category : #initialization }
FMMetaMetaRepository >> defaultMetamodel [
	"The Meta Meta Model is its own Meta model."
	^ self
]

{ #category : #initialization }
FMMetaMetaRepository >> initialize [
	super initialize.
	self
		addAll:
			(FMPragmaProcessor new
				buildFM3;
				elements)
]
