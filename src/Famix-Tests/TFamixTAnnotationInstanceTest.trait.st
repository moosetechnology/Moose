Trait {
	#name : #TFamixTAnnotationInstanceTest,
	#instVars : [
		'annotatedEntity'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAnnotationInstanceTest >> testAnnotatedEntity [
annotatedEntity := MooseEntity new copyWithTalent: FamixTWithAnnotationInstances. 
annotatedEntity class initializeSlots: annotatedEntity.
model add: annotatedEntity.
self entity annotatedEntity: annotatedEntity. 
self assert: (self entity annotatedEntity notNil).
self assert: self entity annotatedEntity equals: annotatedEntity.
self assertCollection: annotatedEntity annotationInstances hasSameElements: {self entity}
]
