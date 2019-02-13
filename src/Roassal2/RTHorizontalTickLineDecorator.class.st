"
Add some horizontal lines, one line per tick.

	b := RTGrapher new.

	b extent: 300 @ 200.

	ds := RTData new.
	ds points: (-50 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) sin  ].
	ds noDot.
	ds interaction popupText: 'sinus'.
	ds connectColor: Color blue.
	b add: ds.

	ds := RTData new.
	ds points: (-50 to: 100 by: 0.1).
	ds y: [ :x | (0.1 * x) cos  ].
	ds noDot.
	ds interaction popupText: 'cosinus'.
	ds connectColor: Color red.
	b add: ds.

	b addDecorator: RTHorizontalTickLineDecorator new.
	b addDecorator: RTVerticalTickLineDecorator new.

	^ b
	
"
Class {
	#name : #RTHorizontalTickLineDecorator,
	#superclass : #RTAbstractTickLineDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #hooks }
RTHorizontalTickLineDecorator >> axis [
	^ builder getAxisY
]

{ #category : #drawing }
RTHorizontalTickLineDecorator >> render [	
	| axis yLine mm |
	axis := builder getAxisY.
	mm := RTMetricNormalizer new.
	(self minValue to: self maxValue by: self step) do: [ :y |
		yLine := mm
						getValue: y
						min: self fromPoint y 
						max: self toPoint y
						minValue: self minValue 
						maxValue: self maxValue.
		self lineFrom: 	builder getAxisX fromPoint x @ yLine to: builder getAxisX toPoint x @ yLine.
		]
]
