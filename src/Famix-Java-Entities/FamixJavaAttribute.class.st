Class {
	#name : #FamixJavaAttribute,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTAttribute + FamixTWithAnnotationInstances + FamixTWithClassScope',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTAttribute classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithClassScope classTrait',
	#instVars : [
		'#hasClassScope'
	],
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<MSEClass: #Attribute super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaAttribute class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #meta }
FamixJavaAttribute class >> requirements [

	<generated>
	^ { FamixJavaAnnotationType. FamixJavaType }
]

{ #category : #accessing }
FamixJavaAttribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixJavaAttribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> initialize [
	super initialize.
	hasClassScope := false.

]

{ #category : #testing }
FamixJavaAttribute >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaAttribute >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> packageScope [
	^ self parentType packageScope
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> typeScope [
	^ self parentType
]
