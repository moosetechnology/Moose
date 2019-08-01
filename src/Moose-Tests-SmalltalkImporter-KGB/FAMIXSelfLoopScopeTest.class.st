Class {
	#name : #FAMIXSelfLoopScopeTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'famix-class' }
FAMIXSelfLoopScopeTest >> testFamixClassClassScope [
	self
		assert:
			(self c12FullReferencerInSide typeScope
				mooseIncludes: self c12FullReferencerInSide).
	self
		deny:
			(self c12FullReferencerInSide typeScope
				mooseIncludes: self c13FullRefereeInSideOutSide).
	self
		assert:
			((self c1FullReferencerOutSide queryAllIncomingInvocations
				atScope: FamixTType) includes: self c1FullReferencerOutSide).
	self
		deny:
			((self c1FullReferencerOutSide queryAllIncomingInvocations
				atScope: FamixTType) withoutSelfLoops
				includes: self c1FullReferencerOutSide)
]

{ #category : #'famix-class' }
FAMIXSelfLoopScopeTest >> testFamixClassPackageScope [

	self assert: (self c12FullReferencerInSide packageScope mooseIncludes: self packageP6InteractedReferee).
	self deny: (self c12FullReferencerInSide packageScope mooseIncludes: self packageP5FullReferee )
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodClassScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.
	
	self assert: (c1Mtd4 typeScope mooseIncludes: self c1FullReferencerOutSide).
	self deny: (c1Mtd4 typeScope mooseIncludes: self c2ReferencerOutSideRefereeInSide)
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodPackageScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.
	
	self assert: (c1Mtd4 namespaceScope mooseIncludes: self namespace1InteractedReferencerReferee).
	self deny: (c1Mtd4 namespaceScope mooseIncludes: self namespace2FullReferee)
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackageClassScope [

	self assert: (self packageP5FullReferee typeScope mooseIncludes: self c11FullRefereeOutSide).
	self deny: (self packageP5FullReferee typeScope mooseIncludes: self c5ReferencerInSideRefereeInSide )
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackagePackageScope [

	self assert: (self packageP5FullReferee packageScope mooseIncludes: self packageP5FullReferee ).
	self deny: (self packageP5FullReferee packageScope mooseIncludes: self packageP10InteractedReferee )
]
