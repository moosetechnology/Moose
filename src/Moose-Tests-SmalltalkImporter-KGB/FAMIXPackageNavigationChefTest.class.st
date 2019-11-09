Class {
	#name : #FAMIXPackageNavigationChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'tests - clients' }
FAMIXPackageNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTType)
		hasSameElements:
			{self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide}
]

{ #category : #'tests - clients' }
FAMIXPackageNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self p5FullReferee queryAllIncoming atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - clients' }
FAMIXPackageNavigationChefTest >> testClientPackages [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p2InteractedReferencerReferee . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedByClasses [
	self assertCollection: self p6InteractedReferee queryIncomingInheritances opposites hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedByClassesInto [
	self assertCollection: (self p6InteractedReferee queryIncomingInheritances opposites within: self p5FullReferee) hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedByPackages [
	self assertCollection: (self p6InteractedReferee queryIncomingInheritances atScope: FamixTPackage) hasSameElements: {self p5FullReferee}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedClasses [
	self assertCollection: self p5FullReferee queryOutgoingInheritances opposites hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedClassesAsSourceOfInheritance [
	self
		assertCollection: (self c6FullReferencerInSideOutSide  queryIncomingInheritances sourcesAtScope: FamixTClass)
		hasSameElements: {self c8FullReferencerInSide}.
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedClassesAsTargetOfInheritance [
	self
		assertCollection: (self c8FullReferencerInSide queryOutgoingInheritances targetsAtScope: FamixTClass)
		hasSameElements: {self c6FullReferencerInSideOutSide }
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: (self p5FullReferee queryOutgoingInheritances opposites within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testInheritedPackages [
	self assertCollection: (self p5FullReferee queryOutgoingInheritances atScope: FamixTPackage) hasSameElements: {self p6InteractedReferee}
]

{ #category : #'tests - providers' }
FAMIXPackageNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoing atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - providers' }
FAMIXPackageNavigationChefTest >> testProviderClassesInto [
	self assertCollection: ((self p8FullReferencer queryAllOutgoing atScope: FamixTType) within: self p11FullReferee) hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoing atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - providers' }
FAMIXPackageNavigationChefTest >> testProviderPackages [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoing atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self p7ReferencerReferee . self pExtensions}
]

{ #category : #'tests - outgoing invocations' }
FAMIXPackageNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXPackageNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - outgoing invocations' }
FAMIXPackageNavigationChefTest >> testReferencedPackages [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions}.
	self assertCollection: (self pExtensions queryAllOutgoingInvocations atScope: FamixTPackage) hasSameElements: {self p11FullReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXPackageNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self p5FullReferee queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXPackageNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee queryAllIncomingInvocations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXPackageNavigationChefTest >> testReferencingPackages [
	self
		assertCollection: (self p5FullReferee queryAllIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p3InteractedReferencer . self p7ReferencerReferee . self p5FullReferee}
]

{ #category : #'tests - inheritance' }
FAMIXPackageNavigationChefTest >> testSourceClassesInInheritedClasses [
	self
		assertCollection: (self p3InteractedReferencer queryOutgoingInheritances sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide . self c7FullRefereeInSide . self c8FullReferencerInSide}.

	self
		assertCollection: (self p3InteractedReferencer queryOutgoingInheritances withoutSelfLoops sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide . self c7FullRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXPackageNavigationChefTest >> testSourceClassesInReferencedClasses [
	self
		assertCollection: (self p3InteractedReferencer queryAllOutgoingInvocations sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticClientClasses [
	self
		assertCollection: (self p5FullReferee queryStaticIncomingAssociations atScope: FamixTType)
		hasSameElements:
			{self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticClientClassesInto [
	self
		assertCollection: ((self p5FullReferee queryStaticIncomingAssociations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticClientPackages [
	self
		assertCollection: (self p5FullReferee queryStaticIncomingAssociations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p2InteractedReferencerReferee . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticProviderClasses [
	self
		assertCollection: (self p8FullReferencer queryStaticOutgoingAssociations atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticProviderClassesInto [
	self
		assertCollection: ((self p8FullReferencer queryStaticOutgoingAssociations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryStaticOutgoingAssociations atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - static dependencies' }
FAMIXPackageNavigationChefTest >> testStaticProviderPackages [
	self
		assertCollection: (self p8FullReferencer queryStaticOutgoingAssociations atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self p7ReferencerReferee}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencedClasses [
	self
		assertCollection: (self p8FullReferencer queryOutgoingReferences atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer queryOutgoingReferences atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryOutgoingReferences atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencedPackages [
	self
		assertCollection: (self p8FullReferencer queryOutgoingReferences atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencingClasses [
	self
		assertCollection: (self p5FullReferee queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee queryIncomingReferences atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testStaticReferencingPackages [
	self
		assertCollection: (self p5FullReferee queryIncomingReferences atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [
	self
		assert:
			(self model allPackages allSatisfy: [ :referencer | referencer querySureOutgoingAssociations includesAll: referencer queryStaticOutgoingAssociations ])
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencedPackages [
	self
		assertCollection: (self p8FullReferencer querySureOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions}
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self p5FullReferee querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [
	self
		assert: (self model allPackages allSatisfy: [ :referencer | referencer querySureIncomingAssociations includesAll: referencer queryStaticIncomingAssociations ])
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee querySureIncomingInvocations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXPackageNavigationChefTest >> testSureReferencingPackages [
	self
		assertCollection: (self p5FullReferee querySureIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXPackageNavigationChefTest >> testTargetClassesInReferencingClasses [
	self assertCollection: (self p5FullReferee queryAllIncomingInvocations targetsAtScope: FamixTClass) hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXPackageNavigationChefTest >> testTargetClassesInStaticReferencingClasses [
	self
		assertCollection: (self p2InteractedReferencerReferee queryIncomingReferences targetsAtScope: FamixTClass)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide . self c4FullRefereeInSide}.
	self
		assertCollection: (self p2InteractedReferencerReferee queryIncomingReferences withoutSelfLoops targetsAtScope: FamixTClass)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]
