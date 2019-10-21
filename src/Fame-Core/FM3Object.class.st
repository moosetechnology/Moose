Class {
	#name : #FM3Object,
	#superclass : #FM3Constant,
	#category : #'Fame-Core'
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
