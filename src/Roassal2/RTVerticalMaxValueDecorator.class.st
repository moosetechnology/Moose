"
=-=-=-=
| b ds |
b := RTGrapher new.

ds := RTData new.
ds points: RTShape withAllSubclasses.
ds y: #numberOfMethods.
b add: ds.

b addDecorator: RTVerticalMinValueDecorator new red.
b addDecorator: RTVerticalMaxValueDecorator new blue.

b axisY noLabel.
b 
=-=-=-=
"
Class {
	#name : #RTVerticalMaxValueDecorator,
	#superclass : #RTAbstractVerticalValuesDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #drawing }
RTVerticalMaxValueDecorator >> render [	
	self add: self datasetValues max. 
	super render.

]
