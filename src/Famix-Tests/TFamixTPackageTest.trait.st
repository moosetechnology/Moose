Trait {
	#name : #TFamixTPackageTest,
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
TFamixTPackageTest >> testChildEntities [
packageable1 := MooseEntity new copyWithTalent: FamixTPackageable.
packageable1 class initializeSlots: packageable1.
model add: packageable1.
packageable2 := MooseEntity new copyWithTalent: FamixTPackageable.
packageable2 class initializeSlots: packageable2.
model add: packageable2.
self entity addChildEntity: packageable1.
self entity addChildEntity: packageable2.
self assert: (self entity childEntities notEmpty).
self assertCollection: self entity childEntities hasSameElements: {  packageable1. packageable2 }.
self assert: packageable1 parentPackage equals: self entity
]

{ #category : #tests }
TFamixTPackageTest >> testPackageOwner [
packageOwner := MooseEntity new copyWithTalent: FamixTWithPackages. 
packageOwner class initializeSlots: packageOwner.
model add: packageOwner.
self entity packageOwner: packageOwner. 
self assert: (self entity packageOwner notNil).
self assert: self entity packageOwner equals: packageOwner.
self assertCollection: packageOwner packages hasSameElements: {self entity}
]
