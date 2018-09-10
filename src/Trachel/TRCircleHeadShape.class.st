Class {
	#name : #TRCircleHeadShape,
	#superclass : #TRAbstractLineDecoratorShape,
	#category : #'Trachel-ShapesForArrow'
}

{ #category : #hooks }
TRCircleHeadShape >> computePath [
	path := TRPlatform current computeCircleHeadPathFor: self.
	
]

{ #category : #initialization }
TRCircleHeadShape >> initialize [
	super initialize.
	open := false.
]
