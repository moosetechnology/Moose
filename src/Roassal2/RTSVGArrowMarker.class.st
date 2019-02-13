"
A RTSVGArrowMarker is an arrow (open figure)  marker.

"
Class {
	#name : #RTSVGArrowMarker,
	#superclass : #RTSVGAbstractMarker,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGArrowMarker >> addPath: stream [	
	stream
		nextPutAll: (' d="M 0 0 L <1p> <2p> L 0 <1p>" ' expandMacrosWith: xExtent with: ((yExtent/2) rounded)).
]
