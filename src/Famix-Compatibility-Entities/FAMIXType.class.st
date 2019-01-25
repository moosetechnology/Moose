Class {
	#name : #FAMIXType,
	#superclass : #FAMIXContainerEntity,
	#traits : 'FamixTClassHierarchyNavigation + FamixTContainingWithInvocationsGlue + FamixTContainingWithStatementsGlue + FamixTParameterizedTypeUser + FamixTReferenceable + FamixTTraitUser + FamixTType + FamixTWithAttributes + FamixTWithMethods + FamixTWithMethodsWithAccessesGlue + FamixTWithMethodsWithModifiersGlue + FamixTWithSubInheritances + FamixTWithSuperInheritances + FamixTWithTypeAliases + FamixTWithTypedStructures + FamixTClassMetrics',
	#classTraits : 'FamixTClassHierarchyNavigation classTrait + FamixTContainingWithInvocationsGlue classTrait + FamixTContainingWithStatementsGlue classTrait + FamixTParameterizedTypeUser classTrait + FamixTReferenceable classTrait + FamixTTraitUser classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithAccessesGlue classTrait + FamixTWithMethodsWithModifiersGlue classTrait + FamixTWithSubInheritances classTrait + FamixTWithSuperInheritances classTrait + FamixTWithTypeAliases classTrait + FamixTWithTypedStructures classTrait + FamixTClassMetrics classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXType class >> annotation [

	<MSEClass: #Type super: #FAMIXContainerEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXType class >> generatedSlotNames [
	<generated>
	'FAMIXType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXType class >> generatedTraitNames [
	<generated>
	^ #(FamixTClassHierarchyNavigation FamixTContainingWithInvocationsGlue FamixTContainingWithStatementsGlue FamixTParameterizedTypeUser FamixTReferenceable FamixTTraitUser FamixTType FamixTWithAttributes FamixTWithMethods FamixTWithMethodsWithAccessesGlue FamixTWithMethodsWithModifiersGlue FamixTWithSubInheritances FamixTWithSuperInheritances FamixTWithTypeAliases FamixTWithTypedStructures)
]

