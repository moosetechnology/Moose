"
I am a layout for elements with model date.
"
Class {
	#name : #RTDateLayout,
	#superclass : #RTLayout,
	#instVars : [
		'gapSize'
	],
	#category : #'Roassal2-Builder-Calendar'
}

{ #category : #hook }
RTDateLayout >> doExecute: elements [
	| extent index currentWeek i |
	extent := elements inject: 0@0 into: [ :max :each | each extent max: max ].
	extent := extent + self gapSize.
	index := 0.
	currentWeek := nil.
	i := Week dayNames indexOf: Week startDay.
	elements do: [ :e | | date position week |
		date := e model.
		(date isKindOf: Date) ifTrue: [ 
			week := date asWeek.
			currentWeek ifNil: [ currentWeek := week. index := index + 1. ].
			currentWeek = week ifFalse: [ currentWeek := week. index := index +1 ].
			position := (((date dayOfWeek + 7 - i) rem: 7)+1) @ index.
		] ifFalse: [ 
			(date isKindOf: Integer) 
				ifTrue: [ position := date @ index. ] 
				ifFalse: [ self error: 'invale value for date'. ] ].
		e translateTo: (extent * position).
		 ]
]

{ #category : #accessing }
RTDateLayout >> gapSize [
	^ gapSize.
]

{ #category : #accessing }
RTDateLayout >> gapSize: aPoint [
	gapSize := aPoint.
]

{ #category : #'initialize-release' }
RTDateLayout >> initialize [
	super initialize.
	self gapSize: 3.
]
