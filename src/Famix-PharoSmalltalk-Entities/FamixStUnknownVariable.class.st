Class {
	#name : #FamixStUnknownVariable,
	#superclass : #FamixStStructuralEntity,
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStUnknownVariable class >> generatedSlotNames [
	<generated>
	'FamixStUnknownVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #meta }
FamixStUnknownVariable class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'moosechef-scoping-filtering' }
FamixStUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
