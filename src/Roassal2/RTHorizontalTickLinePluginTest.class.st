Class {
	#name : #RTHorizontalTickLinePluginTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Grapher-Tests'
}

{ #category : #tests }
RTHorizontalTickLinePluginTest >> testDefault [

	| b p |
	b := RTGrapher new.
	p := RTHorizontalTickLineDecorator new.
	p builder: b.
	p lineFrom: 10 @ 10 to: 20 @ 20.
]
