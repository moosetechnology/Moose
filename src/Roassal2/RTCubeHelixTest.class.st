Class {
	#name : #RTCubeHelixTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #tests }
RTCubeHelixTest >> testBasic [

	| helix |
	helix := RTCubeHelix new.
	helix rotations: 2.
	helix gamma: 2.
	helix level: 0.
	helix level: 0.5.
	helix level: 1.
]

{ #category : #tests }
RTCubeHelixTest >> testBasic02 [

	| helix |
	helix := RTCubeHelix new.
	helix level: 0.
	helix level: 0.5.
	helix level: 1.
]

{ #category : #tests }
RTCubeHelixTest >> testBasic03 [

	| helix |
	helix := RTCubeHelix new.
	helix saturation: 0.5.
	
	helix level: 0.
	helix level: 0.5.
	helix level: 1.
	self assert: helix saturation equals: 0.5
]

{ #category : #tests }
RTCubeHelixTest >> testDefault [

	| helix |
	helix := RTCubeHelix new.
	self assert: helix rotations equals: -1.5.
	self assert: helix saturation equals: 1.2.
	self assert: helix gamma equals: 1.0
]
