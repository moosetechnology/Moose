Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity',
	#classTraits : 'FamixJavaTStructuralEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<MSEClass: #UnknownVariable super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaUnknownVariable class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> belongsTo [
	^ nil
]

{ #category : #testing }
FamixJavaUnknownVariable >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaUnknownVariable >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> namespaceScope [
	"namespaceScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> packageScope [
	"packageScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownVariable >> typeScope [
	"typeScope does not make sense for an unknown variable,
	so we return nil"
	^ nil
]
