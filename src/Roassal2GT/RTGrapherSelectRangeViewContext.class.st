"
Define a range for GT

-=-=-=
g := RTGrapher new.
g view: RTView new.
ds := RTData new.
ds dotShape color: Color blue trans.
ds points: RTShape withAllSubclasses.
ds y: [ :cls | cls numberOfMethods - 50 ].
ds x: [ :cls | cls numberOfLinesOfCode - 150 ].
g add: ds.

RTGrapherSelectRangeViewContext onGrapher: g callback: [ :elements |  (g view attributeAt: #presentation) selection: elements ].

g 
-=-=-=

"
Class {
	#name : #RTGrapherSelectRangeViewContext,
	#superclass : #RTAbstractViewContext,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #public }
RTGrapherSelectRangeViewContext class >> onGrapher: aGrapher [

	"We need to make sure that the view knows about the grapher"
	aGrapher view attributeAt: #grapher put: aGrapher.
	aGrapher addDecorator: (RTRangeSelector new)
]

{ #category : #public }
RTGrapherSelectRangeViewContext class >> onGrapher: aGrapher callback: aOneArgBlock [
	self setOnView: aGrapher view.
	"We need to make sure that the view knows about the grapher"
	aGrapher view attributeAt: #grapher put: aGrapher.
	aGrapher addDecorator: (RTRangeSelector new callback: aOneArgBlock)
]

{ #category : #hooks }
RTGrapherSelectRangeViewContext >> interactionsToBeRegistered [
	^ Array with: RTGrapherSelectRangeContextInteraction with: RTResizeableViewContextInteraction "with: RTSelectableElementsContextInteraction" 
]
