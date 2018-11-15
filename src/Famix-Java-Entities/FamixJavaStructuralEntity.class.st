Class {
	#name : #FamixJavaStructuralEntity,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAccessible + FamixTTypedStructure + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTAccessible classTrait + FamixTTypedStructure classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaStructuralEntity class >> generatedSlotNames [
	<generated>
	'FamixJavaStructuralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaStructuralEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTAccessible FamixTTypedStructure FamixTWithDereferencedInvocations)
]

{ #category : #meta }
FamixJavaStructuralEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> accept: aVisitor [

	aVisitor visitStructuralEntity: self
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> accessors [
	<MSEProperty: #accessors type: #FamixJavaMethod> <multivalued> <derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self declaredType: (aVisitor visit: anEntity declaredType).

]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> hasDeclaredType [
	^ self declaredType notNil
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> isSharedVariable [

	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> namespaceScope [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> packageScope [

	| cs |
	cs := self typeScope.
	
	^ (cs isNil) ifTrue: [nil] ifFalse: [cs packageScope]
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> typeScope [

	^ self belongsTo typeScope 
]
