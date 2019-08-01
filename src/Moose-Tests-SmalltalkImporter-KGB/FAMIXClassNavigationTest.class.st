Class {
	#name : #FAMIXClassNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testClientClasses [
	self assert: self c14ReferencerOutSideRefereeOutSide clientTypes size equals: 2.
	self
		assert:
			(self c14ReferencerOutSideRefereeOutSide clientTypes
				equalsTo:
					(Set new
						add: self c2ReferencerOutSideRefereeInSide;
						add: self c15FullReferencerOutSide;
						yourself)).
	self assert: self c3ReferencerInSideRefereeOutSide clientTypes size equals: 3.
	self
		assert:
			(self c3ReferencerInSideRefereeOutSide clientTypes
				equalsTo:
					(Set new
						add: self c1FullReferencerOutSide;
						add: self c6FullReferencerInSideOutSide;
						add: self c14ReferencerOutSideRefereeOutSide;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testClientPackages [
	self assert: self c14ReferencerOutSideRefereeOutSide clientPackages size equals: 3.
	self
		assert:
			(self c14ReferencerOutSideRefereeOutSide clientPackages
				equalsTo:
					(Set new
						add: self namespace1InteractedReferencerReferee;
						add: self namespace4FullReferencer;
						add: self namespace3ReferencerReferee;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testProviderClasses [
	self assert: self c15FullReferencerOutSide providerTypes size equals: 3.
	self
		assert:
			(self c15FullReferencerOutSide providerTypes
				equalsTo:
					(Set new
						add: self c14ReferencerOutSideRefereeOutSide;
						add: self c18FullRefereeInSideOutSide;
						add: self c19FullRefereeOutSide;
						yourself))
]

{ #category : #'MooseKGB-TestFamix3-allDependencies' }
FAMIXClassNavigationTest >> testProviderPackage [
	self assert: self c15FullReferencerOutSide providerPackages size equals: 3.
	self
		assert:
			(self c15FullReferencerOutSide providerPackages
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
	self assert: self c15FullReferencerOutSide providerPackages size equals: 4.
	self
		assert:
			(self c15FullReferencerOutSide providerPackages
				equalsTo:
					(Set new
						add: p10;
						add: p11;
						add: pEx;
						add: p7;
						yourself))
]
