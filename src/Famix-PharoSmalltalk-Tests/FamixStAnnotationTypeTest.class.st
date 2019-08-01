Class {
	#name : #FamixStAnnotationTypeTest,
	#superclass : #FamixStTypeTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStAnnotationTypeTest >> actualClass [ 
		^ FamixStAnnotationType
]

{ #category : #tests }
FamixStAnnotationTypeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FamixStAnnotationInstance new.
	type instances: (OrderedCollection with: instance).
	self assert: type instances size equals: 1.
	self assert: instance annotationType equals: type
]

{ #category : #tests }
FamixStAnnotationTypeTest >> testMooseName [
	| annotationType method |
	self skip: 'Annotation are not currently well managed in St '.
	annotationType := self actualClass new.
	annotationType name: 'XYZ'.
	self assert: annotationType mooseName equals: 'XYZ'.
	method := FamixStMethod new.
	method name: 'abc'.
	annotationType annotationTypesContainer: method.
	self assert: annotationType mooseName equals: 'abc::XYZ'
]
