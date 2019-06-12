Class {
	#name : #FmxMBNonremoteRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream tab; nextPutAll: ('<MSEProperty: #{1} type: #Object>' format: {aRelationSide name}).
	aStream cr.
	
	aRelationSide remoteBuilderDo: [ :aRemoteBuilder |
		aStream tab; nextPutAll: ('<package: #''{1}''>' format: {aRemoteBuilder generator packageName}).
		aStream cr ].

	((aRelationSide cardinality = #one) and: [ aRelationSide otherSide cardinality = #one ])
		ifTrue: [ 
			aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsent: [ nil ]' format: {aRelationSide name}). ].

	((aRelationSide otherSide cardinality = #one) and: [ aRelationSide cardinality = #many ])
		ifTrue: [ 
			aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsentPut: [ FMMultivalueLink on: self opposite: #{2}: ]' format: {aRelationSide name. aRelationSide otherSide name}). ].

	((aRelationSide otherSide cardinality = #many) and: [ aRelationSide cardinality = #one ])
		ifTrue: [ 
			aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsent: [ nil ]' format: {aRelationSide name}). ].

	((aRelationSide cardinality = #many) and: [ aRelationSide otherSide cardinality = #many ])
		ifTrue: [ 
			aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #{2} ]' format: {aRelationSide name. aRelationSide otherSide name}). ].

]

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	((aRelationSide cardinality = #one) and: [aRelationSide otherSide cardinality = #one])
		ifTrue: [ 
			aStream tab; nextPutAll: ('(self privateState attributeAt: #{1} ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].' format: { aRelationSide name }).
			aStream cr.
			aStream tab; nextPutAll: ('anObject ifNil: [ | otherSide |'); cr.
			aStream tab; tab; nextPutAll: ('otherSide :=  self {1}.' format: {aRelationSide name}); cr.
			aStream tab; tab; nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name}); cr.
			aStream tab; tab; nextPutAll: ('otherSide {1}: nil ]' format: {aRelationSide otherSide name}); cr.
			aStream tab; nextPutAll: ('ifNotNil: [ ' format: {aRelationSide otherSide name}); cr.
			aStream tab; tab; nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name}); cr.
			aStream tab; tab; nextPutAll: ('anObject {1}: self ]' format: {aRelationSide otherSide name}).
	].

	((aRelationSide otherSide cardinality = #one) and: [aRelationSide cardinality = #many])
		ifTrue: [ 
			aStream tab; nextPutAll: ('self {1} value: anObject' format: { aRelationSide name }).
	].

	((aRelationSide otherSide cardinality = #many) and: [aRelationSide cardinality = #one])
		ifTrue: [ 
			aStream tab; nextPutAll: ('self privateState attributeAt: #{1} put: (FMMultivalueLink on: self update: #{2} from: self {1} to: anObject).' format: {aRelationSide name. aRelationSide otherSide name}). ].

	((aRelationSide cardinality = #many) and: [aRelationSide otherSide cardinality = #many])
		ifTrue: [ 
			aStream tab; nextPutAll: ('self {1} value: anObject' format: { aRelationSide name }).
	].
]

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> producesSlot [

	^ false
]
