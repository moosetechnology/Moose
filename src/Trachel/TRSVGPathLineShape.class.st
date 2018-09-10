Class {
	#name : #TRSVGPathLineShape,
	#superclass : #TRAbstractLineShape,
	#instVars : [
		'pathCommands',
		'from',
		'to'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #private }
TRSVGPathLineShape >> computePath [
	path := self athensCanvas
		createPath: [ :builder | 
			pathCommands
				do: [ :each | builder perform: each first withArguments: each second ] ]
]

{ #category : #accessing }
TRSVGPathLineShape >> encompassingRectangle [
	^ Rectangle encompassing: (Array with: from with: to)
]

{ #category : #accessing }
TRSVGPathLineShape >> from: aPoint [
	from := aPoint
]

{ #category : #accessing }
TRSVGPathLineShape >> from: fromPoint to: toPoint [
	self from: fromPoint.
	self to: toPoint
]

{ #category : #accessing }
TRSVGPathLineShape >> svgPath: aString [
	| converter |
	converter := ASPathConverter new stream: aString readStream.
	pathCommands := converter convertPathData
]

{ #category : #accessing }
TRSVGPathLineShape >> to: aPoint [
	to := aPoint
]
