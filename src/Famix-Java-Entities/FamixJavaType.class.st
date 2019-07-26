Class {
	#name : #FamixJavaType,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTClassHierarchyNavigation + FamixTContainingWithStatementsGlue + FamixTParameterizedTypeUser + FamixTReferenceable + FamixTType + FamixTWithAttributes + FamixTWithMethods + FamixTWithMethodsWithModifiersGlue + FamixTWithSuperInheritances + FamixTWithTypeAliases + FamixTWithTypedStructures + FamixTWithTypes',
	#classTraits : 'FamixTClassHierarchyNavigation classTrait + FamixTContainingWithStatementsGlue classTrait + FamixTParameterizedTypeUser classTrait + FamixTReferenceable classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithModifiersGlue classTrait + FamixTWithSuperInheritances classTrait + FamixTWithTypeAliases classTrait + FamixTWithTypedStructures classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaType class >> annotation [

	<MSEClass: #Type super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaType class >> requirements [

	<generated>
	^ { FamixJavaClass. FamixJavaMethod. FamixJavaScopingEntity. FamixJavaType }
]

{ #category : #'Famix-Java' }
FamixJavaType >> allAnnotationInstances [
	| result |
	result := OrderedCollection new.
	result addAll: self annotationInstances.
	result addAll: (self methods flatCollect: [ :each | each annotationInstances ]).
	^ result 
]

{ #category : #'Famix-Extensions' }
FamixJavaType >> allAnnotationTypes [
	^ self allAnnotationInstances collectAsSet: #annotationType
]

{ #category : #accessing }
FamixJavaType >> anySuperclass [
"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]

{ #category : #accessing }
FamixJavaType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixJavaType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixJavaType >> clientNamespaces [
	"returns a set of all the namespaces that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByNamespaces union: self invokingNamespaces"

	^ (self queryAllIncoming atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixJavaType >> clientPackages [
	"returns a set of all the packages that depend on (some classes of them inherit, staticly access, or use some methods of) the receiver"

	"Moose cook was: ^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #accessing }
FamixJavaType >> container [

	<MSEProperty: #container type: #FamixTWithTypes>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #accessing }
FamixJavaType >> container: aContainer [

	self typeContainer: aContainer
]

{ #category : #'moosequery-queries-incoming' }
FamixJavaType >> entityHasIncomingTypeDeclarations [
	^ (self structuresWithDeclaredType , self behavioursWithDeclaredType) isNotEmpty
]

{ #category : #testing }
FamixJavaType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #testing }
FamixJavaType >> hasMethodsAnnotatedWith: aString [
	^ self methods anySatisfy: [ :each | each isAnnotatedWith: aString ]
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'Famix-Java' }
FamixJavaType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #accessing }
FamixJavaType >> incomingAccesses [
	^ self privateState 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #'moosequery-queries-incoming' }
FamixJavaType >> incomingTypeDeclarations [

	^ self structuresWithDeclaredType , self behavioursWithDeclaredType collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #accessing }
FamixJavaType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #testing }
FamixJavaType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #testing }
FamixJavaType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #testing }
FamixJavaType >> isInterface [
	^ false
]

{ #category : #testing }
FamixJavaType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #testing }
FamixJavaType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #testing }
FamixJavaType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #testing }
FamixJavaType >> isParameterType [
	^ false
]

{ #category : #testing }
FamixJavaType >> isParameterizedType [
	^ false
]

{ #category : #testing }
FamixJavaType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]

{ #category : #'Famix-Extensions-operations' }
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

{ #category : #accessing }
FamixJavaType >> packageScope [

	^ self parentPackage
]

{ #category : #accessing }
FamixJavaType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self container
]

{ #category : #printing }
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

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixJavaType >> providerNamespaces [
	"returns a set of all the namespaces that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedNamespaces union: self invokedNamespaces"

	^ (self queryAllOutgoing atScope: FamixTNamespace) withoutSelfLoops
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixJavaType >> providerPackages [
	"returns a set of all the packages that the receiver depends on (they include some classes that the receiver inherites, staticly accesses, or uses some of their methods)"

	"Moose cook was: ^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #accessing }
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

{ #category : #'Famix-Implementation' }
FamixJavaType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]
