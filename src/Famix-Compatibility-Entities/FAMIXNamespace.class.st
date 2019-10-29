Class {
	#name : #FAMIXNamespace,
	#superclass : #FAMIXScopingEntity,
	#traits : 'FamixTNamespace',
	#classTraits : 'FamixTNamespace classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXNamespace class >> annotation [

	<FMClass: #Namespace super: #FAMIXScopingEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> abstractness: aNumber [

	self privateState propertyAt: #abstractness put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> afferentCoupling: aNumber [

	self privateState propertyAt: #afferentCoupling put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> allParentsUpTo: aNamespace [
	(self parentScope isNil or: [self parentScope = aNamespace ]) ifTrue: [ ^ OrderedCollection new ].
	^ self parentScope withAllParentsUpTo: aNamespace
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> bunchCohesion [
	"Computing cohesion (Bunch formula)"

	<FMProperty: #bunchCohesion type: #Number>
	<derived>
	<FMComment: 'Bunch Cohesion of a namespace. It is also considered anonymous and inner classes.'>
	| myClasses intraConnectivities |
	(myClasses := self classes) union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].
	^ intraConnectivities / myClasses size squared asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> bunchCohesion: aNumber [

	self privateState propertyAt: #bunchCohesion put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> bunchCouplingWith: aNamespace [
	"Computing coupling (Bunch formula) between receiver and aNamespace"

	| myClasses otherClasses interConnectivities |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	otherClasses := aNamespace classes.
	otherClasses := otherClasses union: (otherClasses flatCollect: [ :c | c allRecursiveTypes ]).
	(myClasses size == 0 or: [ otherClasses size == 0 ]) ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) within: aNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) within: aNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ]).
	^ interConnectivities / (2 * myClasses size * otherClasses size) asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> bunchCouplingWithAll [
	"Computing coupling (Bunch formula) between receiver and all namespaces"

	| myClasses interConnectivities allClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	allClasses := self mooseModel allModelNamespaces flatCollect: [ :aNamespace | aNamespace classes ].
	allClasses := allClasses union: (allClasses flatCollect: [ :aClass | aClass allRecursiveTypes ]).
	(myClasses isEmpty or: [ allClasses isEmpty ])
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) outOfParentUsing: FamixTNamespace ])
		inject: 0
		into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FAMIXType) outOfParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + (each select: [ :c | c isInstanceSide ]) size ]).
	^ interConnectivities / (2 * myClasses size * (allClasses size - myClasses size)) asFloat
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> childrenOfMyKind [
	^ self childScopes
]

{ #category : #'Famix-Extensions-accessing' }
FAMIXNamespace >> containedEntities [
	^self types
]

{ #category : #'Famix-Extensions-accessing' }
FAMIXNamespace >> containedEntities: collection [
	self types: collection.
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	<FMProperty: #distance type: #Number>
	<derived>
	<FMComment: 'Distance of a namespace'>

	| abstractness instability |
	abstractness := self abstractness.
	instability := self instability.
	
	(abstractness isNil or: [instability isNil]) ifTrue: [^ nil].
	^ abstractness + instability - 1
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> distance: aNumber [

	self privateState propertyAt: #distance put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> efferentCoupling: aNumber [

	self privateState propertyAt: #efferentCoupling put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> instability: aNumber [

	self privateState propertyAt: #instability put: aNumber
]

{ #category : #'Famix-Implementation' }
FAMIXNamespace >> isNamespace [
	^ true
]

{ #category : #'Famix-Implementation' }
FAMIXNamespace >> methods [
	^ self privateState 
			cacheAt: #methods 
			ifAbsentPut: [ 
				self classes flatCollect: #methods ]
]

{ #category : #'Famix-Implementation' }
FAMIXNamespace >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfAttributes [
"	<property: #NOA longName: 'Number of attributes' description:
			'The number of attributes in a namespace'>"

	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in a namespace'>
	
	^ self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfAttributes] ]
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfAttributes: aNumber [

	self privateState propertyAt: #numberOfAttributes put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfClasses
		computedAs: [self types size]
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfClasses: aNumber [

	self privateState propertyAt: #numberOfClasses put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self functions inject: (self types inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode])
				into: [ :sum :each | sum + each numberOfLinesOfCode]]
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ]]
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> numberOfNonInterfacesClasses [
	<FMProperty: #numberOfNonInterfacesClasses type: #Number>
	<derived>
	<FMComment: 'The number of non interfaces classes in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfNonInterfacesClasses
		computedAs: [(self types reject: #isInterface) size]
]

{ #category : #'Famix-Extensions-metrics' }
FAMIXNamespace >> numberOfNonInterfacesClasses: aNumber [

	self privateState propertyAt: #numberOfNonInterfacesClasses put: aNumber
]

{ #category : #'Famix-Implementation' }
FAMIXNamespace >> printOn: aStream [ 
	self belongsTo ifNotNil: [:parent |
		parent printOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Namespace)'
]

{ #category : #'Famix-Extensions' }
FAMIXNamespace >> withAllParentsUpTo: aNamespace [
	^ (self parentScope allParentsUpTo: aNamespace) addFirst: self; yourself
]
