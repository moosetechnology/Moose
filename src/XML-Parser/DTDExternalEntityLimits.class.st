"
This class places security limits on the number and size of external parsed entities. You can set these using the configuration messages in DTDExternalEntityResolver or remove them using removeLimits.
"
Class {
	#name : #DTDExternalEntityLimits,
	#superclass : #Object,
	#instVars : [
		'externalSubsetReadLimit',
		'maxExternalEntities',
		'maxExternalEntitySize',
		'resolvesLocalFromNonLocal'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #accessing }
DTDExternalEntityLimits class >> defaultExternalSubsetReadLimit [
	^ XMLParserLimits defaultReadLimit
		ifNotNil: [:limit | (limit / 4) asInteger]
]

{ #category : #accessing }
DTDExternalEntityLimits class >> defaultMaxExternalEntities [
	^ 20
]

{ #category : #accessing }
DTDExternalEntityLimits class >> defaultMaxExternalEntitySize [
	^ 2500000
]

{ #category : #accessing }
DTDExternalEntityLimits >> externalSubsetReadLimit [
	^ externalSubsetReadLimit
]

{ #category : #accessing }
DTDExternalEntityLimits >> externalSubsetReadLimit: anInteger [
	externalSubsetReadLimit := anInteger
]

{ #category : #initialization }
DTDExternalEntityLimits >> initialize [
	super initialize.

	externalSubsetReadLimit := self class defaultExternalSubsetReadLimit.
	maxExternalEntities := self class defaultMaxExternalEntities.
	maxExternalEntitySize := self class defaultMaxExternalEntitySize.
	resolvesLocalFromNonLocal := false.
]

{ #category : #accessing }
DTDExternalEntityLimits >> maxExternalEntities [
	^ maxExternalEntities
]

{ #category : #accessing }
DTDExternalEntityLimits >> maxExternalEntities: anInteger [
	maxExternalEntities := anInteger
]

{ #category : #accessing }
DTDExternalEntityLimits >> maxExternalEntitySize [
	^ maxExternalEntitySize
]

{ #category : #accessing }
DTDExternalEntityLimits >> maxExternalEntitySize: anInteger [
	maxExternalEntitySize := anInteger
]

{ #category : #removing }
DTDExternalEntityLimits >> removeAll [
	externalSubsetReadLimit := nil.
	maxExternalEntities := nil.
	maxExternalEntitySize := nil.
	resolvesLocalFromNonLocal := true.
]

{ #category : #accessing }
DTDExternalEntityLimits >> resolvesLocalFromNonLocal [
	^ resolvesLocalFromNonLocal
]

{ #category : #accessing }
DTDExternalEntityLimits >> resolvesLocalFromNonLocal: aBoolean [
	resolvesLocalFromNonLocal := aBoolean
]
