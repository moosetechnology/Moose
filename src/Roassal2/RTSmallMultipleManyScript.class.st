Class {
	#name : #RTSmallMultipleManyScript,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTSmallMultipleManyScript >> description [
	^ 
'Visualize a TSV file (like a CSV file but with tabulation instead of comma) as a matrix.
The file should have 4 columns: time<TAB>n1<TAB>n2<TAB>weight.
time is an integer value. It could represent a time period.
n1 and n2 are string values. 
weight is a float value.

Each time slice is represented as a matrix.'
]

{ #category : #hooks }
RTSmallMultipleManyScript >> execute [
	<script: 'RTSmallMultipleManyScript new execute'>
	
	| b times c tab |
	times := OrderedCollection new.
	tab := RTTabTable openTSVfile.
	tab ifNil: [ ^ self ].
	tab values do: [ :line | | k dic a |
		k := line first max: 1.
		times at: k ifAbsentPut: [ Dictionary new ].
		dic := times at: k.
		a := line third -> line second.
		dic at: a ifAbsentPut: [ 0 ].
		dic at: a put: (dic at: a)+1. ].

	c := RTComposer new.
	times doWithIndex: [ :dic :index |
		dic ifNotNil: [ 
			b := RTGradualDSM new.
			b view: c view.
			b objectsY: (dic keys collect: #key) asSet asArray sorted.
			b objectsX: (dic keys collect: #value) asSet asArray sorted.
			b score: [ :assoc |
				dic at: assoc ifAbsent: [ 0 ] ].
			b build.

			c group: index asString asSymbol.
		]
	].

	c layout: RTCellLayout new.
	
	"We highlight only cells that are actually not gray (i.e., have a green component = 0)"
	c propagateHighlightUsing: [ :el | 
		(el trachelShape color green > 0)
			ifTrue: [ #() ]
			ifFalse: [ (el view elementsFromModel: el model) select: [ :ee | ee trachelShape color green = 0 ] ] ].
	c view inspect
]

{ #category : #hooks }
RTSmallMultipleManyScript >> label [
	^ 'CSV as Small Multiple (Each time slice as a matrix)'
]
