Class {
	#name : #M1P3C6FullReferencerInSideOutSide,
	#superclass : #Object,
	#category : #'Moose-TestResources-KGB-P3InteractedReferencer'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P3C6FullReferencerInSideOutSide >> m1p3c6Mtd1 [ 
	 
	^M1P2C3ReferencerInSideRefereeOutSide new m1p2c3Mtd3
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P3C6FullReferencerInSideOutSide >> m1p3c6Mtd2 [ 
	 
	M1P3C5ReferencerInSideRefereeInSide new m1p3c5Mtd1. 
	^M2P5C11FullRefereeOutSide m2p5c11InstCreation1
]
