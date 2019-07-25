Trait {
	#name : #TFamixTDefinedInModuleTest,
	#instVars : [
		'parentModule'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTDefinedInModuleTest >> testParentModule [
parentModule := MooseEntity new copyWithTalent: FamixTModule. 
parentModule class initializeSlots: parentModule.
model add: parentModule.
self entity parentModule: parentModule. 
self assert: (self entity parentModule notNil).
self assert: self entity parentModule equals: parentModule.
self assertCollection: parentModule moduleEntities hasSameElements: {self entity}
]
