Trait {
	#name : #TFamixTWithAnnotationInstancesTest,
	#instVars : [
		'annotationInstance1',
		'annotationInstance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationInstancesTest >> testAnnotationInstances [
annotationInstance1 := MooseEntity new copyWithTalent: FamixTAnnotationInstance.
annotationInstance1 class initializeSlots: annotationInstance1.
model add: annotationInstance1.
annotationInstance2 := MooseEntity new copyWithTalent: FamixTAnnotationInstance.
annotationInstance2 class initializeSlots: annotationInstance2.
model add: annotationInstance2.
self entity addAnnotationInstance: annotationInstance1.
self entity addAnnotationInstance: annotationInstance2.
self assert: (self entity annotationInstances notEmpty).
self assertCollection: self entity annotationInstances hasSameElements: {  annotationInstance1. annotationInstance2 }.
self assert: annotationInstance1 annotatedEntity equals: self entity
]
