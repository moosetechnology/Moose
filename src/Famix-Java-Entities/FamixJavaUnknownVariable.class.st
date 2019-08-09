Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixJavaTStructuralEntity',
	#classTraits : 'FamixJavaTStructuralEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> belongsTo [
	^ nil
]
