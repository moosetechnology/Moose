Class {
	#name : #RTCompoundElement,
	#superclass : #RTElement,
	#instVars : [
		'children',
		'layoutBuilder'
	],
	#category : #'Roassal2-Core'
}

{ #category : #adding }
RTCompoundElement >> add: anElement [
	children add: anElement.
]

{ #category : #adding }
RTCompoundElement >> addAll: someElements [
	children addAll: someElements
]

{ #category : #adding }
RTCompoundElement >> addedIn: aView [
	super addedIn: aView.
	"aView addAll: children."
	children do: [ :c | c addedIn: aView ].

	self doLayoutIfNecessary.
	self doNesting
]

{ #category : #accessing }
RTCompoundElement >> children [
	"Defensive copy"
	^ children copy
]

{ #category : #'as yet unclassified' }
RTCompoundElement >> doLayoutIfNecessary [
	"Perform a layout on the children elements if necessary."
	layoutBuilder ifNil: [ ^ self ].
	layoutBuilder setUpElements: children
]

{ #category : #'as yet unclassified' }
RTCompoundElement >> doNesting [
	RTNest new on: self nest: children
]

{ #category : #initialization }
RTCompoundElement >> initialize [
	super initialize.
	children := RTGroup new.
	
]

{ #category : #accessing }
RTCompoundElement >> layout [
	"We do a lazy initialization"
	layoutBuilder := RTLayoutBuilder new.
	^ layoutBuilder
]

{ #category : #rendering }
RTCompoundElement >> renderOn: trachelCanvas [
	super renderOn: trachelCanvas.
	children do: [ :c | c renderOn: trachelCanvas ]
]
