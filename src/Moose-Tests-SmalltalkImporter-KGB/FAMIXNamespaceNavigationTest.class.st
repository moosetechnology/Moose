Class {
	#name : #FAMIXNamespaceNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testClientClasses [
	self
		assertCollection: (self namespace2FullReferee allClientsAtScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide}
]

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testClientClassesInto [
	self
		assertCollection: ((self namespace2FullReferee allClientsAtScope: FamixTType) within: self namespace3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testClientNamespaces [
	self
		assertCollection: (self namespace2FullReferee allClientsAtScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace3ReferencerReferee}
]

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testProviderClasses [
	self
		assertCollection: (self namespace1InteractedReferencerReferee allProvidersAtScope: FamixTType)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject}
]

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testProviderClassesInto [
	self
		assertCollection: ((self namespace1InteractedReferencerReferee allProvidersAtScope: FamixTType) within: self namespace2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #tests }
FAMIXNamespaceNavigationTest >> testProviderNamespaces [
	self
		assertCollection: (self namespace1InteractedReferencerReferee allProvidersAtScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespace3ReferencerReferee . self namespaceSmalltalkCore}
]
