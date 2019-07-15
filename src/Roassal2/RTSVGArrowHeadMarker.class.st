"
A RTSVGArrowHeadMarker is an arrow-head marker.

"
Class {
	#name : #RTSVGArrowHeadMarker,
	#superclass : #RTSVGAbstractMarker,
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGArrowHeadMarker >> addPath: stream [	
	stream
		nextPutAll: (' d="M 0 0 L <1p> <2p> L 0 <1p> z" ' expandMacrosWith: xExtent with: ((yExtent/2) rounded)).
]
