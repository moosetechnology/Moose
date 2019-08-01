Class {
	#name : #FamixJavaAnnotationInstanceTest,
	#superclass : #FamixJavaSourcedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaAnnotationInstanceTest >> actualClass [ 
		^ FamixJavaAnnotationInstance
]

{ #category : #tests }
FamixJavaAnnotationInstanceTest >> testAnnotatedEntityBackPointer [
	| entity instance |
	entity := FamixJavaNamedEntity new.
	instance := self actualClass new.
	instance annotatedEntity: entity.
	self assert: entity annotationInstances size equals: 1.
	self assert: entity annotationInstances first equals: instance
]

{ #category : #tests }
FamixJavaAnnotationInstanceTest >> testAnnotationType [
	| type instance |
	type := FamixJavaAnnotationType new.
	instance := self actualClass new.
	instance annotationType: type.
	self assert: type instances size equals: 1
]

{ #category : #tests }
FamixJavaAnnotationInstanceTest >> testMooseName [
	| entity type instance |
	type := FamixJavaAnnotationType new.
	type name: 'AnAnnotationType'.
	entity := FamixJavaNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	self assert: instance mooseName equals: #'AnAnnotationType()-AnEntity'
]

{ #category : #tests }
FamixJavaAnnotationInstanceTest >> testMooseNameWithAttributes [
	| entity type instance attributeType attributeInstance |
	type := FamixJavaAnnotationType new.
	type name: 'AnAnnotationType'.
	attributeType := FamixJavaAnnotationTypeAttribute new.
	attributeType name: 'attribute'.
	entity := FamixJavaNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	attributeInstance := FamixJavaAnnotationInstanceAttribute new.
	attributeInstance parentAnnotationInstance: instance.
	attributeInstance annotationTypeAttribute: attributeType.
	attributeInstance value: 'value'.
	self assert: instance name equals: '@AnAnnotationType on AnEntity'.
	self assert: instance mooseName equals: #'AnAnnotationType(value)-AnEntity'
]
