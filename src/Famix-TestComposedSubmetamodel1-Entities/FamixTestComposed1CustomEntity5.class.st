Class {
	#name : #FamixTestComposed1CustomEntity5,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1CustomEntity5 class >> annotation [

	<MSEClass: #CustomEntity5 super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1CustomEntity5 class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1CustomEntity5 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1CustomEntity5 class >> generatedTraitNames [
	<generated>
	^ #(TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed1CustomEntity5 class >> requirements [

	<generated>
	^ {  }
]
