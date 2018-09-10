"
A TRArc is an class that makes all the drawing of arcs
"
Class {
	#name : #TRArcShape,
	#superclass : #TRShape,
	#instVars : [
		'alphaAngle',
		'betaAngle',
		'innerRadius',
		'externalRadius',
		'origin',
		'height',
		'width',
		'topLeft',
		'bottomRight'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #visitor }
TRArcShape >> accept: aVisitor [
	aVisitor visitArcShape: self
]

{ #category : #accessing }
TRArcShape >> alphaAngle [
	^alphaAngle
]

{ #category : #accessing }
TRArcShape >> alphaAngle: angle [
	alphaAngle := angle
]

{ #category : #initialization }
TRArcShape >> alphaAngle: stAngle betaAngle: ndAngle innerRadius: iR externalRadius: eR [
	alphaAngle := stAngle.
	betaAngle := ndAngle.
	innerRadius := iR.
	externalRadius := eR 
	
]

{ #category : #accessing }
TRArcShape >> betaAngle [
	^betaAngle
]

{ #category : #accessing }
TRArcShape >> betaAngle: angle [
	betaAngle := angle
]

{ #category : #accessing }
TRArcShape >> bottomRight [
	^ bottomRight
]

{ #category : #accessing }
TRArcShape >> center [
	^ self encompassingRectangle center
]

{ #category : #hooks }
TRArcShape >> computePath [
	path := TRPlatform current computeArcPathFor: self
]

{ #category : #computing }
TRArcShape >> computeRectangle [
	|aA bA iR eR p1 p2 p3 p4 pR pQ1 pB pQ2 pL pQ3 pT pQ4 pCollection|
	pCollection:= OrderedCollection new.
	aA:= alphaAngle value degreesToRadians.
	bA:= betaAngle value degreesToRadians.
	iR:= innerRadius value.
	eR:= externalRadius value.
	p1:= (iR*aA cos)@((iR*aA sin) negated).
	p2:= (iR*bA cos)@((iR*bA sin) negated).
	p3:= (eR*aA cos)@((eR*aA sin) negated).
	p4:=(eR*bA cos)@((eR*bA sin) negated).
	pR:=(eR*0 cos) @ ((eR*0 sin) negated).
	pQ1:=(eR*(Float pi /4) cos)@((eR*(Float pi /4) sin) negated).
	pB:=(eR*(Float pi /2) cos)@((eR*(Float pi /2) sin) negated).
	pQ2:=(eR*(Float pi * (3/4)) cos)@((eR*(Float pi * (3/4)) sin) negated).
	pL:=(eR*Float pi cos)@((eR*Float pi sin) negated).
	pQ3:=(eR*(Float pi * (5/4)) cos)@((eR*(Float pi * (5/4)) sin) negated).
	pT:=(eR*(Float pi * (3/2)) cos)@((eR*(Float pi * (3/2)) sin) negated).
	pQ4:=(eR*(Float pi * (7/4)) cos)@((eR*(Float pi * (7/4)) sin) negated).
	pCollection add:p1; add: p2; add: p3; add: p4.
	(self includesPoint: pQ1)ifTrue:[pCollection add: pQ1].
	(self includesPoint: pQ2)ifTrue:[pCollection add: pQ2].
	(self includesPoint: pQ3)ifTrue:[pCollection add: pQ3].
	(self includesPoint: pQ4)ifTrue:[pCollection add: pQ4].
	(self includesPoint: pL)ifTrue:[pCollection add: pL].
	(self includesPoint: pR)ifTrue:[pCollection add: pR].
	(self includesPoint: pB)ifTrue:[pCollection add: pB].
	(self includesPoint: pT)ifTrue:[pCollection add: pT].
	
	bottomRight:=(pCollection max x @ pCollection max y) + self position.
	topLeft := (pCollection min x @ pCollection min y) + self position.
	
]

{ #category : #drawing }
TRArcShape >> drawOn: athensCanvas [
	self shouldBeDrawn ifFalse: [ ^ self ].
	athensCanvas pathTransform restoreAfter: [
		athensCanvas pathTransform
				multiplyBy: matrix asFloatTransform.
		athensCanvas
			setPaint: self themedColor;
			drawShape: self path.

		self drawStrokeIfNecessaryOn: athensCanvas
		]
]

{ #category : #drawing }
TRArcShape >> drawStrokeIfNecessaryOn: athensCanvas [
]

{ #category : #accessing }
TRArcShape >> encompassingRectangle [
	self computeRectangle.
	^ topLeft corner: bottomRight
]

{ #category : #accessing }
TRArcShape >> externalRadius [
	^externalRadius  
]

{ #category : #accessing }
TRArcShape >> externalRadius: radius [
	externalRadius := radius
]

{ #category : #accessing }
TRArcShape >> height [
	
	^ self encompassingRectangle height
]

{ #category : #testing }
TRArcShape >> includesPoint: aPoint [
	| pDistanceOrigin pointAngle inside aAngle bAngle thePoint |
	(alphaAngle value = betaAngle value) ifTrue: [ ^ false ].
	inside:=true.
	aAngle := (alphaAngle value % 360 = 0 ) 
		ifFalse: [ alphaAngle value \\  360 ]
		ifTrue: [ alphaAngle value ].
	bAngle := (betaAngle value % 360 = 0 )
		ifFalse: [ betaAngle value \\  360 ]
		ifTrue: [ betaAngle value ].
	thePoint := aPoint - self position.
	pointAngle:= (thePoint angleWith: 0@0) radiansToDegrees \\  360.
	pDistanceOrigin := (thePoint squaredDistanceTo: 0@0) sqrt.
	((pDistanceOrigin < innerRadius value) or: (pDistanceOrigin > externalRadius value))
		ifTrue: [ ^ false ].
	(pointAngle % 360 = 0 )
		ifTrue:[
			(aAngle % 360 = 0) ifTrue: [^ true ].
			(bAngle % 360 = 0) ifTrue: [ ^ true ] ].
	(aAngle < bAngle)
	ifTrue:[
		(pointAngle >= aAngle) ifTrue:[ inside:=inside not ].
		(pointAngle <= bAngle) ifTrue:[ inside:=inside not ] ]
	ifFalse:[
		(bAngle = 0) ifTrue:[bAngle:=360].
		(pointAngle <= aAngle) ifTrue:[ inside:=inside not ].
		(pointAngle <= bAngle) ifTrue:[ inside:=inside not ] ].
	^ inside
]

{ #category : #initialization }
TRArcShape >> initialize [
	super initialize.
	height := 0.
	width := 0.
	externalRadius := 0.
	innerRadius := 0.
	alphaAngle := 0.
	betaAngle := 0
]

{ #category : #accessing }
TRArcShape >> innerRadius [
	^innerRadius 
]

{ #category : #accessing }
TRArcShape >> innerRadius: radius [
	innerRadius := radius
]

{ #category : #accessing }
TRArcShape >> topLeft [
	^ topLeft
]

{ #category : #accessing }
TRArcShape >> width [
	
	^ self encompassingRectangle width
]
