Extension { #name : #FAMIXTypeGroup }

{ #category : #'*Famix-Traits' }
FAMIXTypeGroup >> afferentCoupling [
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

{ #category : #'*Famix-Traits' }
FAMIXTypeGroup >> bunchCohesion [
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
FAMIXTypeGroup >> bunchCouplingWith: aClassGroup [
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

{ #category : #'*Famix-Traits' }
FAMIXTypeGroup >> efferentCoupling [
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
