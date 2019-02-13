"
This Shape represent an OpenStreetMap background object which tracks the camera zoom level and translation to build a view of the corresponding part of the OpenStreetMap.

A similar approach could work with Google maps.

Instance Variables
	osmZoomLevel:		<Integer>
	position:		<Point>
	rectangle:	<Rectangle>
	scale:		<Point>
	tiles:		<Dictionary of Point -> Form>
	zoom:		<Point>

osmZoomLevel
	- the zoom level in the OSM range (0 to 18, integer)

position
	- position of the shape

rectangle
	- bounds of the shape

scale
	- the scale of the shape

tiles
	- the cache of tiles, indexed by x, y

zoom
	- zoom of the shape


Principle:
	1.0 in Roassal space -> 1km in OSM. 
	R zoom to OSM zoom level: (base is 1km/pixel) 
		1000 * Rzoom = 156543.034 meters/pixel / (2 ^ zoomlevel)
		zoomlevel = ln( 156.543034 * Rzoom ) / ln 2
		remainderZoom =  156.543034 * Rzoom / (2 ^ zoomlevel))
		lon to Roassal space = [ :l | 40075.016686 * (l / 360) ]
		lat to Roassal space = [ :l | ((Float pi / 4) + (l degreesToRadians / 2)) tan ln * 40075.016686 / (2.0 * Float pi) ]
		Remember : working limit for lat/lon is ±85.05113°

Goal:
	depending on the RTView size and the canvas parameters, get the right tiles from OSM and display them.

Algorithm:
	From the camera, get the zoom level and offset.
	Compute the OSM zoom level (with the camera zoom value).
	Make remainder zoom a transform inside the TROSMShape.
	Take corners of bounding box, get lat / long, get tiles x and y based on previous zoom level.
	Set clipping rectangle to TROSMShape bounds.
	Display each tile.
	cache each tile. When displaying, check if tile exists. Remove tile if not used in display.
"
Class {
	#name : #TROSMShape,
	#superclass : #TRShape,
	#instVars : [
		'rectangle',
		'zoom',
		'osmZoomLevel',
		'tiles',
		'emptyTile',
		'semaphore',
		'copyright',
		'ratio',
		'onload'
	],
	#classVars : [
		'EmptyTile'
	],
	#category : #'Roassal2-OpenStreetMap'
}

