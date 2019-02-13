Class {
	#name : #RTVarianceRangeDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'color',
		'x',
		'avg',
		'sd'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #accessing }
RTVarianceRangeDecorator >> avg: anObject [
	avg := anObject
]

{ #category : #accessing }
RTVarianceRangeDecorator >> color [
	^ color
]

{ #category : #accessing }
RTVarianceRangeDecorator >> color: aColor [
	color := aColor.
]

{ #category : #drawing }
RTVarianceRangeDecorator >> pathToString: path [
	^ String
		streamContents: [ :s | 
			path
				do: [ :each | 
					s nextPutAll: each key.
					each value
						ifNotNil: [ s nextPutAll: ''.
							s
								nextPutAll: each value x asString , ' ' , each value y asString ] ] ]
]

{ #category : #drawing }
RTVarianceRangeDecorator >> render [
	| deviationData avgData xData svg k path |
	avgData := self datasets first elements collect: [ :e | (avg value: e model) asFloat ].
	deviationData := self datasets first elements collect: [ :e | (sd value: e model) asFloat ].
	xData := self datasets first elements collect: [ :e | (x value: e model) asFloat ].
	path := OrderedCollection new.
	k := builder getPixelPositionOf: xData first @ (avgData first + deviationData first).
	path add: #M -> k.
	(2 to: deviationData size)
		do: [ :i | 
			| p |
			p := (avgData at: i) + (deviationData at: i).
			k := builder getPixelPositionOf: (xData at: i) @ p.
			path add: #L -> k ].
	k := builder getPixelPositionOf: xData last @ (avgData last - deviationData last).
	path add: #L -> k.
	(1 to: deviationData size - 1)
		reverseDo: [ :i | 
			| p |
			p := (avgData at: i) - (deviationData at: i).
			k := builder getPixelPositionOf: (xData at: i) @ p.
			path add: #L -> k ].
	k := builder getPixelPositionOf: xData first @ (avgData first + deviationData first).
	path add: #L -> k.
	path add: #Z -> nil.
	svg := RTSVGPath new
		color: color;
		borderWidth: 0;
		path: (self pathToString: path);
		element.
	builder view add: svg
]

{ #category : #accessing }
RTVarianceRangeDecorator >> sd: anObject [
	sd := anObject
]

{ #category : #accessing }
RTVarianceRangeDecorator >> x: anObject [
	x := anObject
]
