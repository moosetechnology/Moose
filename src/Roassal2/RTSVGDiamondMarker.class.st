"
A RTSVGDiamondMarker is a diamond shape marker.

"
Class {
	#name : #RTSVGDiamondMarker,
	#superclass : #RTSVGAbstractMarker,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGDiamondMarker >> addPath: stream [	
	stream
		nextPutAll: (' d="M 0 0 L <1p> <2p> L 0 <3p> L -<1p> <2p> z" ' expandMacrosWith: xExtent with: ((yExtent/2) rounded) with: yExtent).
]

{ #category : #adding }
RTSVGDiamondMarker >> addSize: stream [
	stream nextPutAll:  ('markerWidth = "<1p>" markerHeight = "<2p>" ' expandMacrosWith: (3 *size) with: size)
]
