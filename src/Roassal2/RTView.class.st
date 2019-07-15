"
A RTView is xxxxxxxxx.

Roassal structures a visualization in terms of views, elements, shapes, interactions, and animations.
A ''view'' is a container of graphical elements and represents a layer that may be combined with other views. 

Instance Variables
	edges:		<Object>
	elements:		<Object>
	trCanvas:		<Object>

edges
	- xxxxx

elements
	- xxxxx

trCanvas
	- xxxxx

"
Class {
	#name : #RTView,
	#superclass : #RTAnnounceableObject,
	#instVars : [
		'elements',
		'edges',
		'trCanvas'
	],
	#category : #'Roassal2-Core'
}

{ #category : #visitor }
RTView >> accept: aVisitor [
	aVisitor visitView: self
]

{ #category : #'adding - removing' }
RTView >> add: anElementOrAnEdge [
	"An element or an edge may be provided here"
	"The elements or edges variables grow respectively"
	self assert: [ anElementOrAnEdge ~= nil ] description: 'Nil cannot be added to a view'.
	
	anElementOrAnEdge addedIn: self.
	anElementOrAnEdge renderOn: trCanvas 

]

{ #category : #'adding - removing' }
RTView >> addAll: someElements [
	"
	:: Collection -> RTView
	"
	"Add a number of of elements to the view"
	someElements do: [ :el | self add: el ]
]

{ #category : #'adding - removing' }
RTView >> addAnimation: animation [
	trCanvas addAnimation: animation
]

{ #category : #'adding - removing' }
RTView >> addEdge: anEdge [
	"Add an edge to the view. Extremity elements may or may not be in the view"
	edges add: anEdge
]

{ #category : #'adding - removing' }
RTView >> addElement: anElement [
	elements add: anElement
]

{ #category : #menu }
RTView >> addFindMenu [
	
	self addMenu: 'Find' callback: [ |element|
		element := TRPlatform current dialogChooseFrom: (self elements collect: #model) values: self elements.
		element notNil
			ifTrue: [ self canvas camera translateTo: element position. RTBlink on: element ] ].
]

{ #category : #'adding - removing' }
RTView >> addFromView: aView [
	"Add all the elements and edges from aView to self"

	self addAll: aView elements , aView edges
]

{ #category : #menu }
RTView >> addLayoutMenu [
	"Simply add some useful menu
	
	:: Void -> RTView
	var b : RTMenuBuilder
	var translator : RTSmoothLayoutTranslator
	"
	| b translator |
	translator := RTSmoothLayoutTranslator new.
	b := RTMenuBuilder new view: self.
	b menu: 'Layout' submenu: 'grid' background: Color yellow callback: [ RTGridLayout new translator: translator; on: self elements. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'hori' background: Color yellow callback: [ RTHorizontalLineLayout new translator: translator; on: self elements. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'tree' background: Color yellow callback: [ RTTreeLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'treeH' background: Color yellow callback: [ RTHorizontalTreeLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'cluster' background: Color yellow callback: [ RTClusterLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'circle' background: Color yellow callback: [ RTCircleLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'radial' background: Color yellow callback: [ RTRadialTreeLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b menu: 'Layout' submenu: 'sugi' background: Color yellow callback: [ RTSugiyamaLayout new translator: translator; on: self elements edges: self edges. self canvas signalUpdate ].
	b build
]

{ #category : #menu }
RTView >> addMenu: aTitle callback: aBlock [
	self canvas addMenu: aTitle callback: aBlock

]

{ #category : #'adding - removing' }
RTView >> animations [
	^ trCanvas animations
]

{ #category : #announce }
RTView >> announce: anEvent [
	anEvent canvas: self canvas.
	super announce: anEvent
]

{ #category : #convertion }
RTView >> asElement [
	| e |
	e := RTBox compoundElement.
	e addAll: self elements.
	^ e
]

{ #category : #convertion }
RTView >> asElementOn: aModel [
	| e |
	e := RTBox compoundElementOn: aModel.
	e addAll: self elements.
	^ e
]

{ #category : #opening }
RTView >> build [
	"do nothing. This method is used polymorphically with builders"
]

{ #category : #accessing }
RTView >> canvas [
	"Return the trachel canvas on which everything is drawn"
	^ trCanvas
]

{ #category : #actions }
RTView >> clean [
	"Remove all the elements of the view. It does not remove elements that are directly added to the canvas however"

	"Iterate over the original collections until they are empty. It's done this way because removal of one element can remove another one via TRRemoveCallback (e.g. RTViewTest>>testCleaningViewWithCallback)."

	[ self elements isNotEmpty ] whileTrue: [ self elements anyOne remove ].
	[ self edges isNotEmpty ] whileTrue: [ self edges anyOne remove ]
]

{ #category : #actions }
RTView >> cleanAll [
	"Clean out everything, both the view and the canvas. It means that elements added to the canvas are cleaned out"
	self clean.
	self resetAnnouncer.
	self canvas clean
	
]

{ #category : #'accessing-computed' }
RTView >> edgeFromModel: anObject [
	"Return an edge that corresponds to the object provided as parameter. If none is found, then return nil"
	^ edges detect: [ :edge | edge model = anObject ] ifNone: [ nil ]
]

{ #category : #accessing }
RTView >> edges [
	"
	:: Void -> Collection
	"
	^ edges copy
]

{ #category : #'accessing-computed' }
RTView >> elementFromModel: anObject [
	"
	:: Object -> RTElement
	"
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	^ elements elementFromModel: anObject

]

{ #category : #accessing }
RTView >> elements [
	"
	:: Void -> RTGroup
	"
	^ RTGroup withAll: elements
]

{ #category : #'accessing-computed' }
RTView >> elementsFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	^ elements elementsFromModel: anObject

]

{ #category : #'accessing-computed' }
RTView >> elementsFromModels: objects [
	"Return elements that corresponds to the objects provided as parameter. If none is found, then return an empty collection"
	^ elements elementsFromModels: objects

]

{ #category : #initialization }
RTView >> initialize [
	super initialize.
	self initializeContent.
	self setCanvas: TRCanvas new
]

{ #category : #initialization }
RTView >> initializeContent [
	elements := RTGroup new.
	edges := RTGroup new
]

{ #category : #testing }
RTView >> isView [
	^ true
]

{ #category : #'accessing-computed' }
RTView >> numberOfEdges [
	"Return the number of edges containde in the view"
	^ edges size
]

{ #category : #'accessing-computed' }
RTView >> numberOfElements [
	^ elements size
]

{ #category : #opening }
RTView >> open [
	^ self setUpCanvas open
]

{ #category : #opening }
RTView >> openInWindowSized: anExtentAsPoint [
	^ self setUpCanvas openInWindowSized: anExtentAsPoint
]

{ #category : #opening }
RTView >> openInWindowSized: anExtentAsPoint titled: aTitle [
	^ self setUpCanvas openInWindowSized: anExtentAsPoint titled: aTitle
]

{ #category : #opening }
RTView >> openRaw [
	"Simply open the canvas. No menu is added, no centering of the camera is done"
	^ trCanvas open
]

{ #category : #opening }
RTView >> openTitled: aTitle [
	^ self setUpCanvas openTitled: aTitle
]

{ #category : #opening }
RTView >> openWithMenu [
	"
	:: Void -> Object
	"
	self canvas addMenu: 'In' callback: [ RTZoomInMove on: self ].
	self canvas addMenu: 'Out' callback: [ RTZoomOutMove on: self ].

	^ self open
]

{ #category : #actions }
RTView >> pushBackEdges [
	"Move all the edges in the background"
	self edges do: [ :e | e trachelShape pushBack ]
]

{ #category : #actions }
RTView >> pushFrontEdges [
	"Move all the edges in the front"
	self edges do: [ :e | e trachelShape pushFront ]
]

{ #category : #'adding - removing' }
RTView >> removeAllEdges [
	"Remove all the edges"	 
	edges := OrderedCollection new. 
	self canvas resetLineShapes. 
	self elements do: #removeConnectedEdges

]

{ #category : #'adding - removing' }
RTView >> removeAllElements [
	"Remove all the elements found in the view. 
	CAUTION: this does not trigger a remove event per elements"
	self initializeContent.
	self canvas resetShapes. 

]

{ #category : #'adding - removing' }
RTView >> removeAnimation: animation [
	trCanvas removeAnimation: animation
]

{ #category : #actions }
RTView >> removeEdge: anEdge [
	"Remove an edge from the view"
	edges remove: anEdge ifAbsent: [ ].
	anEdge trachelShape remove.
]

{ #category : #'adding - removing' }
RTView >> removeEdges: someEdges [
	"
	:: Collection -> RTView
	"
	
	someEdges do: #remove

	"In case we are trying to remove everything, as it may happen with the cachetor"
"	(someEdges asArray = edges asArray) ifTrue: [ 
		edges := OrderedCollection new. 
		self canvas resetLineShapes. 
		^ self ].
"	
"	edges := edges copyWithoutAll: someEdges.
	self canvas removeShapes: (someEdges collect: #trachelShape).
"

]

{ #category : #'adding - removing' }
RTView >> removeElement: anElement [
	elements remove: anElement ifAbsent: [ ].
	anElement trachelShape remove.
]

{ #category : #'adding - removing' }
RTView >> removeElements: someElements [
	"
	:: Collection -> RTView
	"
	someElements do: #remove

	"In case we are trying to remove everything, as it may happen with the cachetor"
"	(someElements asArray = elements asArray) ifTrue: [ 
		self initializeContent.
		self canvas resetShapes. 
		^ self ].
"	
	
"	elements := elements copyWithoutAll: someElements.
	self canvas removeShapes: (someElements collect: #trachelShape).
"

]

{ #category : #actions }
RTView >> resetCamera [
	TRCameraInitializer reset
]

{ #category : #actions }
RTView >> restoreCamera [
	"Reuse a previous camera. This is useful when scripting in a playground"

	self view numberOfElements = 0
		ifTrue: [ self resetCamera ].
	self view canvas camera toAdjust: TRCameraInitializer restorePrevious
]

{ #category : #accessing }
RTView >> setCanvas: aTrachelCanvas [
	trCanvas := aTrachelCanvas.
	"Share my announcer with the one of the Trachel Canvas"
	announcer := trCanvas announcer.
]

{ #category : #menu }
RTView >> setDefaultMenu [
	"
	:: Void -> RTView
	var b : RTMenuBuilder
	"
	"Simply add some useful menu"
	| b |
	b := RTMenuBuilder new view: self.
	b menu: 'In' callback: [ RTZoomInMove on: self ].
	b menu: 'Out' callback: [ RTZoomOutMove on: self ].
	b menu: 'Center' callback: [ self canvas focusOnCenterScaled. self signalUpdate ].
	b menu: 'Export' submenu: 'HTML' background: Color blue trans 
		callback: [ RTHTML5Exporter interactiveExport: self ].
	b menu: 'Export' submenu: 'SVG' 
		callback: [ RTSVGExporter interactiveExportViewAsSVG: self ].
	b menu: 'Export' submenu: 'PNG' 
		callback: [ RTPNGExporter new builder: self; fileName: 'roassal.png'; exportToFile ].
	
	(Smalltalk allClasses anySatisfy: [ :c | c name == #RTPDFExporter ])
		ifTrue: [ b menu: 'Export' submenu: 'PDF' callback: [ (Smalltalk at: #RTPDFExporter) exportView: self ]. ].
	b render
]

{ #category : #initialization }
RTView >> setUpCanvas [
	"Make the camera point on the center of the visualization"
	trCanvas camera adjust.
	^ trCanvas
]

{ #category : #convenient }
RTView >> signalUpdate [
	"Force the view to be refreshed. Useful in case some elements have changed"
	^ self canvas signalUpdate
]

{ #category : #'accessing-computed' }
RTView >> theme [
	"Return the theme currently used. A theme is an instance of a subclass of TRAbstractTheme"

	^ self canvas theme
]

{ #category : #'accessing-computed' }
RTView >> trachelShape [
	"
	:: Void -> String
	"
	^ TRNoShape instance
]

{ #category : #'accessing-computed' }
RTView >> view [
	"This method is meant to be used polymorphically with builders.
	Thus, regardless of whether we get a raw view or a builder, we 
	can uniformly obtain the view"
	^ self
]
