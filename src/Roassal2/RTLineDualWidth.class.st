"
I am a line with different sizes in each side.

Here is an example:
-=-=-=
	| view box e1 e2 l |
    view := RTView new.
    view @ RTDraggableView.
    box := RTBox new size: 20.
    e1 := box element.
    e2 := box element.
    e2 translateTo: 40 @ 20.
    l := RTLineDualWidth new
        widthFrom: [:edge | 2];
        widthTo: [:edge | 1];
        color: Color red;
        withShorterDistanceAttachPoint;
        yourself.
    e1 @ RTDraggable.
    e2 @ RTDraggable.
    view
        add: e1;
        add: e2;
        add: (l edgeFrom: e1 to: e2).
    view 
-=-=-=

Another example:
-=-=-=-=
""This visualization shows dependencies between Monticello packages""
pak := RPackageOrganizer default packages select: [ :p | 'Metacell*' match: p name ].

b := RTMondrian new.
b shape circle withTextAbove: #packageName.
b nodes: pak.

b shape lineDualWidth 
	color: Color blue trans; 
	withShorterDistanceAttachPoint;
	widthFrom: [ :anEdge | (anEdge from model numberOfDependenciesToward: anEdge to model) sqrt  * 4];
	widthTo: [ :anEdge | (anEdge to model numberOfDependenciesToward: anEdge from model) sqrt * 4].

b edges 
	noRepetition; noBidirectional;
	connectToAll: #dependentPackages.
b layout circle.

b normalizer normalizeSize: #numberOfClasses using: #sqrt.
b
-=-=-=-=
"
Class {
	#name : #RTLineDualWidth,
	#superclass : #RTSVGPathLine,
	#instVars : [
		'widthFrom',
		'widthTo'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #examples }
RTLineDualWidth class >> example01 [
	<noTest>
	| view box e1 e2 l |
	view := RTView new.
	view @ RTDraggableView.
	box := RTBox new size: 20.
	e1 := box element.
	e2 := box element.
	e2 translateTo: 40 @ 20.
	l := RTLineDualWidth new
		widthFrom: 10;
		widthTo: 5;
		color: Color red;
		withShorterDistanceAttachPoint;
		yourself.
	e1 @ RTDraggable.
	e2 @ RTDraggable.
	view
		add: e1;
		add: e2;
		add: (l edgeFrom: e1 to: e2).
	view inspect
]

{ #category : #initialization }
RTLineDualWidth >> initialize [
	super initialize.
	self widthFrom: 1; widthTo: 1.
]

{ #category : #initialization }
RTLineDualWidth >> pathFor: anEdge and: trachelShape [
	"this methods is just to avoid recalculate ending point and starting point"

	| from to point side w1 w2 e dist sc z first |
	e := 0.001.
	^ String
		streamContents: [ :s | 
			"Setting values"
			from := trachelShape from.
			to := trachelShape to.
			w1 := widthTo rtValue: anEdge.
			w2 := widthFrom rtValue: anEdge.
			w1 := w1 max: e.
			w2 := w2 max: e.
			dist := from distanceTo: to.
			dist := dist max: e.
			z := (w1 + w2) / 2.
			z > dist
				ifTrue: [ sc := RTScale linear
						domain: (Array with: 0 with: z + (z * 0.1));
						range: (Array with: 0 with: dist).
					w1 := sc scale: w1.
					w2 := sc scale: w2 ].
			"creating utility blocks"
			point := [ :p | 
			s
				nextPutAll: p x asFloat asString;
				space;
				nextPutAll: p y asFloat asString;
				space ].
			side := [ :vector :end :size | 
				| left right u unit middle l r |
				u := vector normal.
				unit := vector / (vector r max: 0.001).
				middle := end - (unit * size).
				left := middle - (u * size).
				l := end - (u * size).
				right := middle + (u * size).
				r := end + (u * size).
				s nextPutAll: (first ifTrue: [ 'M ' ] ifFalse: [ 'L' ]).
				point value: left.
				s nextPutAll: 'C '.
				point value: left.
				point value: l.
				point value: end.
				s nextPutAll: 'C '.
				point value: end.
				point value: r.
				point value: right. ].
			"this creates the line"
			first := true.
			side value: to - from value: to value: w1 / 2.
			first := false.
			side value: from - to value: from value: w2 / 2.
			s nextPutAll: 'Z' ]
]

{ #category : #rendering }
RTLineDualWidth >> updateFor: edge trachelShape: trachelShape [
	trachelShape 
		from: (attachPoint startingPointOf: edge) to: (attachPoint endingPointOf: edge);
		resetPath;
		strokePaint: Color transparent;
		color: (self colorFor: edge);
		width: 0;
		svgPath: (self pathFor: edge and: trachelShape).
]

{ #category : #initialization }
RTLineDualWidth >> widthFrom [
	^ widthFrom
]

{ #category : #initialization }
RTLineDualWidth >> widthFrom: aNumber [
	widthFrom := aNumber
	
]

{ #category : #initialization }
RTLineDualWidth >> widthTo [
	^ widthTo
]

{ #category : #initialization }
RTLineDualWidth >> widthTo: aNumber [
	widthTo := aNumber
	
]
