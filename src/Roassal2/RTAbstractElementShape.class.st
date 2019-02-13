Class {
	#name : #RTAbstractElementShape,
	#superclass : #RTShape,
	#instVars : [
		'height',
		'width',
		'borderColor',
		'borderWidth'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTAbstractElementShape >> borderColor [
	^ borderColor
]

{ #category : #accessing }
RTAbstractElementShape >> borderColor: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self borderColorElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTAbstractElementShape >> borderColorElement: aValueOrAOneArgBlock [
	borderColor := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTAbstractElementShape >> borderColorFor: anElement [
	^ borderColor rtValue: anElement
]

{ #category : #accessing }
RTAbstractElementShape >> borderWidth [
	^ borderWidth
]

{ #category : #accessing }
RTAbstractElementShape >> borderWidth: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self borderWidthElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
	
]

{ #category : #accessing }
RTAbstractElementShape >> borderWidthElement: aValueOrAOneArgBlock [
	borderWidth := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTAbstractElementShape >> borderWidthFor: anElement [
	^ borderWidth rtValue: anElement
]

{ #category : #configuration }
RTAbstractElementShape >> defaultHeight [
	^ 5
]

{ #category : #configuration }
RTAbstractElementShape >> defaultWidth [
	^ 5
]

{ #category : #accessing }
RTAbstractElementShape >> extent: extentAsPoint [
	self widthElement: extentAsPoint x.
	self heightElement: extentAsPoint y.

]

{ #category : #accessing }
RTAbstractElementShape >> height [
	^ height
]

{ #category : #accessing }
RTAbstractElementShape >> height: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self heightElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTAbstractElementShape >> heightElement: aValueOrASymbolOrAOneArgBlock [
	height := aValueOrASymbolOrAOneArgBlock
]

{ #category : #rendering }
RTAbstractElementShape >> heightFor: anElement [
	^ height rtValue: anElement
]

{ #category : #initialization }
RTAbstractElementShape >> initialize [
	super initialize.
	width := self defaultWidth.
	height := self defaultHeight.
	borderWidth := 1
	
]

{ #category : #configuration }
RTAbstractElementShape >> noBorder [
	self borderWidth: 0
]

{ #category : #accessing }
RTAbstractElementShape >> size: aValueOrASymbolOrAOneArgBlock [
	self height: aValueOrASymbolOrAOneArgBlock.
	self width: aValueOrASymbolOrAOneArgBlock
]

{ #category : #accessing }
RTAbstractElementShape >> sizeElement: aValueOrASymbolOrAOneArgBlock [
	"Argument evaluated against the element"
	self heightElement: aValueOrASymbolOrAOneArgBlock.
	self widthElement: aValueOrASymbolOrAOneArgBlock
]

{ #category : #accessing }
RTAbstractElementShape >> width [
	^ width
]

{ #category : #accessing }
RTAbstractElementShape >> width: aValueOrASymbolOrAOneArgBlock [
	"aValueOrASymbolOrAOneArgBlock is applied on the object model"
	self widthElement: [ :anElement | aValueOrASymbolOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTAbstractElementShape >> widthElement: aValueOrASymbolOrAOneArgBlock [
	width := aValueOrASymbolOrAOneArgBlock
]

{ #category : #rendering }
RTAbstractElementShape >> widthFor: anElement [
	^ width rtValue: anElement
]
