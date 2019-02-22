"
I am a layout for Sunburst Visualization, I use a radius to calculate the better distance of all arcs in the visualization.

You can use radius to set the total radius of sunburst
or use the selector extent:, that uses radius size
"
Class {
	#name : #RTSunburstExtentLayout,
	#superclass : #RTAbstractSunburstLayout,
	#instVars : [
		'wside',
		'roots'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #hook }
RTSunburstExtentLayout >> doInitialize: elements [
	roots := elements.
]

{ #category : #accessing }
RTSunburstExtentLayout >> extent: aPoint [
	wside := aPoint x min: aPoint y
]

{ #category : #initialization }
RTSunburstExtentLayout >> initialize [
	super initialize.
	self extent: 500@500
]

{ #category : #public }
RTSunburstExtentLayout >> layoutSunburst: el [

	| children arc parent depth radius totalPie a b s  auxAngle angleOffset block1 block2 |
	children := el attributes at: builder childrenKey.
	parent := el attributes at: #parent.
	arc := el trachelShape.
	depth := el attributes at: #depth.
	block1 := [ | radius2 |
		depth = 1
			ifTrue: [ parent isNil 
				ifTrue: [ self hasCenter 
					ifTrue: [ radius := 0. radius2 := self radius: 1 ] 
					ifFalse: [ radius := 0. radius2 := 0 ] ]
				ifFalse: [ self hasCenter 
					ifTrue: [ radius := 0. radius2 := self radius: 1 ] 
					ifFalse: [ radius := (self radius: 1)+radialSpacing. radius2 := (self radius: 2)+radialSpacing ] ].
				]
			ifFalse: [ | temp d |
				d := depth - 1.
				(self roots size > 1 and: [ self hasCenter not ]) ifTrue: [ d := depth ].
				temp := self radialSpacing * d.
				radius := (self radius: d) + temp.
				radius2 := (self radius: d+1) + temp ].
		arc
			alphaAngle: arc alphaAngle
			betaAngle: arc betaAngle
			innerRadius: radius
			externalRadius: radius2 ].
	block2 := [ 
		radius := depth = 0 
			ifTrue: [ 0 ] 
			ifFalse: [ parent isNil
				ifTrue: [ self hasCenter ifTrue: [self radius: 1] ifFalse: [0] ]
				ifFalse: [ self hasCenter ifTrue: [0] ifFalse: [self self radius: 1] ] ].
		arc
			alphaAngle: 0
			betaAngle: 360
			innerRadius: 0
			externalRadius: radius ].
		
	depth = 0
		ifTrue: block2
		ifFalse: [ depth = 1 
			ifTrue: [ parent isNil 
				ifTrue: block2
				ifFalse: block1. ]
			ifFalse: block1 ].
	
	children isEmpty ifTrue: [ ^ self ].
	totalPie := builder weightOf: el. 
	auxAngle := arc alphaAngle.
	angleOffset := (arc betaAngle - arc alphaAngle)/totalPie.
	
	children doWithIndex: [ :c :i |
		a := auxAngle.
		b := auxAngle + (angleOffset * (builder weightOf: c)	).
		s := self angularSpacing.
		auxAngle := b.
		(b - a) > s ifTrue: [ 
			depth = 1 
				ifTrue: [ b := b - (s/2). a := a + (s/2) ]
				ifFalse: [ 
					i = 1 
						ifTrue: [ 
							(children size > 1) ifTrue: [b := b - (s/2)] ]
						ifFalse: [ 
							i = children size 
								ifTrue: [ a := a + (s/2) ]
								ifFalse: [ b := b - (s/2). a := a + (s/2) ] ] ] ].
		c trachelShape
			alphaAngle: a
			betaAngle: b
			innerRadius: 0
			externalRadius: 0.
		self layoutSunburst: c.
		 ].
	
]

{ #category : #accessing }
RTSunburstExtentLayout >> radius: depth [
	| w2 maxDepth |
	w2 := wside/2.
	maxDepth := builder maxLevel.
	^ ((depth * w2 * w2) / (maxDepth + 1) ) sqrt
]

{ #category : #accessing }
RTSunburstExtentLayout >> roots [
	^ roots.
]
