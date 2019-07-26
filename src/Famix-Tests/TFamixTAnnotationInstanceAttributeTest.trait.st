Trait {
	#name : #TFamixTAnnotationInstanceAttributeTest,
	#instVars : [
		'parentAnnotationInstance',
		'value'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAnnotationInstanceAttributeTest >> testParentAnnotationInstance [
parentAnnotationInstance := MooseEntity new copyWithTalent: FamixTWithAnnotationInstanceAttributes. 
parentAnnotationInstance class initializeSlots: parentAnnotationInstance.
model add: parentAnnotationInstance.
self entity parentAnnotationInstance: parentAnnotationInstance. 
self assert: (self entity parentAnnotationInstance notNil).
self assert: self entity parentAnnotationInstance equals: parentAnnotationInstance.
self assertCollection: parentAnnotationInstance attributes hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTAnnotationInstanceAttributeTest >> testValue [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity value: 'aLiteral'. 
self assert: (self entity value notNil).
self assert: self entity value equals: 'aLiteral' .
]
