Class {
	#name : #MooseModelTestResourceWithSmalltalkDependency,
	#superclass : #MooseModelTestResource,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #testing }
MooseModelTestResourceWithSmalltalkDependency class >> isAbstract [
	^ self = MooseModelTestResourceWithSmalltalkDependency
]

{ #category : #setup }
MooseModelTestResourceWithSmalltalkDependency >> modelClass [
	^ FamixStModel
]
