"
This is the abstract representation of a version entity. There are at least two subclasses: 
- EntityVersion points to a structural entity
- CoChangeVersion is a purely time entity, and has no representation at the structural level.
"
Class {
	#name : #HismoAbstractVersion,
	#superclass : #FAMIXEntity,
	#instVars : [
		'history'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoAbstractVersion class >> annotation [
	<MSEClass: #AbstractVersion super: #FAMIXEntity>
	<package: #Hismo>
]

{ #category : #accessing }
HismoAbstractVersion >> history [
	
	^history
]

{ #category : #accessing }
HismoAbstractVersion >> history: anObject [
	
	history := anObject
]

{ #category : #'public interface' }
HismoAbstractVersion >> nextVersion [
	
	| index |
	index := self history versions indexOf: self.
	index = self history versions size
		ifTrue: [^nil]
		ifFalse: [^self history versions at: index + 1]
]

{ #category : #'public interface' }
HismoAbstractVersion >> previousVersion [
	
	| index |
	index := self history versions indexOf: self.
	index = 1
		ifTrue: [^nil]
		ifFalse: [^self history versions at: index - 1]
]
