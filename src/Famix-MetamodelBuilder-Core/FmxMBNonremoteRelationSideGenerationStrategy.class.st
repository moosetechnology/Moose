Class {
	#name : #FmxMBNonRemoteRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBNonRemoteRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	aStream
		tab;
		nextPutAll: ('<FMProperty: #{1} type: #{2} opposite: #{3}>' format: {aRelationSide name . aRelationSide oppositeType . aRelationSide oppositeName});
		cr.

	aRelationSide
		remoteBuilderDo: [ :aRemoteBuilder | 
			aStream
				tab;
				nextPutAll: ('<package: #''{1}''>' format: {aRemoteBuilder generator packageName});
				cr ].

	aStream
		tab;
		nextPutAll: '^ self privateState attributeAt: #';
		nextPutAll: aRelationSide name.

	aRelationSide isOne ifTrue: [ aStream nextPutAll: ' ifAbsent: [ nil ]' ].

	(aRelationSide otherSide isOne and: [ aRelationSide isMany ])
		ifTrue: [ aStream nextPutAll: (' ifAbsentPut: [ FMMultivalueLink on: self opposite: #{1}: ]' format: {aRelationSide otherSide name}) ].

	(aRelationSide isMany and: [ aRelationSide otherSide isMany ])
		ifTrue: [ aStream nextPutAll: (' ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #{1} ]' format: {aRelationSide otherSide name}) ]
]

{ #category : #printing }
FmxMBNonRemoteRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	(aRelationSide isOne and: [ aRelationSide otherSide isOne ])
		ifTrue: [ aStream
				tab;
				nextPutAll: ('(self privateState attributeAt: #{1} ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].' format: {aRelationSide name});
				cr;
				tab;
				nextPutAll: 'anObject ifNil: [ | otherSide |';
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide :=  self {1}.' format: {aRelationSide name});
				cr;
				tab;
				tab;
				nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name});
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide {1}: nil ]' format: {aRelationSide otherSide name});
				cr;
				tab;
				nextPutAll: ('ifNotNil: [ ' format: {aRelationSide otherSide name});
				cr;
				tab;
				tab;
				nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name});
				cr;
				tab;
				tab;
				nextPutAll: ('anObject {1}: self ]' format: {aRelationSide otherSide name}) ].

	aRelationSide isMany
		ifTrue: [ aStream
				tab;
				nextPutAll: ('self {1} value: anObject' format: {aRelationSide name}) ].

	(aRelationSide otherSide isMany and: [ aRelationSide isOne ])
		ifTrue: [ aStream
				tab;
				nextPutAll:
					('self privateState attributeAt: #{1} put: (FMMultivalueLink on: self update: #{2} from: self {1} to: anObject).'
						format: {aRelationSide name . aRelationSide otherSide name}) ]
]

{ #category : #printing }
FmxMBNonRemoteRelationSideGenerationStrategy >> producesSlot [

	^ false
]
