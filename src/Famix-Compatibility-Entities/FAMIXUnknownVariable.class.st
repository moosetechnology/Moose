Class {
	#name : #FAMIXUnknownVariable,
	#superclass : #FAMIXStructuralEntity,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXUnknownVariable class >> generatedSlotNames [
	<generated>
	'FAMIXUnknownVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXUnknownVariable class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXUnknownVariable class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXUnknownVariable >> accept: aVisitor [

	aVisitor visitUnknownVariable: self
]

{ #category : #accessing }
FAMIXUnknownVariable >> belongsTo [
	^ nil
]

{ #category : #'Famix-Extensions' }
FAMIXUnknownVariable >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self container: (aVisitor visit: anEntity container).

]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> namespaceScope [
	"namespaceScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> packageScope [
	"packageScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
