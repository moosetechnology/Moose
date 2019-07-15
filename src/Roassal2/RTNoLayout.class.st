"
Here is an example:

v := RTView new.

es := (RTEllipse new color: Color blue trans; size: 20) elementsOn: (1 to: 30).
v addAll: es.
RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :vv | vv // 2 ].

v addMenu: 'Remember!' callback: [ 
	positions := es collect: #position.
	 ].

v addMenu: 'Recall!' callback: [ 
	positions with: es do: [ :p :e | e translateTo: p ].
	v signalUpdate.
	 ].

v addMenu: 'Start layout!' callback: [ 
	force := RTForceBasedLayout new.
	force initialLayout: RTNoLayout new.
	animation := RTSpringLayoutStepping new.
	animation layoutWithoutPreparing: force.
	animation inView: v.
].

v addMenu: 'Stop layout!' callback: [ 
	animation stopAndRemove
].
v 
"
Class {
	#name : #RTNoLayout,
	#superclass : #RTLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTNoLayout >> doExecute: elements [
	"Do nothing"
]
