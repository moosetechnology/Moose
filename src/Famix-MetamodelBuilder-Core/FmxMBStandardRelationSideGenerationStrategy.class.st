Class {
	#name : #FmxMBStandardRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'as yet unclassified' }
FmxMBStandardRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	^ aStream tab; nextPutAll: '^ '; nextPutAll: aRelationSide name.
	
]

{ #category : #'as yet unclassified' }
FmxMBStandardRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	(aRelationSide cardinality = #one)
		ifTrue: [ aStream tab; nextPutAll: aRelationSide name; nextPutAll: ' := anObject'; cr ]
		ifFalse: [ aStream tab; nextPutAll: aRelationSide name; nextPutAll: ' value: anObject'; cr ] 
]

{ #category : #printing }
FmxMBStandardRelationSideGenerationStrategy >> producesSlot [

	^ true
]
