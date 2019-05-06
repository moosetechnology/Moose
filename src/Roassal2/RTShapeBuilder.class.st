Class {
	#name : #RTShapeBuilder,
	#superclass : #RTAbstractBuilder,
	#instVars : [
		'shape',
		'createdElements',
		'shapeInitializer'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #'public - shapes' }
RTShapeBuilder >> arc [
	self shape: RTArc new
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> arrowedBezier [
	self shape: (RTArrowedLine new line: RTBezier3Line new).
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> arrowedLine [
	self shape: RTArrowedLine new
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> attachPoint: aBlockOrSymbol [
	aBlockOrSymbol rtValue: shape 
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> bezierLineFollowing: aFollowBlock [
	"aFollowBlock return an element"
	self shape: (RTBezierLine new follow: aFollowBlock)
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> bezierLineUsingObjects: aFollowBlock [
	"aFollowBlock return an element"
	| elements |
	self error: 'Method is not finished!!!'.
	elements := #().
	self shape: (RTBezierLine new controllingElements: elements)
	
 
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> bezierLineUsingObjects: someObjects inView: view [
	"some Objects are objects represented in a view"
	| elements |
	elements := view elementsFromModels: someObjects.
	self shape: (RTBezierLine new controllingElements: elements)
	
 
]

{ #category : #accessing }
RTShapeBuilder >> borderColor [
	^ self current borderColor
]

{ #category : #'public - shapes' }
RTShapeBuilder >> box [
	self shape: RTBox new
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> centeredAttachPoint [
	"Set the vertical attach point for the edges to be built"
	self attachPoint: #withCenteredAttachPoint

	
]

{ #category : #'public - shapes' }
RTShapeBuilder >> circle [
	self shape: RTEllipse new
]

{ #category : #accessing }
RTShapeBuilder >> color [
	^ self current color
]

{ #category : #'public - shapes' }
RTShapeBuilder >> composite: aBlock [
	| newShape |
	newShape := RTCompositeShape new.
	aBlock value: newShape.
	shape := newShape.
]

{ #category : #accessing }
RTShapeBuilder >> createdElements [
	^ createdElements
]

{ #category : #'public - shapes' }
RTShapeBuilder >> cross [
	| s |
	s := RTCompositeShape new.
	s add: (RTBox new height: 10; width: 3). 
	s add: (RTBox new height: 3; width: 10).

	^ self shape: s
]

{ #category : #accessing }
RTShapeBuilder >> current [
	"Return the shape currently built"
	^ shape
]

{ #category : #'public - shapes' }
RTShapeBuilder >> diamond [
	shape := RTPolygon diamond
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> directedLine [
	self shape: RTDirectedLine new
]

{ #category : #'reflective operations' }
RTShapeBuilder >> doesNotUnderstand: aMessage [
	"we simply forward the messages we do not understand
	to the actual shape implementation"
	self shape 
		perform: aMessage selector 
		withArguments: aMessage arguments
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> doubleArrowedLine [
	self shape: RTDoubleArrowedLine new
]

{ #category : #'public - building' }
RTShapeBuilder >> edgeFrom: element1 to: element2 [
	"Return a new edge that goes from element1 to element2"
	self hasSetLineShape ifFalse: [ self line ].
	^ shape edgeFrom: element1 to: element2
]

{ #category : #'public - building' }
RTShapeBuilder >> elementOn: object [
	^ (self elementsOn: (RTGroup with: object)) first
]

{ #category : #'public - building' }
RTShapeBuilder >> elementsOn: objects [
	| answer |
	self hasSetShape ifFalse: [ self rectangle ].
	answer := shape elementsOn: objects.
	createdElements addAll: answer.
	^ answer
]

{ #category : #'public - shapes' }
RTShapeBuilder >> ellipse [
	self shape: RTEllipse new
]

{ #category : #'public - building' }
RTShapeBuilder >> ensure: aClassShape [
	"Make sure the current shape is instance of aClassShapeName. If no, then set it"
	(shape isKindOf: aClassShape)
		ifFalse: [ self shape: aClassShape new ]
]

{ #category : #'public - shapes' }
RTShapeBuilder >> extensibleLabel [
	^ self shape: RTExtensibleLabel new
]

{ #category : #accessing }
RTShapeBuilder >> fillColor [
	^ self color
]

{ #category : #'public - text shape' }
RTShapeBuilder >> fontSize: aValueOrASymbolOrABlock [
	"Make sure we have something that this message is meaningful"
	self assert: [ #(RTLabel #RTCompositeShape) includes: shape class name ].
	
	shape class == RTLabel ifTrue: [ shape height: aValueOrASymbolOrABlock. ^ self ].
	shape class == RTCompositeShape ifTrue: [ (shape allShapes select: [ :s | s class == RTLabel ]) do: [ :s | s height: aValueOrASymbolOrABlock ] ]
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> gradientLineFrom: fromColor to: toColor [
	self shape: (RTGradientColoredLine new colors: (Array with: fromColor with: toColor); 
							precision: 100; 
							gradientColorShape)
]

{ #category : #'public - testing' }
RTShapeBuilder >> hasSetLineShape [
	"A bit hackish..."
	^ (shape isKindOf: RTAbstractLine) or: [ (shape isKindOf: RTCompositeShape) and: [ shape allShapes anyOne isKindOf: RTAbstractLine ] ]
]

{ #category : #'public - testing' }
RTShapeBuilder >> hasSetShape [
	^ shape class ~~ RTNoShape
]

{ #category : #'public - shapes' }
RTShapeBuilder >> heptagon [
	shape := RTPolygon heptagon
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> horizontalAttachPoint [
	"Set the vertical attach point for the edges to be built"
	self attachPoint: #withHorizontalAttachPoint

	
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> horizontalBezierLine [
	self shape: RTBezierLine horizontal
]

{ #category : #'public - shapes' }
RTShapeBuilder >> if: conditionBlock borderColor: colorBlock [
	"If conditionBlock is evaluated at true, then colorBlock is used to set the color of the node. Both conditionBlock and colorBlock are evaluated with the model value of the node."
	| oldBlockOrValue |
	oldBlockOrValue := self borderColor.
	^self borderColor: [ :aModel | (conditionBlock rtValue: aModel)
									ifTrue: [ colorBlock rtValue: aModel ] 
									ifFalse: [ 
										"Having to create a new element is rather ugly. 
										Ideally, the oldBlockOrValue has to be 'unwrapped' for the translation"
										oldBlockOrValue rtValue: (RTElement on: aModel) ]].
							
						

]

{ #category : #'public - shapes' }
RTShapeBuilder >> if: conditionBlock color: colorBlock [
	"If conditionBlock is evaluated at true, then colorBlock is used to set the color of the node. Both conditionBlock and colorBlock are evaluated with the model value of the node."
	| oldBlockOrValue |
	oldBlockOrValue := self color.
	^self color: [ :aModel | (conditionBlock rtValue: aModel)
									ifTrue: [ colorBlock rtValue: aModel ] 
									ifFalse: [ 
										oldBlockOrValue rtValue: (RTElement on: aModel) ]].
							
						
]

{ #category : #'public - shapes' }
RTShapeBuilder >> if: conditionBlock fillColor: colorBlock [
	"If conditionBlock is evaluated at true, then colorBlock is used to set the color of the node. Both conditionBlock and colorBlock are evaluated with the model value of the node."
	| oldBlockOrValue |
	oldBlockOrValue := self fillColor.
	self fillColor: [ :aModel | (conditionBlock rtValue: aModel)
									ifTrue: [ colorBlock rtValue: aModel ] 
									ifFalse: [ 
										"Having to create a new element is rather ugly. 
										Ideally, the oldBlockOrValue has to be 'unwrapped' for the translation"
										oldBlockOrValue rtValue: (RTElement on: aModel) ]].
							
						

]

{ #category : #'public - shapes' }
RTShapeBuilder >> ifElement: conditionBlock borderColor: colorBlock [
	"If conditionBlock is evaluated at true, then colorBlock is used to set the color of the node. Both conditionBlock and colorBlock are evaluated with the model value of the node."
	| oldBlockOrValue |
	oldBlockOrValue := self borderColor.
	^self borderColorElement: [ :anElement | (conditionBlock rtValue: anElement)
									ifTrue: [ colorBlock rtValue: anElement ] 
									ifFalse: [ 
										"Having to create a new element is rather ugly. 
										Ideally, the oldBlockOrValue has to be 'unwrapped' for the translation"
										oldBlockOrValue rtValue: anElement ]].
							
						

]

{ #category : #'public - shapes' }
RTShapeBuilder >> ifElement: conditionBlock fillColor: colorBlock [
	"If conditionBlock is evaluated at true, then colorBlock is used to set the color of the node. Both conditionBlock and colorBlock are evaluated with the model value of the node."
	| oldBlockOrValue |
	oldBlockOrValue := self fillColor.
	^self fillColorElement: [ :anElement | (conditionBlock rtValue: anElement)
									ifTrue: [ colorBlock rtValue: anElement ] 
									ifFalse: [ 
										"Having to create a new element is rather ugly. 
										Ideally, the oldBlockOrValue has to be 'unwrapped' for the translation"
										oldBlockOrValue rtValue: anElement ]].
							
						

]

{ #category : #initialization }
RTShapeBuilder >> initialize [
	super initialize.
	self reset.
 	shapeInitializer := #yourself
]

{ #category : #'public - shapes' }
RTShapeBuilder >> label [
	shape := RTLabel new
]

{ #category : #'public - shapes' }
RTShapeBuilder >> labeledAs: aBlock [
	| label oldShape |
	label := RTLabel new text: aBlock.
	oldShape := shape.
	shape := RTCompositeShape new.
	shape add: oldShape.
	shape add: label.
	
	shape vertical.
	shapeInitializer rtValue: shape.
	
	^ label
]

{ #category : #'public - shapes' }
RTShapeBuilder >> labeledBox [
	"
	A box with a label in it.

	b := RTMondrian new.
	b shape labeledBox.
	b nodes: Dictionary withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout sugiyama.
	b
	"
	self composite: [ :comp |
		comp add: RTBox new.
		comp add: RTLabel new.
		comp allOfSameSizeWithPadding.
		 ]
]

{ #category : #'public - shapes' }
RTShapeBuilder >> labeledBoxUsing: aValueOrABlockOrASymbol [
	"
	A box with a label in it.

	b := RTMondrian new.
	b shape labeledBoxUsing: [:value | 'Value ', value asString ].
	b nodes: Dictionary withAllSubclasses.
	b edges connectFrom: #superclass.
	b layout sugiyama.
	b
	
	Another example
	
b := RTMondrian new.
b shape labeledBoxUsing: [:value | 'Value ', value asString ].

b nodes: (1 to: 100).
b layout grid.
b
	"
	self composite: [ :comp |
		comp add: RTBox new.
		comp add: (RTLabel new text: aValueOrABlockOrASymbol).
		comp allOfSameSizeWithPadding.
		 ]
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> line [
	self shape: RTLine new
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> lineDualWidth [
	"This is a particular kind of lines. No repetition are allowed and edges must not be directional. Here is an example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
edges := { 1 -> 2 . 1 -> 2 . 1 -> 3 . 5 -> 3 . 1 -> 3 . 1 -> 3 . 3 -> 1 . 5 -> 1 . 5 -> 2 }.
nodes := ((edges collect: #key), (edges collect: #value)) asSet.

toValue := [ :fromValue | (edges select: [ :assoc | assoc key = fromValue ]) collect: #value as: Set ].
weightValue := [ :fromValue :toValue | (edges select: [ :assoc | assoc key = fromValue and: [ assoc value = toValue ] ]) size ].

b := RTMondrian new.
b shape label.
b nodes: nodes.

b shape lineDualWidth 
	color: Color blue trans; 
	withShorterDistanceAttachPoint;
	widthFrom: [ :anEdge | weightValue value: anEdge from model value: anEdge to model ];
	widthTo: [ :anEdge | weightValue value: anEdge to model value: anEdge from model ].
b edges 
	noRepetition; noBidirectional;
	connectToAll: [ :fromValue | toValue value: fromValue ].
b layout force charge: -300.
b
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
	
	self shape: RTLineDualWidth new
]

{ #category : #'public - shapes' }
RTShapeBuilder >> linearFillColor: block within: groupOfObjects [
	"Set the linear fill color for the nodes. The gradient goes from white to black. anObject could be a symbol, a block or a value. anObject is evaluated against the model of the node to be paint. aGroup is a collection of the model values. This is where the maximum is looked into."
	
	| max |
	"If the collection is empty, then we return an arbitrary color. 
	 If the script is properly done, the color should not be used"
	groupOfObjects isEmpty ifTrue: [ ^ Color red ].
	
	max := groupOfObjects maxValue: block.
	self current color: [ :v | Color grayScale256: 256 - ((block rtValue: v) max: max in: (1 to: 256)) ]
]

{ #category : #'public - shapes' }
RTShapeBuilder >> noBorder [
	self borderColor: Color transparent
]

{ #category : #'public - shapes' }
RTShapeBuilder >> octagon [
	shape := RTPolygon octagon
]

{ #category : #'public - shapes' }
RTShapeBuilder >> orthoHorizontalLine [
	^ self shape: RTStyledMultiLine new orthoHorizontal 
]

{ #category : #'public - shapes' }
RTShapeBuilder >> orthoVerticalLine [
	^ self shape: (RTStyledMultiLine new withVerticallAttachPoint; orthoVertical)
]

{ #category : #'public - shapes' }
RTShapeBuilder >> pentagon [
	shape := RTPolygon pentagon
]

{ #category : #'public - shapes' }
RTShapeBuilder >> rectangle [
	self box
]

{ #category : #accessing }
RTShapeBuilder >> reset [
	self resetShape.
	self resetCreatedElements
]

{ #category : #accessing }
RTShapeBuilder >> resetCreatedElements [
	createdElements := OrderedCollection new
]

{ #category : #accessing }
RTShapeBuilder >> resetShape [
	shape := RTNoShape instance
]

{ #category : #'public - shapes' }
RTShapeBuilder >> rhomboid [
	shape := RTPolygon rhomboid
]

{ #category : #'public - building' }
RTShapeBuilder >> setUpElement: anElement [
	self hasSetShape ifFalse: [ self rectangle ].
	^ anElement + shape
]

{ #category : #'public - building' }
RTShapeBuilder >> setUpElements: elements [
	self hasSetShape ifFalse: [ self rectangle ].
	^ elements + shape
]

{ #category : #accessing }
RTShapeBuilder >> shape [
	"Return the shape currently built"
	^ shape
]

{ #category : #accessing }
RTShapeBuilder >> shape: aRoassalShape [
	"Useful to set a shape in the builder. For example, this method may be used when overriding the method createShapeBuilder in a Builder"
	shape := aRoassalShape.
	shapeInitializer rtValue: shape.
	^ aRoassalShape
]

{ #category : #accessing }
RTShapeBuilder >> shapeInitializer: aBlock [
	"Invoked after a shape has been designed"
	shapeInitializer := aBlock
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> shortestDistanceAttachPoint [
	"Set the vertical attach point for the edges to be built"
	self attachPoint: #withShorterDistanceAttachPoint


	
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> shortestDistanceAttachPointWithJump [
	"Set the vertical attach point for the edges to be built"
	self attachPoint: #withShorterDistanceAttachPointWithJump


	
]

{ #category : #'public - shapes' }
RTShapeBuilder >> star [
	shape := RTPolygon star
]

{ #category : #'public - shapes' }
RTShapeBuilder >> styledLabel [
	shape := RTStyledLabel new
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> styledLine [
	"
	Set a styled line in the shape builder. A styled line could be dashed, and with different styles.
	Have a look to RTStyledMultiLine for the complete API.
	
	Here is an example:
-=-=-=
v := RTView new.

elements := RTEllipse new size: 20; elementsOn: (1 to: 10).
v addAll: elements.

eb := RTEdgeBuilder new.

eb shape styledLine dashedLine arrowHead.

eb view: v.
eb connectFrom: [ :value | value // 2 ].

RTTreeLayout on: elements.
v
-=-=-=
	"
	self shape: RTStyledMultiLine new
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> text [
	self shape: RTLabel new
]

{ #category : #'public - shapes' }
RTShapeBuilder >> triangle [
	shape := RTPolygon triangle
]

{ #category : #'public - shapes' }
RTShapeBuilder >> vee [
	shape := RTPolygon vee
]

{ #category : #'public - shape - attach point on edges' }
RTShapeBuilder >> verticalAttachPoint [
	"Set the vertical attach point for the edges to be built"
	self attachPoint: #withVerticallAttachPoint

	
]

{ #category : #'public - shape - edges' }
RTShapeBuilder >> verticalBezierLine [
	self shape: RTBezierLine vertical
]

{ #category : #'public - shapes' }
RTShapeBuilder >> withBorder [
	self borderColor: Color black
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withText [
	^ self withText: #yourself
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withText: aSymbolOrABlock [
	shape := shape + (RTLabel new text: aSymbolOrABlock).
	^ shape
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withText: aSymbolOrABlock color: aColor [
	shape := shape + (RTLabel new color: aColor; text: aSymbolOrABlock).
	^ shape
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withText: aSymbolOrABlock height: aHeightAsIntegerOrBlock [
	shape := shape + (RTLabel new height: aHeightAsIntegerOrBlock; text: aSymbolOrABlock).
	^ shape
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withText: aSymbolOrABlock height: aHeightAsIntegerOrBlock color: aColor [
	shape := shape + (RTLabel new height: aHeightAsIntegerOrBlock; color: aColor; text: aSymbolOrABlock).
	^ shape
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextAbove [
	^ self withTextAbove: #yourself
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextAbove: aSymbolOrABlock [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: (RTLabel new text: aSymbolOrABlock).
	newShape add: shape.
	newShape vertical.
	newShape setAutomaticRelayout.
	shape := newShape.
]

{ #category : #'public - text shape' }
RTShapeBuilder >> withTextBelow [
	^ self withTextBelow: #yourself
]

{ #category : #'public - text shape' }
RTShapeBuilder >> withTextBelow: aSymbolOrABlock [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: shape.
	newShape add: (RTLabel new text: aSymbolOrABlock).
	newShape vertical.
	newShape setAutomaticRelayout.
	shape := newShape.
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextColor: aColorOrABlock [
	"Set the color of the text. Should be used only with a composite Shape"
	self assert: [ shape class == RTCompositeShape ] description: 'This method should be used only if a text has been added to a box or an ellipse'.
	(shape shapesInstancesOf: RTLabel) do: [ :l | l color: aColorOrABlock ]
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextOnTheLeft [
	^ self withTextOnTheLeft: #yourself
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextOnTheLeft: aSymbolOrABlock [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: (RTLabel new text: aSymbolOrABlock).
	newShape add: shape.
	newShape horizontal.
	newShape setAutomaticRelayout.
	shape := newShape.
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextOnTheRight [
	^ self withTextOnTheRight: #yourself
]

{ #category : #'public - shapes - texting' }
RTShapeBuilder >> withTextOnTheRight: aSymbolOrABlock [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: shape.
	newShape add: (RTLabel new text: aSymbolOrABlock).
	newShape horizontal.
	newShape setAutomaticRelayout.
	shape := newShape.
]
