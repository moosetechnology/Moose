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

{ #category : #'Famix-Implementation' }
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
	nsClasses := self allClasses.
	nsClasses size == 0 ifTrue: [ ^ nil ].

	^ (nsClasses select: [ :c | c isAbstract ]) size / nsClasses size
]

{ #category : #adding }
FamixJavaPackage >> addChildNamedEntity: aNamedEntity [
	childEntities add: aNamedEntity
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> afferentCoupling [
	"Afferent coupling for a package is the number of classes that depend upon this package"

	<MSEProperty: #afferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Afferent Coupling of a package'>
	^ ((self queryIncomingDependencies atScope: FamixTType) outOfParentUsing: FamixTPackage) size
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> allClasses [
	self flag: #check. "Maybe we should just have #classes later..."
	^ self classes
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
	myClasses size == 0 ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinParentUsing: FamixTPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].
	^ intraConnectivities / myClasses size squared asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> bunchCouplingWith: aPackage [
	"Computing coupling (Bunch formula) between receiver and aPackage"

	| myClasses otherClasses interConnectivities |
	myClasses := self classes.
	myClasses := myClasses asSet union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	otherClasses := aPackage classes.
	otherClasses := otherClasses asSet union: (otherClasses flatCollect: [ :c | c allRecursiveTypes ]).
	(myClasses size == 0 or: [ otherClasses size == 0 ]) ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) within: aPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) within: aPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ]).
	^ interConnectivities / (2 * myClasses size * otherClasses size) asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaPackage >> bunchCouplingWithAll [
	"Computing coupling (Bunch formula) between receiver and all packages"

	| myClasses interConnectivities allClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	allClasses := self mooseModel allModelClasses.
	myClasses size == 0 ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) outOfParentUsing: FamixTPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) outOfParentUsing: FamixTPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ]).
	^ interConnectivities / (2 * myClasses size * (allClasses size - myClasses size)) asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaPackage >> childrenOfMyKind [
	^ self childEntities allWithSubTypesOf: self class
]

{ #category : #accessing }
FamixJavaPackage >> classes [
	^ self privateState cacheAt: #classes ifAbsentPut: [ self childEntities select: [ :child | child isClass ] ]
]

{ #category : #'Famix-Extensions-accessing' }
FamixJavaPackage >> containedEntities [
	^ super containedEntities union: self childEntities
]

{ #category : #'Famix-Extensions-accessing' }
FamixJavaPackage >> containedEntities: collection [
	self definedClasses: collection.
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
	^ ((self queryAllOutgoing outOfParentUsing: FamixTPackage) atScope: FamixTType) size
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

{ #category : #'Famix-Extensions-metrics' }
FamixJavaPackage >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<MSEProperty: #martinCohesion type: #Number>
	<derived>
	<MSEComment: 'Cohesion as defined by Robert C. Martin.'>
	| intraConnectivities myClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses size == 0 ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withoutSelfLoops withinParentUsing: FamixTPackage ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].
	^ ((intraConnectivities + 1) / myClasses size) asFloat
]

{ #category : #accessing }
FamixJavaPackage >> methods [
	^ self privateState cacheAt: #methods ifAbsentPut: [ self classes flatCollect: #methods ]
]

{ #category : #'Famix-Extensions' }
FamixJavaPackage >> numberOfClasses [
	<MSEProperty: #numberOfClasses type: #Number>
	<derived>
	<MSEComment: 'The number of classes in a package'>
	
	^ self classes size
]

{ #category : #accessing }
FamixJavaPackage >> numberOfClientPackages [
	<MSEProperty: #numberOfClientPackages type: #Number>
	<MSEComment: 'The number of packages which depend on this package'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfClientPackages computedAs: [ self allClients size ]
]

{ #category : #accessing }
FamixJavaPackage >> numberOfClientPackages: aNumber [

	self privateState propertyAt: #numberOfClientPackages put: aNumber
]

{ #category : #'Famix-Implementation' }
FamixJavaPackage >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<MSEComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self childEntities inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode ] ]
]

{ #category : #'Famix-Implementation' }
FamixJavaPackage >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #accessing }
FamixJavaPackage >> numberOfMethods [
	<MSEProperty: #numberOfMethods type: #Number>
	<MSEComment: 'The number of methods in a package'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [ self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ] ]
]

{ #category : #accessing }
FamixJavaPackage >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #printing }
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

{ #category : #'Famix-Extensions-metrics' }
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
