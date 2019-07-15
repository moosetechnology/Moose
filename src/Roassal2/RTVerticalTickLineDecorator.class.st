Class {
	#name : #RTVerticalTickLineDecorator,
	#superclass : #RTAbstractTickLineDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #hooks }
RTVerticalTickLineDecorator >> axis [
	^ builder getAxisX
]

{ #category : #drawing }
RTVerticalTickLineDecorator >> render [
	| xLine mm |
	mm := RTMetricNormalizer new.
	(self minValue to: self maxValue by: self step)
		do: [ :x | 
			xLine := mm
				getValue: x
				min: self fromPoint x
				max: self toPoint x
				minValue: self minValue
				maxValue: self maxValue.
			self lineFrom: xLine @ builder getAxisY fromPoint y to: xLine @ builder getAxisY toPoint y ]
]
