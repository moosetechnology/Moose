Class {
	#name : #FAMIXAnnotationInstanceAttributeTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAnnotationInstanceAttributeTest >> actualClass [
	^ FAMIXAnnotationInstanceAttribute
]

{ #category : #tests }
FAMIXAnnotationInstanceAttributeTest >> testComplex [
	| model |
	model := FAMIXModel new.
	model
		importFromMSEStream:
			'(
(FAMIX.Namespace (id: 1))
(FAMIX.Class (id: 2)
	(parentScope (ref: 1))
)
(FAMIX.Class (id: 3)
	(parentScope (ref: 1))
)
(FAMIX.Class (id: 4)
	(parentScope (ref: 1))
)
(FAMIX.Class (id: 5)
	(parentScope (ref: 1))
)

(FAMIX.AnnotationType (id: 11)
	(container (ref: 1))
)

(FAMIX.AnnotationTypeAttribute (id: 111)
	(parentAnnotationType (ref: 11))
	(declaredType (ref: 2)) )

(FAMIX.AnnotationTypeAttribute (id: 112)
	(parentAnnotationType (ref: 11))
	(declaredType (ref: 4)) )

(FAMIX.AnnotationInstance (id: 12)
	(annotationType (ref: 11))
	(annotatedEntity (ref: 3)))

(FAMIX.AnnotationInstanceAttribute (id: 112)
	(parentAnnotationInstance (ref: 12))
	(annotationTypeAttribute (ref: 111))
	(value ''something''))

(FAMIX.AnnotationInstance (id: 13)
	(annotationType (ref: 11))
	(annotatedEntity (ref: 5)))

)' readStream.
	self assert: model allAnnotationTypes size equals: 1.
	self assert: model allAnnotationTypes first attributes size equals: 2.
	self assert: model allAnnotationTypes first instances size equals: 2.
	self assert: model allAnnotationInstances size equals: 2.
	self assert: (model allAnnotationInstances anySatisfy: [ :each | each attributes size = 1 ]).
	self assert: (model allAnnotationInstances anySatisfy: [ :each | each attributes isEmpty ])
]

{ #category : #tests }
FAMIXAnnotationInstanceAttributeTest >> testName [
	| type instance |
	type := FAMIXAnnotationTypeAttribute new.
	type name: 'aName'.
	instance := self actualClass new.
	instance annotationTypeAttribute: type.
	self assert: instance name equals: 'aName'
]

{ #category : #tests }
FAMIXAnnotationInstanceAttributeTest >> testParentAnnotationTypeAttribute [
	| type instance |
	type := FAMIXAnnotationTypeAttribute new.
	instance := self actualClass new.
	instance annotationTypeAttribute: type.
	self assert: type annotationAttributeInstances size equals: 1
]
