Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity',
	#classTraits : 'FamixJavaTStructuralEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> belongsTo [
	^ nil
]
