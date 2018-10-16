Class {
	#name : #FmxMBNonremoteRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream tab; nextPutAll: ('<MSEProperty: #{1} type: #Object>' format: {aRelationSide name}).
	aStream cr.
	aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsent: [ nil ]' format: {aRelationSide name}).
	

	
]

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream tab; nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name}).
	aStream cr.
	aStream tab; nextPutAll: ('anObject {1}: self' format: {aRelationSide otherSide name}).
	

]

{ #category : #printing }
FmxMBNonremoteRelationSideGenerationStrategy >> producesSlot [

	^ false
]
