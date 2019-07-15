"
I'm a class that models matrix data as concentric rings, with columns and row separations.
Look at exampleRTMatrixRing for details on how to use it.

"
Class {
	#name : #RTMatrixRing,
	#superclass : #RTBuilder,
	#instVars : [
		'matrix',
		'elements',
		'innerRadius',
		'externalRadius',
		'rowGap',
		'columnGap',
		'lineShape',
		'rowBlock',
		'columnBlock'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #accessing }
RTMatrixRing >> columnBlock [
	^ columnBlock
]

{ #category : #accessing }
RTMatrixRing >> columnBlock: anObject [
	columnBlock := anObject
]

{ #category : #accessing }
RTMatrixRing >> columnGap [
	^ columnGap
]

{ #category : #accessing }
RTMatrixRing >> columnGap: aNumber [
	columnGap := aNumber.
	self lineShape width: aNumber.
]

{ #category : #accessing }
RTMatrixRing >> elements [
	^ elements
]

{ #category : #accessing }
RTMatrixRing >> elements: anObject [
	elements := anObject
]

{ #category : #accessing }
RTMatrixRing >> externalRadius [
	^ externalRadius
]

{ #category : #accessing }
RTMatrixRing >> externalRadius: anObject [
	self assert: anObject > self innerRadius.
	externalRadius := anObject
]

{ #category : #initialization }
RTMatrixRing >> initialize [
	super initialize.
	self matrix: nil.
	self shape arc.
	self lineShape: RTLine new.
	self innerRadius: 0.
	self columnGap: 2.
	self rowGap: 2.
	self externalRadius: 240.
	self columnGap: 0.
	self columnBlock: #yourself.
	self rowBlock: #yourself.
]

{ #category : #accessing }
RTMatrixRing >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
RTMatrixRing >> innerRadius: anObject [
	self assert: anObject >= 0.
	innerRadius := anObject
]

{ #category : #accessing }
RTMatrixRing >> lineShape [
	^ lineShape
]

{ #category : #accessing }
RTMatrixRing >> lineShape: anObject [
	lineShape := anObject.
	self columnGap: 0.
]

{ #category : #accessing }
RTMatrixRing >> matrix [
	^ matrix
]

{ #category : #accessing }
RTMatrixRing >> matrix: anObject [
	matrix := anObject
]

{ #category : #hooks }
RTMatrixRing >> renderColumnGapsIn: aView [
	| partitions v1 v2 ang boxShape |
	self columnGap isZero ifTrue: [ ^ self ].
	self matrix ifNil: [ ^self ].
	boxShape := RTBox new size: 0.
	partitions := (columnBlock rtValue: (rowBlock rtValue: self matrix) first) size.
	self lineShape color: aView canvas color.
	1 to: partitions do: [ :i |
		ang := (360 * i / partitions) degreesToRadians.
		v1 := boxShape element.
		v2 := boxShape element.
		v1 translateTo: (self innerRadius - 4 * ang cos)@(self innerRadius - 4 * ang sin).
		v2 translateTo: (self externalRadius * ang cos)@(self externalRadius * ang sin).
		aView 
			add: v1;
			add: v2;
			add: (self lineShape edgeFrom: v1 to: v2).
		self elements add: v1; add: v2.
	]
]

{ #category : #hooks }
RTMatrixRing >> renderIn: aView [
	self renderMatrixIn: aView.
	self renderColumnGapsIn: aView.
]

{ #category : #hooks }
RTMatrixRing >> renderMatrixIn: aView [
	|  el rowSize columnSize betaAngle exRadius alphaAngle inRadius theMatrix theRow |
	self matrix ifNil: [^ self ].
	self elements: RTGroup new.
	theMatrix := rowBlock rtValue: self matrix.
	rowSize := theMatrix size.
	theMatrix doWithIndex: [:row :rowIndex |
		theRow := columnBlock rtValue: row. 
		columnSize := theRow size.
		betaAngle := 360 / columnSize.
		exRadius := (self externalRadius - self innerRadius)/rowSize.
		theRow doWithIndex: [:obj :column |  
			el := self shape elementOn: obj.
			el attributes 
				at: #row put:	rowIndex;
				at: #column put: column.
			alphaAngle := betaAngle * (column - 1).
			inRadius := self innerRadius + (exRadius*(rowIndex - 1)).
			el trachelShape 
				alphaAngle: alphaAngle 
				betaAngle:  alphaAngle + betaAngle
				innerRadius: inRadius 
				externalRadius: inRadius + exRadius - self rowGap.
			self elements add: el. ]
	].
	self interaction setUpElements: self elements.
	aView addAll: self elements.

]

{ #category : #accessing }
RTMatrixRing >> rowBlock [
	^ rowBlock
]

{ #category : #accessing }
RTMatrixRing >> rowBlock: anObject [
	rowBlock := anObject
]

{ #category : #accessing }
RTMatrixRing >> rowGap [
	^ rowGap
]

{ #category : #accessing }
RTMatrixRing >> rowGap: anObject [
	rowGap := anObject
]
