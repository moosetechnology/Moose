Class {
	#name : #FamixStType,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTReferenceable + FamixTType + FamixTWithTypedStructures',
	#classTraits : 'FamixTReferenceable classTrait + FamixTType classTrait + FamixTWithTypedStructures classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStType class >> annotation [

	<MSEClass: #Type super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStType class >> requirements [

	<generated>
	^ { FamixStContainerEntity }
]

{ #category : #adding }
FamixStType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixStType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #adding }
FamixStType >> clientNamespaces [
	"returns a set of all the namespaces that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByNamespaces union: self invokingNamespaces"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #adding }
FamixStType >> clientPackages [
	"returns a set of all the packages that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #adding }
FamixStType >> container [

	<MSEProperty: #container type: #FamixStContainerEntity>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #adding }
FamixStType >> entityHasIncomingTypeDeclarations [
	^ (self structuresWithDeclaredType , self behavioursWithDeclaredType) isNotEmpty
]

{ #category : #adding }
FamixStType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #adding }
FamixStType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #testing }
FamixStType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #adding }
FamixStType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #adding }
FamixStType >> lookUp: aMethodSignature [ 
	"Returns the first method that has as signature #aMethodSignature. 
	The search starts from the receiver's methods and traveses the inherited methods from the receiver's superclasses heirarchy.
	If such a method has not been found, it returns nil"

	| c toSearchIt searchedM |
	c := self.
	searchedM := nil.
	toSearchIt := true.
	[c notNil and: [toSearchIt]] whileTrue: 
			[searchedM := c methods 
						detect: [:m | m signature = aMethodSignature]
						ifNone: [nil].
			searchedM
				ifNil: [c := c superclass]
				ifNotNil: [toSearchIt := false]
			].
	^searchedM
]

{ #category : #adding }
FamixStType >> mooseNameOn: aStream [ 
	| parent |
	parent := self typeContainer.
	parent ifNotNil: 
		[ 
			parent mooseNameOn: aStream.
			aStream
				nextPut: $:;
				nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]
