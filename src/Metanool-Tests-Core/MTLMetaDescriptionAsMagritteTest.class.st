Class {
	#name : #MTLMetaDescriptionAsMagritteTest,
	#superclass : #TestCase,
	#category : #'Metanool-Tests-Core'
}

{ #category : #tests }
MTLMetaDescriptionAsMagritteTest >> testBoolean [
	| meta prop desc |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	prop type: FM3 boolean.
	meta attributes add: prop.
	desc := meta asMagritteDescription.
	self assert: desc isContainer.
	self assert: desc size equals: 1.
	self assert: (desc children first isKindOf: MABooleanDescription).
	self assert: (desc children first accessor isKindOf: MTLFamePropertyAccessor).
	self assert: desc children first isReadonly not
]

{ #category : #tests }
MTLMetaDescriptionAsMagritteTest >> testMultivaluedString [
	| meta prop desc |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	prop type: FM3 string.
	prop isMultivalued: true.
	meta attributes add: prop.
	desc := meta asMagritteDescription.
	self assert: desc isContainer.
	self assert: desc size equals: 1.
	self assert: (desc children first isKindOf: MAStringDescription).
	self assert: desc children first isReadonly.
	self assert: (desc children first accessor isKindOf: MTLFamePropertyAccessor)
]

{ #category : #tests }
MTLMetaDescriptionAsMagritteTest >> testNumber [
	| meta prop desc |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	prop type: FM3 number.
	meta attributes add: prop.
	desc := meta asMagritteDescription.
	self assert: desc isContainer.
	self assert: desc size equals: 1.
	self assert: (desc children first isKindOf: MANumberDescription).
	self assert: (desc children first accessor isKindOf: MTLFamePropertyAccessor).
	self assert: desc children first isReadonly not
]

{ #category : #tests }
MTLMetaDescriptionAsMagritteTest >> testString [
	| meta prop desc |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	prop type: FM3 string.
	meta attributes add: prop.
	desc := meta asMagritteDescription.
	self assert: desc isContainer.
	self assert: desc size equals: 1.
	self assert: (desc children first isKindOf: MAStringDescription).
	self assert: (desc children first accessor isKindOf: MTLFamePropertyAccessor).
	self assert: desc children first isReadonly not
]

{ #category : #tests }
MTLMetaDescriptionAsMagritteTest >> testStringAnnotation [
	| meta prop desc |
	meta := FM3MetaDescription new.
	prop := MTLAnnotationDescription new
		name: #something;
		type: FM3 string;
		yourself.
	meta attributes add: prop.
	desc := meta asMagritteDescription.
	self assert: desc isContainer.
	self assert: desc size equals: 1.
	self assert: (desc children first isKindOf: MAStringDescription).
	self assert: (desc children first accessor isKindOf: MTLFamePropertyAccessor).
	self assert: desc children first isReadonly not
]
