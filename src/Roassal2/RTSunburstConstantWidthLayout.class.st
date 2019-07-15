"
I am a layout for sunburst visualization,

I put the arcs in a constant delta separation, you can define the center width.
"
Class {
	#name : #RTSunburstConstantWidthLayout,
	#superclass : #RTAbstractSunburstLayout,
	#instVars : [
		'arcWidth',
		'centerWidth'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #accesing }
RTSunburstConstantWidthLayout >> arcWidth [
	^ arcWidth
]

{ #category : #accesing }
RTSunburstConstantWidthLayout >> arcWidth: aNumber [
	arcWidth := aNumber
]

{ #category : #accesing }
RTSunburstConstantWidthLayout >> centerWidth [
	^ centerWidth
]

{ #category : #accesing }
RTSunburstConstantWidthLayout >> centerWidth: anObject [
	centerWidth := anObject
]

{ #category : #initialization }
RTSunburstConstantWidthLayout >> initialize [
	super initialize.
	self arcWidth: 50.
	self centerWidth: 50.
]

{ #category : #public }
RTSunburstConstantWidthLayout >> layoutSunburst: el [

	| children arc parent depth radius totalPie a b s  auxAngle angleOffset block1 block2 |
	children := el attributes at: builder childrenKey.
	parent := el attributes at: #parent.
	arc := el trachelShape.
	depth := el attributes at: #depth.
	block1 := [ | radius2 |
		depth = 1
			ifTrue: [ parent isNil 
				ifTrue: [ self hasCenter 
					ifTrue: [ radius := 0. radius2 := self centerWidth ] 
					ifFalse: [ radius := 0. radius2 := 0 ] ]
				ifFalse: [ self hasCenter 
					ifTrue: [ radius := 0. radius2 := self centerWidth ] 
					ifFalse: [ radius := self centerWidth+radialSpacing. radius2 := radius + self arcWidth ] ].
				]
			ifFalse: [ 
				radius := ((depth = 2 and: [ (parent attributes at: #parent) isNil ])
					ifTrue: [ self centerWidth ]
					ifFalse: [ parent trachelShape externalRadius  ]) + self radialSpacing.
				radius2 := radius + self arcWidth ].
		arc
			alphaAngle: arc alphaAngle
			betaAngle: arc betaAngle
			innerRadius: radius
			externalRadius: radius2 ].
	block2 := [ 
		radius := depth = 0 
			ifTrue: [ 0 ] 
			ifFalse: [ parent isNil
				ifTrue: [ self hasCenter ifTrue: [self centerWidth] ifFalse: [0] ]
				ifFalse: [ self hasCenter ifTrue: [0] ifFalse: [self centerWidth] ] ].
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
