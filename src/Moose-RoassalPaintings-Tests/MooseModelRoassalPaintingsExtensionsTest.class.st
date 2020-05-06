Class {
	#name : #MooseModelRoassalPaintingsExtensionsTest,
	#superclass : #TestCase,
	#category : #'Moose-RoassalPaintings-Tests'
}

{ #category : #util }
MooseModelRoassalPaintingsExtensionsTest >> getAllWindows [
	^ World submorphs select: #isSystemWindow

]

{ #category : #accessing }
MooseModelRoassalPaintingsExtensionsTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #tests }
MooseModelRoassalPaintingsExtensionsTest >> testviewOverviewPyramid [
	| windows |
	windows := self getAllWindows.
	[self model viewOverviewPyramid] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]
