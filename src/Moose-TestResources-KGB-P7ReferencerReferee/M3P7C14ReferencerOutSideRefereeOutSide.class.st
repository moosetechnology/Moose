Class {
	#name : #M3P7C14ReferencerOutSideRefereeOutSide,
	#superclass : #Object,
	#category : #'Moose-TestResources-KGB-P7ReferencerReferee'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M3P7C14ReferencerOutSideRefereeOutSide class >> m3p7c14InstCreation [ 
	 
	^super new
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M3P7C14ReferencerOutSideRefereeOutSide >> m3p7c14Mtd1 [ 
	 
	| tempVar anObject | 
	tempVar := M2P6C13FullRefereeInSideOutSide m2p6c13InstCreation. 
	anObject := Set with: 'string element'. 
	^(tempVar m2p6c13Mtd1: anObject) m2p6c13Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M3P7C14ReferencerOutSideRefereeOutSide >> m3p7c14Mtd2 [ 
	 
	^M2P5C11FullRefereeOutSide m2p5c11InstCreation1 m2p5c11Mtd2
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M3P7C14ReferencerOutSideRefereeOutSide >> m3p7c14Mtd3 [ 
	 
	^M1P2C3ReferencerInSideRefereeOutSide new m1p2c3Mtd1
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M3P7C14ReferencerOutSideRefereeOutSide >> m3p7c14Mtd4 [ 
	 
	^'m3p7c14Mtd4 Refers ' 
		, M1P2C3ReferencerInSideRefereeOutSide new m1p2c3Mtd3
]
