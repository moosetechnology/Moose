"
I am a utility class for and example of KiviatBuilder
"
Class {
	#name : #RTKiviatFruitExample,
	#superclass : #RTObject,
	#instVars : [
		'arr',
		'color',
		'name'
	],
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #public }
RTKiviatFruitExample class >> fruits [
	^ Array with: (self new values: #(6 8 5 2 6 5 7 9); color: Color red; name: 'apple')
		with: (self new values: #(5 7 3 7 7 7 6 5); color: Color green; name: 'orange')
		with: (self new values: #(4 3 5 9 5 5 4 4); color: Color blue; name: 'banana')
]

{ #category : #accessing }
RTKiviatFruitExample >> color [
	^ color
]

{ #category : #accessing }
RTKiviatFruitExample >> color: aColor [
	color := aColor
]

{ #category : #accessing }
RTKiviatFruitExample >> name [
	^ name
]

{ #category : #accessing }
RTKiviatFruitExample >> name: aString [
	name := aString
	
]

{ #category : #printing }
RTKiviatFruitExample >> printString [
	^ name
]

{ #category : #accessing }
RTKiviatFruitExample >> values: anArray [
	arr := anArray.
]

{ #category : #metrics }
RTKiviatFruitExample >> w1 [
	^ arr at: 1
]

{ #category : #metrics }
RTKiviatFruitExample >> w2 [
	^ arr at: 2
]

{ #category : #metrics }
RTKiviatFruitExample >> w3 [
	^ arr at: 3
]

{ #category : #metrics }
RTKiviatFruitExample >> w4 [
	^ arr at: 4
]

{ #category : #metrics }
RTKiviatFruitExample >> w5 [
	^ arr at: 5
]

{ #category : #metrics }
RTKiviatFruitExample >> w6 [
	^ arr at: 6
]

{ #category : #metrics }
RTKiviatFruitExample >> w7 [
	^ arr at: 7
]

{ #category : #metrics }
RTKiviatFruitExample >> w8 [
	^ arr at: 8
]
