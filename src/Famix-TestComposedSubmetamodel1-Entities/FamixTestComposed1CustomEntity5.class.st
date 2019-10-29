Class {
	#name : #FamixTestComposed1CustomEntity5,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1CustomEntity5 class >> annotation [

	<FMClass: #CustomEntity5 super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTestComposed1CustomEntity5 >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]
