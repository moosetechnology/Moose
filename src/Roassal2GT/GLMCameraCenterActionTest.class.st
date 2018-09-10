Class {
	#name : #GLMCameraCenterActionTest,
	#superclass : #TestCase,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #tests }
GLMCameraCenterActionTest >> testBasic [

	| inst |
	inst := GLMCameraCenterAction new.
	inst roassalPresentation: GLMRoassal2Presentation new.
	inst execute
]
