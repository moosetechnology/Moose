"
self openOn: MooseModel root allModels last.
"
Class {
	#name : #OnMooseModelConsistencyReport,
	#superclass : #REPReport,
	#category : #'OnMoose-Report'
}

{ #category : #private }
OnMooseModelConsistencyReport >> build: spec [
	spec label: 'Moose Model Consistency Report'.
	spec concern: OnMooseModelNoNilForImportantAttributes new
]
