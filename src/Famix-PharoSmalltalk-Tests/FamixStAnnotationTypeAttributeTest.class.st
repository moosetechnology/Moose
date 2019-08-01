Class {
	#name : #FamixStAnnotationTypeAttributeTest,
	#superclass : #FamixStSourcedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStAnnotationTypeAttributeTest >> actualClass [ 
		^ FamixStAnnotationTypeAttribute
]

{ #category : #tests }
FamixStAnnotationTypeAttributeTest >> testInstances [
	| type instance |
	type := self actualClass new.
	instance := FamixStAnnotationInstanceAttribute new.
	type annotationAttributeInstances: (OrderedCollection with: instance).
	self assert: type annotationAttributeInstances size equals: 1.
	self assert: instance annotationTypeAttribute equals: type
]

{ #category : #tests }
FamixStAnnotationTypeAttributeTest >> testParentAnnotationType [
	| type attribute |
	type := FamixStAnnotationType new.
	attribute := self actualClass new.
	attribute parentAnnotationType: type.
	self assert: type attributes size equals: 1
]
