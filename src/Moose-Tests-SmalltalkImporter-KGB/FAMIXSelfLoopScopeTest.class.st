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
FAMIXSelfLoopScopeTest >> testFamixClassNamespaceScope [

	self assert: (self c12FullReferencerInSide namespaceScope mooseIncludes: self namespace2FullReferee).
	self deny: (self c12FullReferencerInSide namespaceScope mooseIncludes: self namespace1InteractedReferencerReferee)
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
FAMIXSelfLoopScopeTest >> testFamixMethodNamespaceScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.
	
	self assert: (c1Mtd4 namespaceScope mooseIncludes: self namespace1InteractedReferencerReferee).
	self deny: (c1Mtd4 namespaceScope mooseIncludes: self namespace2FullReferee)
]

{ #category : #'famix-method' }
FAMIXSelfLoopScopeTest >> testFamixMethodPackageScope [
	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)' from: self c1FullReferencerOutSide.
	
	self assert: (c1Mtd4 packageScope mooseIncludes: self packageP1FullReferencer).
	self deny: (c1Mtd4 packageScope mooseIncludes: self packageP2InteractedReferencerReferee)
]

{ #category : #'famix-namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceClassScope [

	self assert: (self namespace1InteractedReferencerReferee typeScope mooseIncludes: self c2ReferencerOutSideRefereeInSide).
	self deny: (self namespace1InteractedReferencerReferee typeScope mooseIncludes: self c20FullReferencerOutSide)
]

{ #category : #'famix-namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespaceNamespaceScope [

	self assert: (self namespace1InteractedReferencerReferee namespaceScope mooseIncludes: self namespace1InteractedReferencerReferee).
	self deny: (self namespace1InteractedReferencerReferee namespaceScope mooseIncludes: self namespace2FullReferee)
]

{ #category : #'famix-namespace' }
FAMIXSelfLoopScopeTest >> testFamixNamespacePackageScope [

	self should: [self namespace1InteractedReferencerReferee packageScope ] raise: Error.
	"self assert: (self namespace1InteractedReferencerReferee packageScope mooseIncludes: self packageP1FullReferencer ).
	self deny: (self namespace1InteractedReferencerReferee packageScope mooseIncludes: self packageP4FullInteracted )"
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackageClassScope [

	self assert: (self packageP5FullReferee typeScope mooseIncludes: self c11FullRefereeOutSide).
	self deny: (self packageP5FullReferee typeScope mooseIncludes: self c5ReferencerInSideRefereeInSide )
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackageNamespaceScope [

	self should: [self assert: (self packageP5FullReferee namespaceScope )] raise: Error.
	"self assert: (self packageP5FullReferee namespaceScope mooseIncludes: self namespace2FullReferee ).
	self deny: (self packageP5FullReferee namespaceScope mooseIncludes: self namespace6InteractedReferee )"
	"namespace
		^ (self classes collectAsSet: #container) first"
]

{ #category : #'famix-package' }
FAMIXSelfLoopScopeTest >> testFamixPackagePackageScope [

	self assert: (self packageP5FullReferee packageScope mooseIncludes: self packageP5FullReferee ).
	self deny: (self packageP5FullReferee packageScope mooseIncludes: self packageP10InteractedReferee )
]
