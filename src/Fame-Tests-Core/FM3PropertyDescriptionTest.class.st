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
	tower := FMTower new.
]

{ #category : #running }
FM3PropertyDescriptionTest >> testClassHasOpposite [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.class'.
	e hasOpposite should beTrue.
	e opposite fullName should = 'FM3.Class.attributes'
]

{ #category : #running }
FM3PropertyDescriptionTest >> testIsCompositeDerived [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.composite'.
	e isDerived should beTrue
]

{ #category : #running }
FM3PropertyDescriptionTest >> testTypeHasOpposite [
	| e |
	e := tower metaMetamodel elementNamed: 'FM3.Property.type'.
	e hasOpposite should beFalse
]
