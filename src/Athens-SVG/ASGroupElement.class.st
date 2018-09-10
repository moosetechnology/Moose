Class {
	#name : #ASGroupElement,
	#superclass : #ASContainerElement,
	#instVars : [
		'stroke_opacity'
	],
	#category : #'Athens-SVG'
}

{ #category : #attributes }
ASGroupElement >> stroke_opacity: aString [ 
	stroke_opacity := self translateNumber: aString

]
