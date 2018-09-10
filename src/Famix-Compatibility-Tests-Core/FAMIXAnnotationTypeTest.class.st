Class {
	#name : #FAMIXAnnotationTypeTest,
	#superclass : #FAMIXTypeTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAnnotationTypeTest >> actualClass [
	^ FAMIXAnnotationType
]

{ #category : #tests }
FAMIXAnnotationTypeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FAMIXAnnotationInstance new.
	type instances: (OrderedCollection with: instance).
	self assert: type instances size equals: 1.
	self assert: instance annotationType equals: type
]

{ #category : #tests }
FAMIXAnnotationTypeTest >> testMooseName [
	| annotationType namespace |
	annotationType := self actualClass new.
	annotationType name: 'XYZ'.
	self assert: annotationType mooseName equals: 'XYZ'.
	namespace := FAMIXNamespace new.
	namespace name: 'abc'.
	annotationType container: namespace.
	self assert: annotationType mooseName equals: 'abc::XYZ'
]
