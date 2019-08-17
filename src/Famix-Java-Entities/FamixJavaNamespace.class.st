Class {
	#name : #FamixJavaNamespace,
	#superclass : #FamixJavaScopingEntity,
	#traits : 'FamixTNamespace',
	#classTraits : 'FamixTNamespace classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamespace class >> annotation [

	<MSEClass: #Namespace super: #FamixJavaScopingEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."

	<MSEProperty: #abstractness type: #Number>
	<derived>
	<MSEComment: 'Abstractness of a namespace'>
	| nsClasses |
	nsClasses := self allClasses.
	nsClasses size == 0 ifTrue: [ ^ nil ].

	^ (nsClasses select: [ :c | c isAbstract ]) size / nsClasses size asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> abstractness: aNumber [

	self privateState propertyAt: #abstractness put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> afferentCoupling [
	<MSEProperty: #afferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Afferent Coupling of a namespace Afferent is the number of classes that depend upon this namespace'>
	^ ((self queryAllIncoming atScope: FamixTType) outOfParentUsing: FamixTNamespace) size
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> afferentCoupling: aNumber [

	self privateState propertyAt: #afferentCoupling put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixJavaNamespace >> allParentsUpTo: aNamespace [
	(self parentScope isNil or: [self parentScope = aNamespace ]) ifTrue: [ ^ OrderedCollection new ].
	^ self parentScope withAllParentsUpTo: aNamespace
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> bunchCohesion [
	"Computing cohesion (Bunch formula)"

	<MSEProperty: #bunchCohesion type: #Number>
	<derived>
	<MSEComment: 'Bunch Cohesion of a namespace. It is also considered anonymous and inner classes.'>
	| myClasses intraConnectivities |
	(myClasses := self classes) union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses size == 0
		ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withinParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].
	^ intraConnectivities / myClasses size squared asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> bunchCohesion: aNumber [

	self privateState propertyAt: #bunchCohesion put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> bunchCouplingWith: aNamespace [
	"Computing coupling (Bunch formula) between receiver and aNamespace"

	| myClasses otherClasses interConnectivities |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	otherClasses := aNamespace classes.
	otherClasses := otherClasses union: (otherClasses flatCollect: [ :c | c allRecursiveTypes ]).
	(myClasses size == 0 or: [ otherClasses size == 0 ])
		ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) within: aNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) within: aNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ]).
	^ interConnectivities / (2 * myClasses size * otherClasses size) asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> bunchCouplingWithAll [
	"Computing coupling (Bunch formula) between receiver and all namespaces"

	| myClasses interConnectivities allClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	allClasses := self mooseModel allModelNamespaces flatCollect: [ :aNamespace | aNamespace classes ].
	allClasses := allClasses union: (allClasses flatCollect: [ :aClass | aClass allRecursiveTypes ]).
	(myClasses isEmpty or: [ allClasses isEmpty ]) ifTrue: [ ^ nil ].

	"All outgoing dependencies"
	interConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) outOfParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].

	"Plus all incoming dependencies"
	interConnectivities := interConnectivities
		+ ((myClasses collect: [ :c | (c queryIncomingDependencies atScope: FamixTType) outOfParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ]).
	^ interConnectivities / (2 * myClasses size * (allClasses size - myClasses size)) asFloat
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> childrenOfMyKind [
	^ self childScopes
]

{ #category : #'Famix-Extensions-accessing' }
FamixJavaNamespace >> containedEntities [
	^self types
]

{ #category : #'Famix-Extensions-accessing' }
FamixJavaNamespace >> containedEntities: collection [
	self types: collection.
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	<MSEProperty: #distance type: #Number>
	<derived>
	<MSEComment: 'Distance of a namespace'>

	| abstractness instability |
	abstractness := self abstractness.
	instability := self instability.
	
	(abstractness isNil or: [instability isNil]) ifTrue: [^ nil].
	^ abstractness + instability - 1
]

{ #category : #accessing }
FamixJavaNamespace >> distance: aNumber [

	self privateState propertyAt: #distance put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> efferentCoupling [
	"Efferent coupling for a module is the number of classes it depends upon"

	<MSEProperty: #efferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Efferent coupling for a module is the number of classes it depends upon'>
	^ ((self queryOutgoingDependencies outOfParentUsing: FamixTNamespace) atScope: FamixTType) size
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> efferentCoupling: aNumber [

	self privateState propertyAt: #efferentCoupling put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaNamespace >> instability [
	"I =	Ce(P)/(Ce(P)+Ca(P)), in the range [0, 1]. 0 means package is maximally stable (i.e., no dependency to other packages and can not change without big consequences), 1 means it is unstable."
	<MSEProperty: #instability type: #Number>
	<derived>
	<MSEComment: 'Instability of a namespace'>
	
	| efferentCoupling afferentCoupling |
	
	efferentCoupling := self efferentCoupling.
	afferentCoupling := self afferentCoupling.
	(efferentCoupling + afferentCoupling) == 0 ifTrue: [^ nil].
	^ efferentCoupling / (efferentCoupling + afferentCoupling) asFloat
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> instability: aNumber [

	self privateState propertyAt: #instability put: aNumber
]

{ #category : #testing }
FamixJavaNamespace >> isNamespace [
	^ true
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<MSEProperty: #martinCohesion type: #Number>
	<derived>
	<MSEComment: 'Cohesion as defined by Robert C. Martin.'>
	| intraConnectivities myClasses |
	myClasses := self classes.
	myClasses := myClasses union: (myClasses flatCollect: [ :c | c allRecursiveTypes ]).
	myClasses size == 0 ifTrue: [ ^ nil ].
	intraConnectivities := (myClasses collect: [ :c | (c queryOutgoingDependencies atScope: FamixTType) withoutSelfLoops withinParentUsing: FamixTNamespace ]) inject: 0 into: [ :subTotal :each | subTotal + each size ].
	^ ((intraConnectivities + 1) / myClasses size) asFloat
]

{ #category : #printing }
FamixJavaNamespace >> mooseNameOn: aStream [ 
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
FamixJavaNamespace >> numberOfAttributes [
"	<property: #NOA longName: 'Number of attributes' description:
			'The number of attributes in a namespace'>"

	<MSEProperty: #numberOfAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of attributes in a namespace'>
	
	^ self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfAttributes] ]
]

{ #category : #'Famix-Extensions' }
FamixJavaNamespace >> numberOfAttributes: aNumber [

	self privateState propertyAt: #numberOfAttributes put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixJavaNamespace >> numberOfClasses [
	<MSEProperty: #numberOfClasses type: #Number>
	<derived>
	<MSEComment: 'The number of classes in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfClasses
		computedAs: [self types size]
]

{ #category : #'Famix-Extensions' }
FamixJavaNamespace >> numberOfClasses: aNumber [

	self privateState propertyAt: #numberOfClasses put: aNumber
]

{ #category : #'Famix-Implementation' }
FamixJavaNamespace >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<MSEComment: 'The number of lines of code in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [
			self functions inject: (self types inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode])
				into: [ :sum :each | sum + each numberOfLinesOfCode]]
]

{ #category : #'Famix-Implementation' }
FamixJavaNamespace >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #accessing }
FamixJavaNamespace >> numberOfMethods [
	<MSEProperty: #numberOfMethods type: #Number>
	<derived>
	<MSEComment: 'The number of methods in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ]]
]

{ #category : #accessing }
FamixJavaNamespace >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> numberOfNonInterfacesClasses [
	<MSEProperty: #numberOfNonInterfacesClasses type: #Number>
	<derived>
	<MSEComment: 'The number of non interfaces classes in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfNonInterfacesClasses
		computedAs: [(self types reject: #isInterface) size]
]

{ #category : #'Famix-Extensions-metrics' }
FamixJavaNamespace >> numberOfNonInterfacesClasses: aNumber [

	self privateState propertyAt: #numberOfNonInterfacesClasses put: aNumber
]

{ #category : #printing }
FamixJavaNamespace >> printOn: aStream [ 
	self belongsTo ifNotNil: [:parent |
		parent printOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Namespace)'
]

{ #category : #'Famix-Extensions' }
FamixJavaNamespace >> withAllParentsUpTo: aNamespace [
	^ (self parentScope allParentsUpTo: aNamespace) addFirst: self; yourself
]
