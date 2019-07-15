Class {
	#name : #TRNoDecoratorShape,
	#superclass : #TRAbstractLineDecoratorShape,
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #visitor }
TRNoDecoratorShape >> accept: aVisitor [
	aVisitor visitNoShape: self
]

{ #category : #actions }
TRNoDecoratorShape >> addedIn: aCanvas [
	"Do nothing"
]

{ #category : #accessing }
TRNoDecoratorShape >> center [
	0@0
]

{ #category : #hooks }
TRNoDecoratorShape >> computePath [
	"do nothing"
]

{ #category : #drawing }
TRNoDecoratorShape >> drawOn: athensCanvas [
	"do nothing"
]

{ #category : #accessing }
TRNoDecoratorShape >> encompassingRectangle [
	^ 0@0 corner: 0@0
]

{ #category : #accessing }
TRNoDecoratorShape >> height [
	^ 0
]

{ #category : #accessing }
TRNoDecoratorShape >> position [
	^ 0 @ 0
]

{ #category : #actions }
TRNoDecoratorShape >> pushBack [
	"do nothing"
]

{ #category : #actions }
TRNoDecoratorShape >> pushFront [
	"do nothing"
]

{ #category : #actions }
TRNoDecoratorShape >> setAsFixed [
	"Not much to do"
]

{ #category : #actions }
TRNoDecoratorShape >> translateBy: aPoint [
	"do nothing"
]

{ #category : #actions }
TRNoDecoratorShape >> translateTo: aPoint [
	"do nothing"
]

{ #category : #accessing }
TRNoDecoratorShape >> width [
	^ 0
]
