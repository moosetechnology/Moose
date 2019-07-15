Class {
	#name : #PPJavaToken,
	#superclass : #PP2Token,
	#instVars : [
		'comments'
	],
	#category : #'PetitJava-Core'
}

{ #category : #accessing }
PPJavaToken >> comments [
	^ comments
]

{ #category : #accessing }
PPJavaToken >> comments: anObject [
	comments := anObject
]

{ #category : #accessing }
PPJavaToken >> inputValue [
	^ self value
]

{ #category : #compatibility }
PPJavaToken >> length [ 

	^ self size

]
