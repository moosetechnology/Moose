Class {
	#name : #FAMIXPackageNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientClasses [
	| p5 |
	p5 := self packageP5FullReferee.
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
FAMIXPackageNavigationTest >> testClientClassesInto [
	self assert: (((self namespace2FullReferee queryAllIncoming atScope: FamixTType) withinPackage: self namespace3ReferencerReferee) equalsTo: (Set with: self c14ReferencerOutSideRefereeOutSide))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientPackages [
	| p1 p2 p3 p5 p7 |
	p1 := self packageP1FullReferencer.
	p2 := self packageP2InteractedReferencerReferee.
	p3 := self packageP3InteractedReferencer.
	p5 := self packageP5FullReferee.
	p7 := self packageP7ReferencerReferee.
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
	p8 := self packageP8FullReferencer.
	self assert: ((p8 allProvidersAtScope: FamixTType) equalsTo: (Set with: self c18FullRefereeInSideOutSide with: self c19FullRefereeOutSide with: self c14ReferencerOutSideRefereeOutSide))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderClassesInto [
	self
		assert:
			(((self namespace1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType) withinPackage: self namespace2FullReferee)
				equalsTo: (Set with: self c11FullRefereeOutSide with: self c13FullRefereeInSideOutSide))
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderPackages [
	| p7 p8 p10 p11 pEx |
	p7 := self packageP7ReferencerReferee.
	p8 := self packageP8FullReferencer.
	p10 := self packageP10InteractedReferee.
	p11 := self packageP11FullReferee.
	pEx := self packagePExtensions.
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
