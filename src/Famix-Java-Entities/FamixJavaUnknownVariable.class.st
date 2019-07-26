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

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> belongsTo [
	^ nil
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
