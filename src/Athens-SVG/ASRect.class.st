"
The 'rect' element defines a rectangle which is axis-aligned with the current user coordinate system. Rounded rectangles can be achieved by setting appropriate values for attributes rx and ry.

If a properly specified value is provided for rx but not for ry, then the user agent processes the 'rect' element with the effective value for ry as equal to rx. If a properly specified value is provided for ry but not for rx, then the user agent processes the 'rect' element with the effective value for rx as equal to ry. If neither rx nor ry has a properly specified value, then the user agent processes the 'rect' element as if no rounding had been specified, resulting in square corners. If rx is greater than half of the width of the rectangle, then the user agent processes the 'rect' element with the effective value for rx as half of the width of the rectangle. If ry is greater than half of the height of the rectangle, then the user agent processes the 'rect' element with the effective value for ry as half of the height of the rectangle.
Mathematically, a 'rect' element can be mapped to an equivalent 'path' element as follows: (Note: all coordinate and length values are first converted into user space coordinates according to Units.)
● perform an absolute moveto operation to location (x+rx,y), where x is the value of the 'rect' element's x attribute converted to user space, rx is the effective value of the rx attribute converted to user space and y is the value of the y attribute converted to user space
● perform an absolute horizontal lineto operation to location (x+width-rx,y), where width is the 'rect' element's width attribute converted to user space
● perform an absolute elliptical arc operation to coordinate (x+width,y+ry), where the effective values for the rx and ry attributes on the 'rect' element converted to user space are used as the rx and ry attributes on the elliptical arc command, respectively, the x-axis-rotation is set to zero, the large-arc-flag is set to zero, and the sweep-flag is set to one
● perform a absolute vertical lineto to location (x+width,y+height-ry), where height is the 'rect' element's height attribute converted to user space
● perform an absolute elliptical arc operation to coordinate (x+width-rx,y+height)
● perform an absolute horizontal lineto to location (x+rx,y+height)
● perform an absolute elliptical arc operation to coordinate (x,y+height-ry)
● perform an absolute absolute vertical lineto to location (x,y+ry)
● perform an absolute elliptical arc operation to coordinate (x+rx,y)
"
Class {
	#name : #ASRect,
	#superclass : #ASShape,
	#instVars : [
		'x',
		'y',
		'width',
		'height',
		'rx',
		'ry'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASRect >> height: aString [ 

	height := self translateNumber: aString
]

{ #category : #'as yet unclassified' }
ASRect >> initialize [
	super initialize.
	
	x := y := rx := ry := 0.
]

{ #category : #'as yet unclassified' }
ASRect >> rx: aString [ 

	rx := self translateNumber: aString
]

{ #category : #'as yet unclassified' }
ASRect >> ry: aString [ 

	ry := self translateNumber: aString
]

{ #category : #'as yet unclassified' }
ASRect >> setShapeOn: aCanvas [
	aCanvas setShape: (Rectangle origin: x@y extent: width@height).

	"todo: take rx, ry into account"
]

{ #category : #'as yet unclassified' }
ASRect >> width: aString [ 

	width := self translateNumber: aString
]

{ #category : #'as yet unclassified' }
ASRect >> x: aString [ 

	x := self translateNumber: aString
]

{ #category : #'as yet unclassified' }
ASRect >> y: aString [ 

	y := self translateNumber: aString
]
