"
I am a simple test class for RTSVGVisitor2
"
Class {
	#name : #RTSVGVisitor2Test,
	#superclass : #RTTest,
	#instVars : [
		'visitor'
	],
	#category : #'Roassal2-Tests'
}

{ #category : #running }
RTSVGVisitor2Test >> setUp [
	super setUp.
	visitor := RTJavascriptVisitor new.
	
]

{ #category : #tests }
RTSVGVisitor2Test >> testAddInteractions [
	| element |
	element := RTBox new borderColor: Color black; elementOn: 1.
	element @ RTDraggable.
	visitor addInteractions: element.
	self assert: visitor stream contents equals: 'ints: [RTDraggable], '
]

{ #category : #tests }
RTSVGVisitor2Test >> testAddMatrix [
	| el |
	el := RTBox new element.
	el translateTo: 0 @ 0.5.
	visitor addMatrix: el trachelShape matrix.
	self assert: visitor stream contents equals: 'matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0.5}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testAddPopup [
	| element background |
	element := RTBox new borderColor: Color black; elementOn: 1.
	element @ (RTPopup new group: [ :group :el |
		el model timesRepeat: [
			group add: (RTBox new size: 10; color: Color blue) element ].
			RTGridLayout on: group.
			background := (RTBox new color: (Color black)) element.
			RTNest new centerOn: background elements: group.
			group add: background. ]).
	visitor addInteractions: element.
	self assert: visitor stream contents equals: 'ints: [new RTPopup([
		{type: "box", id: "0", w: 10, h: 10, color: {r:0,g:0,b:255}, ints: [], matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, 
		{type: "box", id: "1", w: 20, h: 20, color: {r:0,g:0,b:0}, ints: [], matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, ]) ], '
]

{ #category : #tests }
RTSVGVisitor2Test >> testBasic [
	| size |
	self assert: visitor view isNil.
	self assert: visitor stream contents isEmpty.
	self assert: visitor validInteractions isNotEmpty.
	visitor view: RTView new.
	self deny: visitor view isNil.
	visitor visitView: visitor view.
	size := visitor stream contents size.
	self assert: visitor stream contents isNotEmpty.
	visitor visitNoShape: nil.
	self assert: size equals: visitor stream contents size.
	
]

{ #category : #tests }
RTSVGVisitor2Test >> testBorderWidth [
	| el |
	el := RTBox new borderColor: Color black; element.
	visitor addBorderWidth: el trachelShape.
	self assert: visitor stream contents equals: 'sw: 1,'.
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitArcShape [
	| el |
	el := (RTArc new  betaAngle: 0; innerRadius: 30; externalRadius: 30) element.
	visitor visitElement: el.
	self assert: visitor stream contents equals: '
		{type: "arc", id: "0", ir: 30, er: 30, aAngle: 0, bAngle: 0, o: {x: 30, y: 0}, c: {x: 30, y: 0},color: {r:223,g:223,b:223}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitArrowShape [
	| shape box e1 e2 view |
	view := RTView new.
	box := RTBox new.
	e1 := box element.
	e2 := box element.
	shape := RTArrowedLine edgeFrom: e1 to: e2.
	view add: e1; add: e2; add: shape.
	view canvas color: Color white.
	visitor visitView: view.
	self assert: visitor stream contents equals:'mamani.color({r:255,g:255,b:255});
	mamani.camera.setScale(1.0001);
	var shapes = [
		{type: "box", id: "0", w: 5, h: 5, color: {r:223,g:223,b:223}, ints: [], matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, 
		{type: "box", id: "1", w: 5, h: 5, color: {r:223,g:223,b:223}, ints: [], matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, 
		{id: "2", type:"multi", shapes:[
		{type: "line", id: "3",fromid:''0'',toid:''1'',color: {r:223,g:223,b:223},  width: 1,ap: new RTCenteredAttachPoint(false)},
		{type: "simplearrow", id: "4", fromid: ''0'', toid: ''1'',color: {r:223,g:223,b:223},  width: 1, size: 10, percentage: 1,ap: new RTCenteredAttachPoint(false), base: 10},], offsets: [{x: 0, y: 0},{x: 0, y: 0},]},
	];
	mamani.addShapes(shapes);
'
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitBoxShape [
	| box |
	box := RTBox new size: 1/2; elementOn: 'foo'.
	visitor visitElement: box.
	self assert: visitor stream contents equals: '
		{type: "box", id: "0", w: 0.5, h: 0.5, color: {r:223,g:223,b:223}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitEllipseShape [
	| ellipse |
	ellipse := RTEllipse new size: 1/2; elementOn: 'foo'.
	visitor visitElement: ellipse.
	self assert: visitor stream contents equals:'
		{type: "ellipse", id: "0", rx: 0.25, ry: 0.25,color: {r:223,g:223,b:223}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitGroup [
	| group |
	group := RTGroup new.
	group add: RTBox element.
	visitor visitGroup: group.
	self assert: visitor stream contents equals: '
		{type: "box", id: "0", w: 5, h: 5, color: {r:223,g:223,b:223}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitLineShape [
	| shape box e1 e2 |
	box := RTBox new.
	e1 := box element.
	e2 := box element.
	shape := RTLine edgeFrom: e1 to: e2.
	visitor visitEdge: shape.
	self assert: visitor stream contents equals: '
		{type: "line", id: "0", fromid: {x:0,y:0},toid:{x:0,y:0},color: {r:223,g:223,b:223},  width: 1,ap:RTCenteredAttachPoint},'
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitPolygonShape [
	| shape |
	shape := RTPolygon new 
		vertices: (Array with: 0@0 with: 1@0 with: 1@1); elementOn: 'foo'.
	visitor visitElement: shape.
	self assert: visitor stream contents equals: '
		{type: "polygon", id: "0", o: {x: 0, y: 0}, c: {x: 1, y: 1}, p: "0,0 1,0 1,1 ",color: {r:223,g:223,b:223}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]

{ #category : #tests }
RTSVGVisitor2Test >> testVisitSVGPath [
	| shape |
	shape := RTSVGPath new path:'M 100 100 L 300 100 L 200 300 z'; element.
	
	visitor visitElement: shape.
	self assert: visitor stream contents equals: '
		{type: "path", id: "0", d:"M 100 100 L 300 100 L 200 300 z", o: {x: 100, y: 100}, c: {x: 300, y: 300},bordercolor: {r: 0, g: 0, b:0}, sw: 1,color: {r:0,g:0,b:0,a:0}, matrix:{shx: 0,shy: 0,sx: 1,sy: 1,x: 0,y: 0}}, '
]
