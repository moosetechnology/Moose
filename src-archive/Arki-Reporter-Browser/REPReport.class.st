Class {
	#name : #REPReport,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Arki-Reporter-Browser'
}

{ #category : #opening }
REPReport class >> exportAsHudsonTestsOn: aModel [
	^ self new 
		model: aModel;
		exportAsHudsonTests 
]

{ #category : #initialization }
REPReport class >> on: aModel [
	^ self new 
		model: aModel;
		yourself
]

{ #category : #opening }
REPReport class >> open [ 
	"This works only if the specific report provides a model"
	^ self new open
]

{ #category : #opening }
REPReport class >> openOn: aModel [
	^ self new 
		model: aModel;
		open
]

{ #category : #private }
REPReport >> build: spec [ 
	"override this method to build your spec"
	^ self subclassResponsibility
]

{ #category : #opening }
REPReport >> exportAsHudsonTests [
	REPHudson runOn: self spec
]

{ #category : #'as yet unclassified' }
REPReport >> gtInspectorConcernListIn: a [
	<gtInspectorPresentationOrder: 1>
	^ self spec root gtInspectorConcernListIn: a
]

{ #category : #private }
REPReport >> model [ 
	"override this method to point to the model of the specification"
	^ model
]

{ #category : #private }
REPReport >> model: aModel [
	model := aModel
]

{ #category : #opening }
REPReport >> open [ 
	^ self spec open
]

{ #category : #accessing }
REPReport >> spec [ 
	| spec |
	spec := REPConcernSpecification on: self model.
	self build: spec.
	^ spec
]
