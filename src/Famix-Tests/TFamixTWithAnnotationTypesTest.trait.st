Trait {
	#name : #TFamixTWithAnnotationTypesTest,
	#instVars : [
		'annotationtype1',
		'annotationtype2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationTypesTest >> testWithAnnotationTypes [
annotationtype1:= MooseEntity new copyWithTalent: FamixTAnnotationType.
annotationtype2:= MooseEntity new copyWithTalent: FamixTAnnotationType.
self entity addDefinedAnnotationType: annotationtype1.
self entity addDefinedAnnotationType: annotationtype2.
self assert: (self entity definedAnnotationTypes notEmpty).
	self assertCollection: self entity definedAnnotationTypes hasSameElements: { annotationtype1. annotationtype2 }.
self assert: annotationtype1 annotationTypesContainer equals: entity
]

{ #category : #tests }
TFamixTWithAnnotationTypesTest >> testWithoutAnnotationTypes [
			self assert: (self entity definedAnnotationTypes isEmpty)
]
