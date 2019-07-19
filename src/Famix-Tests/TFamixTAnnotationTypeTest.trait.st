Trait {
	#name : #TFamixTAnnotationTypeTest,
	#instVars : [
		'annotationTypesContainer',
		'typedAnnotationInstance1',
		'typedAnnotationInstance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAnnotationTypeTest >> testAnnotationTypesContainer [
annotationTypesContainer := MooseEntity new copyWithTalent: FamixTWithAnnotationTypes. 
annotationTypesContainer class initializeSlots: annotationTypesContainer.
model add: annotationTypesContainer.
self entity annotationTypesContainer: annotationTypesContainer. 
self assert: (self entity annotationTypesContainer notNil).
self assert: self entity annotationTypesContainer equals: annotationTypesContainer.
self assertCollection: annotationTypesContainer definedAnnotationTypes hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTAnnotationTypeTest >> testInstances [
typedAnnotationInstance1 := MooseEntity new copyWithTalent: FamixTTypedAnnotationInstance.
typedAnnotationInstance1 class initializeSlots: typedAnnotationInstance1.
model add: typedAnnotationInstance1.
typedAnnotationInstance2 := MooseEntity new copyWithTalent: FamixTTypedAnnotationInstance.
typedAnnotationInstance2 class initializeSlots: typedAnnotationInstance2.
model add: typedAnnotationInstance2.
self entity addInstance: typedAnnotationInstance1.
self entity addInstance: typedAnnotationInstance2.
self assert: (self entity instances notEmpty).
self assertCollection: self entity instances hasSameElements: {  typedAnnotationInstance1. typedAnnotationInstance2 }.
self assert: typedAnnotationInstance1 annotationType equals: self entity
]
