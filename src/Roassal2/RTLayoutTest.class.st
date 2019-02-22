Class {
	#name : #RTLayoutTest,
	#superclass : #RTTest,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTLayoutTest >> setUp [
	super setUp.
	view := RTView new.
	
	1 to: 20 do: [ :i | view add: (RTBox elementOn: i) ]
]

{ #category : #tests }
RTLayoutTest >> testCellLayout [
	| v els el30 el50 el80 |
	v := RTView new.
	els := RTBox new size: #yourself; color: (Color green alpha: 0.3); elementsOn: #(30 50 80).
	els @ RTDraggable.
	v addAll: els.

	RTEdgeBuilder new
		view: v;
		useAssociations: (Array with: 30 -> 50 with: 30 -> 80).

	RTCellLayout new 
		gapSize: 0; on: els.
	el30 := els first.
	el50 := els second.
	el80 := els third.
	
	self assert: el30 encompassingRectangle bottom + 10 equals: el80 encompassingRectangle top.
	self assert: el30 encompassingRectangle right + 25 equals: el50 encompassingRectangle left.
	self assert: el50 encompassingRectangle bottom equals: el80 encompassingRectangle top.

]

{ #category : #tests }
RTLayoutTest >> testCircleLayout [

	| answer |
	RTCircleLayout on: view elements.
	answer :=  OrderedCollection new.
	answer add: (442@222);
		add: (431@290);
		add: (400@351);
		add: (351@400);
		add: (290@431);
		add: (222@442);
		add: (154@431);
		add: (93@400);
		add: (44@351);
		add: (13@290);
		add: (2@222);
		add: (13@154);
		add: (44@93);
		add: (93@44);
		add: (154@13);
		add: (222@2);
		add: (290@13);
		add: (351@44);
		add: (400@93);
		add: (431@154).
	self assert: ((view elements collect: #position) collect: #asIntegerPoint) asArray = answer asArray
	
]

{ #category : #tests }
RTLayoutTest >> testCircleLayoutOnEmpty [

	RTCircleLayout new applyOn: #()
	
]

{ #category : #tests }
RTLayoutTest >> testCluster [
	view := RTView new.
	view
		addAll:
			((RTEllipse new size: 10) elementsOn: Collection withAllSubclasses).
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTClusterLayout on: view elements edges: view edges
]

{ #category : #tests }
RTLayoutTest >> testFlowLayoutAlignment [
	| l |
	l := RTFlowLayout new.
	self assert: l isAlignTop.
	self deny: l isAlignBottom.
	
	l alignBottom.
	self deny: l isAlignTop.
	self assert: l isAlignBottom.

]

{ #category : #tests }
RTLayoutTest >> testFlowLayoutAlignmentLayoutBottom [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTFlowLayout new.
	l alignBottom.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
"		
	self assert: (es collect: #position) asArray = (Array with: (10.0@0.0) with: (30.0@ -5.0) with: (60.0@ -10.0))
	
]

{ #category : #tests }
RTLayoutTest >> testFlowLayoutAlignmentLayoutCenter [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTFlowLayout new.
	l alignCenter.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
		
"	self assert: (es collect: #position) asArray = (Array with: (10.0@5) with: (30.0@5) with: (60.0@5))

]

{ #category : #tests }
RTLayoutTest >> testFlowLayoutAlignmentLayoutTop [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTFlowLayout new.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
"		
	self assert: (es collect: #position) asArray = (Array with: (10.0@10.0) with: (30.0@15.0) with: (60.0@20.0))
]

{ #category : #tests }
RTLayoutTest >> testForce [
	| v es layout |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 2).
	v addAll: es.
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 2);
		connectFrom: #yourself
			toAll:
				[ :value | Array with: value - 1 with: value + 1 with: value + 2 ].
	layout := RTForceBasedLayout new.
	layout on: es edges: #().
	self assert: layout userDefinedEdges isEmpty
]

{ #category : #tests }
RTLayoutTest >> testForceDefault [

	| l |
	l := RTForceBasedLayout new.
	self assert: l edges isEmpty.
	self assert: l nodes isEmpty.
]

{ #category : #tests }
RTLayoutTest >> testForceWithForeinEdges [
	| v es layout edges |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 3).
	v addAll: (es copyFrom: 1 to: 3).
	edges := RTEdgeBuilder new
		view: v;
		objects: (1 to: 3);
		connectFrom: #yourself
			toAll: [ :value | Array with: value - 1 with: value + 1 ].

	"We give to the layout node 1 and 2, and some edges that refer to 3"
	layout := RTForceBasedLayout new.
	"No error should be raised"
	layout on: es allButLast edges: edges allButFirst
]

{ #category : #'flow layout' }
RTLayoutTest >> testHorizontalFlowLayoutAlignment [
	| l |
	l := RTHorizontalFlowLayout new.
	self assert: l isAlignTop.
	self deny: l isAlignBottom.
	
	l alignBottom.
	self deny: l isAlignTop.
	self assert: l isAlignBottom.
]

{ #category : #'flow layout' }
RTLayoutTest >> testHorizontalFlowLayoutAlignmentLayoutBottom [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTHorizontalFlowLayout new.
	l alignBottom.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
"		
	self assert: (es collect: #position) asArray = (Array with: (0@10.0) with: (-5@30.0) with: (-10.0@ 60.0))
	
]

{ #category : #'flow layout' }
RTLayoutTest >> testHorizontalFlowLayoutAlignmentLayoutCenter [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTHorizontalFlowLayout new.
	l alignCenter.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
		
"	self assert: (es collect: #position) asArray = (Array with: (5@10.0) with: (5@30.0) with: (5@60.0))

]

{ #category : #'flow layout' }
RTLayoutTest >> testHorizontalFlowLayoutAlignmentLayoutTop [
	| l es |
	es := (RTBox new size: [ :v | v * 10 ]) elementsOn: #(1 2 3).
	l := RTHorizontalFlowLayout new.
	l on: es.
	
"	RTView new
		addAll: es;
		open.
"		
	self assert: (es collect: #position) asArray = (Array with: (10.0@10.0) with: (15.0@30.0) with: (20.0@60.0))
]

{ #category : #tests }
RTLayoutTest >> testHorizontalLineLayout [

	| answer |
	RTHorizontalLineLayout on: view elements.
	answer := (((Array new: 20) at: 1 put: (((5/2)@(5/2))); at: 2 put: (((35/2)@(5/2))); at: 3 put: (((65/2)@(5/2))); at: 4 put: (((95/2)@(5/2))); at: 5 put: (((125/2)@(5/2))); at: 6 put: (((155/2)@(5/2))); at: 7 put: (((185/2)@(5/2))); at: 8 put: (((215/2)@(5/2))); at: 9 put: (((245/2)@(5/2))); at: 10 put: (((275/2)@(5/2))); at: 11 put: (((305/2)@(5/2))); at: 12 put: (((335/2)@(5/2))); at: 13 put: (((365/2)@(5/2))); at: 14 put: (((395/2)@(5/2))); at: 15 put: (((425/2)@(5/2))); at: 16 put: (((455/2)@(5/2))); at: 17 put: (((485/2)@(5/2))); at: 18 put: (((515/2)@(5/2))); at: 19 put: (((545/2)@(5/2))); at: 20 put: (((575/2)@(5/2))); yourself)).
	self assert: (view elements collect: #position) asArray = answer
	
]

{ #category : #tests }
RTLayoutTest >> testHorizontalLineLayoutWithBox [
	| models elHello elWorld elHelloWidth elWorldWidth |
	view := RTView new.
	models := #(50 150 ).
	view addAll: (RTBox new color: (Color blue alpha: 0.2); size: #yourself; elementsOn: models).
	self assert: view elements size = 2.
	elHello := view elementFromModel: models first.
	elWorld := view elementFromModel: models second.
	elHelloWidth := elHello width.
	elWorldWidth := elWorld width.
	RTHorizontalLineLayout new gapSize: 0; on: view elements.
	"view open."
	
	self assert: elHello width = elHelloWidth.
	self assert: elWorld width = elWorldWidth.
	self assert: elHello encompassingRectangle width = elHelloWidth.
	self assert: elWorld encompassingRectangle width = elWorldWidth.
	
	self assert: elHello encompassingRectangle top = elWorld encompassingRectangle top.
	self assert: elHello encompassingRectangle right <= elWorld encompassingRectangle left.

]

{ #category : #tests }
RTLayoutTest >> testHorizontalLineLayoutWithText [
	| elHello elWorld elHelloWidth elWorldWidth |
	view := RTView new.
	view addAll: (RTLabel elementsOn: #('hola ' 'mundo') ).
	self assert: view elements size = 2.
	elHello := view elementFromModel: 'hola '.
	elWorld := view elementFromModel: 'mundo'.
	elHelloWidth := elHello width.
	elWorldWidth := elWorld width.
	RTHorizontalLineLayout new gapSize: 0; on: view elements.
	"view open."
	
	self assert: elHello width = elHelloWidth.
	self assert: elWorld width = elWorldWidth.
	self assert: elHello encompassingRectangle width = elHelloWidth.
	self assert: elWorld encompassingRectangle width = elWorldWidth.
	
	self assert: elHello encompassingRectangle top = elWorld encompassingRectangle top.
	self assert: elHello encompassingRectangle bottom = elWorld encompassingRectangle bottom.
	self deny: elHello encompassingRectangle right > elWorld encompassingRectangle left.

]

{ #category : #tests }
RTLayoutTest >> testHorizontalTreeLayout [
	| v els el30 el50 el80 |
	v := RTView new.
	els := RTBox new size: #yourself; color: (Color green alpha: 0.3); elementsOn: #(30 50 80).
	els @ RTDraggable.
	v addAll: els.

	RTEdgeBuilder new
		view: v;
		useAssociations: (Array with: 30 -> 50 with: 30 -> 80).
	
	RTHorizontalTreeLayout new 
		isLayered: false; leftGap: 0; topGap: 0; verticalGap: 0; horizontalGap: 0; on: els.
	el30 := els first.
	el50 := els second.
	el80 := els third.
	self assert: el30 encompassingRectangle right equals: el50 encompassingRectangle left.
	self assert: el30 encompassingRectangle right equals: el80 encompassingRectangle left.
	self assert: el50 encompassingRectangle bottom equals: el80 encompassingRectangle top.

]

{ #category : #tests }
RTLayoutTest >> testRadialTreelLayout [
	| answer |
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 20);
		connectFrom: [ :v | v // 2 ] to: #yourself.
	RTRadialTreeLayout on: view elements edges: view edges.
	answer := OrderedCollection new.
	answer
		add: 202 @ 202;
		add: 216 @ 217;
		add: 187 @ 215;
		add: 239 @ 217;
		add: 213 @ 240;
		add: 184 @ 238;
		add: 165 @ 216;
		add: 262 @ 208;
		add: 250 @ 239;
		add: 226 @ 257;
		add: 212 @ 261;
		add: 182 @ 259;
		add: 169 @ 252;
		add: 149 @ 230;
		add: 144 @ 216;
		add: 282 @ 202;
		add: 281 @ 217;
		add: 270 @ 245;
		add: 261 @ 257;
		add: 234 @ 275.
	self
		assert:
			((view elements collect: #position) collect: #asIntegerPoint) asArray
				= answer asArray
]

{ #category : #sugiyama }
RTLayoutTest >> testSugiyamaLayout [
	| result elements |
	elements := (RTBox new size: 50) elementsOn: (1 to: 20).
	view := RTView new.
	view addAll: elements.
	elements allButFirst do: [:e | 
	 	view add: (RTLine edgeFrom: elements first to: e) ].
	
	RTSugiyamaLayout on: elements.
	
	result := (((RTGroup new) add: ((522.0@28.0)); add: ((999.0@98.0)); add: ((946.0@98.0)); add: ((893.0@98.0)); add: ((840.0@98.0)); add: ((787.0@98.0)); add: ((734.0@98.0)); add: ((681.0@98.0)); add: ((628.0@98.0)); add: ((575.0@98.0)); add: ((522.0@98.0)); add: ((469.0@98.0)); add: ((416.0@98.0)); add: ((363.0@98.0)); add: ((310.0@98.0)); add: ((257.0@98.0)); add: ((204.0@98.0)); add: ((151.0@98.0)); add: ((98.0@98.0)); add: ((45.0@98.0)); yourself)).
	self assert: (result includesAll: (elements collect: #position))
]

{ #category : #tests }
RTLayoutTest >> testTreeLayoutWithoutSpecificingEdges [
	| v answer |
	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 20)).
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 20);
		connectFrom: [ :value | value // 2 ] to: #yourself.
	RTTreeLayout on: v elements.
	answer := OrderedCollection new.
	answer
		add: 43.5 @ (15 / 2);
		add: 27.5 @ (65 / 2);
		add: 67.5 @ (65 / 2);
		add: 19.5 @ (115 / 2);
		add: 43.5 @ (115 / 2);
		add: 59.5 @ (115 / 2);
		add: 75.5 @ (115 / 2);
		add: 11.5 @ (165 / 2);
		add: 27.5 @ (165 / 2);
		add: 39.5 @ (165 / 2);
		add: 47.5 @ (165 / 2);
		add: 55.5 @ (165 / 2);
		add: 63.5 @ (165 / 2);
		add: 71.5 @ (165 / 2);
		add: 79.5 @ (165 / 2);
		add: 7.5 @ (215 / 2);
		add: 15.5 @ (215 / 2);
		add: 23.5 @ (215 / 2);
		add: 31.5 @ (215 / 2);
		add: 39.5 @ (215 / 2).
	self
		assert: (v elements collect: #position) asArray
		equals: answer asArray
]

{ #category : #tests }
RTLayoutTest >> testTreelLayout [
	| answer |
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 20);
		connectFrom: [ :v | v // 2 ] to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	answer := OrderedCollection new.
	answer
		add: 43.5 @ (15 / 2);
		add: 27.5 @ (65 / 2);
		add: 67.5 @ (65 / 2);
		add: 19.5 @ (115 / 2);
		add: 43.5 @ (115 / 2);
		add: 59.5 @ (115 / 2);
		add: 75.5 @ (115 / 2);
		add: 11.5 @ (165 / 2);
		add: 27.5 @ (165 / 2);
		add: 39.5 @ (165 / 2);
		add: 47.5 @ (165 / 2);
		add: 55.5 @ (165 / 2);
		add: 63.5 @ (165 / 2);
		add: 71.5 @ (165 / 2);
		add: 79.5 @ (165 / 2);
		add: 7.5 @ (215 / 2);
		add: 15.5 @ (215 / 2);
		add: 23.5 @ (215 / 2);
		add: 31.5 @ (215 / 2);
		add: 39.5 @ (215 / 2).
	self
		assert:
			(view elements collect: #position) asArray = answer asArray
]

{ #category : #tests }
RTLayoutTest >> testVerticalLineLayoutOnElements [
	| el1 el2 |
	view := RTView new.
	el1 := RTBox new size: #yourself; elementOn: 30.
	el2 := RTBox new size: #yourself; elementOn: 50.
	view add: el1; add: el2.
	self assert: view elements size equals: 2.
	RTVerticalLineLayout new 
		gapSize: 0; 
		on: view elements.
	self assert: el1 height equals: 30.
	self assert: el2 height equals: 50.
	self assert: el1 position equals: 15 @ 15.
	self assert: el2 position equals: 25 @ 55.
	self assert: el1 encompassingRectangle left equals: el2 encompassingRectangle left.
	self assert: el1 encompassingRectangle bottom <= el2 encompassingRectangle top.
]

{ #category : #tests }
RTLayoutTest >> testVerticalLineLayoutOnGroups [
	| line1 line2 el1 el2 |
	view := RTView new.
	line1 := RTBox new size: #yourself; elementsOn: #(30).
	line2 := RTBox new size: #yourself; elementsOn: #(50).
	view addAll: line1; addAll: line2.
	self assert: view elements size equals: 2.
	RTVerticalLineLayout new 
		gapSize: 0; 
		on: (Array with: line1 with: line2).
	el1 := line1 first.
	el2 := line2 first.
	
	self assert: el1 height equals: 30.
	self assert: el2 height equals: 50.
	self assert: el1 position equals: 15 @ 15.
	self assert: el2 position equals: 25 @ 55.
	self assert: el1 encompassingRectangle left equals: el2 encompassingRectangle left.
	self assert: el1 encompassingRectangle bottom <= el2 encompassingRectangle top.
]

{ #category : #tests }
RTLayoutTest >> testVerticalTreeLayout [
	| v els el30 el50 el80 |
	v := RTView new.
	els := RTBox new size: #yourself; color: (Color green alpha: 0.3); elementsOn: #(30 50 80).
	els @ RTDraggable.
	v addAll: els.

	RTEdgeBuilder new
		view: v;
		useAssociations: (Array with: 30 -> 50 with: 30 -> 80).

	RTTreeLayout new 
		isLayered: false; leftGap: 0; topGap: 0; verticalGap: 0; horizontalGap: 0; on: els.
	el30 := els first.
	el50 := els second.
	el80 := els third.
	self assert: el30 encompassingRectangle bottom equals: el50 encompassingRectangle top.
	self assert: el30 encompassingRectangle bottom equals: el80 encompassingRectangle top.
	self assert: el50 encompassingRectangle right equals: el80 encompassingRectangle left.

]
