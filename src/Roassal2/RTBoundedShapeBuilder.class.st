"
A RTBoundedShapeBuilder is a shape builder for which all the nodes cannot have a size of less than 5 pixels.

"
Class {
	#name : #RTBoundedShapeBuilder,
	#superclass : #RTShapeBuilder,
	#category : #'Roassal2-Builder-Common'
}

{ #category : #accessing }
RTBoundedShapeBuilder >> height: aBlock [
	^ super height: [ :v | (aBlock rtValue: v) max: self minimumSize ]
]

{ #category : #configuration }
RTBoundedShapeBuilder >> minimumSize [
	^ 5
]

{ #category : #accessing }
RTBoundedShapeBuilder >> size: aBlock [
	^ super size: [ :v | (aBlock rtValue: v) max: self minimumSize ]
]

{ #category : #accessing }
RTBoundedShapeBuilder >> width: aBlock [
	"width can also be applied to an edge. We have to take this situation into account"
	^ (shape isKindOf: RTAbstractLine)
		ifTrue: [ super width: aBlock ]
		ifFalse: [ super width: [ :v | (aBlock rtValue: v) max: self minimumSize ] ]
]
