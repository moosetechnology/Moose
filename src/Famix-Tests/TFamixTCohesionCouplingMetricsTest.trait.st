Trait {
	#name : #TFamixTCohesionCouplingMetricsTest,
	#instVars : [
		'packageable1',
		'packageable2',
		'packageOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTCohesionCouplingMetricsTest >> testChildEntities [
packageable1 := MooseEntity new copyWithTalent: FamixTPackageable.
packageable1 class initializeSlots: packageable1.
packageable2 := MooseEntity new copyWithTalent: FamixTPackageable.
packageable2 class initializeSlots: packageable2.
self entity addChildEntity: packageable1.
self entity addChildEntity: packageable2.
self assert: (self entity childEntities notEmpty).
self assertCollection: self entity childEntities hasSameElements: {  packageable1. packageable2 }.
self assert: packageable1 parentPackage equals: self entity
]

{ #category : #tests }
TFamixTCohesionCouplingMetricsTest >> testPackageOwner [
packageOwner := MooseEntity new copyWithTalent: FamixTWithPackages. 
packageOwner class initializeSlots: packageOwner.
self entity packageOwner: packageOwner. 
self assert: (self entity packageOwner notNil).
self assert: self entity packageOwner equals: packageOwner.
self assertCollection: packageOwner packages hasSameElements: {self entity}
]
