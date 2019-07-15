Class {
	#name : #RTHorizontalAllValuesDecorator,
	#superclass : #RTAbstractHorizontalValuesDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #rendering }
RTHorizontalAllValuesDecorator >> render [	
	self addAll: self datasetValuesX asSet. 
	super render.

]
