Class {
	#name : #ASShape,
	#superclass : #ASElement,
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASShape >> renderShapeOn: aCanvas [

"	(self id ='path3070-4' ) ifTrue: [ self halt ]."
	
	self display = 'none' ifTrue: [ ^ self ].
	
	self setShapeOn: aCanvas.
	self fill fill: self on: aCanvas.
	self stroke stroke: self on: aCanvas.

]

{ #category : #'as yet unclassified' }
ASShape >> setShapeOn: aCanvas [
	self subclassResponsibility 
]
