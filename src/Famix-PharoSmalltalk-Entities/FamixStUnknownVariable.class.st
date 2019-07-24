Class {
	#name : #FamixStUnknownVariable,
	#superclass : #FamixStEntity,
	#traits : 'FamixStStructuralEntity',
	#classTraits : 'FamixStStructuralEntity classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'moosechef-scoping-filtering' }
FamixStUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
