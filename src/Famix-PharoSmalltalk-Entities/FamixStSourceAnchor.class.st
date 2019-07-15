Class {
	#name : #FamixStSourceAnchor,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceAnchor + FamixTWithImmediateSource + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + FamixTWithImmediateSource classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#pharoEntity'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStSourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixStSourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStSourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor FamixTWithImmediateSource TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #accessing }
FamixStSourceAnchor class >> parentTypes [
	"Source Anchors should not implement TEntityMetaLevelDependency but currently a source anchor is in Moose containment tree. This is a bug but Orion depend on this hack. So we first need to clean Orion, then we can remove those aweful methods. here."
	^ {}
]

{ #category : #meta }
FamixStSourceAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixStSourceAnchor class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

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
