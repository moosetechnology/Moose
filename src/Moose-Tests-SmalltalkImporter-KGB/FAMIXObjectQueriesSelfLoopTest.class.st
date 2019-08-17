Class {
	#name : #FAMIXObjectQueriesSelfLoopTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #tests }
FAMIXObjectQueriesSelfLoopTest >> testClassObjectTests [
	self assertCollection: (self c1FullReferencerOutSide queryAllIncomingInvocations atScope: FamixTType) hasSameElements: {self c1FullReferencerOutSide}.
	self deny: ((self c1FullReferencerOutSide queryAllIncomingInvocations atScope: FamixTType) withoutSelfLoops includes: self c1FullReferencerOutSide)
]

{ #category : #tests }
FAMIXObjectQueriesSelfLoopTest >> testPackageObjectTests [
	self assertCollection: (self p1FullReferencer queryAllIncomingInvocations atScope: FamixTPackage) hasSameElements: {self p1FullReferencer}.
	self deny: ((self p1FullReferencer queryAllIncomingInvocations atScope: FamixTType) withoutSelfLoops includes: self p1FullReferencer)
]
