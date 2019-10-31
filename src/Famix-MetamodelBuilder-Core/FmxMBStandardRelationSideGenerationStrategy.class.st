Class {
	#name : #FmxMBStandardRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBStandardRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	aStream
		tab;
		nextPutAll: '^ ';
		nextPutAll: aRelationSide name
]

{ #category : #accessing }
FmxMBStandardRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	aStream
		tab;
		nextPutAll: aRelationSide name.
	aRelationSide isOne ifTrue: [ aStream nextPutAll: ' := anObject' ] ifFalse: [ aStream nextPutAll: ' value: anObject' ]
]

{ #category : #printing }
FmxMBStandardRelationSideGenerationStrategy >> producesSlot [

	^ true
]
