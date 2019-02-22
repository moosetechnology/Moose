Class {
	#name : #RTMicroprint,
	#superclass : #RTBuilder,
	#instVars : [
		'nbOfHorizontal',
		'rules'
	],
	#category : #'Roassal2-Builder-Microprint'
}

{ #category : #'as yet unclassified' }
RTMicroprint >> createView [
	^ RTView new @ RTDraggableView
]

{ #category : #'as yet unclassified' }
RTMicroprint >> example01 [
	<gtExample>
	<noTest>
	| b |
	b := RTMicroprint new.
	b lineMatching: '*view*' color: Color red trans.
	b lineMatching: '*roassal*' color: Color green trans.
	b lineMatching: '*shape*' color: Color blue trans.
	b texts: (RTBuilder methods collect: #sourceCode).
	^ b
]

{ #category : #'as yet unclassified' }
RTMicroprint >> initialize [
	super initialize.
	rules := OrderedCollection new.
	nbOfHorizontal := 5.
]

{ #category : #'as yet unclassified' }
RTMicroprint >> lineMatching: pattern color: aColor [
	rules add: pattern -> aColor
]

{ #category : #accessing }
RTMicroprint >> nbOfHorizontal [
	^ nbOfHorizontal
]

{ #category : #accessing }
RTMicroprint >> nbOfHorizontal: anObject [
	nbOfHorizontal := anObject
]

{ #category : #'as yet unclassified' }
RTMicroprint >> texts: someTexts [
	| aShape aRoassalLine |
	aShape := RTBox new.
	aShape width: [ :aText | (aText lines collect: #size) max ]. 
	aShape height: [ :aText | aText lines size ].
	view addAll: (aShape elementsOn: someTexts).
	view elements @ RTPopup.
	RTGridLayout new
		lineItemsCount: nbOfHorizontal;
		on: view elements.
	
	view elements do: [ :e |
		e model lines doWithIndex: [ :aLine :index | 
			rules do: [ :as |
				(as key match: aLine) ifTrue: [ 
					aRoassalLine := RTBox new color: as value; width: e encompassingRectangle width; height: 2; elementOn: aLine.
					view add: aRoassalLine.
					aRoassalLine @ RTPopup.
					aRoassalLine translateTo: e position + (0 @ (index - (e encompassingRectangle height / 2)))
				] ] 
		]
	]
]
