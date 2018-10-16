Class {
	#name : #FmxMBRemoteRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> category [ 

	^ '*', self relationSide builder configuration packageName
]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [
		
	aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category package: self relationSide otherSide builder configuration packageName.
]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream tab; nextPutAll: ('<MSEProperty: #{1} type: #Object>' format: {aRelationSide name}).
	aStream cr.
	aStream tab; nextPutAll: ('^ self privateState attributeAt: #{1} ifAbsent: [ nil ]' format: {aRelationSide name}).
	

	
]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> generateGetterIn: aClassOrTrait for: aRelationSide [

	| methodSource commentDefinition method |
	
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
		
	method := aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category package: self relationSide otherSide builder configuration packageName.
	
	
]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream tab; nextPutAll: ('(self privateState attributeAt: #{1} ifAbsent: [nil]) == anObject ifTrue: [ ^ anObject ].' format: {aRelationSide name}).
	aStream cr.
	aStream tab; nextPutAll: ('self privateState attributeAt: #{1} put: anObject.' format: {aRelationSide name}).
	aStream cr.
	aStream tab; nextPutAll: ('anObject {1}: self' format: {aRelationSide otherSide name}).

]

{ #category : #printing }
FmxMBRemoteRelationSideGenerationStrategy >> producesSlot [

	^ false
]
