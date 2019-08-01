Class {
	#name : #FamixStAnnotationInstanceTest,
	#superclass : #FamixStSourcedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStAnnotationInstanceTest >> actualClass [ 
		^ FamixStAnnotationInstance
]

{ #category : #tests }
FamixStAnnotationInstanceTest >> testAnnotatedEntityBackPointer [
	| entity instance |
	entity := FamixStNamedEntity new.
	instance := self actualClass new.
	instance annotatedEntity: entity.
	self assert: entity annotationInstances size equals: 1.
	self assert: entity annotationInstances first equals: instance
]

{ #category : #tests }
FamixStAnnotationInstanceTest >> testAnnotationType [
	| type instance |
	type := FamixStAnnotationType new.
	instance := self actualClass new.
	instance annotationType: type.
	self assert: type instances size equals: 1
]

{ #category : #tests }
FamixStAnnotationInstanceTest >> testMooseName [
	| entity type instance |
	type := FamixStAnnotationType new.
	type name: 'AnAnnotationType'.
	entity := FamixStNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	self assert: instance mooseName equals: #'@AnAnnotationType on AnEntity'
]

{ #category : #tests }
FamixStAnnotationInstanceTest >> testMooseNameWithAttributes [
	| entity type instance attributeType attributeInstance |
	type := FamixStAnnotationType new.
	type name: 'AnAnnotationType'.
	attributeType := FamixStAnnotationTypeAttribute new.
	attributeType name: 'attribute'.
	entity := FamixStNamedEntity new.
	entity name: 'AnEntity'.
	instance := self actualClass new.
	instance annotationType: type.
	instance annotatedEntity: entity.
	attributeInstance := FamixStAnnotationInstanceAttribute new.
	attributeInstance parentAnnotationInstance: instance.
	attributeInstance annotationTypeAttribute: attributeType.
	attributeInstance value: 'value'.
	self assert: instance name equals: '@AnAnnotationType on AnEntity'.
	self assert: instance mooseName equals: #'@AnAnnotationType on AnEntity'
]
