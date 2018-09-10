Class {
	#name : #RTCubeHelix,
	#superclass : #RTObject,
	#instVars : [
		'hueShift',
		'rotations',
		'saturation',
		'gamma'
	],
	#classVars : [
		'Coefficients'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #'instance creation' }
RTCubeHelix class >> hueShift: hueShift rotations: rotations saturation: saturation [
	^ self new
		hueShift: hueShift;
		rotations: rotations;
		saturation: saturation;
		yourself
]

{ #category : #'class initialization' }
RTCubeHelix class >> initialize [
	" self initialize "
	Coefficients := TRPlatform current matrixClass rows: 3 columns: 2 contents: #(
		-0.14861	1.78277
		-0.29227	-0.90649
		1.97924	0
	)
]

{ #category : #accessing }
RTCubeHelix >> gamma [
	^ gamma 
]

{ #category : #accessing }
RTCubeHelix >> gamma: aNumber [
	"Defines the luminance bias of the gradient.
	<1 : compressed dark tones
	=1 : linear progression
	>1 : compressed light tones"
	gamma := aNumber
]

{ #category : #accessing }
RTCubeHelix >> hueShift: hue [
	"Defines the starting point (the hue of the darkest color) on the chroma wheel.
	The value is modulo 3: 1=red, 2=green, 3=0=blue"
	hueShift := hue
]

{ #category : #initialization }
RTCubeHelix >> initialize [
	"values from the default gradient in the paper"
	hueShift := 0.5. "darkest color is a purple"
	rotations := -1.5. "progress towards blues rather than reds"
	saturation := 1.2.
	gamma := 1.0
]

{ #category : #accessing }
RTCubeHelix >> level: gradientParameter [
	"Return a color. gradientParameter, the argument, is a value between 0.0 and 1.0"
	| gradientGamma phi alpha |
	gradientGamma := gradientParameter raisedTo: gamma.
	phi := 2.0 * Float pi * (hueShift / 3.0 + (rotations * gradientParameter)).
	alpha := saturation * gradientGamma * (1.0 - gradientGamma) / 2.0.
	Coefficients ifNil: [ self class initialize. ].
	
	^ Color fromRgbTriplet: (
		( (Coefficients *alpha) +* (Array with: phi cos with: phi sin)) + gradientGamma
			collect: [ :c | c min: 1 max: 0 ])
]

{ #category : #accessing }
RTCubeHelix >> rotations [
	^ rotations
]

{ #category : #accessing }
RTCubeHelix >> rotations: nbRotations [
	"Defines the angular spread and direction of the gradient over the chromatic wheel.
	From dark to light, positive values will follow the RGB order (and negative values in the other direction)"
	rotations := nbRotations
]

{ #category : #accessing }
RTCubeHelix >> saturation [
	^ saturation
]

{ #category : #accessing }
RTCubeHelix >> saturation: saturationCoefficient [
	"Defines the deviation away from gray levels (saturation 0).
	Values higher than 1 can produce saturated colors."
	saturation := saturationCoefficient
]
