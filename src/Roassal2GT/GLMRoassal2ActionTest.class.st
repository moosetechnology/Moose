Class {
	#name : #GLMRoassal2ActionTest,
	#superclass : #TestCase,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #tests }
GLMRoassal2ActionTest >> testInitialize [
	| prez nbActionOriginal |
	prez := GLMRoassal2Presentation new.
	nbActionOriginal := prez actions size.
	GLMRoassal2Action initializePresentation: prez.
	self assert: prez actions size - nbActionOriginal equals: GLMRoassal2Action allLeafSubclasses size.
]
