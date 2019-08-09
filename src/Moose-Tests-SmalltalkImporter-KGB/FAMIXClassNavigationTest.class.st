Class {
	#name : #FAMIXClassNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testClientClasses [
	self assert: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) size equals: 2.
	self
		assert:
			((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType)
				equalsTo:
					(Set new
						add: self c2ReferencerOutSideRefereeInSide;
						add: self c15FullReferencerOutSide;
						yourself)).
	self assert: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) size equals: 3.
	self
		assert:
			((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType)
				equalsTo:
					(Set new
						add: self c1FullReferencerOutSide;
						add: self c6FullReferencerInSideOutSide;
						add: self c14ReferencerOutSideRefereeOutSide;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testClientNamespaces [
	self assert: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTNamespace) size equals: 3.
	self
		assert:
			((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTNamespace)
				equalsTo:
					(Set new
						add: self namespace1InteractedReferencerReferee;
						add: self namespace4FullReferencer;
						add: self namespace3ReferencerReferee;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testClientPackages [
	| p2 p8 p7 |
	p2 := self packageP2InteractedReferencerReferee.
	p7 := self packageP7ReferencerReferee.
	p8 := self packageP8FullReferencer.
	self assert: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTPackage) size equals: 3.
	self
		assert:
			((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTPackage)
				equalsTo:
					(Set new
						add: p2;
						add: p8;
						add: p7;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testProviderClasses [
	self assert: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType) size equals: 3.
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testProviderNamespace [
	self assert: (self c15FullReferencerOutSide allProvidersAtScope: FamixTNamespace) size equals: 3.
	self
		assert:
			((self c15FullReferencerOutSide allProvidersAtScope: FamixTNamespace)
				equalsTo:
					(Set new
						add: self namespace3ReferencerReferee;
						add: self namespace5InteractedReferencer;
						add: self namespace6InteractedReferee;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testProviderPackages [
	| p10 p11 p7 pEx |
	p10 := self packageP10InteractedReferee.
	p11 := self packageP11FullReferee.
	p7 := self packageP7ReferencerReferee.
	pEx := self packagePExtensions.
	self assert: (self c15FullReferencerOutSide allProvidersAtScope: FamixTPackage) size equals: 4.
	self
		assert:
			((self c15FullReferencerOutSide allProvidersAtScope: FamixTPackage)
				equalsTo:
					(Set new
						add: p10;
						add: p11;
						add: pEx;
						add: p7;
						yourself))
]
