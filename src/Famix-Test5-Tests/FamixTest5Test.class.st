Class {
	#name : #FamixTest5Test,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Test5-Tests'
}

{ #category : #running }
FamixTest5Test >> setUp [
	super setUp.

	model := FamixTest5Model new.

]

{ #category : #running }
FamixTest5Test >> testApplyOnOppositeOn [
	| ctype ttype cwith twith|
	ctype := model metamodel elementNamed: 'Famix-Test5-Entities.AnnotationType2'.
	ttype := model metamodel elementNamed: 'Famix-Traits.TAnnotationType'.
	cwith := model metamodel elementNamed: 'Famix-Test5-Entities.WithAnnotationType2'.
	twith := model metamodel elementNamed: 'Famix-Traits.TWithAnnotationTypes'.

	self assert: (ctype traits includes: ttype).
	self assert: (cwith traits includes: twith)
]

{ #category : #running }
FamixTest5Test >> testApplyOnOppositeTraitOn [
	| ctype ttype cwith twith|
	ctype := model metamodel elementNamed: 'Famix-Test5-Entities.AnnotationType1'.
	ttype := model metamodel elementNamed: 'Famix-Traits.TAnnotationType'.
	cwith := model metamodel elementNamed: 'Famix-Test5-Entities.WithAnnotationType1'.
	twith := model metamodel elementNamed: 'Famix-Traits.TWithAnnotationTypes'.

	self assert: (ctype traits includes: ttype).
	self assert: (cwith traits includes: twith)
]
