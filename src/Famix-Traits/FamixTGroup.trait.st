Trait {
	#name : #FamixTGroup,
	#category : #'Famix-Traits-Group'
}

{ #category : #'*Famix-Traits' }
FamixTGroup >> allAccesses [
	
	<navigation: 'All accesses'>
	^self allUsing: FamixTAccess 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allAnnotationInstances [
	<navigation: 'All annotation instances'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationInstance
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allAnnotationTypes [
	<navigation: 'All annotation types'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationType
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allAttributes [
	
	<navigation: 'All attributes'>
	^self allUsing: FamixTAttribute 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allCaughtExceptions [
	<navigation: 'All caught exceptions'>
	<package: #Java>
	^ self allUsing: FamixTCaughtException
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allClasses [
	<navigation: 'All classes'>
	^ self allUsing: FamixTClass ofGroupClass: FAMIXClassGroup
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allComments [
	
	<navigation: 'All comments'>
	^self allUsing: FamixTComment 
	
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allDeclaredExceptions [
	<navigation: 'All declared exceptions'>
	<package: #Java>
	^ self allUsing: FamixTDeclaredException
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allEnumValues [
	<navigation: 'All enum values'>
	<package: #Java>
	^ self allUsing: FamixTEnumValue 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allEnums [
	<navigation: 'All enums'>
	<package: #Java>
	^ self allUsing: FamixTWithEnumValues  
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allFiles [
	<navigation: 'All files'>
	^ self allUsing: FamixTFile
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allFolders [
	<navigation: 'All folders'>
	^ self allUsing: FamixTFolder
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allFunctions [
	<navigation: 'All functions'>
	^ self allUsing: FamixTFunction
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allGlobalVariables [
	
	<navigation: 'All global variables'>
	^self allUsing: FamixTGlobalVariable 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allImplicitVariables [
	
	<navigation: 'All implicit variables'>
	^self allUsing: FamixTImplicitVariable 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allInheritanceDefinitions [
	<navigation: 'All inheritances'>
	^ self allUsing: FamixTInheritance
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allInvocations [
	
	<navigation: 'All invocations'>
	^self allUsing: FamixTInvocation 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allLocalVariables [
	
	<navigation: 'All local variables'>
	^self allUsing: FamixTLocalVariable 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allMethods [
	<navigation: 'All methods'>
	
	^ self allUsing: FamixTMethod
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allModelClasses [
	<navigation: 'All model classes'>

	^ self privateState cacheAt: 'All model classes'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allClasses reject: [:each | each isStub ]) )
				withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allModelMethods [
	<navigation: 'All model methods'>
	^ self privateState
		cacheAt: 'All model methods'
		ifAbsentPut: [ self allMethods reject: [ :each | each isStub ] ]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allModelNamespaces [
	<navigation: 'All model namespaces'>
	^ self privateState
		cacheAt: 'All model namespaces'
		ifAbsentPut:
			[ MooseGroup withAll: (self allNamespaces reject: [ :each | each isStub ]) withDescription: 'All model namespaces' ]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allModelPackages [
	<navigation: 'All model packages'>

	^ self privateState cacheAt: 'All model packages'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allPackages reject: [:each | each isStub]) sorted:
																		[:p1 :p2 | p1 name < p2 name] )
				withDescription: 'All model packages' ]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allModelPureClasses [
	self flag: 'this method exists only the time we manage correctly the interface'.
	^ self privateState cacheAt: 'All model classes'
		ifAbsentPut: [
			MooseGroup
				withAll: ((self allClasses reject: [:each | each isStub or: [each isInterface]]) )
				withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allNamespaces [
	
	<navigation: 'All namespaces'>
	^self allUsing: FamixTNamespace 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allPackages [
	
	<navigation: 'All packages'>
	^self allUsing: FamixTPackage 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allParameterizableClasses [
	<navigation: 'All parameterizable classes'>
	<package: #Java>
	^ self allUsing: FamixTWithParameterizedTypes
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allParameterizedTypes [
	<navigation: 'All parameterized types'>
	<package: #Java>
	^ self allUsing: FamixTParameterizedType
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allParameters [
	
	<navigation: 'All parameters'>
	^self allUsing: FamixTParameter 
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allReferences [
	
	<navigation: 'All references'>
	^self allUsing: FamixTReference  
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allStructuralEntities [
	<navigation: 'All structural entities'>
	^ self allUsing: FamixTStructuralEntity
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allTestClasses [
	<navigation: 'All test classes'>
	<package: #Java>
	^ self allModelClasses select: #isTestCase
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allTestMethods [
	<navigation: 'All test methods'>
	<package: #Java>
	^ self allModelMethods select: [ :each | 
		(each respondsTo: #isJUnit4Test) and: [ each isJUnit4Test ]]
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allThrownExceptions [
	<navigation: 'All thrown exceptions'>
	<package: #Java>
	^ self allUsing: FamixTThrownException
]

{ #category : #'*Famix-Traits' }
FamixTGroup >> allTypes [
	<navigation: 'All types'>
	^ self allUsing: FamixTType ofGroupClass: FAMIXTypeGroup
]
