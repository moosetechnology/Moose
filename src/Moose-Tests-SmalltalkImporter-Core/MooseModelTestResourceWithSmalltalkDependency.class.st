Class {
	#name : #MooseModelTestResourceWithSmalltalkDependency,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #testing }
MooseModelTestResourceWithSmalltalkDependency class >> isAbstract [
	^ self = MooseModelTestResourceWithSmalltalkDependency
]

{ #category : #setup }
MooseModelTestResourceWithSmalltalkDependency >> modelClass [
	^ FamixStModel
]
