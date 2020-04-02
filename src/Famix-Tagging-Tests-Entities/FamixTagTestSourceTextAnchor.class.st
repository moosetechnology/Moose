Class {
	#name : #FamixTagTestSourceTextAnchor,
	#superclass : #MooseEntity,
	#traits : 'FamixTHasImmediateSource + FamixTSourceAnchor',
	#classTraits : 'FamixTHasImmediateSource classTrait + FamixTSourceAnchor classTrait',
	#category : #'Famix-Tagging-Tests-Entities-Entities'
}

{ #category : #meta }
FamixTagTestSourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #MooseEntity>
	<package: #'Famix-Tagging-Tests-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTagTestSourceTextAnchor class >> metamodel [

	<generated>
	^ FamixTagTestModel metamodel
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTagTestSourceTextAnchor >> isType [

	<generated>
	^ false
]
