"
Description
--------------------

I am an constant representing the root superclass of all FM3Class.

Public API and Key Messages
--------------------

- #isRoot 			Return true if the FM3Class is the root class.

Examples
--------------------

	FM3Object instance
"
Class {
	#name : #FM3Object,
	#superclass : #FM3Constant,
	#category : #'Fame-Core-Model'
}

{ #category : #accessing }
FM3Object class >> constantName [
	^ #Object
]

{ #category : #'accessing-query' }
FM3Object class >> defaultSuperclass [
	^ nil
]

{ #category : #testing }
FM3Object >> isRoot [
	^ true
]
