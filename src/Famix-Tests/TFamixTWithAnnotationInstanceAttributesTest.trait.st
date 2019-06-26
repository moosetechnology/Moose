Trait {
	#name : #TFamixTWithAnnotationInstanceAttributesTest,
	#instVars : [
		'annotationinstanceattribute1',
		'annotationinstanceattribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAnnotationInstanceAttributesTest >> testWithAnnotationInstanceAttributes [
annotationinstanceattribute1:= MooseEntity new copyWithTalent: FamixTAnnotationInstanceAttribute.
annotationinstanceattribute2:= MooseEntity new copyWithTalent: FamixTAnnotationInstanceAttribute.
self entity addAttribute: annotationinstanceattribute1.
self entity addAttribute: annotationinstanceattribute2.
self assert: (self entity attributes notEmpty).
	self assertCollection: self entity attributes hasSameElements: { annotationinstanceattribute1. annotationinstanceattribute2 }.
self assert: annotationinstanceattribute1 parentAnnotationInstance equals: entity
]

{ #category : #tests }
TFamixTWithAnnotationInstanceAttributesTest >> testWithoutAnnotationInstanceAttributes [
			self assert: (self entity attributes isEmpty)
]
