Class {
	#name : #MPNewModelInstalled,
	#superclass : #Announcement,
	#instVars : [
		'newModel'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #accessing }
MPNewModelInstalled >> newModel [

	^ newModel
]

{ #category : #accessing }
MPNewModelInstalled >> newModel: anObject [

	newModel := anObject
]
