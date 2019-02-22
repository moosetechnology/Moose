Class {
	#name : #RTStretchBehavior,
	#superclass : #RTNestingBehavior,
	#category : #'Roassal2-Core'
}

{ #category : #hooks }
RTStretchBehavior >> on: backElement setNested: elements [
	"It makes a scaling/zooming effect.
	If you change backElement's extent, it changes proportionaly extent and position of nested elements. 
	So the overall image --- composition of backElement and elements --- does not change. 
	It only zoom in/out the overall image."
	| callback |
	super on: backElement setNested: elements.
	callback := TRExtentCallback block: [ :shape :ratio | 
		| mainPosition |
		mainPosition := backElement position.
		elements do: [ :eachElement | 
			| eachPosition |
			eachPosition := eachElement position.
			eachElement 
				extent: eachElement extent * ratio;
				translateTo: mainPosition + ((eachPosition - mainPosition) * ratio) ] ].
	backElement trachelShape addCallback: callback 
]
