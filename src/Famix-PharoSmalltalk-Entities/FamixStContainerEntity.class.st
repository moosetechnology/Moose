Class {
	#name : #FamixStContainerEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStContainerEntity class >> annotation [

	<MSEClass: #ContainerEntity super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStContainerEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]

{ #category : #meta }
FamixStContainerEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixStContainerEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStContainerEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
FamixStContainerEntity >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	
	^ self children size
]
