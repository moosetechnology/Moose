Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #FamixJavaStructuralEntity,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaUnknownVariable class >> generatedSlotNames [
	<generated>
	'FamixJavaUnknownVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaUnknownVariable class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixJavaUnknownVariable class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> accept: aVisitor [

	aVisitor visitUnknownVariable: self
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> belongsTo [
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self container: (aVisitor visit: anEntity container).

]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> namespaceScope [
	"namespaceScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> packageScope [
	"packageScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
