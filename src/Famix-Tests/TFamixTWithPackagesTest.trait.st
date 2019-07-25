Trait {
	#name : #TFamixTWithPackagesTest,
	#instVars : [
		'package1',
		'package2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithPackagesTest >> testPackages [
package1 := MooseEntity new copyWithTalent: FamixTPackage.
package1 class initializeSlots: package1.
model add: package1.
package2 := MooseEntity new copyWithTalent: FamixTPackage.
package2 class initializeSlots: package2.
model add: package2.
self entity addPackage: package1.
self entity addPackage: package2.
self assert: (self entity packages notEmpty).
self assertCollection: self entity packages hasSameElements: {  package1. package2 }.
self assert: package1 packageOwner equals: self entity
]
