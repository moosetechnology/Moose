Class {
	#name : #FAMIXAnnotationTypeAttributeTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAnnotationTypeAttributeTest >> actualClass [
	^ FAMIXAnnotationTypeAttribute
]

{ #category : #tests }
FAMIXAnnotationTypeAttributeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FAMIXAnnotationInstanceAttribute new.
	type annotationAttributeInstances: (OrderedCollection with: instance).
	self assert: type annotationAttributeInstances size equals: 1.
	self assert: instance annotationTypeAttribute equals: type
]

{ #category : #tests }
FAMIXAnnotationTypeAttributeTest >> testParentAnnotationType [
	| type attribute |
	type := FAMIXAnnotationType new.
	attribute := self actualClass new.
	attribute parentAnnotationType: type.
	self assert: type attributes size equals: 1
]
