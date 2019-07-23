Trait {
	#name : #TFamixTTypedAnnotationInstanceAttributeTest,
	#instVars : [
		'annotationTypeAttribute'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypedAnnotationInstanceAttributeTest >> testAnnotationTypeAttribute [
annotationTypeAttribute := MooseEntity new copyWithTalent: FamixTAnnotationTypeAttribute. 
annotationTypeAttribute class initializeSlots: annotationTypeAttribute.
model add: annotationTypeAttribute.
self entity annotationTypeAttribute: annotationTypeAttribute. 
self assert: (self entity annotationTypeAttribute notNil).
self assert: self entity annotationTypeAttribute equals: annotationTypeAttribute.
self assertCollection: annotationTypeAttribute annotationAttributeInstances hasSameElements: {self entity}
]
