Class {
	#name : #FamixJavaAnnotationTypeTest,
	#superclass : #FamixJavaTypeTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaAnnotationTypeTest >> actualClass [ 
		^ FamixJavaAnnotationType
]

{ #category : #tests }
FamixJavaAnnotationTypeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FamixJavaAnnotationInstance new.
	type instances: (OrderedCollection with: instance).
	self assert: type instances size equals: 1.
	self assert: instance annotationType equals: type
]

{ #category : #tests }
FamixJavaAnnotationTypeTest >> testMooseName [
	| annotationType namespace |
	annotationType := self actualClass new.
	annotationType name: 'XYZ'.
	self assert: annotationType mooseName equals: 'XYZ'.
	namespace := FamixJavaNamespace new.
	namespace name: 'abc'.
	annotationType container: namespace.
	self assert: annotationType mooseName equals: 'abc::XYZ'
]
