"
A RTEllipseTest is a test class for testing the behavior of RTEllipse
"
Class {
	#name : #RTEllipseTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTEllipseTest >> testBorderWidth [

	self assert: (RTEllipse new borderWidth rtValue: RTElement new) equals: TREllipseShape defaultStrokeWidth
]

{ #category : #tests }
RTEllipseTest >> testBorderWidth02 [

	self assert: (RTEllipse new borderWidthFor: RTElement new) equals: TREllipseShape defaultStrokeWidth
]
