"
RTMultiGrapher allows for supporting several graphs in the same physical location.

Here is an example:
-=-=-=
|g g1 g2 ds1 ds2|
g := RTMultiGrapher new.

g1 := RTGrapher new.
ds1 := RTData new.
ds1 label: 'Red'.
ds1 dotShape color: Color red.
ds1 connectColor: Color red.
ds1 points: ((1 to: 10) collect: [ :each | 20 atRandom ]).
ds1 interaction highlightDataset: Color black.
g1 add: ds1.

g2 := RTGrapher new.
ds2 := RTData new.
ds2 label: 'Blue'.
ds2 dotShape color: Color blue.
ds2 connectColor: Color blue.
ds2 points: ((1 to: 10) collect: [ :each | 1000 atRandom ]).
ds2 interaction highlightDataset: Color purple.
g2 add: ds2.

g1 axisY
	title: 'y 1';
	color: Color red.
	
g2 axisY
	title: 'y 2';
	color: Color blue.

g add: g1.
g add: g2.
g legend.

^ g
-=-=-=
"
Class {
	#name : #RTMultiGrapher,
	#superclass : #RTBuilder,
	#instVars : [
		'graphers',
		'legendBuilder',
		'yOffset',
		'extent'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #adding }
RTMultiGrapher >> add: aGrapher [
	graphers add: aGrapher
]

{ #category : #accessing }
RTMultiGrapher >> extent [
	^ extent
]

{ #category : #accessing }
RTMultiGrapher >> extent: anObject [
	extent := anObject
]

{ #category : #initialization }
RTMultiGrapher >> initialize [
	super initialize.
	graphers := OrderedCollection new.
	yOffset := 70.
	extent := 300 @ 200
]

{ #category : #accessing }
RTMultiGrapher >> legend [
	^ legendBuilder ifNil: [ legendBuilder := RTLegendBuilder new ]
]

{ #category : #hooks }
RTMultiGrapher >> renderIn: aView [
	graphers
		withIndexDo: [ :each :i | 
			each yOffset: (i - 1) * yOffset.
			each build.
			aView addFromView: each view ].
	legendBuilder
		ifNotNil: [ graphers
				do: [ :each | 
					each legend: legendBuilder.
					each renderLegend ].
			aView addFromView: legendBuilder view.
			graphers do: #inferLegendInteractions ]
]
