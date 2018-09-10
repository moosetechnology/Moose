Class {
	#name : #M2P5C11FullRefereeOutSide,
	#superclass : #M2P6C12FullReferencerInSide,
	#instVars : [
		'instVar'
	],
	#category : #'Moose-TestResources-KGB-P5FullReferee'
}

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide class >> m2p5c11InstCreation [ 
	 
	^super new
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide class >> m2p5c11InstCreation1 [ 
	 
	^self m2p5c11InstCreation m2p5c11Mtd3
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide >> m2p5c11Mtd1 [ 
	"" 
	 
	^'m2p5c11Mtd1'
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide >> m2p5c11Mtd2 [ 
	"" 
	 
	^'m2p5c11Mtd2' , ' Refers ' , self m2p5c11Mtd1
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide >> m2p5c11Mtd3 [ 
	"initializes the instance variable instVar" 
	 
	instVar := 1
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide >> m2p5c11Mtd4 [ 
	"returns its class" 
	 
	^M2P5C11FullRefereeOutSide
]

{ #category : #'Moose-Cook-ModelFamix2-Test-Methods' }
M2P5C11FullRefereeOutSide >> m2p5c11Mtd5 [ 
	"returns its class" 
	 
	^self m2p5c11Mtd4 m2p5c11InstCreation1
]
