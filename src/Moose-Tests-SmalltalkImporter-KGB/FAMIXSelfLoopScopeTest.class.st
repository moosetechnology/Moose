Class {
	#name : #FAMIXSelfLoopScopeTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'tests - class' }
FAMIXSelfLoopScopeTest >> testFamixClassClassScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTClass) includes: self c12FullReferencerInSide).
	self deny: ((self c12FullReferencerInSide withScope: FamixTClass) includes: self c13FullRefereeInSideOutSide).
	self assert: ((self c1FullReferencerOutSide queryAllIncomingInvocations withScope: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny: ((self c1FullReferencerOutSide queryAllIncomingInvocations withScope: FamixTClass) withoutSelfLoops includes: self c1FullReferencerOutSide)
]

{ #category : #'tests - class' }
FAMIXSelfLoopScopeTest >> testFamixClassNamespaceScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTNamespace) includes: self n2FullReferee).
	self deny: ((self c12FullReferencerInSide withScope: FamixTNamespace) includes: self n1InteractedReferencerReferee)
]

{ #category : #'tests - class' }
FAMIXSelfLoopScopeTest >> testFamixClassPackageScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTPackage) includes: self p6InteractedReferee).
	self deny: ((self c12FullReferencerInSide withScope: FamixTPackage) includes: self p5FullReferee)
]

{ #category : #'tests - method' }
FAMIXSelfLoopScopeTest >> testFamixMethodClassScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 withScope: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny: ((c1Mtd4 withScope: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide)
]

{ #category : #'tests - method' }
FAMIXSelfLoopScopeTest >> testFamixMethodNamespaceScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 withScope: FamixTNamespace) includes: self n1InteractedReferencerReferee).
	self deny: ((c1Mtd4 withScope: FamixTNamespace) includes: self n2FullReferee)
]

{ #category : #'tests - method' }
FAMIXSelfLoopScopeTest >> testFamixMethodPackageScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 withScope: FamixTPackage) includes: self p1FullReferencer).
	self deny: ((c1Mtd4 withScope: FamixTPackage) includes: self p2InteractedReferencerReferee)
]

{ #category : #'tests - namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceClassScope [
	self assert: ((self n1InteractedReferencerReferee withScope: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide).
	self deny: ((self n1InteractedReferencerReferee withScope: FamixTClass) includes: self c20FullReferencerOutSide)
]

{ #category : #'tests - namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceNamespaceScope [
	self assert: ((self n1InteractedReferencerReferee withScope: FamixTNamespace) includes: self n1InteractedReferencerReferee).
	self deny: ((self n1InteractedReferencerReferee withScope: FamixTNamespace) includes: self n2FullReferee)
]

{ #category : #'tests - package' }
FAMIXSelfLoopScopeTest >> testFamixPackageClassScope [
	self assert: ((self p5FullReferee withScope: FamixTClass) includes: self c11FullRefereeOutSide).
	self deny: ((self p5FullReferee withScope: FamixTClass) includes: self c5ReferencerInSideRefereeInSide)
]

{ #category : #'tests - package' }
FAMIXSelfLoopScopeTest >> testFamixPackagePackageScope [
	self assert: ((self p5FullReferee withScope: FamixTPackage) includes: self p5FullReferee).
	self deny: ((self p5FullReferee withScope: FamixTPackage) includes: self p10InteractedReferee)
]
