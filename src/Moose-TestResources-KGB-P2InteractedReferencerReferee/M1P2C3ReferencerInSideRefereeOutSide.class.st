Class {
	#name : #M1P2C3ReferencerInSideRefereeOutSide,
	#superclass : #M2P5C11FullRefereeOutSide,
	#category : #'Moose-TestResources-KGB-P2InteractedReferencerReferee'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P2C3ReferencerInSideRefereeOutSide >> m1p2c3Mtd1 [ 
	 
	^'m1p2c3Mtd1 Refers ' , M1P2C4FullRefereeInSide new m1p2c4Mtd1
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P2C3ReferencerInSideRefereeOutSide >> m1p2c3Mtd2 [ 
	 
	^M1P2C2ReferencerOutSideRefereeInSide new m1p2c2Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P2C3ReferencerInSideRefereeOutSide >> m1p2c3Mtd3 [ 
	 
	^'m1p2c3Mtd3 Refers ' , M1P2C4FullRefereeInSide new m1p2c4Mtd2
]
