"
This is helper class that is used to edit multiple entities using one Magritte description. It is used in the Metanool editor as a model for manipulating a group.

Instance Variables:
	group	<MooseAbstractGroup>
"
Class {
	#name : #MTLGroup,
	#superclass : #Object,
	#instVars : [
		'group'
	],
	#category : #'Metanool-Core'
}

{ #category : #accessing }
MTLGroup >> group [
	^ group
]

{ #category : #accessing }
MTLGroup >> group: anObject [
	group := anObject
]

{ #category : #model }
MTLGroup >> readUsing: aDescription [
	"we ask the entities in the real group for the actual value corresponding to the description. 
	if we get only one value we return that. otherwise we return the default of the description"
	
	| allValues |
	allValues := self group collectAsSet: [:each | each readUsing: aDescription].
	^ allValues size = 1
		ifTrue: [ allValues anyOne ]
		ifFalse: [ aDescription default ]
]

{ #category : #model }
MTLGroup >> write: anObject using: aDescription [
	"it traverses all entities and writes the value with description for each in the group"

	self group do: [ :each | each write: anObject using: aDescription ]
]
