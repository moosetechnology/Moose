Class {
	#name : #MTLAnnotationTest,
	#superclass : #TestCase,
	#category : #'Metanool-Tests-Core'
}

{ #category : #tests }
MTLAnnotationTest >> testAsMagritteDescription [

	| annotation |
	annotation := MTLAnnotationDescription new name: #something; type: FM3 string; yourself.
	self assert: (annotation asMagritteDescription accessor isKindOf: MTLFamePropertyAccessor)
]

{ #category : #tests }
MTLAnnotationTest >> testBoolean [
	| metaDescription annotationDescription instance |
	metaDescription := FM3MetaDescription new.
	annotationDescription := MTLAnnotationDescription new
		name: #something;
		type: FM3 boolean;
		yourself.
	metaDescription attributes add: annotationDescription.
	instance := MooseEntity new.
	instance mmSetProperty: annotationDescription to: false.
	self assert: (instance mmGetProperty: annotationDescription) equals: false.
	self assert: (instance readUsing: annotationDescription asMagritteDescription) equals: false
]

{ #category : #tests }
MTLAnnotationTest >> testNumber [
	| metaDescription annotationDescription instance |
	metaDescription := FM3MetaDescription new.
	annotationDescription := MTLAnnotationDescription new
		name: #something;
		type: FM3 number;
		yourself.
	metaDescription attributes add: annotationDescription.
	instance := MooseEntity new.
	instance mmSetProperty: annotationDescription to: 42.
	self assert: (instance mmGetProperty: annotationDescription) equals: 42.
	self assert: (instance readUsing: annotationDescription asMagritteDescription) equals: 42
]
