Class {
	#name : #FM3PropertyTest,
	#superclass : #FM3ElementTest,
	#category : #'Fame-Tests-Core'
}

{ #category : #helpers }
FM3PropertyTest >> actualClass [
	^ FM3Property
]

{ #category : #helpers }
FM3PropertyTest >> addUnamedOwnerTo: anElement [
	anElement mmClass: FM3Class new
]

{ #category : #tests }
FM3PropertyTest >> testClassHasOpposite [
	| e |
	e := metaMetamodel elementNamed: 'FM3.Property.class'.
	self assert: e hasOpposite.
	self assert: e opposite fullName equals: 'FM3.Class.properties'
]

{ #category : #tests }
FM3PropertyTest >> testIsCompositeDerived [
	| e |
	e := metaMetamodel elementNamed: 'FM3.Property.composite'.
	self assert: e isDerived
]

{ #category : #tests }
FM3PropertyTest >> testTypeHasOpposite [
	| e |
	e := metaMetamodel elementNamed: 'FM3.Property.type'.
	self deny: e hasOpposite
]
