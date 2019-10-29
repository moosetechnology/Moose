Class {
	#name : #FamixStSourcedEntity,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixStSourcedEntity >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in a class'>
	self flag: #todo.	"Cyril: I am not a big fan of this implementation... We should revisit it."
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size + (self methods asArray inject: 0 into: [ :sum :el | el numberOfComments + sum ]) ]
]

{ #category : #'Famix-Implementation' }
FamixStSourcedEntity >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #metrics }
FamixStSourcedEntity >> numberOfLinesOfCodeWithMoreThanOneCharacter [
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

{ #category : #accessing }
FamixStSourcedEntity >> sourceLanguage [
	^ self sourceLanguageOr: FamixStUnknownSourceLanguage
]