{ #category : #resources }
TROSMShape class >> emptyTile [
	^ EmptyTile
		ifNil: [ EmptyTile := ((StringMorph contents: 'Loading...') center: 127 @ 127) imageFormForRectangle: (0 @ 0 extent: 256 @ 256) ]
]

{ #category : #visitor }
TROSMShape >> accept: aVisitor [
	aVisitor visitOSMShape: self
]

{ #category : #private }
TROSMShape >> checkCallback [
	| call |
	onload ifNil: [ ^ self ].
	call := true.
	tiles keys do: [ :k | 
		(tiles at: k) = self class emptyTile ifTrue: [ call:= false] ].
	call ifTrue: [ onload fork ].
]

{ #category : #private }
TROSMShape >> computeOsmZoomLevel [
	"The osm zoom level."

	^ (((self pixelLength * canvas camera scale) ln / 2 ln) rounded max: 0) min: 18
]

{ #category : #drawing }
TROSMShape >> drawOn: athensCanvas [
	| newTiles start end |
	newTiles := Dictionary new.
	self updateOsmZoomLevel.
	semaphore
		critical: [ 
			athensCanvas pathTransform
				restoreAfter: [ 
					athensCanvas pathTransform
						translateBy: canvas camera position;
						scaleBy: 1 / canvas camera scale asFloat.
					athensCanvas
						clipBy: self translatedRectangle
						during: [ 
							start := self fromOurSpaceToTile: self translatedRectangle topLeft.
							end := self fromOurSpaceToTile: self translatedRectangle bottomRight.
							start x to: end x do: [ :xi | start y to: end y do: [ :yi | self drawTile: xi @ yi on: athensCanvas with: newTiles ] ].
							copyright drawOn: athensCanvas ] ].
			tiles := newTiles ]
]

{ #category : #drawing }
TROSMShape >> drawTile: aPoint on: athensCanvas with: newTiles [
	"Draw a single tile at the right position."
	
	| paint |
	(tiles
		at: (Array with: aPoint x with: aPoint y with: osmZoomLevel)
		ifAbsent: [ self getTile: aPoint ])
		ifNotNil: [ :aTile | 
			athensCanvas pathTransform
				restoreAfter: [ 
					athensCanvas pathTransform
						translateBy: (self fromOSMSpaceToOurSpace: aPoint * 256);
						scaleBy: (self remainderZoom: osmZoomLevel).
					athensCanvas setShape: aTile boundingBox.
					paint := athensCanvas cacheAt: aTile ifAbsentPut: [ aTile asAthensPaintOn: athensCanvas ].
					athensCanvas setPaint: paint.
					athensCanvas draw.
					newTiles
						at: (Array with: aPoint x with: aPoint y with: osmZoomLevel)
						put: aTile ] ]
]

{ #category : #private }
TROSMShape >> earthR [
	"Earth R according to ratio."

	^ RTOSM earthR * self ratio
]

{ #category : #accessing }
TROSMShape >> encompassingRectangle [
	^ canvas camera encompassingRectangleOf: (canvas shapes copyWithout: self)
]

{ #category : #private }
TROSMShape >> equatorLength [
	"Equator length  in km. self earthR * 2* Float pi"

	^ RTOSM equatorLength * self ratio
]

{ #category : #private }
TROSMShape >> fromCameraSpaceToOurSpace: aPoint [
	"To convert our boundaries from the camera space into our space (0@0 at center, no zoom)."

	^ TRPlatform current affineTransformClass new
		scaleBy: canvas camera scale;
		translateBy: canvas camera position negated;
		transform: aPoint
]

{ #category : #private }
TROSMShape >> fromOSMSpaceToOurSpace: aPoint [
	"Convert a point in OSM space (zoom level) into our space."

	^ self
		fromCameraSpaceToOurSpace: aPoint * self equatorLength / (2 raisedTo: osmZoomLevel) / 256 - (self equatorLength / 2)
]

{ #category : #private }
TROSMShape >> fromOurSpaceToCameraSpace: aPoint [
	"To convert our boundaries into the camera space."

	^ TRPlatform current affineTransformClass new
		translateBy: canvas camera position;
		scaleBy: 1 / canvas camera scale;
		transform: aPoint
]

{ #category : #private }
TROSMShape >> fromOurSpaceToOSMSpace: aPoint [
	"Convert our boundaries into the osm space (as set by the zoom level)."

	^ ((self fromOurSpaceToCameraSpace: aPoint) + (self equatorLength / 2))
		// (self equatorLength / 256 / (2 raisedTo: osmZoomLevel))
]

{ #category : #private }
TROSMShape >> fromOurSpaceToTile: aPoint [
	"Convert our boundaries into the osm space (as set by the zoom level)."

	^ ((self fromOurSpaceToCameraSpace: aPoint) + (self equatorLength / 2))
		// (self equatorLength / (2 raisedTo: osmZoomLevel))
]

{ #category : #private }
TROSMShape >> getTile: aPoint [
	"A point has to be xTile @ yTile, integers between 0 and 2^osmZoomLevel - 1"

	self assert: (aPoint x isInteger and: [ aPoint y isInteger ]).	"clamp"
	((aPoint x < 0 or: [ aPoint x >= (2 raisedTo: osmZoomLevel) ])
		or: [ aPoint y < 0 or: [ aPoint y >= (2 raisedTo: osmZoomLevel) ] ])
		ifTrue: [ ^ nil ].
	tiles
		at:
			(Array with: (aPoint x) with:
			(aPoint y) with:
			osmZoomLevel)
		put: self class emptyTile.
	[ 
	| aTile z |
	z := osmZoomLevel.
	Processor yield.
	aTile := [ 
	TRPlatform current downloadPng: 
			('https://a.tile.openstreetmap.org' asZnUrl
				addPathSegment: z printString;
				addPathSegment: aPoint x printString;
				addPathSegment: aPoint y printString , '.png') ]
		on: Error
		do: [ :ex |  ].
	semaphore
		critical: [ 
			tiles
				at:
					(Array with: (aPoint x) with:
					(aPoint y) with:
					z)
				put: aTile ].
	self signalUpdate ] fork.
	^ self class emptyTile
]

{ #category : #accessing }
TROSMShape >> includesPoint: aPoint [
	^ self translatedRectangle containsPoint: (self fromCameraSpaceToOurSpace: aPoint)
]

{ #category : #initialization }
TROSMShape >> initialize [
	super initialize.
"	rectangle := -300 @ -300 corner: 300 @ 300.
"	tiles := Dictionary new.
	emptyTile := Form extent: 256 @ 256.
	semaphore := Semaphore forMutualExclusion.
	copyright := TRLabelShape new
		fontSize: 8;
		text: '© OpenStreetMap contributors'.
"	copyright translateTo: rectangle corner - (copyright extent / 2)"
]

{ #category : #private }
TROSMShape >> maxLatitude [
	^ RTOSM maxLatitude
]

{ #category : #private }
TROSMShape >> minLatitude [
	^ RTOSM minLatitude
]

{ #category : #accessing }
TROSMShape >> onload [
	^ onload
]

{ #category : #accessing }
TROSMShape >> onload: aBlock [
	aBlock ifNil: [ onload := nil ].
	aBlock isBlock ifTrue: [ onload := aBlock ].
]

{ #category : #private }
TROSMShape >> osmZoomLevel [
	^ osmZoomLevel ifNil: [ osmZoomLevel := self computeOsmZoomLevel ]
]

{ #category : #private }
TROSMShape >> pixelLength [
	"Pixel length at equator at highest zoom factor. "

	^ RTOSM equatorLength * self ratio / 256
]

{ #category : #accessing }
TROSMShape >> position: aPosition [
	super position: aPosition.
	rectangle := self rectangle.
	rectangle ifNotNil: [ copyright position: aPosition + rectangle corner - (copyright extent / 2) ]
]

{ #category : #accessing }
TROSMShape >> ratio [
	^ ratio ifNil: [ ratio := 1.0 ]
]

{ #category : #accessing }
TROSMShape >> ratio: aNumber [
	^ ratio := aNumber
]

{ #category : #accessing }
TROSMShape >> rectangle [
	^ rectangle
		ifNil: [ 
			canvas
				ifNil: [  ]
				ifNotNil: [ 
					| rect |
					rect := canvas extent negated / 2.0 extent: canvas extent.
					copyright translateTo: rect corner - (copyright extent / 2).
					rect ] ]
]

{ #category : #accessing }
TROSMShape >> rectangle: anObject [
	rectangle := anObject.
	copyright translateTo: rectangle corner - (copyright extent / 2)
]

{ #category : #private }
TROSMShape >> remainderZoom: z [
	"Remainder zoom to apply on the display."

	^ self pixelLength * canvas camera scale * (256 / 255) asFloat / (2 raisedTo: z)
]

{ #category : #transformations }
TROSMShape >> rotateByDegrees: angle [
	super rotateByDegrees: angle.
	copyright rotateByDegrees: angle
]

{ #category : #transformations }
TROSMShape >> scaleBy: anInteger [
	super scaleBy: anInteger.
	copyright scaleBy: anInteger
]

{ #category : #private }
TROSMShape >> translatedRectangle [
	^ (matrix transform: self rectangle origin) corner: (matrix transform: self rectangle corner)
]

{ #category : #private }
TROSMShape >> updateOsmZoomLevel [
	"Get the osm zoom level. Do something if we need to change the zoom level, like flushing the tile cache."

	osmZoomLevel := self computeOsmZoomLevel
]
