Trait {
	#name : #TFamixTTemplateUserTest,
	#instVars : [
		'template'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTemplateUserTest >> testTemplate [
template := MooseEntity new copyWithTalent: FamixTTemplate. 
template class initializeSlots: template.
model add: template.
self entity template: template. 
self assert: (self entity template notNil).
self assert: self entity template equals: template.
self assertCollection: template templateUsers hasSameElements: {self entity}
]
