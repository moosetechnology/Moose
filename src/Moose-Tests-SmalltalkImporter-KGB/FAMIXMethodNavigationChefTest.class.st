Class {
	#name : #FAMIXMethodNavigationChefTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedClasses [
	| c1Mtd4 |
	c1Mtd4 := self
		getMethod: 'm1p1c1Mtd4:(Object)'
		from: self c1FullReferencerOutSide.
	self
		assert: (c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType) size
		equals: 2.
	self
		assert:
			((c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType)
				equalsTo:
					(Set
						with: self c13FullRefereeInSideOutSide
						with: self c1FullReferencerOutSide))
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedClassesInto [
	| c1Mtd4 p6 |
	c1Mtd4 := self
		getMethod: 'm1p1c1Mtd4:(Object)'
		from: self c1FullReferencerOutSide.
	p6 := self packageP6InteractedReferee.
	self
		assert:
			((c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType)
				withinPackage: p6) size
		equals: 1.
	self
		assert:
			(((c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType)
				withinPackage: p6)
				equalsTo: (Set with: self c13FullRefereeInSideOutSide)).
	self
		assert: 1
		equals:
			((c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType)
				withinNamespace: self namespace2FullReferee) size.
	self
		assert:
			(((c1Mtd4 queryAllOutgoingInvocations atScope: FamixTType)
				withinNamespace: self namespace2FullReferee)
				equalsTo: (Set with: self c13FullRefereeInSideOutSide))
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedMethods [
	| c1Mtd1 c1Mtd4 c13Mtd1 c13Mtd2 c13InstCreation |
	c1Mtd1 := self getMethod: 'm1p1c1Mtd1()' from: self c1FullReferencerOutSide.
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.
	c13Mtd1 := self getMethod: 'm2p6c13Mtd1:(Object)' from: self c13FullRefereeInSideOutSide.
	c13Mtd2 := self getMethod: 'm2p6c13Mtd2()' from: self c13FullRefereeInSideOutSide.
	c13InstCreation := self getMethod: 'm2p6c13InstCreation()' from: self c13FullRefereeInSideOutSide.
	
	self assert: 4
		equals: c1Mtd4 queryAllOutgoingInvocations opposites size.
	self assert: (c1Mtd4 queryAllOutgoingInvocations opposites
		equalsTo: (Set with: c1Mtd1 with: c13Mtd1 with: c13Mtd2 with: c13InstCreation ))
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedMethodsDefinedInto [
	| c15m3 c19InstCreation1 c19m2 |
	c15m3 := self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide.
	c19InstCreation1 := self getMethod: 'm6p11c19InstCreation1()' from: self c19FullRefereeOutSide.
	c19m2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	
	self assert: 2
		equals: (c15m3 queryAllOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) size.
	self assert: ((c15m3 queryAllOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide)
		equalsTo: (Set with: c19InstCreation1 with: c19m2))
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedMethodsDefinedIntoAndPackagedInto [
	| c15m3 c19InstCreation1 c19m2 p11 pExtensions |
	c15m3 := self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide.
	c19InstCreation1 := self getMethod: 'm6p11c19InstCreation1()' from: self c19FullRefereeOutSide.
	c19m2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	p11 := self packageP11FullReferee.
	pExtensions := self packagePExtensions.
	
	self assert: 2
		equals: ((c15m3 queryAllOutgoingInvocations opposites
					withinClass: self c19FullRefereeOutSide) withinPackage: pExtensions) size.
	self assert: (((c15m3 queryAllOutgoingInvocations opposites
					withinClass: self c19FullRefereeOutSide) withinPackage: pExtensions)
		equalsTo: (Set with: c19InstCreation1 with: c19m2 )).
	self assert: ((c15m3 queryAllOutgoingInvocations opposites
					withinClass: self c19FullRefereeOutSide) withinPackage: p11) isEmpty
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedNamespaces [
	| c15m3 |
	c15m3 := self
		getMethod: 'm4p8c15Mtd3()'
		from: self c15FullReferencerOutSide.
	self
		assert: (c15m3 queryAllOutgoingInvocations atScope: FamixTNamespace) size
		equals: 1.
	self
		assert:
			((c15m3 queryAllOutgoingInvocations atScope: FamixTNamespace)
				equalsTo: (Set with: self namespace6InteractedReferee))
]

{ #category : #allOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testReferencedPackages [
	| c15m3 pExtensions p11 |
	c15m3 := self
		getMethod: 'm4p8c15Mtd3()'
		from: self c15FullReferencerOutSide.
	pExtensions := self packagePExtensions.
	p11 := self packageP11FullReferee.
	self
		assert: (c15m3 queryAllOutgoingInvocations atScope: FamixTPackage) size
		equals: 2.
	self
		assert:
			((c15m3 queryAllOutgoingInvocations atScope: FamixTPackage)
				equalsTo: (Set with: pExtensions with: p11))
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingClasses [
	| c19m2 |
	c19m2 := self
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	self
		assert: (c19m2 queryAllIncomingInvocations atScope: FamixTType) size
		equals: 2.
	self
		assert:
			((c19m2 queryAllIncomingInvocations atScope: FamixTType)
				equalsTo:
					(Set
						with: self c15FullReferencerOutSide
						with: self c16FullReferencerOutSideInSide)).
	self
		assert:
			((c19m2 queryAllIncomingInvocations opposites atScope: FamixTType)
				equalsTo:
					(Set
						with: self c15FullReferencerOutSide
						with: self c16FullReferencerOutSideInSide))
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingClassesInto [
	| c19m2 p9 |
	c19m2 := self
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	p9 := self packageP9FullReferencer.
	self
		assert: 1
		equals:
			((c19m2 queryAllIncomingInvocations atScope: FamixTType)
				withinPackage: p9) size.
	self
		assert:
			(((c19m2 queryAllIncomingInvocations atScope: FamixTType)
				withinPackage: p9)
				equalsTo: (Set with: self c16FullReferencerOutSideInSide)).
	self
		assert: 1
		equals:
			((c19m2 queryAllIncomingInvocations atScope: FamixTType)
				withinNamespace: self namespace4FullReferencer) size.
	self
		assert:
			(((c19m2 queryAllIncomingInvocations atScope: FamixTType)
				withinNamespace: self namespace4FullReferencer)
				equalsTo: (Set with: self c15FullReferencerOutSide))
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingMethods [
	| c19m2 c15m1 c15m3 c16m1 |
	c19m2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	c15m3 := self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide.
	c15m1 := self getMethod: 'm4p8c15Mtd1()' from: self c15FullReferencerOutSide.
	c16m1 := self getMethod: 'm5p9c16Mtd1()' from: self c16FullReferencerOutSideInSide.
	
	self assert: 3
		equals: c19m2 queryAllIncomingInvocations opposites size.
	self assert: ((Set with: c15m1 with: c15m3 with: c16m1)
					equalsTo: c19m2 queryAllIncomingInvocations opposites)
		description: 'Unexpected query result' 
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingMethodsDefinedInto [
	| c19m2 c19m1 |
	c19m1 := self 
		getMethod: 'm6p11c19Mtd1()'
		from: self c19FullRefereeOutSide.
	c19m2 := self 
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	
	self assert: 1
		equals: (c19m1 queryAllIncomingInvocations opposites withinClass: c19m1 belongsTo) size.
	self assert: ((c19m1 queryAllIncomingInvocations opposites withinClass: c19m1 belongsTo)
					equalsTo: (Set with: c19m2))
		description: 'Unexpected query result'
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingMethodsDefinedIntoAndPackagedInto [
	| c19m2 c19m1 pExtensions |
	c19m1 := self 
		getMethod: 'm6p11c19Mtd1()'
		from: self c19FullRefereeOutSide.
	c19m2 := self 
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	pExtensions := self packagePExtensions.
	
	self assert: 1
		equals: ((c19m1 queryAllIncomingInvocations opposites
					withinClass: c19m1 belongsTo) withinPackage: pExtensions) size.
	self assert:
			(((c19m1 queryAllIncomingInvocations opposites
				withinClass: c19m1 belongsTo) withinPackage: pExtensions)
			equalsTo: (Set with: c19m2))
		description: 'Unexpected query result'.
	self assert: ((c19m1 queryAllIncomingInvocations opposites
				withinClass: c19m1 belongsTo) withinPackage: c19m1 packageScope) isEmpty
		description: 'Non-empty query result'.
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingMethodsOutOf [
	| c19m2 |
	c19m2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	self assert: c19m2 queryAllIncomingInvocations opposites size equals: 3.
	self
		assert: (c19m2 queryAllIncomingInvocations opposites outOfClass: self c16FullReferencerOutSideInSide) size
		equals: 2.
	self
		assert:
			((c19m2 queryAllIncomingInvocations opposites outOfClass: self c16FullReferencerOutSideInSide)
				equalsTo:
					(Set
						with: (self getMethod: 'm4p8c15Mtd1()' from: self c15FullReferencerOutSide)
						with: (self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide)))
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingNamespaces [
	| c19m1 |
	c19m1 := self
		getMethod: 'm6p11c19Mtd1()'
		from: self c19FullRefereeOutSide.
	self
		assert: (c19m1 queryAllIncomingInvocations atScope: FamixTNamespace) size
		equals: 1
]

{ #category : #allIncomingInvocations }
FAMIXMethodNavigationChefTest >> testReferencingPackages [
	| c19m1 pExtensions p11 p12 |
	c19m1 := self
		getMethod: 'm6p11c19Mtd1()'
		from: self c19FullRefereeOutSide.
	pExtensions := self packagePExtensions.
	p11 := self packageP11FullReferee.
	p12 := self packageP12FullReferencer.
	self
		assert: (c19m1 queryAllIncomingInvocations atScope: FamixTPackage) size
		equals: 3.
	self
		assert:
			((c19m1 queryAllIncomingInvocations atScope: FamixTPackage)
				equalsTo: (Set with: pExtensions with: p11 with: p12)).
	self
		assert:
			((c19m1 queryAllIncomingInvocations opposites atScope: FamixTPackage)
				equalsTo: (Set with: pExtensions with: p11 with: p12))
]

{ #category : #references }
FAMIXMethodNavigationChefTest >> testStaticReferencedClasses [ 
	| c15m3 | 
	c15m3 := self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide. 
	
	self assert: 1
		equals: c15m3 queryOutgoingReferences size. 
	self assert: (c15m3 queryOutgoingReferences opposites
		equalsTo: (Set with: self c19FullRefereeOutSide ))
]

{ #category : #references }
FAMIXMethodNavigationChefTest >> testStaticReferencedClassesInto [
	| c15m3 p11 |
	c15m3 := self getMethod: 'm4p8c15Mtd3()' from: self c15FullReferencerOutSide.
	p11 := self packageP11FullReferee.
	self assert: (c15m3 queryOutgoingReferences opposites withinPackage: p11) size equals: 1.
	self
		assert:
			((c15m3 queryOutgoingReferences opposites withinPackage: p11) equalsTo: (Set with: self c19FullRefereeOutSide)).
	self assert: 1 equals: (c15m3 queryOutgoingReferences opposites withinNamespace: self namespace6InteractedReferee) size.
	self
		assert:
			((c15m3 queryOutgoingReferences opposites withinNamespace: self namespace6InteractedReferee)
				equalsTo: (Set with: self c19FullRefereeOutSide))
]

{ #category : #references }
FAMIXMethodNavigationChefTest >> testStaticReferencedNamespaces [
	| c15m3 |
	c15m3 := self
		getMethod: 'm4p8c15Mtd3()'
		from: self c15FullReferencerOutSide.
	self
		assert: (c15m3 queryOutgoingReferences atScope: FamixTNamespace) size
		equals: 1.
	self
		assert:
			((c15m3 queryOutgoingReferences atScope: FamixTNamespace)
				equalsTo: (Set with: self c19FullRefereeOutSide belongsTo))
]

{ #category : #references }
FAMIXMethodNavigationChefTest >> testStaticReferencedPackages [
	| c15m3 |
	c15m3 := self
		getMethod: 'm4p8c15Mtd3()'
		from: self c15FullReferencerOutSide.
	self
		assert: (c15m3 queryOutgoingReferences atScope: FamixTPackage) size
		equals: 1.
	self
		assert:
			((c15m3 queryOutgoingReferences atScope: FamixTPackage)
				equalsTo: (Set with: self c19FullRefereeOutSide packageScope))
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedClasses [
	"self debug: #testSureReferencedClasses"

	| c19Mtd2 c20Mtd1 |
	c19Mtd2 := self
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	c20Mtd1 := self
		getMethod: 'm6p12c20Mtd1()'
		from: self c20FullReferencerOutSide.
	self
		assert: (c19Mtd2 querySureOutgoingInvocations atScope: FamixTType) size
		equals: 1.
	self
		assert: (c20Mtd1 querySureOutgoingInvocations atScope: FamixTType) size
		equals: 1.
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations atScope: FamixTType)
				includes: self c19FullRefereeOutSide)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedClassesInto [
	| c20Mtd1 p11 pEx |
	c20Mtd1 := self
		getMethod: 'm6p12c20Mtd1()'
		from: self c20FullReferencerOutSide.
	p11 := self packageP11FullReferee.
	pEx := self packagePExtensions.
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations atScope: FamixTType)
				withinPackage: pEx) isEmpty.
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations atScope: FamixTType)
				withinPackage: p11) size
		equals: 1.
	self
		assert:
			(((c20Mtd1 querySureOutgoingInvocations atScope: FamixTType)
				withinPackage: p11) includes: self c19FullRefereeOutSide)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedMethods [
	| c19Mtd1 c19Mtd2 c19InstCreation c20Mtd1 |
	c19Mtd1 := self getMethod: 'm6p11c19Mtd1()' from: self c19FullRefereeOutSide.
	c19Mtd2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	c19InstCreation := self getMethod: 'm6p11c19InstCreation()' from: self c19FullRefereeOutSide.
	c20Mtd1 := self getMethod: 'm6p12c20Mtd1()' from: self c20FullReferencerOutSide.
	self assert: c19Mtd2 querySureOutgoingInvocations opposites size equals: 1.
	self assert: (c19Mtd2 querySureOutgoingInvocations opposites includes: c19Mtd1).
	self assert: c20Mtd1 querySureOutgoingInvocations opposites size equals: 1.
	self assert: (c20Mtd1 querySureOutgoingInvocations opposites includes: c19InstCreation)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedMethodsDefinedInto [ 
	 
	| c19Mtd1 c19Mtd2 c19InstCreation c20Mtd1 | 
	c19Mtd1 := self getMethod: 'm6p11c19Mtd1()' from: self c19FullRefereeOutSide. 
	c19Mtd2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide. 
	c19InstCreation := self getMethod: 'm6p11c19InstCreation()' from: self c19FullRefereeOutSide. 
	c20Mtd1 := self getMethod: 'm6p12c20Mtd1()' from: self c20FullReferencerOutSide. 
	
	self assert: 1
		equals: (c19Mtd2 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) size. 
	self assert: 
			((c19Mtd2 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) 
		includes: c19Mtd1). 
	self assert: 1
		equals: (c20Mtd1 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) size. 
	self assert: 
			((c20Mtd1 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) 
		includes: c19InstCreation)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedMethodsDefinedIntoAndPackagedInto [
	| c19Mtd1 c19Mtd2 c19InstCreation c20Mtd1 p11 pExtensions |
	c19Mtd1 := self getMethod: 'm6p11c19Mtd1()' from: self c19FullRefereeOutSide.
	c19Mtd2 := self getMethod: 'm6p11c19Mtd2()' from: self c19FullRefereeOutSide.
	c19InstCreation := self getMethod: 'm6p11c19InstCreation()' from: self c19FullRefereeOutSide.
	c20Mtd1 := self getMethod: 'm6p12c20Mtd1()' from: self c20FullReferencerOutSide.
	p11 := self packageP11FullReferee.
	pExtensions := self packagePExtensions.
	self
		assert:
			((c19Mtd2 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: pExtensions)
				isEmpty.
	self
		assert:
			((c19Mtd2 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: p11) size
		equals: 1.
	self
		assert:
			(((c19Mtd2 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: p11)
				includes: c19Mtd1).
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: pExtensions)
				isEmpty.
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: p11) size
		equals: 1.
	self
		assert:
			(((c20Mtd1 querySureOutgoingInvocations opposites withinClass: self c19FullRefereeOutSide) withinPackage: p11)
				includes: c19InstCreation)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedNamespaces [
	| c1Mtd4 |
	c1Mtd4 := self
		getMethod: 'm1p1c1Mtd4:(Object)'
		from: self c1FullReferencerOutSide.
	self
		assert: (c1Mtd4 querySureOutgoingInvocations atScope: FamixTNamespace) size
		equals: 1.
	self
		assert:
			((c1Mtd4 querySureOutgoingInvocations atScope: FamixTNamespace)
				includes: self namespace2FullReferee)
]

{ #category : #sureOutgoingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencedPackages [
	| c19Mtd2 c20Mtd1 p11 |
	c19Mtd2 := self
		getMethod: 'm6p11c19Mtd2()'
		from: self c19FullRefereeOutSide.
	c20Mtd1 := self
		getMethod: 'm6p12c20Mtd1()'
		from: self c20FullReferencerOutSide.
	p11 := self packageP11FullReferee.
	self
		assert: (c19Mtd2 querySureOutgoingInvocations atScope: FamixTPackage) size
		equals: 1.
	self
		assert:
			((c19Mtd2 querySureOutgoingInvocations atScope: FamixTPackage)
				includes: p11).
	self
		assert: (c20Mtd1 querySureOutgoingInvocations atScope: FamixTPackage) size
		equals: 1.
	self
		assert:
			((c20Mtd1 querySureOutgoingInvocations atScope: FamixTPackage)
				includes: p11)
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingClasses [
	| c13InstCreation |
	c13InstCreation := self
		getMethod: 'm2p6c13InstCreation()'
		from: self c13FullRefereeInSideOutSide.
	self
		assert: 3
		equals: (c13InstCreation querySureIncomingInvocations atScope: FamixTType) size.
	self
		assert:
			((c13InstCreation querySureIncomingInvocations atScope: FamixTType)
				equalsTo:
					(Set
						with: self c1FullReferencerOutSide
						with: self c12FullReferencerInSide
						with: self c14ReferencerOutSideRefereeOutSide))
		description: 'Unexpected query result'
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingClassesInto [
	| c13InstCreation p6 |
	c13InstCreation := self
		getMethod: 'm2p6c13InstCreation()'
		from: self c13FullRefereeInSideOutSide.
	p6 := self packageP6InteractedReferee.
	self
		assert: 1
		equals:
			((c13InstCreation querySureIncomingInvocations atScope: FamixTType)
				withinPackage: p6) size.
	self
		assert:
			(((c13InstCreation querySureIncomingInvocations atScope: FamixTType)
				withinPackage: p6)
				equalsTo: (Set with: self c12FullReferencerInSide)).
	self
		assert: 1
		equals:
			((c13InstCreation querySureIncomingInvocations atScope: FamixTType)
				withinNamespace: self namespace1InteractedReferencerReferee) size.
	self
		assert:
			(((c13InstCreation querySureIncomingInvocations atScope: FamixTType)
				withinNamespace: self namespace1InteractedReferencerReferee)
				equalsTo: (Set with: self c1FullReferencerOutSide))
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingMethods [ 
	 
	| c13InstCreation c14Mtd1 c12Mtd1 c1Mtd1 c1Mtd4 | 
	c13InstCreation := self 	getMethod: 'm2p6c13InstCreation()' from: self c13FullRefereeInSideOutSide. 
	c14Mtd1 := self getMethod: 'm3p7c14Mtd1()' from: self c14ReferencerOutSideRefereeOutSide. 
	c12Mtd1 := self getMethod: 'm2p6c12Mtd1()' from: self c12FullReferencerInSide. 
	c1Mtd1 := self getMethod: 'm1p1c1Mtd1()' from: self c1FullReferencerOutSide. 
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide. 
	
	self assert: 4 equals: c13InstCreation querySureIncomingInvocations opposites size. 
	self assert: (c13InstCreation querySureIncomingInvocations opposites 
				equalsTo: (Set
						with: c14Mtd1
						with: c12Mtd1
						with: c1Mtd1 
						with: c1Mtd4))
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingMethodsDefinedInto [ 
	 
	| c13InstCreation c1Mtd1 c1Mtd4 | 
	c13InstCreation := self 	getMethod: 'm2p6c13InstCreation()' from: self c13FullRefereeInSideOutSide. 
	c1Mtd1 := self getMethod: 'm1p1c1Mtd1()' from: self c1FullReferencerOutSide. 
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide. 
	self assert: 2
		equals: (c13InstCreation querySureIncomingInvocations opposites
					withinClass: self c1FullReferencerOutSide) size. 
	self assert: ((c13InstCreation querySureIncomingInvocations opposites
					withinClass: self c1FullReferencerOutSide) 
				equalsTo: (Set with: c1Mtd1 with: c1Mtd4))
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingMethodsDefinedIntoAndPackagedInto [ 
	 
	| c13InstCreation c1Mtd1 c1Mtd4 p1 p6 | 
	c13InstCreation := self getMethod: 'm2p6c13InstCreation()' from: self c13FullRefereeInSideOutSide. 
	c1Mtd1 := self getMethod: 'm1p1c1Mtd1()' from: self c1FullReferencerOutSide. 
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide. 
	p1 := self packageP1FullReferencer. 
	p6 := self packageP6InteractedReferee.
	
	self assert: 2
		equals: ((c13InstCreation querySureIncomingInvocations opposites
					withinClass: self c1FullReferencerOutSide)
					withinPackage: p1) size. 
	self assert: 
			(((c13InstCreation querySureIncomingInvocations opposites
					withinClass: self c1FullReferencerOutSide)
					withinPackage: p1) 
				equalsTo: (Set with: c1Mtd1 with: c1Mtd4)). 
	self assert: 
			((c13InstCreation querySureIncomingInvocations opposites
					withinClass: self c1FullReferencerOutSide)
					withinPackage: 6) isEmpty
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingNamespaces [
	| c19InstCreation |
	c19InstCreation := self
		getMethod: 'm6p11c19InstCreation()'
		from: self c19FullRefereeOutSide.
	self
		assert: 3
		equals:
			(c19InstCreation querySureIncomingInvocations atScope: FamixTNamespace)
				size.
	self
		assert:
			((c19InstCreation querySureIncomingInvocations atScope: FamixTNamespace)
				equalsTo:
					(Set
						with: self namespace4FullReferencer
						with: self namespace5InteractedReferencer
						with: self namespace6InteractedReferee))
]

{ #category : #sureIncomingInvocations }
FAMIXMethodNavigationChefTest >> testSureReferencingPackages [
	| c19InstCreation pEx p8 p9 p12 |
	c19InstCreation := self
		getMethod: 'm6p11c19InstCreation()'
		from: self c19FullRefereeOutSide.
	pEx := self packagePExtensions.
	p8 := self packageP8FullReferencer.
	p9 := self packageP9FullReferencer.
	p12 := self packageP12FullReferencer.
	self
		assert:
			(c19InstCreation querySureIncomingInvocations atScope: FamixTPackage)
				size
		equals: 4.
	self
		assert:
			((c19InstCreation querySureIncomingInvocations atScope: FamixTPackage)
				equalsTo:
					(Set
						with: pEx
						with: p8
						with: p9
						with: p12))
]
