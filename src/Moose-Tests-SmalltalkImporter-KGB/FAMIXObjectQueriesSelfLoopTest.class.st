Class {
	#name : #FAMIXObjectQueriesSelfLoopTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #'as yet unclassified' }
FAMIXObjectQueriesSelfLoopTest >> testClassObjectTests [
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

{ #category : #'as yet unclassified' }
FAMIXObjectQueriesSelfLoopTest >> testPackageObjectTests [
	self
		assert:
			((self packageP1FullReferencer queryAllIncomingInvocations
				atScope: FamixTPackage) includes: self packageP1FullReferencer).
	self
		deny:
			((self packageP1FullReferencer queryAllIncomingInvocations
				atScope: FamixTType) withoutSelfLoops
				includes: self packageP1FullReferencer)
]
