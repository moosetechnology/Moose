Class {
	#name : #ASPath,
	#superclass : #ASShape,
	#instVars : [
		'pathData',
		'pathCache',
		'athensPath',
		'bbox'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASPath >> buildPathOn: aCanvas [ 

	pathCache := WeakArray with: aCanvas surface.
	athensPath := aCanvas createPath: [:builder |
		
		pathData do: [:each |
			builder perform: each first withArguments: each second
			]
	]

]

{ #category : #'as yet unclassified' }
ASPath >> checkCacheFor: aCanvas [ 

	pathCache ifNil: [ ^ self buildPathOn: aCanvas ].
	pathCache first == aCanvas surface ifFalse: [ ^ self buildPathOn: aCanvas ]
]

{ #category : #'as yet unclassified' }
ASPath >> d: aString [ 

"	d = 'path data'
	A path is defined by including a 'path' element which contains a d=(path data) attribute, where the d attribute contains the moveto, 
	line, curve (both cubic and quadratic Béziers), arc and closepath instructions.
"

	| conv |
	conv := ASPathConverter new stream: aString readStream.

	pathData := conv convertPathData.
	bbox := conv bbox.
]

{ #category : #'as yet unclassified' }
ASPath >> setShapeOn: aCanvas [

	self checkCacheFor: aCanvas.
	aCanvas setShape: athensPath.
	
]
