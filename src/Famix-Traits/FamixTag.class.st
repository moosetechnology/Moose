Class {
	#name : #FamixTag,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#color => FMProperty',
		'#entities => FMMany type: #FamixTWithTags opposite: #tags'
	],
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTag class >> annotation [

	<FMClass: #Tag super: #MooseEntity>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTag class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #adding }
FamixTag >> addEntity: anObject [
	<generated>
	^ self entities add: anObject
]

{ #category : #accessing }
FamixTag >> color [

	<FMProperty: #color type: #Object>
	<generated>
	<FMComment: 'The color of the tag'>
	^ color
]

{ #category : #accessing }
FamixTag >> color: anObject [
	<generated>
	color := anObject
]

{ #category : #accessing }
FamixTag >> entities [
	"Relation named: #entities type: #FamixTWithTags opposite: #tags"

	<generated>
	<FMComment: 'List of entities with this tag'>
	<derived>
	^ entities
]

{ #category : #accessing }
FamixTag >> entities: anObject [

	<generated>
	entities value: anObject
]
