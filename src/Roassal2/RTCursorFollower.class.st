"
A decorator that add lines that follow the mouse cursor
-=-=-=-=

| b ds |
b := RTGrapher new.

ds := RTDataSet new.
ds points: #(5 10 6 2 -2.5).
b add: ds.

b addDecorator: RTCursorFollower new.
b build.
^ b view
-=-=-=-=
"
Class {
	#name : #RTCursorFollower,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'lineH',
		'canvas',
		'lineV',
		'labelH',
		'labelV',
		'labelXTextConvertion',
		'labelYTextConvertion',
		'color'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #accessing }
RTCursorFollower >> color [
	^ color
]

{ #category : #accessing }
RTCursorFollower >> color: aColor [
	color := aColor
]

{ #category : #createLinesAndLabels }
RTCursorFollower >> createLinesAndLabelsIfNecessary [
	lineH
		ifNil: [ 
			lineH := TRLineShape new.
			lineH color: color.
			canvas := builder view canvas.
			canvas addShape: lineH.
			lineV := TRLineShape new.
			canvas addShape: lineV.
			
			labelH := TRLabelShape new.
			labelH color: color.
			canvas addShape: labelH.
			labelV := TRLabelShape new.
			labelV color: color.
			canvas addShape: labelV. ]
]

{ #category : #configuration }
RTCursorFollower >> defaultColor [
	^ Color gray
]

{ #category : #drawing }
RTCursorFollower >> getLabelXValueFor: pp [
	^ (labelXTextConvertion rtValue: pp x) asString
]

{ #category : #drawing }
RTCursorFollower >> getLabelYValueFor: pp [
	^ (labelYTextConvertion rtValue: pp y negated) asString
]

{ #category : #drawing }
RTCursorFollower >> getPositionFromPixel: p [
	^ builder getPositionFromPixelPosition: (self convertPointForGraph: p)
]

{ #category : #initialization }
RTCursorFollower >> initialize [
	super initialize.
	labelXTextConvertion := [ :v | v round: 2 ].
	labelYTextConvertion := [ :v | v round: 2 ].
	color := self defaultColor
]

{ #category : #accessing }
RTCursorFollower >> labelXTextConvertion [
	^ labelXTextConvertion
]

{ #category : #accessing }
RTCursorFollower >> labelXTextConvertion: aOneArgBlock [
	labelXTextConvertion := aOneArgBlock
]

{ #category : #accessing }
RTCursorFollower >> labelYTextConvertion [
	^ labelYTextConvertion
]

{ #category : #accessing }
RTCursorFollower >> labelYTextConvertion: aOneArgBlock [
	labelYTextConvertion := aOneArgBlock
]

{ #category : #createLinesAndLabels }
RTCursorFollower >> removeLinesAndLabelsIfNecessary [
	lineH notNil
		ifTrue: [ 
			lineH remove.
			lineV remove.
			labelH remove.
			labelV remove.
			self updateCanvas.
			lineH := nil.
			lineV := nil.
			labelH := nil.
			labelV := nil ]
]

{ #category : #drawing }
RTCursorFollower >> render [
	| p pp |
	builder view
		when: TRMouseMove
		do: [ :evt | 
			p := evt position.
			(self isPointOverTheBuilder: p)
				ifTrue: [ 
					self createLinesAndLabelsIfNecessary.
					lineH from: 0 @ p y to: builder extent x @ p y.
					lineV from: p x @ 0 to: p x @ builder extent y negated.
					pp := self getPositionFromPixel: p.
					labelV text: (self getLabelXValueFor: pp).
					labelV translateTo: p x @ builder extent y negated.
					labelH text: (self getLabelYValueFor: pp).
					labelH translateTo: builder extent x @ p y.
					self updateCanvas ]
				ifFalse: [ self removeLinesAndLabelsIfNecessary ] ]
]

{ #category : #createLinesAndLabels }
RTCursorFollower >> updateCanvas [
	canvas signalUpdate
]
