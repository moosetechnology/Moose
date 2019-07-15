Class {
	#name : #FAMIXPackageNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXPackageNavigationTest >> testClientClasses [ 
	 
	| p5 | 
	p5 := self packageP5FullReferee. 
	self 
		assert: 
			(p5 clientTypes 
				equalsTo: 
					(Set 
						with: self c1FullReferencerOutSide 
						with: self c14ReferencerOutSideRefereeOutSide 
						with: self c6FullReferencerInSideOutSide 
						with: self c3ReferencerInSideRefereeOutSide))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXPackageNavigationTest >> testClientPackages [ 
	 
	| p1 p2 p3 p5 p7 | 
	p1 := self packageP1FullReferencer. 
	p2 := self packageP2InteractedReferencerReferee. 
	p3 := self packageP3InteractedReferencer. 
	p5 := self packageP5FullReferee. 
	p7 := self packageP7ReferencerReferee. 
	self 
		assert: 
			(p5 clientPackages equalsTo: (Set with: p1 with: p2 with: p7 with: p3))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXPackageNavigationTest >> testProviderClasses [ 
	 
	| p8 | 
	p8 := self packageP8FullReferencer. 
	self 
		assert: 
			(p8 providerTypes 
				equalsTo: 
					(Set 
						with: self c18FullRefereeInSideOutSide 
						with: self c19FullRefereeOutSide 
						with: self c14ReferencerOutSideRefereeOutSide))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXPackageNavigationTest >> testProviderPackages [ 
	 
	| p7 p8 p10 p11 pEx | 
	p7 := self packageP7ReferencerReferee. 
	p8 := self packageP8FullReferencer. 
	p10 := self packageP10InteractedReferee. 
	p11 := self packageP11FullReferee. 
	pEx := self packagePExtensions. 
	self 
		assert: 
			(p8 providerPackages equalsTo: (Set with: p10 with: p11 with: p7 with: pEx))
]
