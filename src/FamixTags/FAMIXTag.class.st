"
I am a tag that can be attached to any MooseEntity.
I have a name and a prefered color to display me.
I have the collection of entities  to which I am attached.

"
Class {
	#name : #FAMIXTag,
	#superclass : #MooseEntity,
	#instVars : [
		'entities',
		'name',
		'color'
	],
	#classInstVars : [
		'allTags'
	],
	#category : #FamixTags
}

{ #category : #'instance creation' }
FAMIXTag class >> named: aString [
	^self new
		name: aString ;
		yourself
]

{ #category : #accessing }
FAMIXTag >> addEntity: anEntity [
	anEntity addTag: self
]

{ #category : #accessing }
FAMIXTag >> color [
	^color
]

{ #category : #accessing }
FAMIXTag >> color: aColor [
	color := aColor
]

{ #category : #accessing }
FAMIXTag >> entities [
	^ entities
]

{ #category : #accessing }
FAMIXTag >> entities: anObject [
	entities := anObject
]

{ #category : #initialization }
FAMIXTag >> initialize [
	super initialize.
	entities := OrderedCollection new.
	color := Color random.
	name := 'Unnamed'
]

{ #category : #accessing }
FAMIXTag >> name [
	^ name
]

{ #category : #accessing }
FAMIXTag >> name: anObject [
	name := anObject
]

{ #category : #accessing }
FAMIXTag >> reset [
	self entities copy do: [ :e | e removeTag: self ].
]

{ #category : #private }
FAMIXTag >> unsafeAddEntity: anObject [
	entities add: anObject
]

{ #category : #private }
FAMIXTag >> unsafeRemoveEntity: anObject [
	entities remove: anObject
]
