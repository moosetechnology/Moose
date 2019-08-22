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

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> category [ 
	
	^ 'accessing'
]

{ #category : #generation }
FmxMBRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [
	
	aRelationSide builder environment compile: methodSource in: aClassOrTrait classified: self category
	
	
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	^ self subclassResponsibility
]

{ #category : #generation }
FmxMBRelationSideGenerationStrategy >> generateGetterIn: aClassOrTrait for: aRelationSide [
	| methodSource commentDefinition |
	commentDefinition := aRelationSide comment ifNotEmpty: [ :comment | '<MSEComment: {1}>' format: {comment printString} ].

	methodSource := String
		streamContents: [ :s | 
			s
				nextPutAll: aRelationSide name;
				cr.
			aRelationSide hasRelation
				ifTrue: [ s
						tab;
						nextPutAll: '"Relation named: #';
						nextPutAll: relationSide name;
						nextPutAll: ' type: #';
						nextPutAll: relationSide oppositeType;
						nextPutAll: ' opposite: #';
						nextPutAll: relationSide oppositeName;
						nextPutAll: '"';
						cr;
						cr ].
			s
				tab;
				nextPutAll: '<generated>';
				cr.
			commentDefinition
				ifNotEmpty: [ s
						tab;
						nextPutAll: commentDefinition;
						cr ].
			aRelationSide isContainer
				ifTrue: [ s
						tab;
						nextPutAll: '<container>';
						cr ].
			aRelationSide isDerived
				ifTrue: [ s
						tab;
						nextPutAll: '<derived>';
						cr ].
			aRelationSide isSource
				ifTrue: [ s
						tab;
						nextPutAll: '<source>';
						cr ].
			aRelationSide isTarget
				ifTrue: [ s
						tab;
						nextPutAll: '<target>';
						cr ].

			self generateGetterCoreIn: aClassOrTrait on: s for: aRelationSide ].

	self compileMethod: methodSource for: aRelationSide in: aClassOrTrait
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [
	^ self subclassResponsibility
]

{ #category : #generation }
FmxMBRelationSideGenerationStrategy >> generateSetterIn: aClassOrTrait for: aRelationSide [
	| methodSource |
	methodSource := String
		streamContents: [ :s | 
			s
				nextPutAll: aRelationSide name;
				nextPutAll: ': anObject';
				cr;
				cr.
			s
				tab;
				nextPutAll: '<generated>';
				cr.
			self generateSetterCoreIn: aClassOrTrait on: s for: aRelationSide ].

	self compileMethod: methodSource for: aRelationSide in: aClassOrTrait
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> relationSide [
	^ relationSide
]

{ #category : #accessing }
FmxMBRelationSideGenerationStrategy >> relationSide: anObject [
	relationSide := anObject
]
