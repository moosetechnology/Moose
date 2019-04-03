Class {
	#name : #MooseEntityRenamed,
	#superclass : #MooseEntityAnnouncement,
	#instVars : [
		'oldName'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
MooseEntityRenamed >> oldName [
	^ oldName
]

{ #category : #accessing }
MooseEntityRenamed >> oldName: anObject [
	oldName := anObject
]
