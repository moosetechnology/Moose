Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAccesses [
	
	<navigation: 'All accesses'>
	^self allUsing: FamixTAccess 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAnnotationInstances [
	<navigation: 'All annotation instances'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationInstance
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAnnotationTypes [
	<navigation: 'All annotation types'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationType
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAttributes [
	
	<navigation: 'All attributes'>
	^self allUsing: FamixTAttribute 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allCaughtExceptions [
	<navigation: 'All caught exceptions'>
	<package: #Java>
	^ self allUsing: FamixTCaughtException
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allClasses [
	<navigation: 'All classes'>
	^ self allUsing: FamixTClass ofGroupClass: FAMIXClassGroup
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allComments [
	
	<navigation: 'All comments'>
	^self allUsing: FamixTComment 
	
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allDeclaredExceptions [
	<navigation: 'All declared exceptions'>
	<package: #Java>
	^ self allUsing: FamixTDeclaredException
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allEnumValues [
	<navigation: 'All enum values'>
	<package: #Java>
	^ self allUsing: FamixTEnumValue 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allEnums [
	<navigation: 'All enums'>
	<package: #Java>
	^ self allUsing: FamixTWithEnumValues  
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFiles [
	<navigation: 'All files'>
	^ self allUsing: FamixTFile
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFolders [
	<navigation: 'All folders'>
	^ self allUsing: FamixTFolder
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFunctions [
	<navigation: 'All functions'>
	^ self allUsing: FamixTFunction
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allGlobalVariables [
	
	<navigation: 'All global variables'>
	^self allUsing: FamixTGlobalVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allImplicitVariables [
	
	<navigation: 'All implicit variables'>
	^self allUsing: FamixTImplicitVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allInheritanceDefinitions [
	<navigation: 'All inheritances'>
	^ self allUsing: FamixTInheritance
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allInvocations [
	
	<navigation: 'All invocations'>
	^self allUsing: FamixTInvocation 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allLocalVariables [
	
	<navigation: 'All local variables'>
	^self allUsing: FamixTLocalVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allMethods [
	<navigation: 'All methods'>
	
	^ self allUsing: FamixTMethod
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelClasses [
	<navigation: 'All model classes'>

	^ self privateState cacheAt: 'All model classes'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allClasses reject: [:each | each isStub ]) )
				withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelMethods [
	<navigation: 'All model methods'>
	^ self privateState
		cacheAt: 'All model methods'
		ifAbsentPut: [ self allMethods reject: [ :each | each isStub ] ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelNamespaces [
	<navigation: 'All model namespaces'>
	^ self privateState
		cacheAt: 'All model namespaces'
		ifAbsentPut:
			[ MooseGroup withAll: (self allNamespaces reject: [ :each | each isStub ]) withDescription: 'All model namespaces' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelPackages [
	<navigation: 'All model packages'>

	^ self privateState cacheAt: 'All model packages'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allPackages reject: [:each | each isStub]) sorted:
																		[:p1 :p2 | p1 name < p2 name] )
				withDescription: 'All model packages' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelPureClasses [
	self flag: 'this method exists only the time we manage correctly the interface'.
	^ self privateState cacheAt: 'All model classes'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allClasses reject: [:each | each isStub or: [each isInterface]]) )
				withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allNamespaces [
	
	<navigation: 'All namespaces'>
	^self allUsing: FamixTNamespace 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allPackages [
	
	<navigation: 'All packages'>
	^self allUsing: FamixTPackage 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParameterizableClasses [
	<navigation: 'All parameterizable classes'>
	<package: #Java>
	^ self allUsing: FamixTWithParameterizedTypes
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParameterizedTypes [
	<navigation: 'All parameterized types'>
	<package: #Java>
	^ self allUsing: FamixTParameterizedType
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParameters [
	
	<navigation: 'All parameters'>
	^self allUsing: FamixTParameter 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allReferences [
	
	<navigation: 'All references'>
	^self allUsing: FamixTReference  
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allStructuralEntities [
	<navigation: 'All structural entities'>
	^ self allUsing: FamixTStructuralEntity
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTestClasses [
	<navigation: 'All test classes'>
	<package: #Java>
	^ self allModelClasses select: #isTestCase
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTestMethods [
	<navigation: 'All test methods'>
	<package: #Java>
	^ self allModelMethods select: [ :each | 
		(each respondsTo: #isJUnit4Test) and: [ each isJUnit4Test ]]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allThrownExceptions [
	<navigation: 'All thrown exceptions'>
	<package: #Java>
	^ self allUsing: FamixTThrownException
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTypes [
	<navigation: 'All types'>
	^ self allUsing: FamixTType ofGroupClass: FAMIXTypeGroup
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfAssociations [
	<FMProperty: #numberOfAssociations type: #Number>
	<FMComment: 'The total number of associations'>
	^ (self allWithSubTypesOf: FamixTAssociation) size
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfEntities [
	<FMProperty: #numberOfEntities type: #Number>
	<FMComment: 'The total number of entities (items that are not associations)'>
	^ self numberOfItems - self numberOfAssociations
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of classes in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self allMethods sum: #numberOfLinesOfCode ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfPackages [
	<FMProperty: #numberOfPackages type: #Number>
	<FMComment: 'Total number of packages'>
	^ self privateState propertyAt: #numberOfPackages ifAbsentPut: [ self allPackages size ] 
]
