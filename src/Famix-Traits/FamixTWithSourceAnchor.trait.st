Trait {
	#name : #FamixTWithSourceAnchor,
	#instVars : [
		'#sourceAnchor => FMOne type: #FamixTSourceAnchor opposite: #element'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTWithSourceAnchor classSide >> annotation [

	<MSEClass: #TWithSourceAnchor super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FamixTWithSourceAnchor >> computeNumberOfLinesOfCode [
	self hasSourceAnchor 
		ifTrue: [ ^ self sourceAnchor lineCount ].
	^ (self sourceText = '')
			ifTrue: [ self notExistentMetricValue ]
			ifFalse: [ self sourceText lineCount ]
]

{ #category : #testing }
FamixTWithSourceAnchor >> hasSourceAnchor [
	^ self sourceAnchor notNil
]

{ #category : #properties }
FamixTWithSourceAnchor >> notExistentMetricValue [
	^ self explicitRequirement
]

{ #category : #'Famix-Implementation' }
FamixTWithSourceAnchor >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<MSEComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #'Famix-Implementation' }
FamixTWithSourceAnchor >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #metrics }
FamixTWithSourceAnchor >> numberOfLinesOfCodeWithMoreThanOneCharacter [
	<MSEProperty: #numberOfLinesOfCodeWithMoreThanOneCharacter type: #Number> <derived>
	<MSEComment: 'This metric is essentially similar to the numberOfLinesOfCode one, 
	the difference being that it only counts the lines with more than one non-whitespace characters.
	This metric is particularly useful for comparing the density of other metrics on a line of code.
	For example, depending on the formatting style chosen a Java curly brace, or a Smalltalk block 
	can appear inline or on a separate line. For normalization purposes, these commonly appearing 
	cases can be ruled out through the present metric.'>
	^self
		lookUpPropertyNamed: #numberOfLinesOfCodeWithMoreThanOneCharacter
		computedAs: [			
			(self sourceText lines select: [ :line |
				line trimBoth size > 1 ]) size ]
]

{ #category : #accessing }
FamixTWithSourceAnchor >> sourceAnchor [
	"Relation named: #sourceAnchor type: #FamixTSourceAnchor opposite: #element"

	<generated>
	<MSEComment: 'SourceAnchor entity linking to the original source code for this entity'>
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
