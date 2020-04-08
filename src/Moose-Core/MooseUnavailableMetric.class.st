"
Description
--------------------

I am an object to represent an unavailable metric.

This can happen if a model is missing a metric we cannot compute or if a computation ended in error.
"
Class {
	#name : #MooseUnavailableMetric,
	#superclass : #Object,
	#category : #'Moose-Core'
}

{ #category : #arithmetic }
MooseUnavailableMetric class >> + something [
	^ something addUnavailableMetric: self
]

{ #category : #arithmetic }
MooseUnavailableMetric class >> - aClass [ 
	^ self
]

{ #category : #arithmetic }
MooseUnavailableMetric class >> <= anObject [
	^ false
]

{ #category : #arithmetic }
MooseUnavailableMetric class >> adaptToNumber: anInteger andSend: aString [
	^ self
]

{ #category : #arithmetic }
MooseUnavailableMetric class >> addUnavailableMetric: aSYNUnavailableMetric [ 
	^ self
]

{ #category : #arithmetic }
MooseUnavailableMetric class >> asString [
	^ 'unavailable'
]
