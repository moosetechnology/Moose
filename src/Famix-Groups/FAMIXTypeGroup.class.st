"
FAMIXTypeGroup is a MooseGroup containing only FAMIX enities of type FAMIXType.
"
Class {
	#name : #FAMIXTypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXTypeGroup class >> annotation [
	<FMClass: #TypeGroup super: #MooseGroup>
	<package: #FAMIX>

]

{ #category : #metrics }
FAMIXTypeGroup >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."

	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract.'>
	
	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size) asFloat
]

{ #category : #metrics }
FAMIXTypeGroup >> ahh [ 
	"average hierarchy height" 

	| allHierarchies |
	allHierarchies := 
			self allClasses select: 
				[:cls | cls superclass isNil or: [ cls superclass isStub ] ].
	^ ((allHierarchies asOrderedCollection collect: #subclassHierarchyDepth) sum / allHierarchies size) asFloat 

]

{ #category : #navigation }
FAMIXTypeGroup >> allClasses [

	^ self
]

{ #category : #navigation }
FAMIXTypeGroup >> allMethods [

	^ self flatCollect: [:c | c methods]
]

{ #category : #navigation }
FAMIXTypeGroup >> allPackages [
	^ FAMIXPackageGroup withAll: (self entities flatCollectAsSet: [ :c | c atScope: FamixTPackage ])
]

{ #category : #metrics }
FAMIXTypeGroup >> averageNumberOfAttributes [
	<FMProperty: #averageNumberOfAttributes type: #Number>
	<FMComment: 'Average number of attributes per class'>

	^self
		lookUpPropertyNamed: #averageNumberOfAttributes
		computedAs: [(self average: [:each | each numberOfAttributes ]) asFloat]
]

{ #category : #metrics }
FAMIXTypeGroup >> averageNumberOfLinesOfCode [
	<FMProperty: #averageNumberOfMethods type: #Number>
	<FMComment: 'Average number of methods per class'>
	
	^self
		lookUpPropertyNamed: #averageNumberOfMethods
		computedAs: [(self average: [:each | each numberOfLinesOfCode ]) asFloat]
]

{ #category : #metrics }
FAMIXTypeGroup >> averageNumberOfMethods [
	<FMProperty: #averageNumberOfMethods type: #Number>
	<FMComment: 'Average number of methods per class'>

	^self
		lookUpPropertyNamed: #averageNumberOfMethods
		computedAs: [(self average: [:each | each numberOfMethods ]) asFloat]
]

{ #category : #metrics }
FAMIXTypeGroup >> averageNumberOfStatements [
	<FMProperty: #averageNumberOfStatements type: #Number>
	<FMComment: 'Average number of statements per class'>	

	^self
		lookUpPropertyNamed: #averageNumberOfStatements
		computedAs: [(self average: [:each | each numberOfStatements]) asFloat]
]

{ #category : #navigation }
FAMIXTypeGroup >> collaboratingClassesAndMethods [
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
FAMIXTypeGroup >> commonExternalSuperclasses [
	| result |
	result := Set new.
	self do: [:each | 
			result addAll: (each superclassHierarchy reject: [:eachClass | self includes: eachClass])].
	^result
]

{ #category : #metrics }
FAMIXTypeGroup >> distance [
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

{ #category : #metrics }
FAMIXTypeGroup >> instability [
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
FAMIXTypeGroup >> withCommonSuperclasses [
	| result |
	result := self asSet.
	self do: [:each | result addAll: each superclassHierarchy].
	^result
]
