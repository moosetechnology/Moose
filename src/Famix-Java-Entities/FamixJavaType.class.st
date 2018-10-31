Class {
	#name : #FamixJavaType,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixTClassHierarchyNavigation + FamixTContainingWithInvocationsGlue + FamixTContainingWithStatementsGlue + FamixTParameterizedTypeUser + FamixTReferenceable + FamixTType + FamixTWithAttributes + FamixTWithMethods + FamixTWithMethodsWithAccessesGlue + FamixTWithMethodsWithModifiersGlue + FamixTWithSubInheritances + FamixTWithSuperInheritances + FamixTWithTypeAliases + FamixTWithTypedStructures',
	#classTraits : 'FamixTClassHierarchyNavigation classTrait + FamixTContainingWithInvocationsGlue classTrait + FamixTContainingWithStatementsGlue classTrait + FamixTParameterizedTypeUser classTrait + FamixTReferenceable classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithAccessesGlue classTrait + FamixTWithMethodsWithModifiersGlue classTrait + FamixTWithSubInheritances classTrait + FamixTWithSuperInheritances classTrait + FamixTWithTypeAliases classTrait + FamixTWithTypedStructures classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaType class >> annotation [

	<MSEClass: #Type super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaType class >> generatedSlotNames [
	<generated>
	'FamixJavaType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaType class >> generatedTraitNames [
	<generated>
	^ #(FamixTClassHierarchyNavigation FamixTContainingWithInvocationsGlue FamixTContainingWithStatementsGlue FamixTParameterizedTypeUser FamixTReferenceable FamixTType FamixTWithAttributes FamixTWithMethods FamixTWithMethodsWithAccessesGlue FamixTWithMethodsWithModifiersGlue FamixTWithSubInheritances FamixTWithSuperInheritances FamixTWithTypeAliases FamixTWithTypedStructures)
]

{ #category : #meta }
FamixJavaType class >> requirements [

	<generated>
	^ { FamixJavaContainerEntity }
]

{ #category : #'as yet unclassified' }
FamixJavaType >> accept: aVisitor [

	aVisitor visitType: self
]

{ #category : #'as yet unclassified' }
FamixJavaType >> accessTo: aFAMIXPackageOrFAMIXClass [ 

	|accesses|
	accesses := self methods flatCollect:[:each | each accesses].
	^ accesses 
		selectAsSet: [:access | (access variable isKindOf: #FamixJavaAttribute) 
								and:[aFAMIXPackageOrFAMIXClass isAccessedBy: access]].
]

{ #category : #'as yet unclassified' }
FamixJavaType >> allAnnotationInstances [
	| result |
	result := OrderedCollection new.
	result addAll: self annotationInstances.
	result addAll: (self methods flatCollect: [ :each | each annotationInstances ]).
	^ result 
]

{ #category : #'as yet unclassified' }
FamixJavaType >> allAnnotationTypes [
	^ self allAnnotationInstances collectAsSet: #annotationType
]

{ #category : #'as yet unclassified' }
FamixJavaType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixJavaType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaType >> clientClasses [
	self deprecated: 'use clientTypes'.
	
	^ self clientTypes 
]

{ #category : #'as yet unclassified' }
FamixJavaType >> clientNamespaces [
	"returns a set of all the namespaces that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByNamespaces union: self invokingNamespaces"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaType >> clientPackages [
	"returns a set of all the packages that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaType >> container [

	<MSEProperty: #container type: #FamixJavaContainerEntity>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #'as yet unclassified' }
FamixJavaType >> container: aContainer [

	self typeContainer: aContainer
]

{ #category : #'as yet unclassified' }
FamixJavaType >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.

	anEntity superInheritances do: [:inh|
		aVisitor visit: inh ].
	anEntity attributes do: [:a |
		self addAttribute: (aVisitor visit: a) ].
	anEntity methods do: [:m|
		self addMethod: (aVisitor visit: m) ].

]

{ #category : #'as yet unclassified' }
FamixJavaType >> extendedInPackages [

	^ self privateState cacheAt: #extendedInPackages
							ifAbsentPut: [ self extendedMethods collectAsSet: [ :m| m packageScope ] ]


]

{ #category : #'as yet unclassified' }
FamixJavaType >> extendedMethods [
	"select methods which are class extensions in this class"

	^  self privateState cacheAt: #extendedMethods
							ifAbsentPut: [ self methods select: [ :m| m isExtension ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> hasMethodsAnnotatedWith: aString [
	^ self methods anySatisfy: [ :each | each isAnnotatedWith: aString ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #'as yet unclassified' }
FamixJavaType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> incomingAccesses [
	^ self privateState 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> incomingAccessesGroup [
	<navigation: 'Incoming accesses'>
	^ self privateState cacheAt:
		 #incomingAccessesGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self incomingAccesses
				withDescription: 'Incoming accesses to ' , self mooseName]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> incomingTypeDeclarations [

	^ self structuresWithDeclaredType , self behavioursWithDeclaredType collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> instanceSide [
	^self isClassSide
		ifTrue:
			[self mooseModel allClasses
				entityNamed: (self mooseName removeSuffix: '_class') asSymbol]
		ifFalse: [self]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isExtended [

	^ self methods anySatisfy: [ :m| m isExtension ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isInstanceSide [
	^self isClassSide not
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isInterface [
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isParameterType [
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isParameterizedType [
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]

{ #category : #'as yet unclassified' }
FamixJavaType >> localMethods [
	"select all locally defined methods"

	^ self privateState cacheAt: #localMethods
							ifAbsentPut: [ self methods reject: [ :m| m isExtension ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> lookUp: aMethodSignature [ 
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

{ #category : #'as yet unclassified' }
FamixJavaType >> methodScope [
	"This only makes sense to reject self loops in #collectAtScope:"

	^ self methods
]

{ #category : #printing }
FamixJavaType >> mooseNameOn: aStream [ 
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

{ #category : #'as yet unclassified' }
FamixJavaType >> namespaceScope [
	"we ask the container for the namespaceScope
	because we can have classes in methods or in other classes.
	Thus, we need to traverse recursively until we reach a namespace"
	
	^ self container 
		ifNotNil: [ self container namespaceScope ]
]

{ #category : #'as yet unclassified' }
FamixJavaType >> packageScope [

	^ self parentPackage
]

{ #category : #'as yet unclassified' }
FamixJavaType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self container
]

{ #category : #'as yet unclassified' }
FamixJavaType >> printOn: aStream [ 
	| parent |
	
	self name ifNotNil: [ aStream nextPutAll: self name ].
	parent := self container.
	parent ifNotNil: [ 
		aStream nextPutAll: ' in '.
		parent mooseNameOn: aStream ].
	aStream 
		nextPutAll: ' (';
		nextPutAll: (self class name removePrefix: 'FamixJava');
		nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
FamixJavaType >> providerClasses [
	self deprecated: 'use providerTypes'.
	^ self providerTypes
]

{ #category : #'as yet unclassified' }
FamixJavaType >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedNamespaces union: self invokedNamespaces"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaType >> providerPackages [
	"returns a set of all the packages that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaType >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixJavaType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on (inherites, staticly accesses, or uses some of their methods)'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaType >> typeScope [
	"all types are not classes. Redefined in FamixClass"

	^ self
]

{ #category : #'as yet unclassified' }
FamixJavaType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]

{ #category : #'as yet unclassified' }
FamixJavaType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]
