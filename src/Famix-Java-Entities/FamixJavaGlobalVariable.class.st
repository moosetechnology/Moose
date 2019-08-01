Class {
	#name : #FamixJavaGlobalVariable,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTGlobalVariable + FamixTWithModifiers',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTGlobalVariable classTrait + FamixTWithModifiers classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaGlobalVariable class >> annotation [

	<MSEClass: #GlobalVariable super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaGlobalVariable class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #meta }
FamixJavaGlobalVariable class >> requirements [

	<generated>
	^ { FamixJavaScopingEntity }
]

{ #category : #accessing }
FamixJavaGlobalVariable >> belongsTo [

	<generated>
	^ self parentScope

]

{ #category : #accessing }
FamixJavaGlobalVariable >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]

{ #category : #testing }
FamixJavaGlobalVariable >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> isPrivate [
	^ self isPublic not
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> isPublic [
	"checker whether I am called outside the module in which I am defined"
	^ self incomingAccesses anySatisfy: [:inv |
			inv accessor parentScope ~~ self parentScope]
]

{ #category : #testing }
FamixJavaGlobalVariable >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaGlobalVariable >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> namespaceScope [
	^ self parentScope
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> packageScope [
	^ self parentPackage
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Global Variable)'
]

{ #category : #'as yet unclassified' }
FamixJavaGlobalVariable >> typeScope [
	"typeScope does not make sense for a global variable,
	so we return nil"

	^ nil
]
