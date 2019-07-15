Class {
	#name : #ASTransformConverter,
	#superclass : #ASConverter,
	#instVars : [
		'transform'
	],
	#category : #'Athens-SVG'
}

{ #category : #operations }
ASTransformConverter >> matrix [
	"matrix(<a> <b> <c> <d> <e> <f>), which specifies a transformation in the form of a transformation matrix of six values. matrix(a,b,c,d,e,f) is equivalent to applying the transformation matrix [a b c d e f]."
	
	| m |

	m := AthensAffineTransform new.
"
Athens matrix: 

| sx   shx   x   |
| shy sy     y   |
|  0     0     1   | "	

"
SVG matrix: 
| a   c   e   |
| b   d  f  |
|  0     0     1   | "	
	

"a"	self skipBlanks.
	m sx: self nextNumber.

"b"	self skipBlanksAndComma.
	m shy: self nextNumber.

"c"	self skipBlanksAndComma.
	m shx: self nextNumber.

"d"	self skipBlanksAndComma.
	m sy: self nextNumber.

"e"	self skipBlanksAndComma.
	m x: self nextNumber.
	
"f"	self skipBlanksAndComma.
	m y: self nextNumber.

	transform multiplyBy: m
	
]

{ #category : #operations }
ASTransformConverter >> rotate [
	"
rotate(<rotate-angle> [<cx> <cy>]), which specifies a rotation by <rotate-angle> degrees about a given point.
If optional parameters <cx> and <cy> are not supplied, the rotate is about the origin of the current user coordinate system. The operation corresponds to the matrix [cos(a) sin(a) -sin(a) cos(a) 0 0].
If optional parameters <cx> and <cy> are supplied, the rotate is about the point (<cx>, <cy>). The operation represents the equivalent of the following specification: translate(<cx>, <cy>) rotate(<rotate- angle>) translate(-<cx>, -<cy>).
	
	"
	| angle cx cy |
	
	angle := self nextNumber.
	cx := self nextNumber.
	cy := self nextNumber.

	cx ifNil: [
		transform rotateByDegrees: angle negated .		
	] ifNotNil: [
		"if cx is given, cy should also be present"
		self assert: cy notNil. 
	
		transform translateX: cx Y: cy. 
		transform rotateByDegrees: angle negated.		
		transform translateX: cx negated  Y: cy negated. 
	].


]

{ #category : #accessing }
ASTransformConverter >> scale [
	"
	scale(<sx> [<sy>]), which specifies a scale operation by sx and sy. If <sy> is not provided, it is assumed
to be equal to <sx>.
	
	"
	
	| sx sy |
	
	sx := self nextNumber.
	self skipBlanks.
	sy := self nextNumber ifNil: [ sx ].
	
	transform scaleX: sx Y: sy
]

{ #category : #'public access' }
ASTransformConverter >> translate [
	"
	translate(<tx> [<ty>]), which specifies a translation by tx and ty. If <ty> is not provided, it is assumed to be zero.
	"
	| tx ty |

	tx := self nextNumber.
	self skipBlanks.
	ty := 0.
	(stream peek = $,) ifTrue: [
		stream next.
		self skipBlanks.
		ty := self nextNumber ifNil: [ 0 ]].
	
	transform translateX: tx Y: ty
]

{ #category : #operations }
ASTransformConverter >> translateString: aString [ 
	"translate the transform data 
	
	'rotate(10) scale (1) translate (100,10)'
	"

	stream := aString readStream.
	transform := AthensAffineTransform new.
		
	[ stream atEnd ] whileFalse: [ | type |
		type := (stream upTo: $() trimBoth.	
		self perform: type asSymbol.
		
		stream upTo: $).
		self skipBlanks
		 ].
	^ transform
]
