Class {
	#name : #MooseQueryTypeDeclarationAssociationTest,
	#superclass : #MooseTestWithSmalltalkDependency,
	#instVars : [
		'model'
	],
	#category : #'Moose-Tests-SmalltalkImporter-KGB-MooseChef'
}

{ #category : #setup }
MooseQueryTypeDeclarationAssociationTest class >> importModel [ 
	 
	| factory p1 p2 c1 c2 c3 m1 m2 m3 m4 |
	
	factory := self metamodelFactory.
	
	p1 := factory package new name: 'p1' ; yourself.
	p2 := factory package new name: 'p2' ; yourself.
	
	c1 := factory classEntity new
			name: 'c1' ;
			container: p1 ;
			yourself.
	c2 := factory classEntity new
			name: 'c2' ;
			container: p1 ;
			yourself.
	c3 := factory classEntity new
			name: 'c3' ;
			container: p2 ;
			yourself.

	m1 := factory method new
			name: 'm1' ;
			signature: 'm1()' ;
			container: c1 ;
			declaredType: c2 ;
			yourself.
	m2 := factory method new
			name: 'm2' ;
			signature: 'm2()' ;
			container: c2 ;
			declaredType: c3 ;
			yourself.
	m3 := factory method new
			name: 'm3' ;
			signature: 'm3()' ;
			container: c2 ;
			declaredType: c1 ;
			yourself.
	m4 := factory method new
			name: 'm4' ;
			signature: 'm4()' ;
			container: c3 ;
			declaredType: c3 ;
			yourself.
			
	self model
		add: p1 ;
		add: p2 ;
		add: c1 ;
		add: c2 ;
		add: c3 ;
		add: m1 ;
		add: m2 ;
		add: m3 ;
		add: m4.
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociationTest >> model [
	^ model
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociationTest >> model: anObject [
	model := anObject
]

{ #category : #running }
MooseQueryTypeDeclarationAssociationTest >> setUp [ 
	 
	| p1 p2 c1 c2 c3 m1 m2 m3 m4 at1 at2 pr1 pr2 v1 factory |
		
	super setUp.
	
	factory := self metamodelFactory new.
	
	p1 := factory package new name: 'p1' ; stub: true ; yourself.
	p2 := factory package new name: 'p2' ; stub: true ; yourself.

	c1 := factory classEntity new
			stub: true ;
			name: 'C1' ;
			parentPackage: p1 ;
			yourself.
	c2 := factory classEntity new
			stub: true ;
			name: 'C2' ;
			parentPackage: p1 ;
			yourself.
	c3 := factory classEntity new
			stub: true ;
			name: 'C3' ;
			parentPackage: p2 ;
			yourself.

	m1 := factory method new
			stub: true ;
			name: 'm1' ;
			signature: 'm1()' ;
			parentType: c1 ;
			parentPackage: p1 ;
			declaredType: c2 ;
			yourself.
	m2 := factory method new
			stub: true ;
			name: 'm2' ;
			signature: 'm2()' ;
			parentType: c2 ;
			parentPackage: p1 ;
			declaredType: c3 ;
			yourself.
	m3 := factory method new
			stub: true ;
			name: 'm3' ;
			signature: 'm3(C2,C3)' ;
			parentType: c2 ;
			parentPackage: p1 ;
			declaredType: c1 ;
			yourself.
	m4 := factory method new
			stub: true ;
			name: 'm4' ;
			signature: 'm4()' ;
			parentType: c3 ;
			parentPackage: p2 ;
			declaredType: c3 ;
			yourself.
		
	v1 := factory localVariable new
			stub: true ;
			name: 'v1' ;
			parentBehaviouralEntity: m2 ;
			parentPackage: p1 ;
			declaredType: c1 ;
			yourself.

	pr1 := factory parameter new
			stub: true ;
			name: 'pr1' ;
			parentBehaviouralEntity: m3 ;
			parentPackage: p1 ;
			declaredType: c2 ;
			yourself.
	pr2 := factory parameter new
			stub: true ;
			name: 'pr2' ;
			parentBehaviouralEntity: m3 ;
			parentPackage: p1 ;
			declaredType: c3 ;
			yourself.
		
	at1 := factory attribute new
			stub: true ;
			name: 'at1' ;
			parentType: c1 ;
			parentPackage: p1 ;
			declaredType: c3 ;
			yourself.
	at2 := factory attribute new
			stub: true ;
			name: 'at2' ;
			parentType: c3 ;
			parentPackage: p2 ;
			declaredType: c2 ;
			yourself.
	
	self model: (MooseModel new
		add: p1 ;
		add: p2 ;
		add: c1 ;
		add: c2 ;
		add: c3 ;
		add: m1 ;
		add: m2 ;
		add: m3 ;
		add: m4 ;
		add: v1 ;
		add: at1 ;
		add: at2 ;
		add: pr1 ;
		add: pr2 ;
		yourself).

]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassHasIncomingTypeDeclarations [
	self assert: (self model entityNamed: 'C2') hasIncomingTypeDeclarations.
	self
		assert: (self model entityNamed: 'C3') hasIncomingTypeDeclarations
]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassHasOutgoingTypeDeclarations [
	self
		assert:
			(self model entityNamed: 'C2') hasOutgoingTypeDeclarations .
	self
		assert:
			(self model entityNamed: 'C3') hasOutgoingTypeDeclarations.
]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassHasTypeDeclarationsWithoutSelfLoops [
	self assert: (self model entityNamed: 'C3') hasOutgoingTypeDeclarations.
	self
		assert: (self model entityNamed: 'C3') hasOutgoingTypeDeclarations
]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassIncomingTypeDeclarations [
	self
		assert:
			((self model entityNamed: 'C2') queryIncomingTypeDeclarations
				atScope: FamixTType) size
		equals: 3.
	self
		assert:
			(((self model entityNamed: 'C2') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C1')).
	self
		assert:
			(((self model entityNamed: 'C2') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C2')).
	self
		assert:
			(((self model entityNamed: 'C2') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C3')).
	self
		assert:
			((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				atScope: FamixTType) size
		equals: 3.
	self
		assert:
			(((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C1')).
	self
		assert:
			(((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C2')).
	self
		assert:
			(((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				atScope: FamixTType) includes: (self model entityNamed: 'C3'))
]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassOutgoingTypeDeclarations [
	self
		assert:
			((self model entityNamed: 'C2') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C1')).
	self
		assert:
			((self model entityNamed: 'C2') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C2')).
	self
		assert:
			((self model entityNamed: 'C2') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C3')).
	self assert: (self model entityNamed: 'C2') queryOutgoingTypeDeclarations opposites size equals: 3.
	self assert: (self model entityNamed: 'C3') queryOutgoingTypeDeclarations opposites size equals: 2.
	self
		assert:
			((self model entityNamed: 'C3') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C2')).
	self
		assert:
			((self model entityNamed: 'C3') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C3'))
]

{ #category : #'famix-class' }
MooseQueryTypeDeclarationAssociationTest >> testFamixClassTypeDeclarationsWithoutSelfLoops [
	self
		assert:
			((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				withoutSelfLoops atScope: FamixTType) size
		equals: 2.
	self
		assert:
			(((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				withoutSelfLoops atScope: FamixTType)
				includes: (self model entityNamed: 'C1')).
	self
		assert:
			(((self model entityNamed: 'C3') queryIncomingTypeDeclarations
				withoutSelfLoops atScope: FamixTType)
				includes: (self model entityNamed: 'C2')).
	self
		assert:
			((self model entityNamed: 'C3') queryOutgoingTypeDeclarations
				withoutSelfLoops atScope: FamixTType) size
		equals: 1.
	self
		assert:
			(((self model entityNamed: 'C3') queryOutgoingTypeDeclarations
				withoutSelfLoops atScope: FamixTType)
				includes: (self model entityNamed: 'C2'))
]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodHasIncomingTypeDeclarations [
	self
		deny: (self model entityNamed: 'C1.m1()') hasIncomingTypeDeclarations.
	self
		deny:
			(self model entityNamed: 'C2.m3(C2,C3)') hasIncomingTypeDeclarations
			
]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodHasOutgoingTypeDeclarations [
	self
		assert: (self model entityNamed: 'C2.m2()') hasOutgoingTypeDeclarations.
	
	self
		assert:
			(self model entityNamed: 'C2.m3(C2,C3)') hasOutgoingTypeDeclarations
]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodHasTypeDeclarationsWithoutSelfLoops [
	self
		deny:
			(self model entityNamed: 'C1.m1()') hasIncomingTypeDeclarations.
	self
		assert:
			(self model entityNamed: 'C2.m3(C2,C3)')
				hasOutgoingTypeDeclarations 
]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodIncomingTypeDeclarations [
	self assert: (self model entityNamed: 'C1.m1()') queryIncomingTypeDeclarations size equals: 0.
	self assert: (self model entityNamed: 'C2.m3(C2,C3)') queryIncomingTypeDeclarations size equals: 0
]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodOutgoingTypeDeclarations [
	self assert: (self model entityNamed: 'C2.m2()') queryOutgoingTypeDeclarations opposites size equals: 2.
	self
		assert:
			((self model entityNamed: 'C2.m2()') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C1')).
	self
		assert:
			((self model entityNamed: 'C2.m2()') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C3')).
	self
		assert:
			((self model entityNamed: 'C2.m3(C2,C3)') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C1')).
	self
		assert:
			((self model entityNamed: 'C2.m3(C2,C3)') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C2')).
	self
		assert:
			((self model entityNamed: 'C2.m3(C2,C3)') queryOutgoingTypeDeclarations opposites includes: (self model entityNamed: 'C3')).
	self assert: (self model entityNamed: 'C2.m3(C2,C3)') queryOutgoingTypeDeclarations opposites size equals: 3.

]

{ #category : #'famix-method' }
MooseQueryTypeDeclarationAssociationTest >> testFamixMethodTypeDeclarationsWithoutSelfLoops [
	self
		assert:
			(self model entityNamed: 'C1.m1()') queryIncomingTypeDeclarations
				withoutSelfLoops size
		equals: 0.
	self
		assert:
			(((self model entityNamed: 'C2.m3(C2,C3)')
				queryOutgoingTypeDeclarations withoutSelfLoops atScope: FamixTType)
				includes: (self model entityNamed: 'C1')).
	self
		assert:
			((self model entityNamed: 'C2.m3(C2,C3)')
				queryOutgoingTypeDeclarations withoutSelfLoops atScope: FamixTType)
				size
		equals: 3.
	self
		assert:
			(((self model entityNamed: 'C2.m3(C2,C3)')
				queryOutgoingTypeDeclarations withoutSelfLoops atScope: FamixTType)
				includes: (self model entityNamed: 'C3'))
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageHasIncomingTypeDeclarations [
	self
		assert:
			(self model entityNamed: 'p2') hasIncomingTypeDeclarations
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageHasOutgoingTypeDeclarations [
	self
		assert:
			(self model entityNamed: 'p1') hasOutgoingTypeDeclarations
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageHasTypeDeclarationsWithoutSelfLoops [
	self
		assert: (self model entityNamed: 'p2') hasIncomingTypeDeclarations.
		self
		assert:
			(self model entityNamed: 'p1') hasOutgoingTypeDeclarations
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageIncomingTypeDeclarations [
	self
		assert:
			((self model entityNamed: 'p2') queryIncomingTypeDeclarations
				atScope: FamixTPackage) size
		equals: 2.
	self
		assert:
			(((self model entityNamed: 'p2') queryIncomingTypeDeclarations
				atScope: FamixTPackage) includes: (self model entityNamed: 'p1')).
	self
		assert:
			(((self model entityNamed: 'p2') queryIncomingTypeDeclarations
				atScope: FamixTPackage) includes: (self model entityNamed: 'p2'))
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageOutgoingTypeDeclarations [
	self
		assert:
			((self model entityNamed: 'p1') queryOutgoingTypeDeclarations
				atScope: FamixTPackage) size
		equals: 2.
	self
		assert:
			(((self model entityNamed: 'p1') queryOutgoingTypeDeclarations
				atScope: FamixTPackage) includes: (self model entityNamed: 'p1')).
	self
		assert:
			(((self model entityNamed: 'p1') queryOutgoingTypeDeclarations
				atScope: FamixTPackage) includes: (self model entityNamed: 'p2'))
]

{ #category : #'famix-package' }
MooseQueryTypeDeclarationAssociationTest >> testFamixPackageTypeDeclarationsWithoutSelfLoops [
	self
		assert:
			((self model entityNamed: 'p2') queryIncomingTypeDeclarations
				atScope: FamixTPackage) withoutSelfLoops size
		equals: 1.
	self
		assert:
			(((self model entityNamed: 'p2') queryIncomingTypeDeclarations
				atScope: FamixTPackage) withoutSelfLoops
				includes: (self model entityNamed: 'p1')).
	self
		assert:
			((self model entityNamed: 'p1') queryOutgoingTypeDeclarations
				atScope: FamixTPackage) withoutSelfLoops size
		equals: 1.
	self
		assert:
			(((self model entityNamed: 'p1') queryOutgoingTypeDeclarations
				atScope: FamixTPackage) withoutSelfLoops
				includes: (self model entityNamed: 'p2'))
]
