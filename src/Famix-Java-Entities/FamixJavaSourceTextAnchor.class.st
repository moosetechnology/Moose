Class {
	#name : #FamixJavaSourceTextAnchor,
	#superclass : #FamixJavaSourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixJavaSourceAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaSourceTextAnchor >> containerFiles [
	^ {}
]

{ #category : #'as yet unclassified' }
FamixJavaSourceTextAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]
