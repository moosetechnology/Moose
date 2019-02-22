Class {
	#name : #RTAMItem,
	#superclass : #RTObject,
	#instVars : [
		'itemName',
		'row',
		'column',
		'tags',
		'model',
		'color'
	],
	#category : #'Roassal2-Builder-ApplicationMatrix'
}

{ #category : #accessing }
RTAMItem >> addTag: aTag [
	tags add: aTag
]

{ #category : #accessing }
RTAMItem >> color [
	^ color
]

{ #category : #accessing }
RTAMItem >> color: anObject [
	color := anObject
]

{ #category : #accessing }
RTAMItem >> column [
	^ column
]

{ #category : #accessing }
RTAMItem >> column: anObject [
	column := anObject
]

{ #category : #testing }
RTAMItem >> hasTag [

	^ tags notEmpty
]

{ #category : #initialization }
RTAMItem >> initialize [
	super initialize.
	tags := OrderedCollection new.
	itemName := 'Unnamed'.
	row := 'row'.
	column := 'column'.
	color := Color veryVeryLightGray.
]

{ #category : #accessing }
RTAMItem >> itemName [
	^ itemName
]

{ #category : #accessing }
RTAMItem >> itemName: anObject [
	itemName := anObject
]

{ #category : #accessing }
RTAMItem >> model [
	^ model
]

{ #category : #accessing }
RTAMItem >> model: anObject [
	model := anObject
]

{ #category : #accessing }
RTAMItem >> row [
	^ row
]

{ #category : #accessing }
RTAMItem >> row: anObject [
	row := anObject
]

{ #category : #accessing }
RTAMItem >> tags [
	^ tags
]
