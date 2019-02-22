"
A RTGradientColoredLine is an alpha and color gradiant shape between the two first values of colorArray. Precision define the number of gradient colors for the edges.

Instance Variables
	precision :		<Object>

"
Class {
	#name : #RTGradientColoredLine,
	#superclass : #RTMultiColoredLine,
	#instVars : [
		'precision'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTGradientColoredLine >> getColorAtStep: anInteger [

	^ Color fromRgbTriplet: (Array with:
	((colorArray first red * (1 - ((1 / precision) * anInteger))) + (colorArray second red * (1 / precision) * anInteger)) with:
	 ((colorArray first green * (1 - ((1 / precision) * anInteger))) + (colorArray second green * (1 / precision) * anInteger)) with:
	((colorArray first blue * (1 - ((1 / precision) * anInteger))) + (colorArray second blue * (1 / precision) * anInteger))
	)

]

{ #category : #'as yet unclassified' }
RTGradientColoredLine >> gradientColorShape [
	| diff  gradientColorArray |

	diff := (colorArray second alpha - colorArray first alpha).
	gradientColorArray := Array with: (colorArray first).

	(2 to: (precision - 1)) do: [ :i | gradientColorArray := gradientColorArray copyWith: ((self getColorAtStep: i) alpha: ( (colorArray first) alpha + ((i - 1) * diff / (precision - 1)) )) ]. 

	gradientColorArray := gradientColorArray copyWith: (colorArray last).
	colorArray := gradientColorArray.
	
	self colorShape.
]

{ #category : #initialization }
RTGradientColoredLine >> initialize [
	super initialize.
	precision := 1.
]

{ #category : #accessing }
RTGradientColoredLine >> precision [
	^ precision
]

{ #category : #accessing }
RTGradientColoredLine >> precision: anInteger [
	^ precision := anInteger
]
