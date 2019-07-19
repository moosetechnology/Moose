Trait {
	#name : #TFamixTTypedAnnotationInstanceTest,
	#instVars : [
		'annotationType'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTTypedAnnotationInstanceTest >> testAnnotationType [
annotationType := MooseEntity new copyWithTalent: FamixTAnnotationType. 
annotationType class initializeSlots: annotationType.
model add: annotationType.
self entity annotationType: annotationType. 
self assert: (self entity annotationType notNil).
self assert: self entity annotationType equals: annotationType.
self assertCollection: annotationType instances hasSameElements: {self entity}
]
