Class {
	#name : #FAMIXPackage,
	#superclass : #FAMIXScopingEntity,
	#traits : 'FamixTCohesionCouplingMetrics + FamixTPackage',
	#classTraits : 'FamixTCohesionCouplingMetrics classTrait + FamixTPackage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXPackage class >> annotation [

	<FMClass: #Package super: #FAMIXScopingEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FAMIXPackage >> abstractClasses [

	^ self classes select: [:c | c isAbstract]
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #accessing }
FAMIXPackage >> addChildNamedEntity: aNamedEntity [
	childEntities add: aNamedEntity
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> afferentCoupling [
	"Afferent coupling for a package is the number of classes that depend upon this package"

	<FMProperty: #afferentCoupling type: #Number>
	<derived>
	<FMComment: 'Afferent Coupling of a package'>
	^ (((self queryIncomingDependencies atScope: FamixTType) outOfParentUsing: FamixTPackage)
		select: [ :c | c isInstanceSide ]) size
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> allClasses [
	^self classes union: self extensionClasses
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> bunchCohesion [
	"Computing cohesion (Bunch formula)"

	<FMProperty: #bunchCohesion type: #Number>
	<derived>
	<FMComment: 'Bunch Cohesion of a package. It is also considered anonymous and inner classes (in Java).'>
	| myClasses intraConnectivities |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses := myClasses select: [ :c | c isInstanceSide ].
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinParentUsing: FamixTPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].
	^ intraConnectivities / myClasses size squared asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> bunchCouplingWith: aPackage [
	"Computing coupling (Bunch formula) between receiver and aPackage"

	| myClasses otherClasses interConnectivities |
	myClasses := self classes.
	myClasses := (myClasses asSet union: (myClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	otherClasses := aPackage classes.
	otherClasses := (otherClasses asSet union: (otherClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	(myClasses size == 0 or: [ otherClasses size == 0 ])
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) within: aPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+
			((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) within: aPackage ])
				inject: 0
				into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ]).
	^ interConnectivities / (2 * myClasses size * otherClasses size) asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> bunchCouplingWithAll [
	"Computing coupling (Bunch formula) between receiver and all packages"

	| myClasses interConnectivities allClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	allClasses := self mooseModel allModelClasses.
	myClasses size == 0
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) outOfParentUsing: FamixTPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+
			((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FAMIXType) outOfParentUsing: FamixTPackage ]) inject: 0 into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ]).
	^ interConnectivities / (2 * myClasses size * (allClasses size - myClasses size)) asFloat
]

{ #category : #accessing }
FAMIXPackage >> childNamedEntities [

	^ self childEntities
]

{ #category : #accessing }
FAMIXPackage >> childNamedEntities: aNamedEntity [

	^ self childEntities: aNamedEntity
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> childrenOfMyKind [
	^ self childEntities allWithSubTypesOf: self class
]

{ #category : #'Famix-Implementation' }
FAMIXPackage >> classes [

	^ self privateState 	cacheAt: #classes 
							ifAbsentPut: [ self childEntities select: [ :child | child isClass ]]
]

{ #category : #'Famix-Extensions-accessing' }
FAMIXPackage >> concernedClassesCollection [
	"it returns the collection of the receiver's concerned classes (See #__concernedClassesCollection). Before returning this value it verifies if it is cached in the receiver's state under the properiety #concernedClasses."

	^self privateState cacheAt: #concernedClassesCollection
		ifAbsentPut: (self extensionClasses union: self localClasses)
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> containedEntities [
	^ super containedEntities union: self childEntities
]

{ #category : #'Famix-Extensions-accessing' }
FAMIXPackage >> containedEntities: collection [
	self definedClasses: collection.
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> definedMethods [
	"alias"

	^ self localMethods
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> efferentCoupling [
	"Efferent coupling for a package is the number of classes it depends upon"

	<FMProperty: #efferentCoupling type: #Number>
	<derived>
	<FMComment: 'Efferent Coupling of a package'>
	^ (((self queryAllOutgoing outOfParentUsing: FamixTPackage) atScope: FamixTType) select: [ :c | c isInstanceSide ]) size
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> extendedClasses [
	"select all classes extended in this package"

	^ self privateState cacheAt: #extendedClasses
							ifAbsentPut: [ self classes select: [ :c| c isExtended ] ]
	
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> extendedClassesGroup [
	<navigation: 'Extended classes in package'>
	
	^ FAMIXClassGroup 
		withAll: self extendedClasses
		withDescription: 'Extended classes in package ', self name
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> extensionClasses [
	"select all classes extended by this package"

	^ self privateState 
		cacheAt: #extensionClasses
		ifAbsentPut: [ self extensionMethods collectAsSet: [ :method | method parentType ] ]
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> extensionClassesGroup [
	<navigation: 'Classes extended by package'>
	
	^ FAMIXClassGroup 
		withAll: self extensionClasses
		withDescription: 'Classes extended by package', self name
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> extensionMethods [
	"select all class extensions made by this package"

	^ self privateState 
		cacheAt: #extensionMethods 
		ifAbsentPut: [ self childEntities select: [ :child | child isMethod ]]
]

{ #category : #'Moose-Hismo' }
FAMIXPackage >> historicalUniqueName [
	^ (self parentPackage isNil 
		ifTrue: [ self name ]
		ifFalse: [ self parentPackage historicalUniqueName , '.' , self name ]) asSymbol
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> localClasses [
	"select all local classes. Just an alias"

	^ self classes
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> localClassesGroup [
	<navigation: 'Local classes'>

	^ FAMIXClassGroup 
		withAll: self localClasses
		withDescription: 'Local classes'
]

{ #category : #'Famix-Smalltalk' }
FAMIXPackage >> localMethods [
	"select all local methods"

	^ self privateState 
			cacheAt: #localMethods 
			ifAbsentPut: [ self classes flatCollect: [:c | c localMethods ]]
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<FMProperty: #martinCohesion type: #Number>
	<derived>
	<FMComment: 'Cohesion as defined by Robert C. Martin.'>
	| intraConnectivities myClasses |
	myClasses := self classes.
	myClasses := (myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withoutSelfLoops withinParentUsing: FamixTPackage ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].
	^ ((intraConnectivities + 1) / myClasses size) asFloat
]

{ #category : #'Famix-Implementation' }
FAMIXPackage >> methods [
	^ self localMethods union: self extensionMethods
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a package'>
	
	^ self classes size
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfClientPackages [
	<FMProperty: #numberOfClientPackages type: #Number>
	<FMComment: 'The number of packages which depend on this package'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfClientPackages computedAs: [ self allClients size ]
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfClientPackages: aNumber [

	self privateState propertyAt: #numberOfClientPackages put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self methods inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<FMComment: 'The number of methods in a package'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [ self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ] ]
]

{ #category : #'Famix-Extensions' }
FAMIXPackage >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #'Famix-Implementation' }
FAMIXPackage >> printOn: aStream [ 
	| parent |
	parent := self parentPackage.
	parent ifNotNil: 
		[ parent printOn: aStream.
		aStream
			nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Package)'
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXPackage >> relativeImportanceForSystem [
	<FMProperty: #relativeImportanceForSystem type: #Number>
	<derived>
	<FMComment: 'The number of client packages normalized by the total number of packages'>
	
	^ self lookUpPropertyNamed: #relativeImportanceForSystem
				 computedAs: [
					(self mooseModel allModelPackages size > 1)
						ifTrue:[
							self numberOfClientPackages / (self mooseModel allModelPackages size - 1)
							]
						ifFalse: [0]
						]
]
