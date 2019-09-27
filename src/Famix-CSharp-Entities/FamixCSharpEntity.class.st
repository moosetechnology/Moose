"
file :=  'ArgoUML-0.34.mse' asFileReference readStream.

dictionary := Dictionary newFrom: (
	FamixJavaEntity withAllSubclasses collect: [ :c | 
		cn := c name withoutPrefix: #FamixJava.
		('FAMIX.', cn) -> ('FamixJava-Entities.', cn) ]).

dictionary at: 'FAMIX.JavaSourceLanguage' put: 'FamixJava-Entities.SourceLanguage'.

repo := MooseModel importFrom: file withMetamodel: FamixJavaGenerator metamodel translationDictionary: dictionary.

model := MooseModel new.
	model silentlyAddAll: repo elements.
	model entityStorage forRuntime.
model.
"
Class {
	#name : #FamixCSharpEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixCSharpGenerator) metamodel
]

{ #category : #testing }
FamixCSharpEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixCSharpEntity >> isType [

	<generated>
	^ false
]
