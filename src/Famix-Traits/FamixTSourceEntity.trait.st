"
FAMIXSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FAMIXEntity and it can hold comments, a source anchor and a source language.
"
Trait {
	#name : #FamixTSourceEntity,
	#instVars : [
		'#isStub => FMProperty',
		'#sourceAnchor => FMOne type: #FamixTSourceAnchor opposite: #element'
	],
	#traits : 'FamixTWithComments + FamixTWithSourceLanguage',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTSourceEntity classSide >> annotation [

	<FMClass: #TSourceEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTSourceEntity >> allSourceAnchors [
	^ self sourceAnchor
		ifNil: [ {} ]
		ifNotNil: #allSourceAnchors
]

{ #category : #enumerating }
FamixTSourceEntity >> allSourceAnchorsDo: aBlock [
	^ self sourceAnchor ifNotNil: [ :sa | sa allSourceAnchorsDo: aBlock ]
]

{ #category : #metrics }
FamixTSourceEntity >> computeNumberOfLinesOfCode [
	self hasSourceAnchor ifTrue: [ ^ self sourceAnchor lineCount ].
	self sourceText = '' ifFalse: [ ^ self sourceText lineCount ].

	(self isStub not and: [ self shouldCountChildrenForLinesOfCodeIfNoSourceAnchor ]) ifFalse: [ ^ self notExistentMetricValue ].

	^ self children sumNumbers: #numberOfLinesOfCode
]

{ #category : #'source anchor' }
FamixTSourceEntity >> defineMultiSourceAnchorWithPath: aPath [
	 self ensureMultiSourceAnchor addFileAnchorWithPath: aPath
]

{ #category : #'source anchor' }
FamixTSourceEntity >> ensureMultiSourceAnchor [
	^ self sourceAnchor
		ifNil: [ self
				sourceAnchor:
					(self multipleFileAnchorClass new
						element: self;
						mooseModel: self mooseModel;
						yourself);
				sourceAnchor ]
]

{ #category : #testing }
FamixTSourceEntity >> hasSourceAnchor [
	^ self sourceAnchor isNotNil
]

{ #category : #accessing }
FamixTSourceEntity >> isStub [

	<FMProperty: #isStub type: #Boolean>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FamixTSourceEntity >> isStub: anObject [
	<generated>
	isStub := anObject
]

{ #category : #'source anchor' }
FamixTSourceEntity >> multipleFileAnchorClass [
	^ self mooseModel
		ifNil: [ self error: 'The model need to be set for this feature to work.' ]
		ifNotNil: [ :model | 
			model factory
				entityNamed: #MultipleFileAnchor
				ifAbsent: [ self error: 'This metamodel does not includes the full concept of MultipleFileAnchor needed.' ] ]
]

{ #category : #properties }
FamixTSourceEntity >> notExistentMetricValue [
	^ self explicitRequirement
]

{ #category : #metrics }
FamixTSourceEntity >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of lines of code in a method.'>
	^ self lookUpPropertyNamed: #numberOfLinesOfCode computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #metrics }
FamixTSourceEntity >> numberOfLinesOfCode: aNumber [
	self privateState cacheAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #metrics }
FamixTSourceEntity >> numberOfLinesOfCodeWithMoreThanOneCharacter [
	<FMProperty: #numberOfLinesOfCodeWithMoreThanOneCharacter type: #Number>
	<derived>
	<FMComment:
		'This metric is essentially similar to the numberOfLinesOfCode one, 
	the difference being that it only counts the lines with more than one non-whitespace characters.
	This metric is particularly useful for comparing the density of other metrics on a line of code.
	For example, depending on the formatting style chosen a Java curly brace, or a Smalltalk block 
	can appear inline or on a separate line. For normalization purposes, these commonly appearing 
	cases can be ruled out through the present metric.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodeWithMoreThanOneCharacter
		computedAs: [ (self sourceText lines select: [ :line | line trimBoth size > 1 ]) size ]
]

{ #category : #metrics }
FamixTSourceEntity >> shouldCountChildrenForLinesOfCodeIfNoSourceAnchor [
	^ self isContainerEntity
]

{ #category : #accessing }
FamixTSourceEntity >> sourceAnchor [
	"Relation named: #sourceAnchor type: #FamixTSourceAnchor opposite: #element"

	<generated>
	<FMComment: 'SourceAnchor entity linking to the original source code for this entity'>
	<derived>
	^ sourceAnchor
]

{ #category : #accessing }
FamixTSourceEntity >> sourceAnchor: anObject [

	<generated>
	sourceAnchor := anObject
]

{ #category : #accessing }
FamixTSourceEntity >> sourceText [
	self isStub ifTrue: [ ^ '' ].
	
	^ self sourceAnchor 
		ifNil: [ '' ]
		ifNotNil: [ self sourceAnchor sourceText ]
]
