Class {
	#name : #FamixTest1NamedEntity,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTest1NamedEntity class >> dependencyFM3PropertyDescription [
	"TODO: Clean"

	^ self allDeclaredProperties
		select: [ :e | e hasOpposite and: [ e opposite isSource or: [ e opposite isTarget ] ] ]
]
