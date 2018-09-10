Class {
	#name : #GRPharoRandomProvider,
	#superclass : #GRObject,
	#classInstVars : [
		'mutex',
		'generator'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #private }
GRPharoRandomProvider class >> initialize [
	Smalltalk addToStartUpList: self.
	self startUp
]

{ #category : #public }
GRPharoRandomProvider class >> nextInt: anInteger [
	"Answer a random integer in the interval [1, anInteger]"

	^ mutex critical: [ generator nextInt: anInteger ]
]

{ #category : #private }
GRPharoRandomProvider class >> randomClass [
	^ Random
]

{ #category : #public }
GRPharoRandomProvider class >> randomFrom: aCollection [
	| random count |
	random := self nextInt: aCollection size.
	^ aCollection isSequenceable
		ifTrue: [ aCollection at: random ]
		ifFalse: [
			count := 1.
			aCollection do: [ :ea |
				count = random ifTrue: [ ^ ea ].
				count := count + 1 ] ]
]

{ #category : #'class initialization' }
GRPharoRandomProvider class >> startUp [
	generator := self randomClass new.
	mutex := Semaphore forMutualExclusion
]

{ #category : #private }
GRPharoRandomProvider class >> unload [
	GRPlatform current removeFromStartUpList: self
]
