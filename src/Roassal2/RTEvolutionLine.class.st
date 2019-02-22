"
I am a simple object that has values in a timeline
"
Class {
	#name : #RTEvolutionLine,
	#superclass : #RTObject,
	#instVars : [
		'xvalue',
		'timeline',
		'yvalue',
		'afterBlock'
	],
	#category : #'Roassal2-Builder-DSM'
}

{ #category : #accessing }
RTEvolutionLine >> afterBlock [
	^ afterBlock
]

{ #category : #accessing }
RTEvolutionLine >> afterBlock: ablockWith1arg [
	afterBlock := ablockWith1arg
]

{ #category : #ui }
RTEvolutionLine >> gtEvolutionGraphIn: composite [
	<gtInspectorPresentationOrder: -10>
	| b ds |
	^ composite roassal2 
		title: 'Plot';
		initializeView: [ 
			b := RTGrapher new.
			b extent: 300@ 200.
			
			ds := RTData new.
			ds points: self timeline.
			ds x: [ :assoc | self timeline indexOf: assoc ].
			ds y: [ :assoc | assoc value ].
			ds connectUsing: (RTLine new color: Color blue).
			b add: ds.
			
			b axisX 
				labelRotation: -30;
				labelConversion: [ :n | n isZero
					ifTrue: ['']
					ifFalse: [ (self timeline at: n) key ] ];
				numberOfLabels: self timeline size.
			b axisY
				title: self value.
			b build.
			b view ]
]

{ #category : #ui }
RTEvolutionLine >> gtRelativeEvolutionGraphIn: composite [
	<gtInspectorPresentationOrder: -20>
	^ composite roassal2 
		title: 'Relative Plot';
		initializeView: [ self roassalView ]
]

{ #category : #accessing }
RTEvolutionLine >> key [
	^ xvalue
]

{ #category : #printing }
RTEvolutionLine >> printOn: stream [
	stream print: xvalue; nextPutAll: '->'; print: yvalue 
]

{ #category : #ui }
RTEvolutionLine >> roassalView [
	| min max temp x round b ds |
	self timeline
		ifNil: [ ^ RTView new
			add: (RTLabel elementOn: 'No applicable');
			yourself ].
	b := RTGrapher new.
	x := self timeline size < 20
		ifTrue: [ 400 ] 
		ifFalse: [ self timeline size / 5 * 100 ].
	b extent: x @ 300.
	temp := self timeline collect: #value.
	min := temp min.
	max := temp max.
	ds := RTData new.
	ds points: self timeline.
	ds x: [ :assoc | self timeline indexOf: assoc ].
	ds y: [ :assoc | assoc value - min ].
	ds connectUsing: (RTLine new color: Color blue).
	b add: ds.
	b axisX
		labelRotation: -30;
		labelConversion: [ :n | 
			n isZero
				ifTrue: [ '' ]
				ifFalse: [ (self timeline at: n) key ] ];
		numberOfLabels: self timeline size.
	round := (max - min) abs < 1
		ifTrue: [ 5 ]
		ifFalse: [ 1 ].
	b axisY
		labelConversion: [ :aValue | aValue + min round: round ];
		title: self value value.
	self afterBlock ifNotNil: [ self afterBlock value: b.  ].
	
	b view @ RTZoomableBoxView.
	^ b
]

{ #category : #accessing }
RTEvolutionLine >> score [
	| score |
	timeline ifNil: [ ^ nil ].
	score := (timeline last value - timeline first value)/timeline first value.
	^ score
]

{ #category : #accessing }
RTEvolutionLine >> timeline [
	^ timeline
]

{ #category : #accessing }
RTEvolutionLine >> timeline: anArray [
	anArray ifNil: [ ^ self ].
	timeline := anArray
]

{ #category : #accessing }
RTEvolutionLine >> value [
	^ yvalue
]

{ #category : #accessing }
RTEvolutionLine >> xvalue [
	^ xvalue
]

{ #category : #accessing }
RTEvolutionLine >> xvalue: anObject [
	xvalue := anObject
]

{ #category : #accessing }
RTEvolutionLine >> yvalue [
	^ yvalue
]

{ #category : #accessing }
RTEvolutionLine >> yvalue: anObject [
	yvalue := anObject
]
