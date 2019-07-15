Extension { #name : #GLMSystemWindow }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMSystemWindow >> gtInspectorOpenTreeIn: composite [
	<gtInspectorPresentationOrder: 30>  
	^ (self model 
		gtInspectorOpenTreeIn: composite)
		title: 'Browser tree'
]
