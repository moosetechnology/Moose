Class {
	#name : #FAMIXAnnotationInstanceTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAnnotationInstanceTest >> actualClass [
	^ FAMIXAnnotationInstance
]

{ #category : #tests }
FAMIXAnnotationInstanceTest >> testAnnotatedEntityBackPointer [
	| entity instance |
	entity := FAMIXNamedEntity new.
	instance := self actualClass new.
	instance annotatedEntity: entity.
	self assert: entity annotationInstances size equals: 1.
	self assert: entity annotationInstances first equals: instance
]

{ #category : #tests }
FAMIXAnnotationInstanceTest >> testAnnotationType [
	| type instance |
	type := FAMIXAnnotationType new.
	instance := self actualClass new.
	instance annotationType: type.
	self assert: type instances size equals: 1
]

{ #category : #tests }
FAMIXAnnotationInstanceTest >> testMooseName [
	| entity type instance |
	type := FAMIXAnnotationType new.
	type name: 'AnAnnotationType'.
	entity := FAMIXNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	self assert: instance mooseName equals: #'AnAnnotationType()-AnEntity'
]

{ #category : #tests }
FAMIXAnnotationInstanceTest >> testMooseNameWithAttributes [
	| entity type instance attributeType attributeInstance |
	type := FAMIXAnnotationType new.
	type name: 'AnAnnotationType'.
	attributeType := FAMIXAnnotationTypeAttribute new.
	attributeType name: 'attribute'.
	entity := FAMIXNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	attributeInstance := FAMIXAnnotationInstanceAttribute new.
	attributeInstance parentAnnotationInstance: instance.
	attributeInstance annotationTypeAttribute: attributeType.
	attributeInstance value: 'value'.
	self assert: instance name equals: '@AnAnnotationType on AnEntity'.
	self assert: instance mooseName equals: #'AnAnnotationType(value)-AnEntity'
]
