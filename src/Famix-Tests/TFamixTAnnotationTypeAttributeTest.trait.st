Trait {
	#name : #TFamixTAnnotationTypeAttributeTest,
	#instVars : [
		'typedAnnotationInstanceAttribute1',
		'typedAnnotationInstanceAttribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAnnotationTypeAttributeTest >> testAnnotationAttributeInstances [
typedAnnotationInstanceAttribute1 := MooseEntity new copyWithTalent: FamixTTypedAnnotationInstanceAttribute.
typedAnnotationInstanceAttribute1 class initializeSlots: typedAnnotationInstanceAttribute1.
model add: typedAnnotationInstanceAttribute1.
typedAnnotationInstanceAttribute2 := MooseEntity new copyWithTalent: FamixTTypedAnnotationInstanceAttribute.
typedAnnotationInstanceAttribute2 class initializeSlots: typedAnnotationInstanceAttribute2.
model add: typedAnnotationInstanceAttribute2.
self entity addAnnotationAttributeInstance: typedAnnotationInstanceAttribute1.
self entity addAnnotationAttributeInstance: typedAnnotationInstanceAttribute2.
self assert: (self entity annotationAttributeInstances notEmpty).
self assertCollection: self entity annotationAttributeInstances hasSameElements: {  typedAnnotationInstanceAttribute1. typedAnnotationInstanceAttribute2 }.
self assert: typedAnnotationInstanceAttribute1 annotationTypeAttribute equals: self entity
]
