Class {
	#name : #RTPieBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'objects',
		'values',
		'sum',
		'elements'
	],
	#category : #'Roassal2-Builder-PieChart'
}

{ #category : #'public - pies' }
RTPieBuilder >> emphasize: object by: anIntegerOrASymbolOrABlock [
	"public method"
	"Move the pie to a given offset"
	"anIntegerOrASymbolOrABlock is the distance for which object has to be moved away"
	| element trachelShape delta v |
	element := elements elementFromModel: object.
	trachelShape := element trachelShape.
	
	v := (anIntegerOrASymbolOrABlock rtValue: object).
	delta := (trachelShape position + (v @ 0)) 
						rotateBy: ((trachelShape betaAngle - trachelShape alphaAngle) / 2 + trachelShape alphaAngle) * 3.1415 / 180
						about: trachelShape position.
	trachelShape translateTo: delta.
	
]

{ #category : #'public - shapes' }
RTPieBuilder >> emphasizeBy: anIntegerOrASymbolOrABlock [
	"anIntegerOrASymbolOrABlock is the distance for which object has to be moved away"
	objects do: [ :object |
		self emphasize: object by: anIntegerOrASymbolOrABlock ]
]

{ #category : #initialization }
RTPieBuilder >> initialize [
	super initialize.
	objects := #().
	self initializeShapeBuilder
]

{ #category : #initialization }
RTPieBuilder >> initializeShapeBuilder [
	self shape arc  
		outerAngle: [ :e | self outerAngleOf: e ]
			innerAngle: [ :e | self innerAngleOf: e ];
		innerRadius: 0;
		externalRadius: 90;
		color: RTNIdentityNormalizer new
]

{ #category : #'private - utility' }
RTPieBuilder >> innerAngleOf: element [
	| i |
	i := element attributes at: #index.
	^ (values at: i) / sum * 360.
]

{ #category : #'private - utility' }
RTPieBuilder >> label: aBlock withObject: anObject [
	"Private method"
	| element trachelShape labelPosition lbl off |
	element := elements elementFromModel: anObject.
	trachelShape := element trachelShape.
	
	off := (trachelShape class == TRArcShape) 
				ifTrue: [ trachelShape externalRadius + 30 ] 
				ifFalse: [ 0 ].
	labelPosition := (trachelShape position + (off @ 0)) 
						rotateBy: ((trachelShape betaAngle - trachelShape alphaAngle) / 2 + trachelShape alphaAngle) * 3.1415 / 180
						about: trachelShape position.

	lbl := RTLabel elementOn: (aBlock rtValue: anObject) asString.
	view add: lbl.
	"view canvas addShape: lbl."
	lbl trachelShape translateTo: labelPosition
]

{ #category : #'public - shapes' }
RTPieBuilder >> labeled [
	"Make each pie having a label"
	self labeledIf: true
]

{ #category : #obsolete }
RTPieBuilder >> labeled: aBlockLabel [
	"Make each pie having a label that respect the aBlockLabel"	
	self labeledIf: true withBlock: aBlockLabel
]

{ #category : #'public - shapes' }
RTPieBuilder >> labeledIf: aBlock [
	self labeledIf: aBlock withBlock: [ :o | o ]
]

{ #category : #'public - shapes' }
RTPieBuilder >> labeledIf: aBlock withBlock: aBlockLabel [
	objects do: [ :object |
		(aBlock rtValue: object) ifTrue: [ self label: aBlockLabel withObject: object ] ]
]

{ #category : #obsolete }
RTPieBuilder >> labelled [
	"Make each pie having a label"
	self deprecated: 'Please, use #labeled instead'.
	self labeled
]

{ #category : #obsolete }
RTPieBuilder >> labelled: aBlockLabel [
	"Make each pie having a label that respect the aBlockLabel"
	self deprecated: 'Please, use #labeled: instead'.
	self labeledIf: true withBlock: aBlockLabel
]

{ #category : #obsolete }
RTPieBuilder >> labelledIf: aBlock [
	self deprecated: 'Please, use #labeledIf: instead'.
	self labeledIf: aBlock
]

{ #category : #obsolete }
RTPieBuilder >> labelledIf: aBlock withBlock: aBlockLabel [
	self deprecated: 'Please, use #labeledIf:withBlock: instead'.
	self labeledIf: aBlock withBlock: aBlockLabel
]

{ #category : #'public - pies' }
RTPieBuilder >> objects: someObjects [
	objects := someObjects
]

{ #category : #'private - utility' }
RTPieBuilder >> outerAngleOf: e [
	^ ((values copyFrom: 1 to: (e attributes at: #index) - 1), (Array with: 0)) sum * 360.0 / sum
]

{ #category : #'public - pies' }
RTPieBuilder >> slice: aBlockOrASymbol [
	values := objects collect: aBlockOrASymbol.
	sum := values sum.
	elements := RTGroup new.
	objects doWithIndex: [ :obj :index | | e |
		e := RTElement new model: obj.
		e attributes at: #index put: index.
		e addShape: self shape shape.
		elements add: e.
	].
	view addAll: elements.
	^ elements
]
