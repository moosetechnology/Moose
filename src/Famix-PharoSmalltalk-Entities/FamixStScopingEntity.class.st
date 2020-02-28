Class {
	#name : #FamixStScopingEntity,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTScopingEntity + FamixTWithGlobalVariables',
	#classTraits : 'FamixTScopingEntity classTrait + FamixTWithGlobalVariables classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStScopingEntity class >> annotation [

	<FMClass: #ScopingEntity super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics' }
FamixStScopingEntity >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	
	self subclassResponsibility
]

{ #category : #'Famix-Extensions' }
FamixStScopingEntity >> allClasses [
	| result |
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result addAll: each classes ].
	^ result
]
