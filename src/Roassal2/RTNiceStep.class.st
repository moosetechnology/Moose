"
I am an utility class for RTNiceStepSizeGenerator>>next

"
Class {
	#name : #RTNiceStep,
	#superclass : #RTObject,
	#instVars : [
		'stepSize',
		'offset',
		'i',
		'j'
	],
	#category : #'Roassal2-Builder-Grapher-Labeling'
}

{ #category : #accessing }
RTNiceStep >> i [
	^ i
]

{ #category : #accessing }
RTNiceStep >> i: aNumber [
	i := aNumber
]

{ #category : #accessing }
RTNiceStep >> j [
	^ j
]

{ #category : #accessing }
RTNiceStep >> j: aNumber [
	j := aNumber
]

{ #category : #accessing }
RTNiceStep >> offset [
	^ offset
]

{ #category : #accessing }
RTNiceStep >> offset: aNumber [
	offset := aNumber
]

{ #category : #accessing }
RTNiceStep >> stepSize [
	^ stepSize
]

{ #category : #accessing }
RTNiceStep >> stepSize: aNumber [
	stepSize := aNumber
]
