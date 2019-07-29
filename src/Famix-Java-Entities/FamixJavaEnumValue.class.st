Class {
	#name : #FamixJavaEnumValue,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTEnumValue',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTEnumValue classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<MSEClass: #EnumValue super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaEnumValue class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #meta }
FamixJavaEnumValue class >> requirements [

	<generated>
	^ { FamixJavaEnum }
]

{ #category : #accessing }
FamixJavaEnumValue >> belongsTo [

	<generated>
	^ self parentEnum

]

{ #category : #accessing }
FamixJavaEnumValue >> belongsTo: anObject [

	<generated>
	self parentEnum: anObject

]

{ #category : #testing }
FamixJavaEnumValue >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEnumValue >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
FamixJavaEnumValue >> packageScope [
	^ self typeScope ifNotNil: #packageScope
]

{ #category : #accessing }
FamixJavaEnumValue >> typeScope [
	^ self belongsTo typeScope
]
