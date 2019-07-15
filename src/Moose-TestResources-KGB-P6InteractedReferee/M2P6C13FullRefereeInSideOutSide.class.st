Class {
	#name : #M2P6C13FullRefereeInSideOutSide,
	#superclass : #Object,
	#instVars : [
		'c13InstVar'
	],
	#category : #'Moose-TestResources-KGB-P6InteractedReferee'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P6C13FullRefereeInSideOutSide class >> m2p6c13InstCreation [ 
	 
	^super new m2p6c13Mtd3
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P6C13FullRefereeInSideOutSide >> m2p6c13Mtd1: anObject [ 
	 
	c13InstVar := anObject
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P6C13FullRefereeInSideOutSide >> m2p6c13Mtd2 [ 
	 
	^c13InstVar
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P6C13FullRefereeInSideOutSide >> m2p6c13Mtd3 [ 
	 
	self m2p6c13Mtd1: 1
]
