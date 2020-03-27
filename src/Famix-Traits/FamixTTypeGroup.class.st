Class {
	#name : #FamixTTypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTTypeGroup class >> annotation [

	<FMClass: #TTypeGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTTypeGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #metrics }
FamixTTypeGroup >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."

	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract.'>
	
	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size) asFloat
]

{ #category : #'*Famix-Traits' }
FamixTTypeGroup >> afferentCoupling [
	"Afferent coupling for a class group is the number of external classes that depend upon this class group"

	<FMProperty: #afferentCoupling type: #Number>
	<derived>
	<FMComment: 'Afferent coupling for a class group is the number of external classes that depend upon this class group'>
	| cgClasses cgTypes |
	cgClasses := self allClasses select: [ :c | c isInstanceSide ].
	cgTypes := cgClasses flatCollect: [ :c | c allRecursiveTypes ].
	cgClasses := (cgClasses union: cgTypes) asArray.
	^ (cgClasses
		flatCollect: [ :cgClass | (cgClass queryIncomingDependencies atScope: FamixTType) select: [ :invokingClass | (cgClasses includes: invokingClass) not and: [ invokingClass isInstanceSide ] ] ])
		asSet size
]

{ #category : #metrics }
FamixTTypeGroup >> ahh [ 
	"average hierarchy height" 

	| allHierarchies |
	allHierarchies := 
			self allClasses select: 
				[:cls | cls superclass isNil or: [ cls superclass isStub ] ].
	^ ((allHierarchies asOrderedCollection collect: #subclassHierarchyDepth) sum / allHierarchies size) asFloat 

]

{ #category : #navigation }
FamixTTypeGroup >> allClasses [

	^ self
]

{ #category : #navigation }
FamixTTypeGroup >> allMethods [

	^ self flatCollect: [:c | c methods]
]

{ #category : #navigation }
FamixTTypeGroup >> allPackages [
	^ FamixTPackageGroup withAll: (self entities flatCollectAsSet: [ :c | c atScope: FamixTPackage ])
]

{ #category : #metrics }
FamixTTypeGroup >> averageNumberOfAttributes [
	<FMProperty: #averageNumberOfAttributes type: #Number>
	<FMComment: 'Average number of attributes per class'>

	^self
		lookUpPropertyNamed: #averageNumberOfAttributes
		computedAs: [(self average: [:each | each numberOfAttributes ]) asFloat]
]

{ #category : #metrics }
FamixTTypeGroup >> averageNumberOfLinesOfCode [
	<FMProperty: #averageNumberOfMethods type: #Number>
	<FMComment: 'Average number of methods per class'>
	
	^self
		lookUpPropertyNamed: #averageNumberOfMethods
		computedAs: [(self average: [:each | each numberOfLinesOfCode ]) asFloat]
]

{ #category : #metrics }
FamixTTypeGroup >> averageNumberOfMethods [
	<FMProperty: #averageNumberOfMethods type: #Number>
	<FMComment: 'Average number of methods per class'>

	^self
		lookUpPropertyNamed: #averageNumberOfMethods
		computedAs: [(self average: [:each | each numberOfMethods ]) asFloat]
]

{ #category : #metrics }
FamixTTypeGroup >> averageNumberOfStatements [
	<FMProperty: #averageNumberOfStatements type: #Number>
	<FMComment: 'Average number of statements per class'>	

	^self
		lookUpPropertyNamed: #averageNumberOfStatements
		computedAs: [(self average: [:each | each numberOfStatements]) asFloat]
]

{ #category : #'*Famix-Traits' }
FamixTTypeGroup >> bunchCohesion [
	"Computing cohesion (Bunch formula). It is also considered anonymous and inner classes (in Java)."

	<FMProperty: #bunchCohesion type: #Number>
	<derived>
	<FMComment: 'Bunch Cohesion of a class group. It is also considered anonymous and inner classes (in Java).'>
	| cgClasses cgTypes intraConnectivities |
	cgClasses := self allClasses select: [ :c | c isInstanceSide ].
	cgTypes := cgClasses flatCollect: [ :c | c allRecursiveTypes ].
	cgClasses := (cgClasses union: cgTypes) asArray.
	cgClasses size == 0
		ifTrue: [ ^ 0.0 ].
	intraConnectivities := (cgClasses
		collect: [ :cgClass | (cgClass queryOutgoingDependencies opposites atScope: FamixTType) select: [ :class | (cgClasses includes: class) and: [ class isInstanceSide ] ] ])
		inject: 0
		into: [ :subTotal :each | subTotal + each size ].
	^ intraConnectivities / cgClasses size squared asFloat
]

{ #category : #'*Famix-Traits' }
FamixTTypeGroup >> bunchCouplingWith: aClassGroup [
	"Computing coupling (Bunch formula) from aClassGroup to receiver. It is also considered anonymous and inner classes (in Java)"

	| cgClasses cgTypes dependClasses dependTypes interConnectivities |
	cgClasses := self allClasses select: [ :c | c isInstanceSide ].
	cgTypes := cgClasses flatCollect: [ :c | c allRecursiveTypes ].
	cgClasses := (cgClasses union: cgTypes) asArray.
	dependClasses := aClassGroup allClasses select: [ :c | c isInstanceSide ].
	dependTypes := dependClasses flatCollect: [ :c | c allRecursiveTypes ].
	dependClasses := (dependClasses union: dependTypes) asArray.
	(cgClasses size == 0 or: [ dependClasses size == 0 ])
		ifTrue: [ ^ 0.0 ].
	interConnectivities := (cgClasses
		collect:
			[ :cgClass | (cgClass queryOutgoingDependencies opposites atScope: FamixTType) select: [ :referencedClass | (dependClasses includes: referencedClass) and: [ referencedClass isInstanceSide ] ] ])
		inject: 0
		into: [ :subTotal :each | subTotal + each size ].
	interConnectivities := ((cgClasses
		collect:
			[ :cgClass | (cgClass queryIncomingDependencies opposites atScope: FamixTType) select: [ :referencingClass | (dependClasses includes: referencingClass) and: [ referencingClass isInstanceSide ] ] ])
		inject: 0
		into: [ :subTotal :each | subTotal + each size ]) + interConnectivities.
	^ interConnectivities / (2 * cgClasses size * dependClasses size) asFloat
]

{ #category : #navigation }
FamixTTypeGroup >> collaboratingClassesAndMethods [
	"this returns the set of methods belonging to these classes that call at least
	one other method from at least one other class from the group"
	| selectedMethods invokingMethods invokedMethods methods |
	selectedMethods := IdentityDictionary new.
	self do: [ :eachClass | 
		invokingMethods := eachClass methods select: [ :eachMethod | 
			eachMethod invokedClasses anySatisfy: [ :each | each ~~ eachClass and: [ self includes: each ] ] ].
		invokedMethods := eachClass methods select: [ :eachMethod | 
			eachMethod invokingClasses anySatisfy: [ :each | each ~~ eachClass and: [ self includes: each ] ] ].
		methods := Set new.
		methods addAll: invokingMethods.
		methods addAll: invokedMethods.
		selectedMethods at: eachClass put: methods ].
	^ selectedMethods
]

{ #category : #navigation }
FamixTTypeGroup >> commonExternalSuperclasses [
	| result |
	result := Set new.
	self do: [:each | 
			result addAll: (each superclassHierarchy reject: [:eachClass | self includes: eachClass])].
	^result
]

{ #category : #metrics }
FamixTTypeGroup >> distance [
	"D = A + I - 1. A package should be balanced between abstractness and instability, i.e., somewhere between abstract and stable or concrete and unstable. This rule defines the main sequence by the equation A + I - 1 = 0. D is the distance to the main sequence."
	<FMProperty: #distance type: #Number>
	<derived>
	<FMComment: 'Distance of a class group'>
	
	| abstractness instability |
	abstractness := self abstractness.
	instability := self instability.
	
	(abstractness isNil or: [instability isNil]) ifTrue: [^ nil].
	^ abstractness + instability - 1
]

{ #category : #'*Famix-Traits' }
FamixTTypeGroup >> efferentCoupling [
	"Efferent coupling for a class group is the number of classes it depends upon"

	<FMProperty: #efferentCoupling type: #Number>
	<derived>
	<FMComment: 'Efferent coupling for a class group is the number of classes it depends upon'>
	| cgClasses cgTypes |
	cgClasses := self allClasses select: [ :c | c isInstanceSide ].
	cgTypes := cgClasses flatCollect: [ :c | c allRecursiveTypes ].
	cgClasses := (cgClasses union: cgTypes) asArray.
	^ (cgClasses flatCollect: [ :aClass | (aClass queryOutgoingDependencies atScope: FamixTType) select: [ :c | (cgClasses includes: c) not and: [ c isInstanceSide ] ] ]) asSet size
]

{ #category : #metrics }
FamixTTypeGroup >> instability [
	"I =	Ce(P)/(Ce(P)+Ca(P)), in the range [0, 1]. 0 means package is maximally stable (i.e., no dependency to other packages and can not change without big consequences), 1 means it is unstable."
	<FMProperty: #instability type: #Number>
	<derived>
	<FMComment: 'Instability of a class group'>
	
	| efferentCoupling afferentCoupling |
	
	efferentCoupling := self efferentCoupling.
	afferentCoupling := self afferentCoupling.
	(efferentCoupling + afferentCoupling) == 0 ifTrue: [^ nil].
	^ efferentCoupling / (efferentCoupling + afferentCoupling) asFloat
]

{ #category : #navigation }
FamixTTypeGroup >> withCommonSuperclasses [
	| result |
	result := self asSet.
	self do: [:each | result addAll: each superclassHierarchy].
	^result
]
