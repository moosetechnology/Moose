Class {
	#name : #FAMIXTypeAlias,
	#superclass : #FAMIXType,
	#traits : 'FamixTTypeAlias',
	#classTraits : 'FamixTTypeAlias classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXTypeAlias class >> annotation [

	<MSEClass: #TypeAlias super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FAMIXTypeAlias >> allSubclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the real type as well"
	self realType ifNotNil: [:a | a allSubclassesDo: aBlock].

]

{ #category : #'Famix-Implementation' }
FAMIXTypeAlias >> allSuperclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the aliased type as well"
	self realType ifNotNil: [:a | a allSuperclassesDo: aBlock]
]

{ #category : #'Famix-Implementation' }
FAMIXTypeAlias >> realType [
	"The alias type is just an alias.
	The real type is the one provided by the aliasedType "
	^ self aliasedType isNil 
		ifTrue: [nil]
		ifFalse: [self aliasedType realType]
]
