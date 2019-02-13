"
I am a builder to create UML diagrams in Roassal2, see examples
"
Class {
	#name : #RTUMLClassBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'classes',
		'classesGroup',
		'classname',
		'instanceVariables',
		'methodsNames',
		'superclass',
		'methodselector',
		'methodShape',
		'layout',
		'attributeselector',
		'attributeShape',
		'lineShape',
		'boxShape',
		'classNameShape',
		'edgeActions'
	],
	#category : #'Roassal2-Builder-UML'
}

{ #category : #public }
RTUMLClassBuilder >> addObject: object [
	
	classes add: object.
	
]

{ #category : #public }
RTUMLClassBuilder >> addObjects: objects [
	objects do: [ :obj | self addObject: obj ].
]

{ #category : #public }
RTUMLClassBuilder >> applyLayout [
	self layout layout on: classesGroup elements.
]

{ #category : #shapes }
RTUMLClassBuilder >> attributeShape [
	^ attributeShape
]

{ #category : #shapes }
RTUMLClassBuilder >> attributeShape: aUMLShapeBuilder [
	^ attributeShape := aUMLShapeBuilder
]

{ #category : #accessing }
RTUMLClassBuilder >> attributesOf: object [
	^ self instanceVariables ifNil: [ #() ] ifNotNil: [ :m | m rtValue: object]
]

{ #category : #accessing }
RTUMLClassBuilder >> attributeselector [
	^ attributeselector
]

{ #category : #accessing }
RTUMLClassBuilder >> attributeselector: aSelector [
	attributeselector := aSelector.
]

{ #category : #shapes }
RTUMLClassBuilder >> boxShape [
	^ boxShape
]

{ #category : #shapes }
RTUMLClassBuilder >> boxShape: aShapeBuilder [
	^ boxShape := aShapeBuilder.
]

{ #category : #edges }
RTUMLClassBuilder >> buildEdges [
	| bool eb |
	bool := lineShape shape attachPoint isInverted.
	lineShape verticalAttachPoint.
	lineShape shape attachPoint inverted: bool.
	eb := RTEdgeBuilder new.
	eb view: view.
	eb objects: classes.
	eb shape shape: lineShape shape.
	eb connectFrom: self superclass.
	"eb connectFrom: self superclass to: #yourself."
	
	eb := RTEdgeBuilder new.
	eb view: view.
	eb elements: view elements.
	
	self edges do: [ :asso |
		eb shape shape: asso key.
		asso value value: eb.
		 ].
]

{ #category : #public }
RTUMLClassBuilder >> buildSchema: aView [
	| group box r label e1 e2  l h attributes methods line headerline midline clh |
	
	classes do: [ :object | 
		group := RTGroup new.
		group add: (self classNameShape elementOn: object).
		clh := group encompassingRectangle height.
			
		label := self attributeShape shape.
		(attributes := self attributesOf: object) do: [ :attribute |
			| lab |
			lab := label elementOn: attribute.
			(lab notNil and: [ lab trachelShape text trimmed notEmpty ])
				ifTrue: [ group add: lab ] ].
		RTVerticalLineLayout new gapSize: 0; on: group.
		r := group encompassingRectangle.
		h := r height.
		
		label := self methodShape shape.
		(methods := self methodsForClass: object) do: [ :method | 
			| lab | 
			lab := label elementOn: method.
			lab notNil
				ifTrue: [ group add: lab ] ].
	
		RTVerticalLineLayout new gapSize: 0; on: group.
		r := group encompassingRectangle.
		group first trachelShape 
			translateTo: (r center x @ group first trachelShape center y).
		box := self boxShape elementOn: object.
		
		line := [ :p1 :p2 |
			e1 := (RTBox new size: 0) elementOn: p1.
			e2 := (RTBox new size: 0) elementOn: p2.
			e1 trachelShape translateTo: p1.
			e2 trachelShape translateTo: p2.
			l := RTEdge on: object from: e1 to: e2.
			l + (RTLine new color: box trachelShape strokePaint).
			group add: e1; add: e2; add: l. ].
		headerline := [ line value: (r left@ clh) value: (r right@ clh)  ].
		midline := [ line value: (r left@h) value: (r right@h)  ].
		attributes isEmpty 
			ifTrue: [ 
				methods isEmpty ifTrue: [  ]
					ifFalse: [ headerline value. ] ]
			ifFalse: [  
				headerline value.
				methods isEmpty ifTrue: [  ]
					ifFalse: [ midline value ]  ].
		
		RTNest new on: box nest: group.
	
		self interaction setUpElement: box.
		classesGroup add: box.
		aView add: box.
		aView addAll: group.
	].
	
]

{ #category : #accessing }
RTUMLClassBuilder >> classNameFor: obj [
	^ self classname rtValue: obj
]

{ #category : #shapes }
RTUMLClassBuilder >> classNameShape [
	^ classNameShape
]

{ #category : #shapes }
RTUMLClassBuilder >> classNameShape: aUMLShapeBuilder [
	^ classNameShape := aUMLShapeBuilder
	
]

{ #category : #accessing }
RTUMLClassBuilder >> classesGroup [
	^ classesGroup.
]

{ #category : #accessing }
RTUMLClassBuilder >> classname [
	^ classname
	
]

{ #category : #accessing }
RTUMLClassBuilder >> classname: aSelector [
	classname := aSelector
	
]

{ #category : #public }
RTUMLClassBuilder >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #edges }
RTUMLClassBuilder >> edges [
	edgeActions ifNil: [ edgeActions := OrderedCollection new ].
	^ edgeActions.
]

{ #category : #edges }
RTUMLClassBuilder >> edgesDo: aBlock [
	| s |
	s := self shape current copy.
	self edges add: s->aBlock.
]

{ #category : #examples }
RTUMLClassBuilder >> example1 [
	"
	self new example1
	"

	^ RTUMLClassBuilder new
		addObjects: RTShape withAllSubclasses;
		gridLayout;
		yourself
]

{ #category : #examples }
RTUMLClassBuilder >> example2 [
	"
	self new example2
	"

	^ RTUMLClassBuilder new
		addObjects: RTShape withAllSubclasses;
		treeLayout;
		yourself
]

{ #category : #examples }
RTUMLClassBuilder >> example3 [
	"
	self new example3
	"
	| objects|
	objects := Array
		with: (Array with: 'MyClass' with: (Array with: #iv1 with: #iv2) 
			with: (Array with: #method1 with: #method2 with: #method3 ) )
		with: (Array with: 'MyClass2' with: (Array with: #iv3 with: #iv4) 
			with: (Array with: #method4 with: #method5 with: #method6 ) ).

	^ RTUMLClassBuilder new
		addObjects: objects;
		classname: #first;
		instanceVariables: #second;
		methodsNames: #third;
		methodselector: #yourself;
		attributeselector: #yourself;
		superclass: nil;
		yourself
]

{ #category : #examples }
RTUMLClassBuilder >> example4 [
	"
	self new example4
	"
	| b |
	b := RTUMLClassBuilder new.
	b methodShape label
		if: [ :method | method selector beginsWith: 'init' ] color: Color green;
		if: [ :method | method selector beginsWith: 'with' ] color: Color red.
			
	b attributeShape label
		if: [ :attribute | attribute beginsWith: 'a' ] color: Color blue.
	b addObjects: RTShape withAllSubclasses.
	b treeLayout.
	^ b
]

{ #category : #examples }
RTUMLClassBuilder >> example5 [
	"
	self new example5
	"
	| objects b |
	objects := Array
		with: (Array with: 'MyClass' with: (Array with: #iv1 with: #iv2) 
			with: (Array with: #method1 with: #method2 with: #method3 ) )
		with: (Array with: 'MyClass2' with: (Array with: #iv3 with: #iv4) 
			with: (Array with: #method4 with: #method5 with: #method6 ) ).

	b := RTUMLClassBuilder new.
	b attributeShape label if: [ :a | a = #iv1 ] color: Color red.
	b
		addObjects: objects;
		classname: #first;
		instanceVariables: #second;
		methodsNames: #third;
		methodselector: #yourself;
		attributeselector: #yourself;
		superclass: nil.
	^ b
]

{ #category : #examples }
RTUMLClassBuilder >> example6WithColoredProtocols [
	"
	self new example6WithColoredProtocols
	"
	| someClasses allMethodCategories b n |
	someClasses := RTShape withAllSubclasses.
	allMethodCategories := (someClasses flatCollect: #protocols) asSet asArray.

	b := RTUMLClassBuilder new.
	n := RTMultiLinearColorForIdentity new objects: allMethodCategories.

	b methodShape label
		color: [ :m | n rtValue: m protocol ].

	b methodsNames: [ :cls | (cls rtmethods sortedAs: #protocol) ].
	b addObjects: someClasses.
	b treeLayout.

	b view setDefaultMenu.
	^ b
]

{ #category : #private }
RTUMLClassBuilder >> fontSizeOfClassname [
	^ 12
]

{ #category : #private }
RTUMLClassBuilder >> fontSizeOfMembers [
	^ 10
]

{ #category : #'public - configuration' }
RTUMLClassBuilder >> forPharoClasses [
	self classname: #name.
	self instanceVariables: #instVarNames.
	self methodsNames: #rtmethods.
	self superclass: #superclass.
	self methodselector: #selector.
	self attributeselector: #yourself
]

{ #category : #'public - configuration' }
RTUMLClassBuilder >> forSelfMadeClasses [
	self classname: #yourself.
	self instanceVariables: ''.
	self methodsNames: #().
	self superclass: nil.
	self methodselector: ''.
	self attributeselector: ''
]

{ #category : #layouts }
RTUMLClassBuilder >> gridLayout [
	^ self layout grid
]

{ #category : #initialization }
RTUMLClassBuilder >> initialize [
	super initialize.
	classesGroup := RTGroup new.
	classes := OrderedCollection new.
	self forPharoClasses.
	self initializeLayout.
	self initializeShapeBuilder.
	(self classNameShape: RTShapeBuilder new) label
		height: self fontSizeOfClassname;
		text: [ :c | self classNameFor: c ].
	self methodShape: RTShapeBuilder new.
	self attributeShape: RTShapeBuilder new.
	(self boxShape: RTShapeBuilder new) box
		color: Color white;
		borderColor: Color gray.
	self interaction draggable.
	self prepare: self methodShape selector: #methodselector.
	self prepare: self attributeShape selector: #attributeselector.
	
]

{ #category : #initialization }
RTUMLClassBuilder >> initializeLayout [
	self layout: RTLayoutBuilder new
]

{ #category : #initialization }
RTUMLClassBuilder >> initializeShapeBuilder [
	(self lineShape: RTShapeBuilder new) orthoVerticalLine
]

{ #category : #accessing }
RTUMLClassBuilder >> instanceVariables [
	^ instanceVariables
]

{ #category : #accessing }
RTUMLClassBuilder >> instanceVariables: aSelector [
	instanceVariables := aSelector
]

{ #category : #accessing }
RTUMLClassBuilder >> layout [
	layout ifNil: [ layout := RTHorizontalLineLayout new ].
	^ layout
]

{ #category : #accessing }
RTUMLClassBuilder >> layout: aRTLayout [
	^ layout := aRTLayout
]

{ #category : #edges }
RTUMLClassBuilder >> lineShape [
	^ lineShape
]

{ #category : #edges }
RTUMLClassBuilder >> lineShape: aShapeBuilder [
	^ lineShape := aShapeBuilder
]

{ #category : #shapes }
RTUMLClassBuilder >> methodShape [
	^ methodShape
]

{ #category : #shapes }
RTUMLClassBuilder >> methodShape: aUMLShapeBuilder [
	^ methodShape := aUMLShapeBuilder
]

{ #category : #accessing }
RTUMLClassBuilder >> methodsForClass: obj [
	^ self methodsNames rtValue: obj
]

{ #category : #accessing }
RTUMLClassBuilder >> methodsNames [
	^ methodsNames
]

{ #category : #accessing }
RTUMLClassBuilder >> methodsNames: aSelector [
	methodsNames := aSelector
]

{ #category : #accessing }
RTUMLClassBuilder >> methodselector [
	^ methodselector.
]

{ #category : #accessing }
RTUMLClassBuilder >> methodselector: aSelector [
	methodselector := aSelector.
]

{ #category : #private }
RTUMLClassBuilder >> prepare: builder selector: selector [
	builder shape class = RTNoShape ifTrue: [ 
		builder label height: self fontSizeOfMembers ].
	builder text: [ :obj | (self perform: selector) rtValue: obj ].
	
]

{ #category : #hooks }
RTUMLClassBuilder >> renderIn: aView [
	self buildSchema: aView.
	self buildEdges.
	self applyLayout.
]

{ #category : #accessing }
RTUMLClassBuilder >> superclass [
	^ superclass
]

{ #category : #accessing }
RTUMLClassBuilder >> superclass: aSelector [
	superclass := aSelector
]

{ #category : #layouts }
RTUMLClassBuilder >> treeLayout [
	^ self layout tree
]
