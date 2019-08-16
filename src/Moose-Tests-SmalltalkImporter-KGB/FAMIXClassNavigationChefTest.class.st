Class {
	#name : #FAMIXClassNavigationChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testAllIncomingInvocationsIntoMyNamespace [
	self assertEmpty: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace).
	self
		assertCollection: (self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace) opposites
		hasSameElements:
			{(self getMethod: 'm2p6c13Mtd3()') . (self getMethod: 'm2p6c13InstCreation()') . (self getMethod: 'm2p6c12Mtd1()')}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace) atScope: FamixTType)
		hasSameElements: {self c13FullRefereeInSideOutSide . self c12FullReferencerInSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testAllIncomingInvocationsOutOfMyPackage [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations outOfMyPackage atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations outOfMyPackage atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testAllOutgoingDependenciesWithoutSelfLoops [
	self assert: self c1FullReferencerOutSide queryAllOutgoing size equals: 25.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoing atScope: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops size equals: 16.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops atScope: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testAllOutgoingInvocationsIntoMyPackage [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinParentUsing: FamixTPackage) opposites
		hasSameElements: {(self getMethod: 'm1p3c5Mtd1()')}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testAllOutgoingInvocationsOutOfMyNamespace [
	self assert: self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfMyNamespace size equals: 3.
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfMyNamespace atScope: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfMyNamespace
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testAllOutgoingInvocationsWithoutSelfLoops [
	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations size equals: 13.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoingInvocations atScope: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops size equals: 12.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops atScope: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) within: self packageP2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) within: self packageP1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClassesOutOfMyNamespace [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientClassesOutOfMyPackage [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfMyPackage
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfMyPackage
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientNamespaces [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncoming withoutSelfLoops atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace4FullReferencer}
]

{ #category : #'tests - clients' }
FAMIXClassNavigationChefTest >> testClientPackages [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncoming withoutSelfLoops atScope: FamixTPackage)
		hasSameElements: {self packageP2InteractedReferencerReferee . self packageP8FullReferencer}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testIncomingReferencesAreEitherPotentialOrSureOrStatic [
	| modelClasses |
	modelClasses := self model allClasses.
	self flag: 'Should we test all combinations of static, access, inheritance...?'.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTType) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTType) ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTPackage) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTPackage) ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTNamespace) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTNamespace) ])
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClasses [
	self assertCollection: self c11FullRefereeOutSide queryIncomingInheritances opposites hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self packageP2InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClassesIntoMyNamespace [
	self
		assertCollection: (self c12FullReferencerInSide queryIncomingInheritances opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClassesIntoMyPackage [
	self assertEmpty: (self c11FullRefereeOutSide queryIncomingInheritances opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClassesOutOfMyNamespace [
	self assertCollection: self c11FullRefereeOutSide queryIncomingInheritances opposites outOfMyNamespace hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByClassesOutOfMyPackage [
	self assertCollection: self c11FullRefereeOutSide queryIncomingInheritances opposites outOfMyPackage hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByNamespaces [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedByPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances atScope: FamixTPackage)
		hasSameElements: {self packageP2InteractedReferencerReferee}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClasses [
	self assertCollection: self c11FullRefereeOutSide queryOutgoingInheritances opposites hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self packageP6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self namespace2FullReferee)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClassesIntoMyNamespace [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClassesIntoMyPackage [
	self assertEmpty: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClassesOutOfMyNamespace [
	self assertEmpty: self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfMyNamespace
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedClassesOutOfMyPackage [
	self assertCollection: self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfMyPackage hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedNamespaces [
	self assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances atScope: FamixTNamespace) hasSameElements: {self namespace2FullReferee}
]

{ #category : #'tests - inheritance' }
FAMIXClassNavigationChefTest >> testInheritedPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites atScope: FamixTPackage)
		hasSameElements: {self packageP6InteractedReferee}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testOppositesOfCompositeQueryResult [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoing opposites
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide . (self getMethod: 'm2p5c11InstCreation1()').
			(self getMethod: 'm1p3c5Mtd1()') . (self getMethod: 'm1p2c3Mtd3()') . self cObject}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testOutgoingReferencesAreEitherPotentialOrSureOrStatic [
	self flag: 'See testIncomingReferencesAreEitherPotentialOrSureOrStatic'.
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllOutgoing atScope: FamixTType) includesAll: (referencer queryAllOutgoingInvocations atScope: FamixTType) ])
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClassesInto [
	self
		assertCollection: ((self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) within: self packageP11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self
		assertCollection: ((self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) within: self namespace6InteractedReferee)
		hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClassesIntoMyNamespace [
	self assertEmpty: ((self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) withinParentUsing: FamixTNamespace)
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClassesIntoMyPackage [
	self assertEmpty: ((self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) withinParentUsing: FamixTPackage)
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClassesOutOfMyNamespace [
	self
		assertCollection: (self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderClassesOutOfMyPackage [
	self
		assertCollection: (self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderNamespace [
	self
		assertCollection: (self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTNamespace)
		hasSameElements: {self namespace3ReferencerReferee . self namespace5InteractedReferencer . self namespace6InteractedReferee}
]

{ #category : #'tests - providers' }
FAMIXClassNavigationChefTest >> testProviderPackages [
	self
		assertCollection: (self c15FullReferencerOutSide queryAllOutgoing atScope: FamixTPackage)
		hasSameElements: {self packageP10InteractedReferee . self packageP11FullReferee . self packagePExtensions . self packageP7ReferencerReferee}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) within: self packageP3InteractedReferencer)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClassesIntoMyNamespace [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClassesIntoMyPackage [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClassesOutOfMyNamespace [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedClassesOutOfMyPackage [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedMethods [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoingInvocations opposites
		hasSameElements:
			{(self getMethod: 'm2p5c11InstCreation1()') . (self getMethod: 'm1p2c3Mtd3()') . (self getMethod: 'm1p3c5Mtd1()')}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedNamespaces [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace2FullReferee}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testReferencedPackages [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self packageP2InteractedReferencerReferee . self packageP3InteractedReferencer . self packageP5FullReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self packageP2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self packageP1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClassesOutOfMyNamespace [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingClassesOutOfMyPackage [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingNamespaces [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace3ReferencerReferee . self namespace1InteractedReferencerReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testReferencingPackages [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self packageP1FullReferencer . self packageP3InteractedReferencer . self packageP7ReferencerReferee}
]

{ #category : #'tests - outgoing invocations' }
FAMIXClassNavigationChefTest >> testSourceMethodsInReferencedMethods [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfMyNamespace sourceMethods
		hasSameElements: {(self getMethod: 'm1p3c6Mtd1()') . (self getMethod: 'm1p3c6Mtd2()')}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testSourceMethodsInStaticReferencedClasses [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences withinParentUsing: FamixTPackage) sources
		hasSameElements: {(self getMethod: 'm1p3c6Mtd2()')}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClasses [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType)
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClassesInto [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) within: self packageP3InteractedReferencer)
		hasSameElements: {self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClassesIntoMyNamespace [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClassesIntoMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClassesOutOfMyNamespace [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) outOfMyNamespace
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientClassesOutOfMyPackage [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) outOfMyPackage
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientNamespaces [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace3ReferencerReferee . self namespace2FullReferee}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticClientPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTPackage)
		hasSameElements:
			{self packageP1FullReferencer . self packageP2InteractedReferencerReferee . self packageP3InteractedReferencer . self packageP7ReferencerReferee.
			self packageP5FullReferee}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClasses [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClassesInto [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) within: self packageP6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) within: self namespace2FullReferee)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClassesIntoMyNamespace [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClassesIntoMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClassesOutOfMyNamespace [
	self assertEmpty: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) outOfMyNamespace
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderClassesOutOfMyPackage [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderNamespaces [
	self assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTNamespace) hasSameElements: {self namespace2FullReferee}
]

{ #category : #'tests - static dependencies' }
FAMIXClassNavigationChefTest >> testStaticProviderPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTPackage)
		hasSameElements: {self packageP6InteractedReferee . self packageP5FullReferee}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClasses [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites within: self packageP3InteractedReferencer)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClassesIntoMyNamespace [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClassesIntoMyPackage [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTPackage)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}.

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoingReferences withinParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClassesOutOfMyNamespace [
	self assertCollection: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfMyNamespace hasSameElements: {self c11FullRefereeOutSide}.

	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences outOfMyNamespace atScope: FamixTType)
		hasSameElements: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfMyNamespace
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedClassesOutOfMyPackage [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfMyPackage
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedNamespaces [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences atScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespace1InteractedReferencerReferee}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencedPackages [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences atScope: FamixTPackage)
		hasSameElements: {self packageP2InteractedReferencerReferee . self packageP5FullReferee . self packageP3InteractedReferencer}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self packageP2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self assertEmpty: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self packageP1FullReferencer).
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTNamespace).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTPackage).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClassesOutOfMyNamespace [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingClassesOutOfMyPackage [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryIncomingReferences opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingNamespaces [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTNamespace)
		hasSameElements: {self namespace3ReferencerReferee . self namespace1InteractedReferencerReferee}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testStaticReferencingPackages [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTPackage)
		hasSameElements: {self packageP3InteractedReferencer . self packageP7ReferencerReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c13FullRefereeInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllOutgoing atScope: FamixTType) includesAll: (referencer queryStaticOutgoingAssociations atScope: FamixTType) ])
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTType) within: self packageP5FullReferee)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedClassesIntoMyNamespace [
	self
		assertCollection: ((self c16FullReferencerOutSideInSide querySureOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c18FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedClassesIntoMyPackage [
	self
		assertCollection: ((self c10FullReferencerInSide querySureOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c9FullRefereeInSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedClassesOutOfMyNamespace [
	self
		assertCollection: (self c6FullReferencerInSideOutSide querySureOutgoingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedMethods [
	self assertCollection: self c6FullReferencerInSideOutSide querySureOutgoingInvocations opposites hasSameElements: {(self getMethod: 'm2p5c11InstCreation1()')}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedNamespaces [
	self assertCollection: (self c6FullReferencerInSideOutSide querySureOutgoingInvocations atScope: FamixTNamespace) hasSameElements: {self namespace2FullReferee}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testSureReferencedNamespacesTest [
	| modelClasses |
	modelClasses := self model allClasses.
	modelClasses
		do:
			[ :each | self assert: (each querySureOutgoingInvocations atScope: FamixTNamespace) size equals: (each querySureOutgoingInvocations atScope: FamixTNamespace) asSet size ].
	modelClasses
		do:
			[ :each | self assert: (each querySureIncomingInvocations atScope: FamixTType) size equals: (each querySureIncomingInvocations atScope: FamixTType) asSet size ].
	modelClasses
		do:
			[ :each | self assert: (each querySureIncomingInvocations atScope: FamixTNamespace) size equals: (each querySureIncomingInvocations atScope: FamixTNamespace) asSet size ]
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencedPackages [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self packageP6InteractedReferee . self packageP5FullReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c12FullReferencerInSide . self c14ReferencerOutSideRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - references' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTType) includesAll: (referencer queryStaticIncomingAssociations atScope: FamixTType) ])
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self packageP2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self assertEmpty: ((self c3ReferencerInSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self packageP1FullReferencer).
	self
		assertCollection: ((self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self namespace4FullReferencer)
		hasSameElements: {self c15FullReferencerOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesOutOfMyNamespace [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfMyNamespace
		hasSameElements: {self c15FullReferencerOutSide . self c16FullReferencerOutSideInSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingClassesOutOfMyPackage [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) outOfMyPackage
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingMethods [
	self assertCollection: self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations opposites hasSameElements: {(self getMethod: 'm1p2c2Mtd1()')}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingNamespaces [
	self
		assertCollection: (self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace4FullReferencer . self namespace5InteractedReferencer . self namespace6InteractedReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXClassNavigationChefTest >> testSureReferencingPackages [
	self
		assertCollection: (self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTPackage)
		hasSameElements:
			{self packagePExtensions . self packageP8FullReferencer . self packageP9FullReferencer . self packageP11FullReferee . self packageP12FullReferencer}
]

{ #category : #'tests - incoming invocations' }
FAMIXClassNavigationChefTest >> testTargetMethodsInReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations targetMethods
		hasSameElements:
			{(self getMethod: 'm3p7c14Mtd2()') . (self getMethod: 'm3p7c14Mtd4()') . (self getMethod: 'm3p7c14InstCreation()')}
]

{ #category : #tests }
FAMIXClassNavigationChefTest >> testUnion [
	| queryResult anotherResult |
	queryResult := MooseQueryResult on: #FakeReceiver withAll: #(1 2 3).
	self assertCollection: (queryResult union: #(4 5)) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: #(4 5)) receiver equals: #FakeReceiver.
	anotherResult := MooseQueryResult on: #FakeReceiver withAll: #(4 5).
	self assertCollection: (queryResult union: anotherResult) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: anotherResult) receiver equals: #FakeReceiver
]

{ #category : #tests }
FAMIXClassNavigationChefTest >> testWithin [
	self
		assertCollection: ((self c1FullReferencerOutSide queryAllOutgoing within: self packageP2InteractedReferencerReferee) atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}.
	self
		assertCollection: (self c1FullReferencerOutSide queryAllOutgoingInvocations within: self c13FullRefereeInSideOutSide) opposites
		hasSameElements:
			{(self getMethod: 'm2p6c13Mtd2()') . (self getMethod: 'm2p6c13Mtd1:(Object)') . (self getMethod: 'm2p6c13InstCreation()')}
]
