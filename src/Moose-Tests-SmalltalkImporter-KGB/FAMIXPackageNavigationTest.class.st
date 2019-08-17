Class {
	#name : #FAMIXPackageNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientClasses [
	self
		assertCollection: (self p5FullReferee allClientsAtScope: FamixTType)
		hasSameElements:
			{self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide}
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testClientPackages [
	self
		assertCollection: self p5FullReferee allClients
		hasSameElements: {self p1FullReferencer . self p2InteractedReferencerReferee . self p7ReferencerReferee . self p3InteractedReferencer}
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderClasses [
	self
		assertCollection: (self p8FullReferencer allProvidersAtScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #tests }
FAMIXPackageNavigationTest >> testProviderPackages [
	self
		assertCollection: (self p8FullReferencer allProvidersAtScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self p7ReferencerReferee . self pExtensions}
]
