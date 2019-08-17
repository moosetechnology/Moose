Class {
	#name : #FAMIXMethodNavigationChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: ((self getMethod: 'm1p1c1Mtd4:(Object)') queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c13FullRefereeInSideOutSide . self c1FullReferencerOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: (((self getMethod: 'm1p1c1Mtd4:(Object)') queryAllOutgoingInvocations atScope: FamixTType) within: self p6InteractedReferee)
		hasSameElements: {self c13FullRefereeInSideOutSide}.
	self
		assertCollection: (((self getMethod: 'm1p1c1Mtd4:(Object)') queryAllOutgoingInvocations atScope: FamixTType) within: self n2FullReferee)
		hasSameElements: {self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedMethods [
	self
		assertCollection: (self getMethod: 'm1p1c1Mtd4:(Object)') queryAllOutgoingInvocations opposites
		hasSameElements:
			{(self getMethod: 'm1p1c1Mtd1()') . (self getMethod: 'm2p6c13Mtd1:(Object)') . (self getMethod: 'm2p6c13Mtd2()').
			(self getMethod: 'm2p6c13InstCreation()')}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedMethodsDefinedInto [
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryAllOutgoingInvocations opposites within: self c19FullRefereeOutSide)
		hasSameElements: {(self getMethod: 'm6p11c19InstCreation1()') . (self getMethod: 'm6p11c19Mtd2()')}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedMethodsDefinedIntoAndPackagedInto [
	self
		assertCollection: (((self getMethod: 'm4p8c15Mtd3()') queryAllOutgoingInvocations opposites within: self c19FullRefereeOutSide) within: self pExtensions)
		hasSameElements: {(self getMethod: 'm6p11c19InstCreation1()') . (self getMethod: 'm6p11c19Mtd2()')}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedNamespaces [
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryAllOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n6InteractedReferee}
]

{ #category : #'tests - outgoing invocations' }
FAMIXMethodNavigationChefTest >> testReferencedPackages [
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryAllOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self pExtensions . self p11FullReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c15FullReferencerOutSide . self c16FullReferencerOutSideInSide}.
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations opposites atScope: FamixTType)
		hasSameElements: {self c15FullReferencerOutSide . self c16FullReferencerOutSideInSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: (((self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations atScope: FamixTType) within: self p9FullReferencer)
		hasSameElements: {self c16FullReferencerOutSideInSide}.
	self
		assertCollection: (((self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations atScope: FamixTType) within: self n4FullReferencer)
		hasSameElements: {self c15FullReferencerOutSide}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingMethods [
	self
		assertCollection: (self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations opposites
		hasSameElements: {(self getMethod: 'm4p8c15Mtd1()') . (self getMethod: 'm4p8c15Mtd3()') . (self getMethod: 'm5p9c16Mtd1()')}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingMethodsDefinedInto [
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd1()') queryAllIncomingInvocations opposites within: (self getMethod: 'm6p11c19Mtd1()') belongsTo)
		hasSameElements: {(self getMethod: 'm6p11c19Mtd2()')}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingMethodsDefinedIntoAndPackagedInto [
	self
		assertCollection:
			(((self getMethod: 'm6p11c19Mtd1()') queryAllIncomingInvocations opposites within: (self getMethod: 'm6p11c19Mtd1()') belongsTo) within: self pExtensions)
		hasSameElements: {(self getMethod: 'm6p11c19Mtd2()')}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingMethodsOutOf [
	self assert: (self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations opposites size equals: 3.
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd2()') queryAllIncomingInvocations opposites outOf: self c16FullReferencerOutSideInSide)
		hasSameElements: {(self getMethod: 'm4p8c15Mtd1()') . (self getMethod: 'm4p8c15Mtd3()')}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingNamespaces [
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd1()') queryAllIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n6InteractedReferee}
]

{ #category : #'tests - incoming invocations' }
FAMIXMethodNavigationChefTest >> testReferencingPackages [
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd1()') queryAllIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self pExtensions . self p11FullReferee . self p12FullReferencer}.
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd1()') queryAllIncomingInvocations opposites atScope: FamixTPackage)
		hasSameElements: {self pExtensions . self p11FullReferee . self p12FullReferencer}
]

{ #category : #'tests - references' }
FAMIXMethodNavigationChefTest >> testStaticReferencedClasses [
	self assertCollection: (self getMethod: 'm4p8c15Mtd3()') queryOutgoingReferences opposites hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXMethodNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryOutgoingReferences opposites within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryOutgoingReferences opposites within: self n6InteractedReferee)
		hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FAMIXMethodNavigationChefTest >> testStaticReferencedNamespaces [
	self assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryOutgoingReferences atScope: FamixTNamespace) hasSameElements: {self n6InteractedReferee}
]

{ #category : #'tests - references' }
FAMIXMethodNavigationChefTest >> testStaticReferencedPackages [
	self
		assertCollection: ((self getMethod: 'm4p8c15Mtd3()') queryOutgoingReferences atScope: FamixTPackage)
		hasSameElements: (self c19FullRefereeOutSide atScope: FamixTPackage)
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedClasses [
	self assertCollection: ((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations atScope: FamixTType) hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedClassesInto [
	self assertEmpty: (((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations atScope: FamixTType) within: self pExtensions).
	self
		assertCollection: (((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedMethods [
	self assertCollection: (self getMethod: 'm6p11c19Mtd2()') querySureOutgoingInvocations opposites hasSameElements: {(self getMethod: 'm6p11c19Mtd1()')}.
	self assertCollection: (self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations opposites hasSameElements: {(self getMethod: 'm6p11c19InstCreation()')}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedMethodsDefinedInto [
	self
		assertCollection: ((self getMethod: 'm6p11c19Mtd2()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide)
		hasSameElements: {(self getMethod: 'm6p11c19Mtd1()')}.
	self
		assertCollection: ((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide)
		hasSameElements: {(self getMethod: 'm6p11c19InstCreation()')}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedMethodsDefinedIntoAndPackagedInto [
	self
		assertEmpty: (((self getMethod: 'm6p11c19Mtd2()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide) within: self pExtensions).
	self
		assertCollection: (((self getMethod: 'm6p11c19Mtd2()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide) within: self p11FullReferee)
		hasSameElements: {(self getMethod: 'm6p11c19Mtd1()')}.
	self
		assertEmpty: (((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide) within: self pExtensions).
	self
		assertCollection: (((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations opposites within: self c19FullRefereeOutSide) within: self p11FullReferee)
		hasSameElements: {(self getMethod: 'm6p11c19InstCreation()')}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedNamespaces [
	self
		assertCollection: ((self getMethod: 'm1p1c1Mtd4:(Object)') querySureOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencedPackages [
	self assertCollection: ((self getMethod: 'm6p11c19Mtd2()') querySureOutgoingInvocations atScope: FamixTPackage) hasSameElements: {self p11FullReferee}.
	self assertCollection: ((self getMethod: 'm6p12c20Mtd1()') querySureOutgoingInvocations atScope: FamixTPackage) hasSameElements: {self p11FullReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: ((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c12FullReferencerInSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: (((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations atScope: FamixTType) within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: (((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingMethods [
	self
		assertCollection: (self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations opposites
		hasSameElements:
			{(self getMethod: 'm3p7c14Mtd1()') . (self getMethod: 'm2p6c12Mtd1()') . (self getMethod: 'm1p1c1Mtd1()') . (self getMethod: 'm1p1c1Mtd4:(Object)')}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingMethodsDefinedInto [
	self
		assertCollection: ((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations opposites within: self c1FullReferencerOutSide)
		hasSameElements: {(self getMethod: 'm1p1c1Mtd1()') . (self getMethod: 'm1p1c1Mtd4:(Object)')}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingMethodsDefinedIntoAndPackagedInto [
	self
		assertCollection: (((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations opposites within: self c1FullReferencerOutSide) within: self p1FullReferencer)
		hasSameElements: {(self getMethod: 'm1p1c1Mtd1()') . (self getMethod: 'm1p1c1Mtd4:(Object)')}.
	self
		assertEmpty:
			(((self getMethod: 'm2p6c13InstCreation()') querySureIncomingInvocations opposites within: self c1FullReferencerOutSide) within: self p6InteractedReferee)
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingNamespaces [
	self
		assertCollection: ((self getMethod: 'm6p11c19InstCreation()') querySureIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n4FullReferencer . self n5InteractedReferencer . self n6InteractedReferee}
]

{ #category : #'tests - sure invocations' }
FAMIXMethodNavigationChefTest >> testSureReferencingPackages [
	self
		assertCollection: ((self getMethod: 'm6p11c19InstCreation()') querySureIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self pExtensions . self p8FullReferencer . self p9FullReferencer . self p12FullReferencer}
]
