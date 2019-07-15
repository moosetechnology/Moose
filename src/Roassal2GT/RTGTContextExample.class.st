Class {
	#name : #RTGTContextExample,
	#superclass : #RTObject,
	#category : #'Roassal2GT-Glamour-Context'
}

{ #category : #'as yet unclassified' }
RTGTContextExample >> exampleNoContext [

| v |
v := RTView new.
v addAll: (RTEllipse new size: 20; elementsOn: #(1 2)).
RTHorizontalLineLayout on: v elements.
RTEmptyViewContext setOnView: v.
v

]
