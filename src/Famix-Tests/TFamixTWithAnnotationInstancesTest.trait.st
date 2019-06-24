Trait {
	#name : #TFamixTWithAnnotationInstancesTest,
	#instVars : [
		'annotationinstance1',
		'annotationinstance2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationInstancesTest >> testWithAnnotationInstances [
annotationinstance1:= MooseEntity new copyWithTalent: FamixTAnnotationInstance.
annotationinstance2:= MooseEntity new copyWithTalent: FamixTAnnotationInstance.
self entity addAnnotationInstance: annotationinstance1.
self entity addAnnotationInstance: annotationinstance2.
self assert: (self entity annotationInstances notEmpty).
	self assertCollection: self entity annotationInstances hasSameElements: { annotationinstance1. annotationinstance2 }.
self assert: annotationinstance1 annotatedEntity equals: entity
]

{ #category : #tests }
TFamixTWithAnnotationInstancesTest >> testWithoutAnnotationInstances [
			self assert: (self entity annotationInstances isEmpty)
]
