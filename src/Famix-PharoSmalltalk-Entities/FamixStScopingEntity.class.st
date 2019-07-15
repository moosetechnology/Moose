Class {
	#name : #FamixStScopingEntity,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTGlobalVariableScope + FamixTScopingEntity',
	#classTraits : 'FamixTGlobalVariableScope classTrait + FamixTScopingEntity classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStScopingEntity class >> annotation [

	<MSEClass: #ScopingEntity super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStScopingEntity class >> generatedSlotNames [
	<generated>
	'FamixStScopingEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStScopingEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTGlobalVariableScope FamixTScopingEntity)
]

{ #category : #meta }
FamixStScopingEntity class >> requirements [

	<generated>
	^ { FamixStScopingEntity }
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

{ #category : #accessing }
FamixStScopingEntity >> belongsTo [
	^ self parentScope ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixStScopingEntity >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]

{ #category : #accessing }
FamixStScopingEntity >> typeScope [
	"This only makes sense to reject self loops in #collectAtScope:"
	^ self classes
]
