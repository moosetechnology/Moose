Trait {
	#name : #TFamixTWithAnnotationInstanceAttributesTest,
	#instVars : [
		'annotationInstanceAttribute1',
		'annotationInstanceAttribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationInstanceAttributesTest >> testAttributes [
annotationInstanceAttribute1 := MooseEntity new copyWithTalent: FamixTAnnotationInstanceAttribute.
annotationInstanceAttribute1 class initializeSlots: annotationInstanceAttribute1.
model add: annotationInstanceAttribute1.
annotationInstanceAttribute2 := MooseEntity new copyWithTalent: FamixTAnnotationInstanceAttribute.
annotationInstanceAttribute2 class initializeSlots: annotationInstanceAttribute2.
model add: annotationInstanceAttribute2.
self entity addAttribute: annotationInstanceAttribute1.
self entity addAttribute: annotationInstanceAttribute2.
self assert: (self entity attributes notEmpty).
self assertCollection: self entity attributes hasSameElements: {  annotationInstanceAttribute1. annotationInstanceAttribute2 }.
self assert: annotationInstanceAttribute1 parentAnnotationInstance equals: self entity
]
