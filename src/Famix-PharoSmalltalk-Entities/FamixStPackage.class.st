Class {
	#name : #FamixStPackage,
	#superclass : #FamixStScopingEntity,
	#traits : 'FamixTCohesionCouplingMetrics + FamixTPackage',
	#classTraits : 'FamixTCohesionCouplingMetrics classTrait + FamixTPackage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStPackage class >> annotation [

	<FMClass: #Package super: #FamixStScopingEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics' }
FamixStPackage >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #metrics }
FamixStPackage >> afferentCoupling [
	<FMProperty: #afferentCoupling type: #Number>
	<derived>
	<FMComment:
		'Afferent Coupling of a namespace Afferent is the number of classes that depend upon this namespace'>
	^ (((self queryAllIncoming outOfParentUsing: FamixTPackage) atScope: FamixTType) collect: [ :e | e isClassSide ifTrue: [ e instanceSide ] ifFalse: [ e ] ]) asSet  size
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

{ #category : #metrics }
FamixStPackage >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	<FMProperty: #distance type: #Number>
	<derived>
	<FMComment: 'Distance of a package'>

	
	| abstractness instability |
	abstractness := self abstractness.
	instability := self instability.
	
	(abstractness isNil or: [instability isNil]) ifTrue: [^ nil].
	^ abstractness + instability - 1
]

{ #category : #metrics }
FamixStPackage >> efferentCoupling [
	"Efferent coupling for a package is the number of classes it depends upon"

	<FMProperty: #efferentCoupling type: #Number>
	<derived>
	<FMComment: 'Efferent Coupling of a package'>

	^ (((self queryAllOutgoing outOfParentUsing: FamixTPackage) atScope: FamixTType) collect: [ :e | e isClassSide ifTrue: [ e instanceSide ] ifFalse: [ e ] ] ) asSet size
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

{ #category : #metrics }
FamixStPackage >> instability [
	"I =	Ce(P)/(Ce(P)+Ca(P)), in the range [0, 1]. 0 means package is maximally stable (i.e., no dependency to other packages and can not change without big consequences), 1 means it is unstable."

	<FMProperty: #instability type: #Number>
	<derived>
	<FMComment: 'Instability of a package'>

	| efferentCoupling afferentCoupling |
	
	efferentCoupling := self efferentCoupling.
	afferentCoupling := self afferentCoupling.
	(efferentCoupling + afferentCoupling) == 0 ifTrue: [^ nil].
	^ efferentCoupling / (efferentCoupling + afferentCoupling)
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

{ #category : #metrics }
FamixStPackage >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<FMProperty: #martinCohesion type: #Number>
	<derived>
	<FMComment: 'Cohesion as defined by Robert C. Martin.'>
	| intraConnectivities myClasses |
	myClasses := self childEntities select: #isClass.
	myClasses := (myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ])) select: [ :c | c isInstanceSide ].
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withoutSelfLoops withinParentUsing: FamixTNamespace ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].
	^ ((intraConnectivities + 1) / myClasses size) asFloat
]

{ #category : #accessing }
FamixStPackage >> methods [
	^ self localMethods union: self extensionMethods
]

{ #category : #accessing }
FamixStPackage >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a package'>
	
	^ self classes size
]

{ #category : #accessing }
FamixStPackage >> numberOfClientPackages [
	<FMProperty: #numberOfClientPackages type: #Number>
	<FMComment: 'The number of packages which depend on this package'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfClientPackages computedAs: [ self allClients size ]
]

{ #category : #accessing }
FamixStPackage >> numberOfClientPackages: aNumber [

	self privateState propertyAt: #numberOfClientPackages put: aNumber
]

{ #category : #accessing }
FamixStPackage >> relativeImportanceForSystem [
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

{ #category : #metrics }
FamixStPackage >> weightedMethodCount [
	<FMProperty: #weightedMethodCount type: #Number>
	<FMComment: 'The sum of the complexity in a package'>
	<derived>
	^ self lookUpPropertyNamed: #WMC computedAs: [ (self toScope: FamixTWithMethods) detectSum: #weightedMethodCount ]
]
