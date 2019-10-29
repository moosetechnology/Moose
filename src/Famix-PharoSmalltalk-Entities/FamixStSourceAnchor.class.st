Class {
	#name : #FamixStSourceAnchor,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceAnchor + FamixTWithImmediateSource',
	#classTraits : 'FamixTSourceAnchor classTrait + FamixTWithImmediateSource classTrait',
	#instVars : [
		'#pharoEntity'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #initialization }
FamixStSourceAnchor >> initialize [
	super initialize.
	pharoEntity := WeakArray new: 1.
]

{ #category : #accessing }
FamixStSourceAnchor >> pharoEntity [
	"pharoEntity var is a 1-element weak array"
	
	^ pharoEntity at: 1
]

{ #category : #accessing }
FamixStSourceAnchor >> pharoEntity: anObject [
	"point to object weakly"
	
	pharoEntity at: 1 put: anObject 
]

{ #category : #accessing }
FamixStSourceAnchor >> sourceText [
	^ self pharoEntity ifNotNil: #definition  
]