{ #category : #meta }
FAMIXType class >> requirements [

	<generated>
	^ { FAMIXContainerEntity }
]

{ #category : #'Famix-Extensions' }
FAMIXType >> accept: aVisitor [

	aVisitor visitType: self
]

{ #category : #'Famix-Extensions-navigation' }
FAMIXType >> accessTo: aFAMIXPackageOrFAMIXClass [ 

	|accesses|
	accesses := self methods flatCollect:[:each | each accesses].
	^ accesses 
		selectAsSet: [:access | (access variable isKindOf: #FAMIXAttribute) 
								and:[aFAMIXPackageOrFAMIXClass isAccessedBy: access]].
]

{ #category : #accessing }
FAMIXType >> addOutgoingTraitUsage: aTraitUsage [
	self outgoingTraitUsages add: aTraitUsage
]

{ #category : #accessing }
FAMIXType >> addTraitUsage: aTraitUsage [
	
]

{ #category : #'Famix-Extensions' }
FAMIXType >> allAnnotationInstances [
	| result |
	result := OrderedCollection new.
	result addAll: self annotationInstances.
	result addAll: (self methods flatCollect: [ :each | each annotationInstances ]).
	^ result 
]

{ #category : #'Famix-Extensions' }
FAMIXType >> allAnnotationTypes [
	^ self allAnnotationInstances collectAsSet: #annotationType
]

{ #category : #'Famix-Implementation' }
FAMIXType >> allSuperclassesDo: aBlock [
	self allSuperclassesWithoutAliasesDo: aBlock.
	(self mooseModel sourceLanguage notNil and: [self mooseModel sourceLanguage isC])
		ifTrue: [ self typeAliases do: [ :each | each allSuperclassesWithoutAliasesDo: aBlock ] ]
]

{ #category : #accessing }
FAMIXType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FAMIXType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> classSide [
	^self isClassSide
		ifFalse:
			[self mooseModel allClasses
				entityNamed: (self mooseName , '_class') asSymbol]
		ifTrue: [self]
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> clientClasses [
	self deprecated: 'use clientTypes'.
	
	^ self clientTypes 
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> clientNamespaces [
	"returns a set of all the namespaces that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByNamespaces union: self invokingNamespaces"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> clientPackages [
	"returns a set of all the packages that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FAMIXType >> container [

	<MSEProperty: #container type: #FAMIXContainerEntity>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #'as yet unclassified' }
FAMIXType >> container: aContainer [

	self typeContainer: aContainer
]

{ #category : #'Famix-Extensions' }
FAMIXType >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.

	anEntity superInheritances do: [:inh|
		aVisitor visit: inh ].
	anEntity attributes do: [:a |
		self addAttribute: (aVisitor visit: a) ].
	anEntity methods do: [:m|
		self addMethod: (aVisitor visit: m) ].

]

{ #category : #'moosequery-queries-incoming' }
FAMIXType >> entityHasIncomingTypeDeclarations [
	^ (self structuresWithDeclaredType , self behavioursWithDeclaredType) isNotEmpty
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> extendedInPackages [

	^ self privateState cacheAt: #extendedInPackages
							ifAbsentPut: [ self extendedMethods collectAsSet: [ :m| m packageScope ] ]


]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> extendedMethods [
	"select methods which are class extensions in this class"

	^  self privateState cacheAt: #extendedMethods
							ifAbsentPut: [ self methods select: [ :m| m isExtension ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> hasMethodsAnnotatedWith: aString [
	^ self methods anySatisfy: [ :each | each isAnnotatedWith: aString ]
]

{ #category : #'Famix-Implementation' }
FAMIXType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'Famix-Java' }
FAMIXType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #'Famix-Implementation' }
FAMIXType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #'Famix-Extensions-navigation' }
FAMIXType >> incomingAccesses [
	^ self privateState 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #'Famix-Extensions-navigation' }
FAMIXType >> incomingAccessesGroup [
	<navigation: 'Incoming accesses'>
	^ self privateState cacheAt:
		 #incomingAccessesGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self incomingAccesses
				withDescription: 'Incoming accesses to ' , self mooseName]
]

{ #category : #'moosequery-queries-incoming' }
FAMIXType >> incomingTypeDeclarations [

	^ self structuresWithDeclaredType , self behavioursWithDeclaredType collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> instanceSide [
	^self isClassSide
		ifTrue:
			[self mooseModel allClasses
				entityNamed: (self mooseName removeSuffix: '_class') asSymbol]
		ifFalse: [self]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #'Famix-Java' }
FAMIXType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isBrainClass [
	^ (self propertyNamed: #BrainClass) = true
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^'*_class' match: self name
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isDataClass [
	^ (self propertyNamed: #DataClass) = true
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> isExtended [

	^ self methods anySatisfy: [ :m| m isExtension ]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isGodClass [
	^ (self propertyNamed: #GodClass) = true
]

{ #category : #'Famix-Java' }
FAMIXType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> isInstanceSide [
	^self isClassSide not
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isInterface [
	^ false
]

{ #category : #'Famix-Java' }
FAMIXType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #'Famix-Java' }
FAMIXType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #'Famix-Extensions' }
FAMIXType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #'Famix-Java' }
FAMIXType >> isParameterType [
	^ false
]

{ #category : #'Famix-Java' }
FAMIXType >> isParameterizedType [
	^ false
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> isSUnitTestCase [
	self allSuperclassesDo: [:each | each name = 'TestCase' ifTrue: [^ true] ].
	^ false
]

{ #category : #'Famix-Java' }
FAMIXType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]

{ #category : #'Famix-Smalltalk' }
FAMIXType >> localMethods [
	"select all locally defined methods"

	^ self privateState cacheAt: #localMethods
							ifAbsentPut: [ self methods reject: [ :m| m isExtension ] ]
]

{ #category : #'Famix-Extensions-operations' }
FAMIXType >> lookUp: aMethodSignature [ 
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> methodScope [
	"This only makes sense to reject self loops in #collectAtScope:"

	^ self methods
]

{ #category : #'Famix-Implementation' }
FAMIXType >> mooseNameOn: aStream [ 
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> namespaceScope [
	"we ask the container for the namespaceScope
	because we can have classes in methods or in other classes.
	Thus, we need to traverse recursively until we reach a namespace"
	
	^ self container 
		ifNotNil: [ self container namespaceScope ]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> packageScope [

	^ self parentPackage
]

{ #category : #'Famix-Implementation' }
FAMIXType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self container
]

{ #category : #'Famix-Implementation' }
FAMIXType >> printOn: aStream [ 
	| parent |
	
	self name ifNotNil: [ aStream nextPutAll: self name ].
	parent := self container.
	parent ifNotNil: [ 
		aStream nextPutAll: ' in '.
		parent mooseNameOn: aStream ].
	aStream 
		nextPutAll: ' (';
		nextPutAll: (self class name removePrefix: 'FAMIX');
		nextPutAll: ')'
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> providerClasses [
	self deprecated: 'use providerTypes'.
	^ self providerTypes
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedNamespaces union: self invokedNamespaces"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> providerPackages [
	"returns a set of all the packages that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FAMIXType >> providerTypes [
	<MSEProperty: #providerTypes type: #FAMIXType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on (inherites, staticly accesses, or uses some of their methods)'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> typeScope [
	"all types are not classes. Redefined in FamixClass"

	^ self
]

{ #category : #'Famix-Implementation' }
FAMIXType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]

{ #category : #'Famix-Implementation' }
FAMIXType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]
