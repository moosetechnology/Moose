Extension { #name : #FamixPackage }

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> createPackagesFromCategories [
	<menuItem: 'Create packages from package categories' category: 'Utilities'>
	"Inspired by the Moose Smalltalk Category importer"
	| cat famixCat |
	
	self localClasses do:[ :class |
		cat := (Smalltalk at: class instanceSide name) category.
		famixCat := self mooseModel allPackages detect: [:each | each mooseName = cat] ifNone: [nil].
		famixCat ifNil: [
			famixCat := self mooseModel add: (FamixPackage new name: cat; stub: true)
		].
		class isStub
			ifFalse: [ famixCat stub: false ].
		class localMethods do:[:aMethod |
			aMethod parentPackage: famixCat ].
		class parentPackage: famixCat.
	].
	self privateState flushGroups.
	self mooseModel cacheMooseGroups
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> definedMethods [
	"alias"

	^ self localMethods
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> extendedClasses [
	"select all classes extended in this package"

	^ self privateState cacheAt: #extendedClasses
							ifAbsentPut: [ self classes select: [ :c| c isExtended ] ]
	
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> extendedClassesGroup [
	<navigation: 'Extended classes in package'>
	
	^ FAMIXClassGroup 
		withAll: self extendedClasses
		withDescription: 'Extended classes in package ', self name
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> extensionClasses [
	"select all classes extended by this package"

	^ self privateState 
		cacheAt: #extensionClasses
		ifAbsentPut: [ self extensionMethods collectAsSet: [ :method | method parentType ] ]
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> extensionClassesGroup [
	<navigation: 'Classes extended by package'>
	
	^ FAMIXClassGroup 
		withAll: self extensionClasses
		withDescription: 'Classes extended by package', self name
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> extensionMethods [
	"select all class extensions made by this package"

	^ self privateState 
		cacheAt: #extensionMethods 
		ifAbsentPut: [ self childEntities select: [ :child | child isMethod ]]
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> localClasses [
	"select all local classes. Just an alias"

	^ self classes
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> localClassesGroup [
	<navigation: 'Local classes'>

	^ FAMIXClassGroup 
		withAll: self localClasses
		withDescription: 'Local classes'
]

{ #category : #'*Famix-Smalltalk' }
FamixPackage >> localMethods [
	"select all local methods"

	^ self privateState 
			cacheAt: #localMethods 
			ifAbsentPut: [ self classes flatCollect: [:c | c localMethods ]]
]
