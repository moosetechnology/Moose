Class {
	#name : #MooseModelRoassalPaintingsExtensionsTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-RoassalPaintings'
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
	self skip: 'anonymous classes are not yet managed in Pharo'.
	windows := self getAllWindows.
	[self model viewOverviewPyramid] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]
