Class {
	#name : #FamixStPackage,
	#superclass : #FamixStScopingEntity,
	#traits : 'FamixTPackage + FamixTPackageWithClassesGlue',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageWithClassesGlue classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStPackage class >> annotation [

	<MSEClass: #Package super: #FamixStScopingEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStPackage class >> generatedSlotNames [
	<generated>
	'FamixStPackage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStPackage class >> generatedTraitNames [
	<generated>
	^ #(FamixTPackage FamixTPackageWithClassesGlue)
]

{ #category : #meta }
FamixStPackage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions-metrics' }
FamixStPackage >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<MSEProperty: #abstractness type: #Number>
	<derived>
	<MSEComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #'Famix-Extensions' }
FamixStPackage >> allClasses [
	^self classes union: self extensionClasses
]

{ #category : #accessing }
FamixStPackage >> classes [

	^ self privateState 	cacheAt: #classes 
							ifAbsentPut: [ self childEntities select: [ :child | child isClass ]]
]

{ #category : #accessing }
FamixStPackage >> clientPackages [
	"^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #accessing }
FamixStPackage >> extendedClasses [
	"select all classes extended in this package"

	^ self privateState cacheAt: #extendedClasses
							ifAbsentPut: [ self classes select: [ :c| c isExtended ] ]
	
]

{ #category : #accessing }
FamixStPackage >> extensionClasses [
	"select all classes extended by this package"

	^ self privateState 
		cacheAt: #extensionClasses
		ifAbsentPut: [ self extensionMethods collectAsSet: [ :method | method parentType ] ]
]

{ #category : #accessing }
FamixStPackage >> extensionMethods [
	"select all class extensions made by this package"

	^ self privateState 
		cacheAt: #extensionMethods 
		ifAbsentPut: [ self childEntities select: [ :child | child isMethod ]]
]

{ #category : #accessing }
FamixStPackage >> localClasses [
	"select all local classes. Just an alias"

	^ self classes
]

{ #category : #accessing }
FamixStPackage >> localClassesGroup [
	<navigation: 'Local classes'>

	^ FAMIXClassGroup 
		withAll: self localClasses
		withDescription: 'Local classes'
]

{ #category : #accessing }
FamixStPackage >> localMethods [
	"select all local methods"

	^ self privateState 
			cacheAt: #localMethods 
			ifAbsentPut: [ self classes flatCollect: [:c | c localMethods ]]
]

{ #category : #accessing }
FamixStPackage >> methods [
	^ self localMethods union: self extensionMethods
]

{ #category : #accessing }
FamixStPackage >> namespaceScope [

	self shouldNotImplement 

]

{ #category : #accessing }
FamixStPackage >> numberOfClasses [
	<MSEProperty: #numberOfClasses type: #Number>
	<derived>
	<MSEComment: 'The number of classes in a package'>
	
	^ self classes size
]

{ #category : #accessing }
FamixStPackage >> numberOfClientPackages [
"	<property: #CP longName: 'Number of client packages' description:
			'The number of packages which depend on this package'>"

	<MSEProperty: #numberOfClientPackages type: #Number>
	<MSEComment: 'The number of packages which depend on this package'>
	<derived>

	^ self lookUpPropertyNamed: #numberOfClientPackages
				 computedAs: [ self clientPackages size ]
]

{ #category : #accessing }
FamixStPackage >> numberOfClientPackages: aNumber [

	self privateState propertyAt: #numberOfClientPackages put: aNumber
]

{ #category : #accessing }
FamixStPackage >> providerPackages [
	"^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #accessing }
FamixStPackage >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixStType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #accessing }
FamixStPackage >> relativeImportanceForSystem [
	<MSEProperty: #relativeImportanceForSystem type: #Number>
	<derived>
	<MSEComment: 'The number of client packages normalized by the total number of packages'>
	
	^ self lookUpPropertyNamed: #relativeImportanceForSystem
				 computedAs: [
					(self mooseModel allModelPackages size > 1)
						ifTrue:[
							self numberOfClientPackages / (self mooseModel allModelPackages size - 1)
							]
						ifFalse: [0]
						]
]
