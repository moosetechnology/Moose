Class {
	#name : #FAMIXPackageNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientClasses [
	| p5 |
	p5 := self p5FullReferee.
	self
		assert:
			((p5 allClientsAtScope: FamixTType)
				equalsTo:
					(Set
						with: self c1FullReferencerOutSide
						with: self c14ReferencerOutSideRefereeOutSide
						with: self c6FullReferencerInSideOutSide
						with: self c3ReferencerInSideRefereeOutSide))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientPackages [
	| p1 p2 p3 p5 p7 |
	p1 := self p1FullReferencer.
	p2 := self p2InteractedReferencerReferee.
	p3 := self p3InteractedReferencer.
	p5 := self p5FullReferee.
	p7 := self p7ReferencerReferee.
	self
		assert:
			(p5 allClients
				equalsTo:
					(Set
						with: p1
						with: p2
						with: p7
						with: p3))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderClasses [
	| p8 |
	p8 := self p8FullReferencer.
	self assert: ((p8 allProvidersAtScope: FamixTType) equalsTo: (Set with: self c18FullRefereeInSideOutSide with: self c19FullRefereeOutSide with: self c14ReferencerOutSideRefereeOutSide))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderPackages [
	| p7 p8 p10 p11 pEx |
	p7 := self p7ReferencerReferee.
	p8 := self p8FullReferencer.
	p10 := self p10InteractedReferee.
	p11 := self p11FullReferee.
	pEx := self pExtensions.
	self
		assert:
			((p8 allProvidersAtScope: FamixTPackage)
				equalsTo:
					(Set
						with: p10
						with: p11
						with: p7
						with: pEx))
]
