Class {
	#name : #FamixStQueryTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'p1',
		'c1',
		'c2',
		'c3',
		'm1',
		'm2',
		'm3',
		'm4',
		'v1',
		'pr1',
		'pr2',
		'at1',
		'at2',
		'p2'
	],
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #accessing }
FamixStQueryTest >> model [
	^ model
]

{ #category : #accessing }
FamixStQueryTest >> model: anObject [
	model := anObject
]

{ #category : #running }
FamixStQueryTest >> setUp [
	super setUp.
	p1 := FamixStPackage new
		name: 'p1';
		stub: true;
		yourself.
	p2 := FamixStPackage new
		name: 'p2';
		stub: true;
		yourself.

	c1 := FamixStClass new
		stub: true;
		name: 'C1';
		parentPackage: p1;
		yourself.
	c2 := FamixStClass new
		stub: true;
		name: 'C2';
		parentPackage: p1;
		yourself.
	c3 := FamixStClass new
		stub: true;
		name: 'C3';
		parentPackage: p2;
		yourself.

	m1 := FamixStMethod new
		stub: true;
		name: 'm1';
		signature: 'm1()';
		parentType: c1;
		parentPackage: p1;
		declaredType: c2;
		yourself.
	m2 := FamixStMethod new
		stub: true;
		name: 'm2';
		signature: 'm2()';
		parentType: c2;
		parentPackage: p1;
		declaredType: c3;
		yourself.
	m3 := FamixStMethod new
		stub: true;
		name: 'm3';
		signature: 'm3(C2,C3)';
		parentType: c2;
		parentPackage: p1;
		declaredType: c1;
		yourself.
	m4 := FamixStMethod new
		stub: true;
		name: 'm4';
		signature: 'm4()';
		parentType: c3;
		parentPackage: p2;
		declaredType: c3;
		yourself.

	v1 := FamixStLocalVariable new
		stub: true;
		name: 'v1';
		parentBehaviouralEntity: m2;
		parentPackage: p1;
		declaredType: c1;
		yourself.

	pr1 := FamixStParameter new
		stub: true;
		name: 'pr1';
		parentBehaviouralEntity: m3;
		parentPackage: p1;
		declaredType: c2;
		yourself.
	pr2 := FamixStParameter new
		stub: true;
		name: 'pr2';
		parentBehaviouralEntity: m3;
		parentPackage: p1;
		declaredType: c3;
		yourself.

	at1 := FamixStAttribute new
		stub: true;
		name: 'at1';
		parentType: c1;
		parentPackage: p1;
		declaredType: c3;
		yourself.
	at2 := FamixStAttribute new
		stub: true;
		name: 'at2';
		parentType: c3;
		parentPackage: p2;
		declaredType: c2;
		yourself.

	self model: (FamixStModel withAll: {p1 . p2 . c1 . c2 . c3 . m1 . m2 . m3 . m4 . v1 . at1 . at2 . pr1 . pr2})
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassHasIncomingTypeDeclarations [
	self assert: c2 hasIncomingTypeDeclarations.
	self assert: c3 hasIncomingTypeDeclarations
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassHasOutgoingTypeDeclarations [
	self assert: c2 hasOutgoingTypeDeclarations.
	self assert: c3 hasOutgoingTypeDeclarations
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassHasTypeDeclarationsWithoutSelfLoops [
	self assert: c3 hasOutgoingTypeDeclarations.
	self assert: c3 hasOutgoingTypeDeclarations
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassIncomingTypeDeclarations [
	self assertCollection: (c2 queryIncomingTypeDeclarations atScope: FamixTType) hasSameElements: {c1 . c2 . c3}.
	self assertCollection: (c3 queryIncomingTypeDeclarations atScope: FamixTType) hasSameElements: {c1 . c2 . c3}
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassOutgoingTypeDeclarations [
	self assertCollection: c2 queryOutgoingTypeDeclarations opposites hasSameElements: {c1 . c2 . c3}.
	self assertCollection: c3 queryOutgoingTypeDeclarations opposites hasSameElements: {c2 . c3}
]

{ #category : #'tests - class' }
FamixStQueryTest >> testFamixClassTypeDeclarationsWithoutSelfLoops [
	self assertCollection: (c3 queryIncomingTypeDeclarations withoutSelfLoops atScope: FamixTType) hasSameElements: {c1 . c2}.
	self assertCollection: (c3 queryOutgoingTypeDeclarations withoutSelfLoops atScope: FamixTType) hasSameElements: {c2}
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodHasIncomingTypeDeclarations [
	self deny: m1 hasIncomingTypeDeclarations.
	self deny: m3 hasIncomingTypeDeclarations
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodHasOutgoingTypeDeclarations [
	self assert: m2 hasOutgoingTypeDeclarations.
	self assert: m3 hasOutgoingTypeDeclarations
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodHasTypeDeclarationsWithoutSelfLoops [
	self deny: m1 hasIncomingTypeDeclarations.
	self assert: m3 hasOutgoingTypeDeclarations
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodIncomingTypeDeclarations [
	self assert: m1 queryIncomingTypeDeclarations isEmpty.
	self assert: m3 queryIncomingTypeDeclarations isEmpty
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodOutgoingTypeDeclarations [
	self assertCollection: m2 queryOutgoingTypeDeclarations opposites hasSameElements: {c1 . c3}.
	self assertCollection: m3 queryOutgoingTypeDeclarations opposites hasSameElements: {c1 . c2 . c3}
]

{ #category : #'tests - method' }
FamixStQueryTest >> testFamixMethodTypeDeclarationsWithoutSelfLoops [
	self assert: m1 queryIncomingTypeDeclarations withoutSelfLoops isEmpty.
	self assertCollection: (m3 queryOutgoingTypeDeclarations withoutSelfLoops atScope: FamixTType) hasSameElements: {c1 . c2 . c3}
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageHasIncomingTypeDeclarations [
	self assert: p2 hasIncomingTypeDeclarations
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageHasOutgoingTypeDeclarations [
	self assert: p1 hasOutgoingTypeDeclarations
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageHasTypeDeclarationsWithoutSelfLoops [
	self assert: p2 hasIncomingTypeDeclarations.
	self assert: p1 hasOutgoingTypeDeclarations
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageIncomingTypeDeclarations [
	self assertCollection: (p2 queryIncomingTypeDeclarations atScope: FamixTPackage) hasSameElements: {p1 . p2}
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageOutgoingTypeDeclarations [
	self assertCollection: (p1 queryOutgoingTypeDeclarations atScope: FamixTPackage) hasSameElements: {p1 . p2}
]

{ #category : #'tests - package' }
FamixStQueryTest >> testFamixPackageTypeDeclarationsWithoutSelfLoops [
	self assertCollection: (p2 queryIncomingTypeDeclarations atScope: FamixTPackage) withoutSelfLoops hasSameElements: {p1}.
	self assertCollection: (p1 queryOutgoingTypeDeclarations atScope: FamixTPackage) withoutSelfLoops hasSameElements: {p2}
]
