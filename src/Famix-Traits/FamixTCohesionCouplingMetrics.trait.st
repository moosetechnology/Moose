Trait {
	#name : #FamixTCohesionCouplingMetrics,
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTCohesionCouplingMetrics classSide >> annotation [

	<MSEClass: #TCohesionCouplingMetrics super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<MSEProperty: #abstractness type: #Number>
	<derived>
	<MSEComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self childEntities .
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> afferentCoupling [
	<MSEProperty: #afferentCoupling type: #Number>
	<derived>
	<MSEComment:
		'Afferent Coupling of a namespace Afferent is the number of classes that depend upon this namespace'>
	^ (((self queryAllIncoming outOfParentUsing: FamixTPackage) atScope: FamixTType) collect: [ :e | e isClassSide ifTrue: [ e instanceSide ] ifFalse: [ e ] ]) asSet  size
]

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> distance [
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

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> efferentCoupling [
	"Efferent coupling for a package is the number of classes it depends upon"

	<MSEProperty: #efferentCoupling type: #Number>
	<derived>
	<MSEComment: 'Efferent Coupling of a package'>

	^ (((self queryAllOutgoing outOfParentUsing: FamixTPackage) atScope: FamixTType) collect: [ :e | e isClassSide ifTrue: [ e instanceSide ] ifFalse: [ e ] ] ) asSet size
]

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> instability [
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

{ #category : #metrics }
FamixTCohesionCouplingMetrics >> martinCohesion [
	"Computing cohesion as described by Robert C. Martin"

	<MSEProperty: #martinCohesion type: #Number>
	<derived>
	<MSEComment: 'Cohesion as defined by Robert C. Martin.'>
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
