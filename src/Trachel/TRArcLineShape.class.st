Class {
	#name : #TRArcLineShape,
	#superclass : #TRAbstractLineShape,
	#instVars : [
		'distance',
		'line',
		'normal',
		'alpha',
		'center',
		'radius'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #accessing }
TRArcLineShape >> center [
	^ center
]

{ #category : #private }
TRArcLineShape >> computeCircle [
	| srcMidNormal dstMidNormal |
	line length = 0
		ifTrue: [ ^ self ].
	normal := self normalFor: line.
	alpha := (distance abs / (line length / 2)) arcTan * 2.
	srcMidNormal := self normalFor: (RTLineSegment from: line from to: normal to).
	dstMidNormal := self normalFor: (RTLineSegment from: line to to: normal to).
	center := srcMidNormal intersectLines: dstMidNormal.
	radius := center dist: line from
]

{ #category : #private }
TRArcLineShape >> computePath [
	path := self athensCanvas
		createPath:
			[ :builder | 
			builder
				absolute;
				moveTo: line from.
			distance > 0
				ifTrue: [ builder
						ccwArcTo: normal to angle: alpha;
						ccwArcTo: line to angle: alpha ]
				ifFalse: [ builder
						cwArcTo: normal to angle: alpha;
						cwArcTo: line to angle: alpha ] ]
]

{ #category : #accessing }
TRArcLineShape >> distance: aDistance [
	distance := aDistance.
	self computeCircle
]

{ #category : #drawing }
TRArcLineShape >> drawOn: athensCanvas [
	athensCanvas pathTransform
		restoreAfter:
			[ athensCanvas setShape: self path.
			(athensCanvas setStrokePaint: self themedColor) width: width.
			athensCanvas draw ]
]

{ #category : #accessing }
TRArcLineShape >> encompassingRectangle [
	| mid v |
	mid := line pointForBalance: 0.5.
	v := line vector.
	normal := RTLineSegment from: mid to: mid + (distance * v normal).
	^ Rectangle
		encompassing: (Array with: line from with: line to with: normal to)
]

{ #category : #testing }
TRArcLineShape >> includesPoint: aPoint [
	| angleOne angleTwo anglePoint |
	((aPoint dist: center) - radius) abs < 5
		ifFalse: [ ^ false ].
	angleOne := line from angleWith: center.
	angleTwo := line to angleWith: center.
	anglePoint := aPoint angleWith: center.
	^ (anglePoint between: angleOne and: angleTwo)
		| (anglePoint between: angleTwo and: angleOne)
]

{ #category : #accessing }
TRArcLineShape >> line [
	^ line
]

{ #category : #accessing }
TRArcLineShape >> line: aLine [
	line := aLine
]

{ #category : #accessing }
TRArcLineShape >> normal [
	^ normal
]

{ #category : #private }
TRArcLineShape >> normalFor: aLine [
	| mid v |
	mid := aLine pointForBalance: 0.5.
	v := aLine vector.
	^ RTLineSegment from: mid to: mid + (distance * v normal)
]

{ #category : #accessing }
TRArcLineShape >> radius [
	^ radius
]
