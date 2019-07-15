Extension { #name : #M6P11C19FullRefereeOutSide }

{ #category : #'*moose-testresources-kgb-pextensions' }
M6P11C19FullRefereeOutSide class >> m6p11c19InstCreation1 [ 
	 
	^super new
]

{ #category : #'*moose-testresources-kgb-pextensions' }
M6P11C19FullRefereeOutSide >> m6p11c19Mtd2 [ 
	 
	^1 + self m6p11c19Mtd1	"With this expresion, C19>>Mtd2 invoks surely C19>>Mtd1 which is packaged into P11FullReferee, and so PExtension becomes a referencer of P11FullReferee"
]
