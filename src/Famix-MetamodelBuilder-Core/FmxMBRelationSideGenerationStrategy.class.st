Class {
	#name : #FmxMBRelationSideGenerationStrategy,
	#superclass : #Object,
	#instVars : [
		'relationSide'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'instance creation' }
FmxMBRelationSideGenerationStrategy class >> for: aRelationSide [

	^ self new relationSide: aRelationSide
]

{ #category : #'as yet unclassified' }
FmxMBRelationSideGenerationStrategy >> category [ 
	
	^ 'accessing'
]

{ #category : #'as yet unclassified' }
FmxMBRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [
	
	aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category
	
	
]

{ #category : #'as yet unclassified' }
FmxMBRelationSideGenerationStrategy >> generateGetterIn: aClassOrTrait for: aRelationSide [

	| methodSource commentDefinition |
	
	commentDefinition := aRelationSide comment
		ifNotEmpty: [ '<MSEComment: {1}>' format: { aRelationSide comment printString } ].

	methodSource := String streamContents: [ :s |
		s nextPutAll: aRelationSide name; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		commentDefinition  
			ifNotEmpty: [ s tab; nextPutAll: commentDefinition; cr].
			aRelationSide isContainer ifTrue: [ 
				s tab; nextPutAll: '<container>'; cr; cr ].
			aRelationSide isDerived ifTrue: [ 
				s tab; nextPutAll: '<derived>'; cr; cr ].
			aRelationSide isSource ifTrue: [ 
				s tab; nextPutAll: '<source>'; cr; cr ].
			aRelationSide isTarget ifTrue: [ 
				s tab; nextPutAll: '<target>'; cr; cr ].
		
		self generateGetterCoreIn: aClassOrTrait on: s for: aRelationSide ].
		
	self compileMethod: methodSource for: aRelationSide in: aClassOrTrait.
]

{ #category : #'as yet unclassified' }
FmxMBRelationSideGenerationStrategy >> generateSetterIn: aClassOrTrait for: aRelationSide [

	| methodSource |
	
	methodSource := String streamContents: [ :s |
		s nextPutAll: aRelationSide name; nextPutAll: ': anObject'; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		self generateSetterCoreIn: aClassOrTrait on: s for: aRelationSide ].
		
	self compileMethod: methodSource for: aRelationSide in: aClassOrTrait.
	
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> relationSide [
	^ relationSide
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> relationSide: anObject [
	relationSide := anObject
]
