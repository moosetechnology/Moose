"
This is a specific layout for month in RTCalendarBuilder
"
Class {
	#name : #RTMonthLayout,
	#superclass : #RTLayout,
	#instVars : [
		'gapSize'
	],
	#category : #'Roassal2-Builder-Calendar'
}

{ #category : #hook }
RTMonthLayout >> doExecute: elements [
	| prevWeek index first cellSize |
	first := elements first.
	prevWeek := first model weeks last.
	cellSize := first height / first model weeks size.
	index := 0.
	elements first translateTo: 0 @ 0.
	elements allButFirstDo: [ :e | | month |
		month := e model.
		(prevWeek = month weeks first) ifTrue: [ index := index - 1 ].
		(month previous weeks size - month weeks size) odd ifTrue: [  
			month previous weeks size odd ifTrue: [ index := index - 0.5 ].
			month weeks size even ifTrue: [ index := index + 0.5 ] ].
		index := index + month previous weeks size.
		prevWeek := month weeks last.
		e translateTo: 0@ ((index * cellSize)).
		
		 ].
	
]

{ #category : #accessing }
RTMonthLayout >> gapSize [
	^ gapSize
]

{ #category : #accessing }
RTMonthLayout >> gapSize: anObject [
	gapSize := anObject
]

{ #category : #'initialize-release' }
RTMonthLayout >> initialize [
	super initialize.
	self gapSize: 1
]
