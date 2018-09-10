"
A TRArcShapeTest is a test class for testing the behavior of TRArcShape
"
Class {
	#name : #TRArcShapeTest,
	#superclass : #TRTest,
	#instVars : [
		'arc1',
		'arc2',
		'arc3',
		'arc4',
		'arc5',
		'p1',
		'p2',
		'p3',
		'p4',
		'p5',
		'p6',
		'p7',
		'p8',
		'p1n',
		'p2n',
		'p3n',
		'p4n',
		'p5n',
		'p6n',
		'p7n',
		'p8n',
		'arcQ1',
		'arcQ2',
		'arcQ3',
		'arcQ4',
		'pR',
		'pB',
		'pL',
		'pT',
		'pQ1',
		'pQ2',
		'pQ3',
		'pQ4'
	],
	#category : #'Trachel-Tests'
}

{ #category : #running }
TRArcShapeTest >> setUp [
	super setUp.
	arc1:=TRArcShape new.
	arc2:=TRArcShape new.
	arc3:=TRArcShape new.
	arc4:=TRArcShape new.
	arc5:=TRArcShape new.
	arcQ1:=TRArcShape new.
	arcQ2:=TRArcShape new.
	arcQ3:=TRArcShape new.
	arcQ4:=TRArcShape new.
	arc1 alphaAngle: 0 betaAngle: 360 innerRadius:  0 externalRadius:  100.
	arc2 alphaAngle: 30 betaAngle: 60 innerRadius:  50 externalRadius:  50.
	arc3 alphaAngle: 0 betaAngle:  90 innerRadius:  2 sqrt externalRadius: 2 sqrt.
	arc4 alphaAngle:180 betaAngle: 270 innerRadius: 50 externalRadius:150.
	arc5 alphaAngle:0 betaAngle: 270 innerRadius: 50 externalRadius:150.
	arcQ1 alphaAngle: 0 betaAngle: 90 innerRadius:  0 externalRadius:  100.
	arcQ2 alphaAngle: 90 betaAngle: 180 innerRadius:  0 externalRadius:  100.
	arcQ3 alphaAngle: 180 betaAngle: 270 innerRadius:  0 externalRadius:  100.
	arcQ4 alphaAngle: 270 betaAngle: 360 innerRadius:  0 externalRadius:  100.
	pR:=100 @ 0.
	pB:=0 @ 100.
	pL:=-100 @ 0.
	pT:=0 @ -100.
	pQ1:=50 @ 50.
	pQ2:=-50 @ 50.
	pQ3:=-50 @ -50.
	pQ4:=50 @ -50.
	p1:= 0 @ 0.
	p2:=100 @ 100.
	p3:=50 @ 50.
	p4:= 0 @ 150.
	p5:=1 @ -1.
	p6:=0 @ -100.
	p7:=-100 @ 0.
	p8:=-100 @ 100.
	p1n:=p1 negated.
	p2n:=p2 negated.
	p3n:=p3 negated.
	p4n:= p4 negated.
	p5n:=p5 negated.
	p6n:=p6 negated.
	p7n:=p7 negated.
	p8n:=p8 negated.
]

{ #category : #'basic tests' }
TRArcShapeTest >> testEncompassingRectangle [
	self assert: (arc1 encompassingRectangle = ((-100.0@ -100.0) corner: (100.0@100.0))).
	self assert: (arc1 encompassingRectangle width abs = 200).
	self assert:(arc2 encompassingRectangle width abs < 50).  
	self assert:(arc2 encompassingRectangle height abs < 50).
	self assert: (arc3 encompassingRectangle height abs= 2 sqrt).
	self assert: (((arc4 encompassingRectangle height abs) roundDownTo: 1 )= 150). 
	self assert: (((arc4 encompassingRectangle width abs) roundDownTo: 1 )= 150). 
	self assert: (arc5 encompassingRectangle width abs= 300).
	self assert: (arc5 encompassingRectangle height abs= 300).
]

{ #category : #'basic tests' }
TRArcShapeTest >> testIncludesPoint [	
	self assert: (arc1 includesPoint: p1).
	self deny: (arc1 includesPoint: p2).
	self assert: (arc1 includesPoint: p3).
	self deny: (arc1 includesPoint: p4).
	self assert: (arc1 includesPoint: p5).	
	self assert: (arc1 includesPoint: p6).
	self assert: (arc1 includesPoint: p7).
	self deny: (arc1 includesPoint: p8).
	self assert: (arc1 includesPoint: p1n).
	self deny: (arc1 includesPoint: p2n).
	self assert: (arc1 includesPoint: p3n).
	self deny: (arc1 includesPoint: p4n).
	self assert: (arc1 includesPoint: p5n).	
	self assert: (arc1 includesPoint: p6n).
	self assert: (arc1 includesPoint: p7n).
	self deny: (arc1 includesPoint: p8n).
	
	self deny: (arc2 includesPoint: p1).
	self deny: (arc2 includesPoint: p2).
	self deny: (arc2 includesPoint: p3).
	self deny: (arc2 includesPoint: p4).
	self deny: (arc2 includesPoint: p5).	
	self deny: (arc2 includesPoint: p6).
	self deny: (arc2 includesPoint: p7).
	self deny: (arc2 includesPoint: p8).
	self deny: (arc2 includesPoint: p1n).
	self deny: (arc2 includesPoint: p2n).
	self deny: (arc2 includesPoint: p3n).
	self deny: (arc2 includesPoint: p4n).
	self deny: (arc2 includesPoint: p5n).	
	self deny: (arc2 includesPoint: p6n).
	self deny: (arc2 includesPoint: p7n).
	self deny: (arc2 includesPoint: p8n).
	
	self deny: (arc3 includesPoint: p1).
	self deny: (arc3 includesPoint: p2).
	self deny: (arc3 includesPoint: p3).
	self deny: (arc3 includesPoint: p4).
	self assert: (arc3 includesPoint: p5).
	self deny: (arc3 includesPoint: p6).
	self deny: (arc3 includesPoint: p7).
	self deny: (arc3 includesPoint: p8).
	self deny: (arc3 includesPoint: p1n).
	self deny: (arc3 includesPoint: p2n).
	self deny: (arc3 includesPoint: p3n).
	self deny: (arc3 includesPoint: p4n).
	self deny: (arc3 includesPoint: p5n).
	self deny: (arc3 includesPoint: p6n).
	self deny: (arc3 includesPoint: p7n).
	self deny: (arc3 includesPoint: p8n).
	
	self deny: (arc4 includesPoint: p1).
	self deny: (arc4 includesPoint: p2).
	self deny: (arc4 includesPoint: p3).
	self assert: (arc4 includesPoint: p4).
	self deny: (arc4 includesPoint: p5).	
	self deny: (arc4 includesPoint: p6).
	self assert:(arc4 includesPoint: p7).
	self assert:(arc4 includesPoint: p8).
	self deny: (arc4 includesPoint: p1n).
	self deny: (arc4 includesPoint: p2n).
	self deny: (arc4 includesPoint: p3n).
	self deny: (arc4 includesPoint: p4n).
	self deny: (arc4 includesPoint: p5n).	
	self assert: (arc4 includesPoint: p6n).
	self deny: (arc4 includesPoint: p7n).
	self deny: (arc4 includesPoint: p8n).
	
	self deny: (arc5 includesPoint: p1).
	self deny: (arc5 includesPoint: p2).
	self deny: (arc5 includesPoint: p3).
	self assert: (arc5 includesPoint: p4).
	self deny: (arc5 includesPoint: p5).	
	self assert:(arc5 includesPoint: p6).
	self assert:(arc5 includesPoint: p7).
	self assert:(arc5 includesPoint: p8).
	self deny: (arc5 includesPoint: p1n).
	self assert: (arc5 includesPoint: p2n).
	self assert: (arc5 includesPoint: p3n).
	self assert: (arc5 includesPoint: p4n).
	self deny: (arc5 includesPoint: p5n).	
	self assert: (arc5 includesPoint: p6n).
	self assert: (arc5 includesPoint: p7n).
	self assert: (arc5 includesPoint: p8n).
	
	self assert:(arcQ1 includesPoint: pR).
	self deny:(arcQ1 includesPoint: pQ1).
	self deny:(arcQ1 includesPoint: pB).
	self deny:(arcQ1 includesPoint: pQ2).
	self deny:(arcQ1 includesPoint: pL).
	self deny:(arcQ1 includesPoint: pQ3).
	self assert:(arcQ1 includesPoint: pT).
	self assert: (arcQ1 includesPoint: pQ4).
	
	self deny:(arcQ2 includesPoint: pR).
	self deny:(arcQ2 includesPoint: pQ1).
	self deny:(arcQ2 includesPoint: pB).
	self deny:(arcQ2 includesPoint: pQ2).
	self assert:(arcQ2 includesPoint: pL).
	self assert:(arcQ2 includesPoint: pQ3).
	self assert:(arcQ2 includesPoint: pT).
	self deny:(arcQ2 includesPoint: pQ4).
	
	self deny:(arcQ3 includesPoint: pR).
	self deny:(arcQ3 includesPoint: pQ1).
	self assert:(arcQ3 includesPoint: pB).
	self assert:(arcQ3 includesPoint: pQ2).
	self assert:(arcQ3 includesPoint: pL).
	self deny: (arcQ3 includesPoint: pQ3).
	self deny:(arcQ3 includesPoint: pT).
	self deny:(arcQ3 includesPoint: pQ4).
	
	self assert:(arcQ4 includesPoint: pR).
	self assert:(arcQ4 includesPoint: pQ1).
	self assert:(arcQ4 includesPoint: pB).
	self deny:(arcQ4 includesPoint: pQ2).
	self deny:(arcQ4 includesPoint: pL).
	self deny:(arcQ4 includesPoint: pQ3).
	self deny:(arcQ4 includesPoint: pT).
	self deny:(arcQ4 includesPoint: pQ4).

]
