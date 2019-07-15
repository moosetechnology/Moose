Class {
	#name : #DudeAnotherClass,
	#superclass : #Object,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #'public interface' }
DudeAnotherClass >> methodB [
	| a b c |
	a := 0.
	b := 1.
	c := 2.
	a = 0 ifTrue: [
		b = 1 ifTrue: [
			c = 2 ifTrue: [
				Transcript show: 'Daaaaa!'
			]
		]
	].
	^a + b + c
]
