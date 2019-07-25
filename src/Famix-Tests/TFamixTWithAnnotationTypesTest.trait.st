Trait {
	#name : #TFamixTWithAnnotationTypesTest,
	#instVars : [
		'annotationType1',
		'annotationType2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationTypesTest >> testDefinedAnnotationTypes [
annotationType1 := MooseEntity new copyWithTalent: FamixTAnnotationType.
annotationType1 class initializeSlots: annotationType1.
model add: annotationType1.
annotationType2 := MooseEntity new copyWithTalent: FamixTAnnotationType.
annotationType2 class initializeSlots: annotationType2.
model add: annotationType2.
self entity addDefinedAnnotationType: annotationType1.
self entity addDefinedAnnotationType: annotationType2.
self assert: (self entity definedAnnotationTypes notEmpty).
self assertCollection: self entity definedAnnotationTypes hasSameElements: {  annotationType1. annotationType2 }.
self assert: annotationType1 annotationTypesContainer equals: self entity
]
