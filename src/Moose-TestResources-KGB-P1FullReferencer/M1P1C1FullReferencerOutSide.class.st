Class {
	#name : #M1P1C1FullReferencerOutSide,
	#superclass : #Object,
	#category : #'Moose-TestResources-KGB-P1FullReferencer'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P1C1FullReferencerOutSide >> m1p1c1Mtd1 [ 
	 
	| tempVar | 
	tempVar := M2P6C13FullRefereeInSideOutSide m2p6c13InstCreation. 
	^tempVar m2p6c13Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P1C1FullReferencerOutSide >> m1p1c1Mtd2 [ 
	 
	| tempVar | 
	tempVar := M2P5C11FullRefereeOutSide m2p5c11InstCreation. 
	^tempVar m2p5c11Mtd5 m2p5c11Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P1C1FullReferencerOutSide >> m1p1c1Mtd3: m2p5C11Object [ 
	 
	^m2p5C11Object m2p5c11Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P1C1FullReferencerOutSide >> m1p1c1Mtd4: anObject [ 
	 
	self class new m1p1c1Mtd1. 
	^(M2P6C13FullRefereeInSideOutSide m2p6c13InstCreation m2p6c13Mtd1: 
			anObject) m2p6c13Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M1P1C1FullReferencerOutSide >> m1p1c1Mtd5: m1p2C3Object [ 
	"m1p2C3Object is considered here as an instance of M1P2C3ReferencerInSideRefereeOutSide" 
	 
	^m1p2C3Object m1p2c3Mtd3
]
