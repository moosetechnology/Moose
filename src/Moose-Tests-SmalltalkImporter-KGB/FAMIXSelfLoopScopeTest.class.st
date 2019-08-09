Class {
	#name : #FAMIXSelfLoopScopeTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'famix-class' }
FAMIXSelfLoopScopeTest >> testFamixClassClassScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTClass) includes: self c12FullReferencerInSide).
	self deny: ((self c12FullReferencerInSide withScope: FamixTClass) includes: self c13FullRefereeInSideOutSide).
	self assert: ((self c1FullReferencerOutSide queryAllIncomingInvocations withScope: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny: ((self c1FullReferencerOutSide queryAllIncomingInvocations withScope: FamixTClass) withoutSelfLoops includes: self c1FullReferencerOutSide)
]

{ #category : #'famix-class' }
FAMIXSelfLoopScopeTest >> testFamixClassNamespaceScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTNamespace) includes: self namespace2FullReferee).
	self deny: ((self c12FullReferencerInSide withScope: FamixTNamespace) includes: self namespace1InteractedReferencerReferee)
]

{ #category : #'famix-class' }
FAMIXSelfLoopScopeTest >> testFamixClassPackageScope [
	self assert: ((self c12FullReferencerInSide withScope: FamixTPackage) includes: self packageP6InteractedReferee).
	self deny: ((self c12FullReferencerInSide withScope: FamixTPackage) includes: self packageP5FullReferee)
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodClassScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.

	self assert: ((c1Mtd4 withScope: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny: ((c1Mtd4 withScope: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide)
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodNamespaceScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.

	self assert: ((c1Mtd4 withScope: FamixTNamespace) includes: self namespace1InteractedReferencerReferee).
	self deny: ((c1Mtd4 withScope: FamixTNamespace) includes: self namespace2FullReferee)
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodPackageScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.

	self assert: ((c1Mtd4 withScope: FamixTPackage) includes: self packageP1FullReferencer).
	self deny: ((c1Mtd4 withScope: FamixTPackage) includes: self packageP2InteractedReferencerReferee)
]

{ #category : #'famix-namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceClassScope [
	self assert: ((self namespace1InteractedReferencerReferee withScope: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide).
	self deny: ((self namespace1InteractedReferencerReferee withScope: FamixTClass) includes: self c20FullReferencerOutSide)
]

{ #category : #'famix-namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceNamespaceScope [
	self assert: ((self namespace1InteractedReferencerReferee withScope: FamixTNamespace) includes: self namespace1InteractedReferencerReferee).
	self deny: ((self namespace1InteractedReferencerReferee withScope: FamixTNamespace) includes: self namespace2FullReferee)
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackageClassScope [
	self assert: ((self packageP5FullReferee withScope: FamixTClass) includes: self c11FullRefereeOutSide).
	self deny: ((self packageP5FullReferee withScope: FamixTClass) includes: self c5ReferencerInSideRefereeInSide)
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackagePackageScope [
	self assert: ((self packageP5FullReferee withScope: FamixTPackage) includes: self packageP5FullReferee).
	self deny: ((self packageP5FullReferee withScope: FamixTPackage) includes: self packageP10InteractedReferee)
]
