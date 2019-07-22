Class {
	#name : #FamixJavaAnnotationInstanceAttributeTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaAnnotationInstanceAttributeTest >> actualClass [
	^ FAMIXAnnotationInstanceAttribute
]

{ #category : #tests }
FamixJavaAnnotationInstanceAttributeTest >> testComplex [
	| model |
	MooseModel resetMeta.
	model := FamixJavaMooseModel new.
	model
		importFromMSEStream:
			'(
(Famix-Java-Entities.Namespace (id: 1))
(Famix-Java-Entities.Class (id: 2)
	(parentScope (ref: 1))
)
(Famix-Java-Entities.Class (id: 3)
	(parentScope (ref: 1))
)
(Famix-Java-Entities.Class (id: 4)
	(parentScope (ref: 1))
)
(Famix-Java-Entities.Class (id: 5)
	(parentScope (ref: 1))
)

(Famix-Java-Entities.AnnotationType (id: 11)
	(container (ref: 1))
)

(Famix-Java-Entities.AnnotationTypeAttribute (id: 111)
	(parentAnnotationType (ref: 11))
	(declaredType (ref: 2)) )

(Famix-Java-Entities.AnnotationTypeAttribute (id: 112)
	(parentAnnotationType (ref: 11))
	(declaredType (ref: 4)) )

(Famix-Java-Entities.AnnotationInstance (id: 12)
	(annotationType (ref: 11))
	(annotatedEntity (ref: 3)))

(Famix-Java-Entities.AnnotationInstanceAttribute (id: 112)
	(parentAnnotationInstance (ref: 12))
	(annotationTypeAttribute (ref: 111))
	(value ''something''))

(Famix-Java-Entities.AnnotationInstance (id: 13)
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
FamixJavaAnnotationInstanceAttributeTest >> testName [
	| type instance |
	type := FamixJavaAnnotationTypeAttribute new.
	type name: 'aName'.
	instance := self actualClass new.
	instance annotationTypeAttribute: type.
	self assert: instance name equals: 'aName'
]

{ #category : #tests }
FamixJavaAnnotationInstanceAttributeTest >> testParentAnnotationTypeAttribute [
	| type instance |
	type := FamixJavaAnnotationTypeAttribute new.
	instance := self actualClass new.
	instance annotationTypeAttribute: type.
	self assert: type annotationAttributeInstances size equals: 1
]
