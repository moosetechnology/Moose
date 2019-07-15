Class {
	#name : #FamixJavaSourceTextAnchor,
	#superclass : #FamixJavaSourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FamixJavaSourceAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaSourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FamixJavaSourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaSourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FamixJavaSourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaSourceTextAnchor >> containerFiles [
	^ {}
]

{ #category : #'as yet unclassified' }
FamixJavaSourceTextAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]
