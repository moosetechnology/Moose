"
FAMIXSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FAMIXEntity and it can hold comments, a source anchor and a source language.
"
Trait {
	#name : #FamixTSourceEntity,
	#traits : 'FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTSourceEntity classSide >> annotation [

	<FMClass: #TSourceEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FamixTSourceEntity >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #metrics }
FamixTSourceEntity >> numberOfLinesOfCodeWithMoreThanOneCharacter [
	<FMProperty: #numberOfLinesOfCodeWithMoreThanOneCharacter type: #Number> <derived>
	<FMComment: 'This metric is essentially similar to the numberOfLinesOfCode one, 
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
