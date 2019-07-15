Class {
	#name : #RTSmallMultipleSingleScript,
	#superclass : #RTUsefulScript,
	#instVars : [
		'dic',
		'view',
		'scale',
		'sortX',
		'sortY',
		'objectsY',
		'objectsX'
	],
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTSmallMultipleSingleScript >> buildMatrix [
	| b |
	b := RTGradualDSM new.
	b view: view.

	"objectsX and objectsY refers to a dictionary in which the key is the string contained in a column,
	and values is an array containing the connections"
	objectsY := dic associations groupedBy: [ :ass | ass key key ].
	objectsX := dic associations groupedBy: [ :ass | ass key value ].
	
	b objectsY: ((objectsY associations sortedAs: sortX) asArray collect: #key).
	b objectsX: ((objectsX associations sortedAs: sortY) asArray collect: #key).
	
	b score: [ :assoc | scale rtValue: (dic at: assoc ifAbsent: [ 0 ]) ].
	b build.
	view signalUpdate 
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> buildMenu [

	| mb |
	mb := RTMenuBuilder new.
	mb view: view.
	
	mb menu: 'scale' submenu: 'linear' background: Color red trans
			callback: [ scale := #yourself. self clearView. self buildMatrix ].
			
	mb menu: 'scale' submenu: 'sqrt' background: Color red trans
			callback: [ scale := #sqrt. self clearView. self buildMatrix ].

	mb menu: 'scale' submenu: 'log' background: Color red trans
			callback: [ scale := [ :value | (value + 1) log * 5 ] . self clearView. self buildMatrix ].

	mb menu: 'sorting' submenu: 'X-Name' background: Color red trans
			callback: [ sortX := [ :assoc | assoc key ]. self clearView. self buildMatrix ].
	mb menu: 'sorting' submenu: 'Y-Name' background: Color red trans
			callback: [ sortY := [ :assoc | assoc key ]. self clearView. self buildMatrix ].

	mb menu: 'sorting' submenu: 'X-amount of connections' background: Color red trans
			callback: [ sortX := [ :assoc | assoc value size ]. self clearView. self buildMatrix ].
	mb menu: 'sorting' submenu: 'Y-amount of connections' background: Color red trans
			callback: [ sortY := [ :assoc | assoc value size ]. self clearView. self buildMatrix ].

	mb menu: 'sorting' submenu: 'X-sum weight' background: Color red trans
			callback: [ sortX := [ :assoc | (assoc value collect: [ :as | as value value ]) sum ]. self clearView. self buildMatrix ].
	mb menu: 'sorting' submenu: 'Y-sum weight' background: Color red trans
			callback: [ sortY := [ :assoc | (assoc value collect: [ :as | as value value ]) sum ]. self clearView. self buildMatrix ].
		
	mb build.
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> buildView [
	view := RTView new.
	view @ RTDraggableView @ RTDoubleScrollBar
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> clearView [

	(view elements select: [ :e | e isFixed not ]) remove
]

{ #category : #accessing }
RTSmallMultipleSingleScript >> description [
	^ 
'Visualize a TSV file (like a CSV file but with tabulation instead of comma) as a matrix.
The file should have 4 columns: time<TAB>n1<TAB>n2<TAB>weight.
time is an integer value. It could represent a time period.
n1 and n2 are string values. 
weight is a float value.'
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> execute [
	<script: 'RTSmallMultipleSingleScript new execute'>
	dic := self loadData.
	self buildView.
	self buildMatrix.
	self buildMenu.
	self inspectView
]

{ #category : #initialization }
RTSmallMultipleSingleScript >> initialize [
	super initialize.
	scale := #yourself.
	sortX := [ :assoc | assoc key ].
	sortY := [ :assoc | assoc key ]
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> inspectView [
	view inspect
]

{ #category : #hooks }
RTSmallMultipleSingleScript >> label [
	^ 'CSV as Small Multiple (All time slices in one)'
]

{ #category : #util }
RTSmallMultipleSingleScript >> loadData [

	| dc tab |
	dc := Dictionary new.
	tab := RTTabTable openTSVfile.
	tab ifNil: [ ^ self ].
	
	tab values do: [ :line|
		| a |
		a := line third -> line second.
		dc at: a ifAbsentPut: [ 0 ].
		dc at: a put: (dc at: a) + 1 ].
	
	^ dc
]
