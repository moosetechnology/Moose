Extension { #name : #AthensCairoPathBuilder }

{ #category : #'*Athens-SVG' }
AthensCairoPathBuilder >> ellipticalArc: radii xrot: rotation large: largeFlag sweep: sweepFlag to: pt [

	 self cwArcTo: pt angle: 45 degreesToRadians  
]
