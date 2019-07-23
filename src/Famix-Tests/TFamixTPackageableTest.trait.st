Trait {
	#name : #TFamixTPackageableTest,
	#instVars : [
		'parentPackage'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTPackageableTest >> testParentPackage [
parentPackage := MooseEntity new copyWithTalent: FamixTPackage. 
parentPackage class initializeSlots: parentPackage.
model add: parentPackage.
self entity parentPackage: parentPackage. 
self assert: (self entity parentPackage notNil).
self assert: self entity parentPackage equals: parentPackage.
self assertCollection: parentPackage childEntities hasSameElements: {self entity}
]
