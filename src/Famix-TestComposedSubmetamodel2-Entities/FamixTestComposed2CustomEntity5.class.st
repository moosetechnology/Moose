Class {
	#name : #FamixTestComposed2CustomEntity5,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2CustomEntity5 class >> annotation [

	<MSEClass: #CustomEntity5 super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2CustomEntity5 class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2CustomEntity5 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2CustomEntity5 class >> generatedTraitNames [
	<generated>
	^ #(TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed2CustomEntity5 class >> requirements [

	<generated>
	^ {  }
]
