Class {
	#name : #RTGrayLinearColor,
	#superclass : #RTAbstractNormalizer,
	#instVars : [
		'max',
		'scope',
		'min'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #initialization }
RTGrayLinearColor >> initialize [
	super initialize.
	max := -1.
	min := -1.
	scope := #()
]

{ #category : #accessing }
RTGrayLinearColor >> max [
	max = -1 ifTrue: [ 
		max := scope inject: -1000000 into: [ :s :e | s max: (command rtValue: e) ] ].

	^ max
]

{ #category : #accessing }
RTGrayLinearColor >> min [
	min = -1 ifTrue: [ 
		min := scope inject: 1000000 into: [ :s :e | s min: (command rtValue: e) ] ].

	^ min
]

{ #category : #accessing }
RTGrayLinearColor >> rtValue: anObject [
	| intensity v |	
	self min = self max ifTrue: [ ^ Color gray ].
	v := command rtValue: anObject.
	intensity := 1 - ((v - self min) / (self max - self min)).
	^ Color r: intensity g: intensity b: intensity
]

{ #category : #accessing }
RTGrayLinearColor >> scope: groupOfObjects [
	"The argument is used to determine the maximum value. Command is executed on each of elements of the group passed as argument"
	scope := groupOfObjects
]
