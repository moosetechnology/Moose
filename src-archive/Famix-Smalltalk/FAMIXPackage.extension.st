Extension { #name : #FAMIXPackage }

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> createPackagesFromCategories [
	<menuItem: 'Create packages from package categories' category: 'Utilities'>
	"Inspired by the Moose Smalltalk Category importer"
	| cat famixCat |
	
	self localClasses do:[ :class |
		cat := (Smalltalk at: class instanceSide name) category.
		famixCat := self mooseModel allPackages detect: [:each | each mooseName = cat] ifNone: [nil].
		famixCat ifNil: [
			famixCat := self mooseModel add: (FamixPackage new name: cat; isStub: true)
		].
		class isStub
			ifFalse: [ famixCat isStub: false ].
		class localMethods do:[:aMethod |
			aMethod parentPackage: famixCat ].
		class parentPackage: famixCat.
	].
	self privateState flushGroups.
	self mooseModel cacheMooseGroups
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> definedMethods [
	"alias"

	^ self localMethods
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> extendedClasses [
	"select all classes extended in this package"

	^ self privateState cacheAt: #extendedClasses
							ifAbsentPut: [ self classes select: [ :c| c isExtended ] ]
	
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> extendedClassesGroup [
	<navigation: 'Extended classes in package'>
	
	^ FAMIXClassGroup 
		withAll: self extendedClasses
		withDescription: 'Extended classes in package ', self name
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> extensionClasses [
	"select all classes extended by this package"

	^ self privateState 
		cacheAt: #extensionClasses
		ifAbsentPut: [ self extensionMethods collectAsSet: [ :method | method parentType ] ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> extensionClassesGroup [
	<navigation: 'Classes extended by package'>
	
	^ FAMIXClassGroup 
		withAll: self extensionClasses
		withDescription: 'Classes extended by package', self name
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> extensionMethods [
	"select all class extensions made by this package"

	^ self privateState 
		cacheAt: #extensionMethods 
		ifAbsentPut: [ childNamedEntities select: [ :child | child isMethod ]]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> localClasses [
	"select all local classes. Just an alias"

	^ self classes
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> localClassesGroup [
	<navigation: 'Local classes'>

	^ FAMIXClassGroup 
		withAll: self localClasses
		withDescription: 'Local classes'
]

{ #category : #'*Famix-Smalltalk' }
FAMIXPackage >> localMethods [
	"select all local methods"

	^ self privateState 
			cacheAt: #localMethods 
			ifAbsentPut: [ self classes flatCollect: [:c | c localMethods ]]
]
