Class {
	#name : #FAMIXNamespaceNavigationChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self namespace2FullReferee queryAllIncoming atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c10FullReferencerInSide . self c11FullRefereeOutSide . self c12FullReferencerInSide . self c13FullRefereeInSideOutSide.
			self c9FullRefereeInSide}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self namespace2FullReferee queryAllIncoming atScope: FamixTType) within: self namespace3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testClientNamespaces [
	self
		assertCollection: (self namespace2FullReferee queryAllIncoming atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace3ReferencerReferee . self namespace2FullReferee}
]

{ #category : #'MooseKGB-TestFamix3-integralTests' }
FAMIXNamespaceNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelNamespaces |
	modelNamespaces := self model allNamespaces.
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ]).
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ])
]

{ #category : #'MooseKGB-TestFamix3-integralTests' }
FAMIXNamespaceNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelNamespaces |
	modelNamespaces := self model allNamespaces.
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ]).
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ])
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedByClasses [
	self
		assertCollection: (self namespace2FullReferee queryIncomingInheritances atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}.
	self
		assertCollection: self namespace2FullReferee queryIncomingInheritances opposites
		hasSameElements: {self c11FullRefereeOutSide . self c3ReferencerInSideRefereeOutSide}
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedByClassesInto [
	self
		assertCollection: ((self namespace2FullReferee queryIncomingInheritances atScope: FamixTType) within: self namespace1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedByNamespaces [
	self
		assertCollection: (self namespace2FullReferee queryIncomingInheritances atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace2FullReferee}
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedClasses [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTType)
		hasSameElements: {self c11FullRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide}.
	self
		assertCollection: self namespace1InteractedReferencerReferee queryOutgoingInheritances opposites
		hasSameElements: {self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide . self cObject}
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: ((self namespace1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTType) within: self namespace2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #inheritance }
FAMIXNamespaceNavigationChefTest >> testInheritedNamespaces [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespaceSmalltalkCore . self namespace1InteractedReferencerReferee}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType)
		hasSameElements:
			{self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c7FullRefereeInSide.
			self c6FullReferencerInSideOutSide . self c2ReferencerOutSideRefereeInSide . self c4FullRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c1FullReferencerOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testProviderClassesInto [
	| invos refs inh |
	self
		assertCollection:
			((self namespace1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType) within: self namespace2FullReferee)
				hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}.
	self assert: 15 equals: (self namespace1InteractedReferencerReferee queryAllOutgoing within: self namespace2FullReferee) size.
	invos := (self namespace1InteractedReferencerReferee queryAllOutgoing within: self namespace2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTInvocation ].
	self assert: 10 equals: invos size.
	refs := (self namespace1InteractedReferencerReferee queryAllOutgoing within: self namespace2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTReference ].
	self assert: 4 equals: refs size.
	inh := (self namespace1InteractedReferencerReferee queryAllOutgoing within: self namespace2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTSubInheritance ].
	self assert: 1 equals: inh size.
	self
		assertCollection:
			((self namespace1InteractedReferencerReferee queryAllOutgoing within: self namespace2FullReferee) atScope: FamixTType)
				hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testProviderClassesOutOf [
	| invos refs inh acc |
	self
		assertCollection: ((self namespace1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType) outOf: self packageP5FullReferee)
		hasSameElements:
			{self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide.
			self c5ReferencerInSideRefereeInSide . self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c4FullRefereeInSide . self c1FullReferencerOutSide}.
	self assert: 55 equals: (self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee) size.
	invos := (self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTInvocation ].
	self assert: 29 equals: invos size.
	refs := (self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTReference ].
	self assert: 10 equals: refs size.
	inh := (self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee)
		select: [ :dep | dep usesFamixTrait: FamixTSubInheritance ].
	self assert: 7 equals: inh size.
	acc := (self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTAccess ].
	self assert: 9 equals: acc size.
	self
		assertCollection: ((self namespace1InteractedReferencerReferee queryAllOutgoing outOf: self packageP5FullReferee) atScope: FamixTType)
		hasSameElements:
			{self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide.
			self c5ReferencerInSideRefereeInSide . self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c4FullRefereeInSide . self c1FullReferencerOutSide}
]

{ #category : #allDependencies }
FAMIXNamespaceNavigationChefTest >> testProviderNamespaces [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryAllOutgoing atScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespace3ReferencerReferee . self namespaceSmalltalkCore . self namespace1InteractedReferencerReferee}
]

{ #category : #allOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements:
			{self c11FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c13FullRefereeInSideOutSide . self c5ReferencerInSideRefereeInSide.
			self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide . self c4FullRefereeInSide.
			self c1FullReferencerOutSide}
]

{ #category : #allOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self namespace1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTType) within: self namespace2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #allOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencedNamespaces [
	self
		assertCollection: (self namespace1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespace3ReferencerReferee . self namespace1InteractedReferencerReferee}
]

{ #category : #allIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self namespace2FullReferee queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c12FullReferencerInSide.
			self c13FullRefereeInSideOutSide . self c10FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #allIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self namespace2FullReferee queryAllIncomingInvocations atScope: FamixTType) within: self namespace3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #allIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testReferencingNamespaces [
	self
		assertCollection: (self namespace2FullReferee queryAllIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace3ReferencerReferee . self namespace2FullReferee}
]

{ #category : #sureOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self namespace1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self c4FullRefereeInSide}
]

{ #category : #sureOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self namespace1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTType) within: self namespace2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #sureOutgoingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencedNamespaces [
	self
		assertCollection: (self namespace1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace2FullReferee . self namespace3ReferencerReferee . self namespace1InteractedReferencerReferee}
]

{ #category : #sureIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self namespace2FullReferee querySureIncomingInvocations atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide.
			self c13FullRefereeInSideOutSide . self c12FullReferencerInSide . self c10FullReferencerInSide}
]

{ #category : #sureIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self namespace2FullReferee querySureIncomingInvocations atScope: FamixTType) within: self namespace3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #sureIncomingInvocations }
FAMIXNamespaceNavigationChefTest >> testSureReferencingNamespaces [
	self
		assertCollection: (self namespace2FullReferee querySureIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self namespace1InteractedReferencerReferee . self namespace2FullReferee . self namespace3ReferencerReferee}
]
