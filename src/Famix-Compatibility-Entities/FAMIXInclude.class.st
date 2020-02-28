Class {
	#name : #FAMIXInclude,
	#superclass : #MooseEntity,
	#traits : 'FamixTFileInclude',
	#classTraits : 'FamixTFileInclude classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInclude class >> annotation [

	<FMClass: #Include super: #MooseEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXInclude class >> metamodel [

	<generated>
	^ FAMIXModel metamodel
]

{ #category : #accessing }
FAMIXInclude >> from [	
	^ self source
]

{ #category : #testing }
FAMIXInclude >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FAMIXInclude >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
FAMIXInclude >> to [
	^ self target
]
