Class {
	#name : #FamixJavaAnnotationTypeAttributeTest,
	#superclass : #FamixJavaSourcedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaAnnotationTypeAttributeTest >> actualClass [ 
		^ FamixJavaAnnotationTypeAttribute
]

{ #category : #tests }
FamixJavaAnnotationTypeAttributeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FamixJavaAnnotationInstanceAttribute new.
	type annotationAttributeInstances: (OrderedCollection with: instance).
	self assert: type annotationAttributeInstances size equals: 1.
	self assert: instance annotationTypeAttribute equals: type
]

{ #category : #tests }
FamixJavaAnnotationTypeAttributeTest >> testParentAnnotationType [
	| type attribute |
	type := FamixJavaAnnotationType new.
	attribute := self actualClass new.
	attribute parentAnnotationType: type.
	self assert: type attributes size equals: 1
]
