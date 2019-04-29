Class {
	#name : #FamixJavaPackage,
	#superclass : #FamixJavaScopingEntity,
	#traits : 'FamixTPackage + FamixTPackageWithClassesGlue',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageWithClassesGlue classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaPackage class >> annotation [

	<MSEClass: #Package super: #FamixJavaScopingEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaPackage class >> generatedSlotNames [
	<generated>
	'FamixJavaPackage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaPackage class >> generatedTraitNames [
	<generated>
	^ #(FamixTPackage FamixTPackageWithClassesGlue)
]

{ #category : #meta }
FamixJavaPackage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> abstractClasses [

	^ self classes select: [:c | c isAbstract]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<MSEProperty: #abstractness type: #Number>
	<derived>
	<MSEComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> accept: aVisitor [

	aVisitor visitPackage: self
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> addChildNamedEntity: aNamedEntity [
	childEntities add: aNamedEntity
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> afferentCoupling [
	"Afferent coupling for a package is the number of classes that depend upon this package"

	<MSEProperty: #afferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Afferent Coupling of a package'>
	^ ((self queryIncomingDependencies atScope: FamixTType) outOfMyPackage
		select: [ :c | c isInstanceSide ]) size
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> allClasses [
	^self classes union: self extensionClasses
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> bunchCohesion [
	"Computing cohesion (Bunch formula)"

	<MSEProperty: #bunchCohesion type: #Number>
	<derived>
	<MSEComment: 'Bunch Cohesion of a package. It is also considered anonymous and inner classes (in Java).'>
	| myClasses intraConnectivities |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses := myClasses select: [ :c | c isInstanceSide ].
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinMyPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].
	^ intraConnectivities / myClasses size squared asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> bunchCouplingWith: aPackage [
	"Computing coupling (Bunch formula) between receiver and aPackage"

	| myClasses otherClasses interConnectivities |
	myClasses := self classes.
	myClasses := (myClasses asSet union: (myClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	otherClasses := aPackage classes.
	otherClasses := (otherClasses asSet union: (otherClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	(myClasses size == 0 or: [ otherClasses size == 0 ])
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinPackage: aPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+
			((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) withinPackage: aPackage ])
				inject: 0
				into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ]).
	^ interConnectivities / (2 * myClasses size * otherClasses size) asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> bunchCouplingWithAll [
	"Computing coupling (Bunch formula) between receiver and all packages"

	| myClasses interConnectivities allClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	allClasses := self mooseModel allModelClasses.
	myClasses size == 0
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) outOfMyPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+
			((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) outOfMyPackage ]) inject: 0 into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ]).
	^ interConnectivities / (2 * myClasses size * (allClasses size - myClasses size)) asFloat
]

{ #category : #deprecated }
FamixJavaPackage >> childNamedEntities [

	^ self childEntities
]

{ #category : #deprecated }
FamixJavaPackage >> childNamedEntities: aNamedEntity [

	^ self childEntities: aNamedEntity
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> childrenOfMyKind [
	^ self childNamedEntities allWithSubTypesOf: self class
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> classes [

	^ self privateState 	cacheAt: #classes 
							ifAbsentPut: [ self childEntities select: [ :child | child isClass ]]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> clientClasses [
	self deprecated: 'use clientTypes'.
	^ self clientTypes
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> clientPackages [
	"^ self inheritedByPackages union: self invokingPackages"

	^ (self queryAllIncoming atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> concernedClassesCollection [
	"it returns the collection of the receiver's concerned classes (See #__concernedClassesCollection). Before returning this value it verifies if it is cached in the receiver's state under the properiety #concernedClasses."

	^self privateState cacheAt: #concernedClassesCollection
		ifAbsentPut: (self extensionClasses union: self localClasses)
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> containedEntities [
	^ super containedEntities union: self childNamedEntities
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> containedEntities: collection [
	self definedClasses: collection.
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	
	anEntity childNamedEntities do: [:c|
		self addChildNamedEntity: (aVisitor visit: c ) ].

]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> createPackagesFromCategories [
	<menuItem: 'Create packages from package categories' category: 'Utilities'>
	"Inspired by the Moose Smalltalk Category importer"
	| cat famixCat |
	
	self localClasses do:[ :class |
		cat := (Smalltalk at: class instanceSide name) category.
		famixCat := self mooseModel allPackages detect: [:each | each mooseName = cat] ifNone: [nil].
		famixCat ifNil: [
			famixCat := self mooseModel add: (FamixJavaPackage new name: cat; stub: true)
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

{ #category : #'as yet unclassified' }
FamixJavaPackage >> definedMethods [
	"alias"

	^ self localMethods
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	<MSEProperty: #distance type: #Number>
	<derived>
	<MSEComment: 'Distance of a package'>

	
	| abstractness instability |
	abstractness := self abstractness.
	instability := self instability.
	
	(abstractness isNil or: [instability isNil]) ifTrue: [^ nil].
	^ abstractness + instability - 1
	
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> efferentCoupling [
	"Efferent coupling for a package is the number of classes it depends upon"

	<MSEProperty: #efferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Efferent Coupling of a package'>
	^ ((self queryAllOutgoing outOfMyPackage atScope: FamixTType) select: [ :c | c isInstanceSide ]) size
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> extendedClasses [
	"select all classes extended in this package"

	^ self privateState cacheAt: #extendedClasses
							ifAbsentPut: [ self classes select: [ :c| c isExtended ] ]
	
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> extendedClassesGroup [
	<navigation: 'Extended classes in package'>
	
	^ FAMIXClassGroup 
		withAll: self extendedClasses
		withDescription: 'Extended classes in package ', self name
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> extensionClasses [
	"select all classes extended by this package"

	^ self privateState 
		cacheAt: #extensionClasses
		ifAbsentPut: [ self extensionMethods collectAsSet: [ :method | method parentType ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> extensionClassesGroup [
	<navigation: 'Classes extended by package'>
	
	^ FAMIXClassGroup 
		withAll: self extensionClasses
		withDescription: 'Classes extended by package', self name
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> extensionMethods [
	"select all class extensions made by this package"

	^ self privateState 
		cacheAt: #extensionMethods 
		ifAbsentPut: [ self childEntities select: [ :child | child isMethod ]]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> historicalUniqueName [
	^ (self parentPackage isNil 
		ifTrue: [ self name ]
		ifFalse: [ self parentPackage historicalUniqueName , '.' , self name ]) asSymbol
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> instability [
	"I =	Ce(P)/(Ce(P)+Ca(P)), in the range [0, 1]. 0 means package is maximally stable (i.e., no dependency to other packages and can not change without big consequences), 1 means it is unstable."

	<MSEProperty: #instability type: #Number>
	<derived>
	<MSEComment: 'Instability of a package'>

	| efferentCoupling afferentCoupling |
	
	efferentCoupling := self efferentCoupling.
	afferentCoupling := self afferentCoupling.
	(efferentCoupling + afferentCoupling) == 0 ifTrue: [^ nil].
	^ efferentCoupling / (efferentCoupling + afferentCoupling)
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> localClasses [
	"select all local classes. Just an alias"

	^ self classes
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> localClassesGroup [
	<navigation: 'Local classes'>

	^ FAMIXClassGroup 
		withAll: self localClasses
		withDescription: 'Local classes'
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> localMethods [
	"select all local methods"

	^ self privateState 
			cacheAt: #localMethods 
			ifAbsentPut: [ self classes flatCollect: [:c | c localMethods ]]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<MSEProperty: #martinCohesion type: #Number>
	<derived>
	<MSEComment: 'Cohesion as defined by Robert C. Martin.'>
	| intraConnectivities myClasses |
	myClasses := self classes.
	myClasses := (myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withoutSelfLoops withinMyPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].
	^ ((intraConnectivities + 1) / myClasses size) asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> methods [
	^ self localMethods union: self extensionMethods
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> namespaceScope [

	self shouldNotImplement 

]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfClasses [
	<MSEProperty: #numberOfClasses type: #Number>
	<derived>
	<MSEComment: 'The number of classes in a package'>
	
	^ self classes size
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfClientPackages [
"	<property: #CP longName: 'Number of client packages' description:
			'The number of packages which depend on this package'>"

	<MSEProperty: #numberOfClientPackages type: #Number>
	<MSEComment: 'The number of packages which depend on this package'>
	<derived>

	^ self lookUpPropertyNamed: #numberOfClientPackages
				 computedAs: [ self clientPackages size ]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfClientPackages: aNumber [

	self privateState propertyAt: #numberOfClientPackages put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<MSEComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self childEntities inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfMethods [
	<MSEProperty: #numberOfMethods type: #Number>
	<MSEComment: 'The number of methods in a package'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [ self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ] ]
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> printOn: aStream [ 
	| parent |
	parent := self parentPackage.
	parent ifNotNil: 
		[ parent printOn: aStream.
		aStream
			nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Package)'
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> providerClasses [
	self deprecated: 'use providerTypes'.
	^ self providerTypes
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> providerPackages [
	"^ self inheritedPackages union: self invokedPackages"

	^ (self queryAllOutgoing atScope: FamixTPackage) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> providerTypes [
	<MSEProperty: #providerTypes type: #FamixJavaType>
	<derived>
	<multivalued>
	<MSEComment: 'All types that the receiver depends on'>
	^ (self queryAllOutgoing atScope: FamixTType) withoutSelfLoops
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> relativeImportanceForSystem [
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

{ #category : #'as yet unclassified' }
FamixJavaPackage >> selectWithinYourScope: aMooseQueryResult [
	^ aMooseQueryResult withinPackage: self
]
