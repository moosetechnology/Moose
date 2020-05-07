Trait {
	#name : #FamixTWithSourceAnchor,
	#instVars : [
		'#sourceAnchor => FMOne type: #FamixTSourceAnchor opposite: #element'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTWithSourceAnchor classSide >> annotation [

	<FMClass: #TWithSourceAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithSourceAnchor >> allSourceAnchors [
	^ self sourceAnchor
		ifNil: [ {} ]
		ifNotNil: #allSourceAnchors
]

{ #category : #enumerating }
FamixTWithSourceAnchor >> allSourceAnchorsDo: aBlock [
	^ self sourceAnchor ifNotNil: [ :sa | sa allSourceAnchorsDo: aBlock ]
]

{ #category : #testing }
FamixTWithSourceAnchor >> canHaveBehaviouralChildren [
	self isContainerEntity ifFalse: [ ^ false ].

	^ self childrenTypes anySatisfy: [ :c | c usesFamixTrait: FamixTWithStatements ]
]

{ #category : #metrics }
FamixTWithSourceAnchor >> computeNumberOfLinesOfCode [
	self hasSourceAnchor ifTrue: [ ^ self sourceAnchor lineCount ].
	self sourceText = '' ifFalse: [ ^ self sourceText lineCount ].

	(self isStub not and: [ self canHaveBehaviouralChildren ]) ifFalse: [ ^ self notExistentMetricValue ].

	^ (self children select: #isBehavioural) sumNumbers: #numberOfLinesOfCode
]

{ #category : #testing }
FamixTWithSourceAnchor >> hasSourceAnchor [
	^ self sourceAnchor isNotNil
]

{ #category : #properties }
FamixTWithSourceAnchor >> notExistentMetricValue [
	^ self explicitRequirement
]

{ #category : #metrics }
FamixTWithSourceAnchor >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of lines of code in a method.'>
	^ self lookUpPropertyNamed: #numberOfLinesOfCode computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #metrics }
FamixTWithSourceAnchor >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #metrics }
FamixTWithSourceAnchor >> numberOfLinesOfCodeWithMoreThanOneCharacter [
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

{ #category : #accessing }
FamixTWithSourceAnchor >> sourceAnchor [
	"Relation named: #sourceAnchor type: #FamixTSourceAnchor opposite: #element"

	<generated>
	<FMComment: 'SourceAnchor entity linking to the original source code for this entity'>
	<derived>
	^ sourceAnchor
]

{ #category : #accessing }
FamixTWithSourceAnchor >> sourceAnchor: anObject [

	<generated>
	sourceAnchor := anObject
]

{ #category : #accessing }
FamixTWithSourceAnchor >> sourceText [
	self isStub ifTrue: [ ^ '' ].
	
	^ self sourceAnchor 
		ifNil: [ '' ]
		ifNotNil: [ self sourceAnchor sourceText ]
]
