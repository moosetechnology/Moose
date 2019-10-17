Class {
	#name : #FM3PropertyDescriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3PropertyDescriptionTest >> setUp [
	super setUp.
	tower := FMTower new
]

{ #category : #running }
FM3PropertyDescriptionTest >> testClassHasOpposite [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.class'.
	self assert: e hasOpposite.
	self assert: e opposite fullName equals: 'FM3.Class.properties'
]

{ #category : #running }
FM3PropertyDescriptionTest >> testIsCompositeDerived [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.composite'.
	self assert: e isDerived
]

{ #category : #running }
FM3PropertyDescriptionTest >> testTypeHasOpposite [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.type'.
	self deny: e hasOpposite
]
