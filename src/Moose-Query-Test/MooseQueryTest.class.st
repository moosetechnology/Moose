Class {
	#name : #MooseQueryTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'class1',
		'class2',
		'inh',
		'method1',
		'var2',
		'access',
		'method2',
		'method3',
		'inv1',
		'inv2',
		'package1',
		'inv3',
		'package2',
		'var1',
		'acc1',
		'namespace',
		'ref1',
		'methodExt',
		'isolatedPackage',
		'isolatedClass',
		'isolatedMethod',
		'localVariable'
	],
	#category : #'Moose-Query-Test'
}

{ #category : #accessing }
MooseQueryTest >> model [
	^ model
]

{ #category : #running }
MooseQueryTest >> setUp [
	super setUp.
	model := MooseModel new.
	package1 := FAMIXPackage new name: 'package1' ; mooseModel: model.
	package2 := FAMIXPackage new name: 'package2' ; mooseModel: model.
	isolatedPackage := FAMIXPackage new name: 'isolatedPackage' ; mooseModel: model.
	namespace := FAMIXNamespace new name: 'Smalltalk' ; mooseModel: model.
	class1 := FAMIXClass new name: 'class1' ; parentPackage: package1 ; container: namespace ; mooseModel: model.
	class2 := FAMIXClass new name: 'class2' ; parentPackage: package2 ; mooseModel: model.
	isolatedClass := FAMIXClass new name: 'isolatedClass' ; parentPackage: isolatedPackage ; mooseModel: model.
	inh := FAMIXInheritance new subclass: class1 ; superclass: class2 ; mooseModel: model.
	method1 := FAMIXMethod new name: 'method1' ; parentType: class1 ; mooseModel: model.
	method2 := FAMIXMethod new name: 'method2' ; parentType: class2 ; mooseModel: model.
	method3 := FAMIXMethod new name: 'method3' ; parentType: class2 ; mooseModel: model.
	isolatedMethod := FAMIXMethod new name: 'isolatedMethod' ; parentType: isolatedClass ; mooseModel: model.
	methodExt := FAMIXMethod new name: 'methodExt' ; parentType: class2 ; parentPackage: package1 ; mooseModel: model.
	var1 := FAMIXAttribute new name: 'var1' ; parentType: class2 ; declaredType: class1 ; mooseModel: model.
	var2 := FAMIXAttribute new name: 'var2' ; parentType: class2 ; mooseModel: model.
	localVariable := FAMIXLocalVariable new name: 'var3' ; parentBehaviouralEntity: method2 ; declaredType: class1 ; mooseModel: model.
	access := FAMIXAccess new accessor: method1 ; variable: var2 ; mooseModel: model.
	acc1 := FAMIXAccess new accessor: method2 ; variable: var1 ; mooseModel: model.
	inv1 := FAMIXInvocation new sender: method1 ; addCandidate: method2 ; receiver: var2 ; mooseModel: model.
	inv2 := FAMIXInvocation new sender: method2 ; addCandidate: method2 ; receiver: var2 ; mooseModel: model.
	inv3 := FAMIXInvocation new sender: method3 ; addCandidate: method2 ; receiver: var2 ; mooseModel: model.
	ref1 := FAMIXReference new source: method1 ; target: class2 ; mooseModel: model.
]

{ #category : #tests }
MooseQueryTest >> testAllAtAnyScope [
	self assertCollection: (class1 allAtAnyScope: {FAMIXClass}) hasSameElements: {class1}.
	self assertCollection: (class1 allAtAnyScope: {FAMIXPackage}) hasSameElements: {package1}.
	self assertCollection: (class1 allAtAnyScope: {FAMIXClass . FAMIXPackage}) hasSameElements: {class1. package1}.
	self assertCollection: (class1 allAtAnyScope: {FAMIXMethod}) hasSameElements: {}.
	self assertCollection: (class1 allAtAnyScope: {FamixTClass}) hasSameElements: {class1}.
	self assertCollection: (class1 allAtAnyScope: {FamixTPackage}) hasSameElements: {package1}.
	self assertCollection: (class1 allAtAnyScope: {FamixTClass . FamixTPackage}) hasSameElements: {class1. package1}.
	self assertCollection: (class1 allAtAnyScope: {FamixTMethod}) hasSameElements: {}.
	self assertCollection: (methodExt allAtAnyScope: {FAMIXPackage}) hasSameElements: {package1. package2}.
]

{ #category : #tests }
MooseQueryTest >> testAllAtScope [
	| package3 |
	self assertCollection: (class1 allAtScope: FamixTClass) hasSameElements: {class1}.
	self assertCollection: (class1 allAtScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 allAtScope: FamixTPackage) hasSameElements: {package1}.
	self
		assertCollection: (class1 allAtScope: FamixTScopingEntity)
		hasSameElements:
			{namespace.
			package1}.
	package3 := FAMIXPackage new
		name: 'package3';
		mooseModel: model.
	package1 parentPackage: package3.
	self
		assertCollection: (class1 allAtScope: FamixTPackage)
		hasSameElements:
			{package1.
			package3}.
	self
		assertCollection: (class1 allAtScope: FamixTScopingEntity)
		hasSameElements:
			{namespace.
			package1.
			package3}
]

{ #category : #tests }
MooseQueryTest >> testAllChildren [
	self assert: package2 allChildren size equals: 7.
	self assert: class2 allChildren size equals: 6.
	self assert: method2 allChildren size equals: 1
]

{ #category : #tests }
MooseQueryTest >> testAllIncoming [
	self assert: method2 queryAllIncoming size equals: 3.
	self assert: class2 queryAllIncoming size equals: 7
]

{ #category : #tests }
MooseQueryTest >> testAllOutgoing [
	self assert: method2 queryAllOutgoing size equals: 2.
	self assert: class2 queryAllOutgoing size equals: 3
]

{ #category : #tests }
MooseQueryTest >> testAllParents [
	self assert: package2 allParents size equals: 0.
	self assert: class2 allParents size equals: 1.
	self assert: method2 allParents size equals: 2.
	self assert: var2 allParents size equals: 2
]

{ #category : #tests }
MooseQueryTest >> testAllToAnyScope [
	self assertCollection: (class2 allToAnyScope: {FAMIXMethod . FAMIXAttribute}) hasSameElements: {method2 . method3 . methodExt . var1 . var2}.
	self assertCollection: (class2 allToAnyScope: {FAMIXMethod . FAMIXLocalVariable}) hasSameElements: {method2 . method3 . methodExt . localVariable}.
	self assertCollection: (class2 allToAnyScope: {FAMIXMethod . FAMIXStructuralEntity}) hasSameElements: {method2 . method3 . methodExt . var1 . var2 . localVariable}.
	self assertCollection: (class2 allToAnyScope: {FAMIXClass . FAMIXMethod}) hasSameElements: {class2 . method2 . method3 . methodExt}.
	self assertCollection: (method1 allToAnyScope: {FAMIXClass . FAMIXPackage}) hasSameElements: {}
]

{ #category : #tests }
MooseQueryTest >> testAllToScope [
	| class3 |
	self assertCollection: (class1 allToScope: FamixTMethod) hasSameElements: {method1}.
	self assertCollection: (class2 allToScope: FamixTAttribute) hasSameElements: {var1 . var2}.
	self assertCollection: (class2 allToScope: FAMIXStructuralEntity) hasSameElements: {var1 . var2 . localVariable}.
	self assertCollection: (package1 allToScope: FamixTClass) hasSameElements: {class1}.
	class3 := FAMIXClass new
		name: 'class3';
		container: class1;
		mooseModel: model.
	self assertCollection: (class1 allToScope: FamixTClass) hasSameElements: {class1 . class3}.
	self assertCollection: (package1 allToScope: FamixTClass) hasSameElements: {class1 . class3}
]

{ #category : #tests }
MooseQueryTest >> testAllWithAnyScope [
	self assertCollection: (class2 allWithAnyScope: {FamixTMethod . FamixTAttribute}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt}.
	self assertCollection: (class2 allWithAnyScope: {FamixTClass . FamixTPackage}) hasSameElements: {class2. package2}.
	self assertCollection: (class2 allWithAnyScope: {FamixTMethod . FamixTAttribute . FamixTPackage}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt . package2}.
	self assertCollection: (class2 allWithAnyScope: {FamixTMethod . FAMIXStructuralEntity . FamixTPackage}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt . package2 . localVariable}
]

{ #category : #tests }
MooseQueryTest >> testAllWithScope [
	| package3 class3 |
	self assertCollection: (class1 allWithScope: FamixTMethod) hasSameElements: {method1}.
	self assertCollection: (class1 allWithScope: FamixTClass) hasSameElements: {class1}.
	self assertCollection: (class1 allWithScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 allWithScope: FamixTPackage) hasSameElements: {package1}.
	self
		assertCollection: (class1 allWithScope: FamixTScopingEntity)
		hasSameElements:
			{package1.
			namespace}.
	package3 := FAMIXPackage new
		name: 'package3';
		mooseModel: model.
	package1 parentPackage: package3.
	class3 := FAMIXClass new
		name: 'class3';
		container: class1;
		mooseModel: model.
	self assertCollection: (class1 allWithScope: FamixTMethod) hasSameElements: {method1}.
	self
		assertCollection: (class1 allWithScope: FamixTClass)
		hasSameElements:
			{class1.
			class3}.
	self
		assertCollection: (class1 allWithScope: FamixTType)
		hasSameElements:
			{class1.
			class3}.
	self
		assertCollection: (class1 allWithScope: FamixTPackage)
		hasSameElements:
			{package1.
			package3}.
	self
		assertCollection: (class1 allWithScope: FamixTScopingEntity)
		hasSameElements:
			{package1.
			package3.
			namespace}
]

{ #category : #tests }
MooseQueryTest >> testAtAnyScope [
	self assertCollection: (class1 atAnyScope: {FAMIXClass}) hasSameElements: {class1}.
	self assertCollection: (class1 atAnyScope: {FAMIXPackage}) hasSameElements: {package1}.
	self assertCollection: (class1 atAnyScope: {FAMIXClass . FAMIXPackage}) hasSameElements: {class1}.
	self assertCollection: (class1 atAnyScope: {FAMIXMethod}) hasSameElements: {}.
	self assertCollection: (class1 atAnyScope: {FamixTClass}) hasSameElements: {class1}.
	self assertCollection: (class1 atAnyScope: {FamixTPackage}) hasSameElements: {package1}.
	self assertCollection: (class1 atAnyScope: {FamixTClass . FamixTPackage}) hasSameElements: {class1}.
	self assertCollection: (class1 atAnyScope: {FamixTMethod}) hasSameElements: {}.
	self assertCollection: (methodExt atAnyScope: {FAMIXPackage}) hasSameElements: {package1. package2}.
]

{ #category : #tests }
MooseQueryTest >> testAtScope [
	self assertCollection: (class1 atScope: FAMIXClass) hasSameElements: {class1}.
	self assertCollection: (class1 atScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 atScope: FamixTPackage) hasSameElements: {package1}.
	self
		assertCollection: (class1 atScope: FamixTScopingEntity)
		hasSameElements:
			{namespace.
			package1}
]

{ #category : #tests }
MooseQueryTest >> testBelongsToMethod [
	self assert: class1 class belongsToMethod isNil.
	self assert: method1 class belongsToMethod isNotNil.
]

{ #category : #tests }
MooseQueryTest >> testChildren [
	self assert: package2 children size equals: 1.
	self assert: package2 children anyOne equals: class2.
	self assert: class1 children size equals: 1.
	self assert: class1 children anyOne equals: method1.
]

{ #category : #tests }
MooseQueryTest >> testChildrenSelectors [
	self
		assertCollection: class1 childrenSelectors
		hasSameElements: #(#functions #types #attributes #methods #definedAnnotationTypes #annotationInstances)
]

{ #category : #tests }
MooseQueryTest >> testExplicitDirectionQueryEquivalentToQueryWithDirectionSymbol [
	"queryIncoming: is equivalent to query: #in with:"

	self
		assert: (method1 queryIncoming: FAMIXInvocation)
		equals: (method1 query: #in with: FAMIXInvocation).
	self
		assert: (class2 queryIncoming: FAMIXInvocation)
		equals: (class2 query: #in with: FAMIXInvocation).
	"queryOutgoing: is equivalent to query: #out with:"
	self
		assert: (method1 queryOutgoing: FAMIXInvocation)
		equals: (method1 query: #out with: FAMIXInvocation).
	self
		assert: (class2 queryOutgoing: FAMIXInvocation)
		equals: (class2 query: #out with: FAMIXInvocation)
]

{ #category : #tests }
MooseQueryTest >> testHasIncoming [

	self assert: (method2 hasIncoming).
	self assert: (class2 hasIncoming).
]

{ #category : #tests }
MooseQueryTest >> testHasIncomingInvocation [
	"queryIncoming: is equivalent to query: #in with:"

	self assert: (method2 hasIncoming: FamixTInvocation).
	self assert: (method2 has: #in with: FamixTInvocation).
	self assert: (class2 hasIncoming: FamixTInvocation).
	self assert: (class2 has: #in with: FamixTInvocation).
]

{ #category : #tests }
MooseQueryTest >> testHasLocalIncoming [

	self assert: (method2 hasLocalIncoming).
	self deny: (class1 hasLocalIncoming).
	self deny: (package2 hasLocalIncoming).
]

{ #category : #tests }
MooseQueryTest >> testHasLocalIncomingInvocation [

	self assert: (method2 hasLocalIncoming: FamixTInvocation).
	self deny: (class2 hasLocalIncoming: FamixTInvocation).
	self deny: (package2 hasLocalIncoming: FamixTInvocation).
]

{ #category : #tests }
MooseQueryTest >> testHasLocalOutgoing [
	self assert: method2 hasLocalOutgoing.
	self deny: class2 hasLocalOutgoing.
	self deny: package2 hasLocalOutgoing
]

{ #category : #tests }
MooseQueryTest >> testHasLocalOutgoingInvocation [

	self assert: (method2 hasLocalOutgoing: FamixTInvocation).
	self deny: (class2 hasLocalOutgoing: FamixTInvocation).
	self deny: (package2 hasLocalOutgoing: FamixTInvocation).
]

{ #category : #tests }
MooseQueryTest >> testHasNotIncoming [
	self deny: isolatedMethod hasIncoming.
	self deny: isolatedClass hasIncoming.
	self deny: isolatedPackage hasIncoming
]

{ #category : #tests }
MooseQueryTest >> testHasNotIncomingInvocation [
	"hasIncoming: is equivalent to has: #in with:"

	self deny: (isolatedMethod hasIncoming: FamixTInvocation).
	self deny: (isolatedMethod has: #in with: FamixTInvocation).
	self deny: (isolatedClass hasIncoming: FamixTInvocation).
	self deny: (isolatedClass has: #in with: FamixTInvocation).
	self deny: (isolatedPackage hasIncoming: FamixTInvocation).
	self deny: (isolatedPackage has: #in with: FamixTInvocation)
]

{ #category : #tests }
MooseQueryTest >> testHasNotLocalIncoming [
	self deny: isolatedMethod hasLocalIncoming.
	self deny: isolatedClass hasLocalIncoming.
	self deny: isolatedPackage hasLocalIncoming
]

{ #category : #tests }
MooseQueryTest >> testHasNotLocalOutgoing [
	self deny: isolatedMethod hasLocalOutgoing.
	self deny: isolatedClass hasLocalOutgoing.
	self deny: isolatedPackage hasLocalOutgoing
]

{ #category : #tests }
MooseQueryTest >> testHasNotOutgoing [
	self deny: isolatedMethod hasOutgoing.
	self deny: isolatedClass hasOutgoing.
	self deny: isolatedPackage hasOutgoing
]

{ #category : #tests }
MooseQueryTest >> testHasNotOutgoingInvocation [
	"hasOutgoing: is equivalent to has: #out with:"

	self deny: (isolatedMethod hasOutgoing: FamixTInvocation).
	self deny: (isolatedMethod has: #out with: FamixTInvocation).
	self deny: (isolatedClass hasOutgoing: FamixTInvocation).
	self deny: (isolatedClass has: #out with: FamixTInvocation).
	self deny: (isolatedPackage hasOutgoing: FamixTInvocation).
	self deny: (isolatedPackage has: #out with: FamixTInvocation)
]

{ #category : #tests }
MooseQueryTest >> testHasOutgoing [

	self assert: (method2 hasOutgoing).
	self assert: (class2 hasOutgoing).
]

{ #category : #tests }
MooseQueryTest >> testHasOutgoingInvocation [
	"queryOutgoing: is equivalent to query: #out with:"

	self assert: (method1 hasOutgoing: FamixTInvocation).
	self assert: (method1 has: #out with: FamixTInvocation).
	self assert: (class2 hasOutgoing: FamixTInvocation).
	self assert: (class2 has: #out with: FamixTInvocation)
]

{ #category : #tests }
MooseQueryTest >> testIncomingAssociationTypes [
	self assertCollection: var2 incomingAssociationTypes hasSameElements: {FamixTAccess}.
	self
		assertCollection: class1 incomingAssociationTypes
		hasSameElements:
			{FamixTSuperInheritance.
			FamixTReference.
			FamixTTraitUsage}.
	self assertCollection: method1 incomingAssociationTypes hasSameElements: {FamixTInvocation}
]

{ #category : #tests }
MooseQueryTest >> testIncomingInvocation [
	"queryIncoming: is equivalent to query: #in with:"

	self assert: (method2 queryIncoming: FamixTInvocation) size equals: 3.
	self assert: (method2 query: #in with: FamixTInvocation) size equals: 3.
	self assert: (class2 queryIncoming: FamixTInvocation) size equals: 3.
	self assert: (class2 query: #in with: FamixTInvocation) size equals: 3
]

{ #category : #tests }
MooseQueryTest >> testIncomingInvocationAtScope [
	self
		assert: ((method2 queryIncoming: FamixTInvocation) atScope: FAMIXPackage) size
		equals: 2.
	self
		assert: ((class2 queryIncoming: FamixTInvocation) atScope: FAMIXPackage) size
		equals: 2
]

{ #category : #tests }
MooseQueryTest >> testOutgoingAccessAtScope [
	self assert: ((method1 queryOutgoing: FamixTAccess) atScope: FAMIXPackage) size equals: 1.
	self
		assert: ((method1 queryOutgoing: FamixTAccess) atScope: FAMIXPackage) storage first
		equals: package2
]

{ #category : #tests }
MooseQueryTest >> testOutgoingAccessesWithANamespaceInANamespace [
	"queryOutgoing: is equivalent to query: #out with:"

	| namespaceContainer |
	namespaceContainer := FAMIXNamespace new
		name: 'Test';
		mooseModel: model;
		addChildScope: namespace.
	self assert: (namespaceContainer query: #out with: FamixTAccess) size equals: 1
]

{ #category : #tests }
MooseQueryTest >> testOutgoingAssociationTypes [
	self assertCollection: class1 outgoingAssociationTypes hasSameElements: {FamixTSubInheritance}.
	self
		assertCollection: method1 outgoingAssociationTypes
		hasSameElements:
			{FamixTInvocation.
			FamixTReference.
			FamixTAccess}
]

{ #category : #tests }
MooseQueryTest >> testOutgoingInvocation [
"queryOutgoing: is equivalent to query: #out with:"
	self assert: (method1 queryOutgoing: FamixTInvocation) size equals: 1.
	self assert: (method1 query: #out with: FamixTInvocation) size equals: 1.
	self assert: (class2 queryOutgoing: FamixTInvocation) size equals: 2.
	self assert: (class2 query: #out with: FamixTInvocation) size equals: 2.
]

{ #category : #tests }
MooseQueryTest >> testOutgoingInvocationAtScope [

	self assert: ((method2 queryOutgoing: FamixTInvocation) atScope: FAMIXPackage) size equals: 1.
	self assert: ((class2 queryOutgoing: FamixTInvocation) atScope: FAMIXPackage) size equals: 1.

]

{ #category : #tests }
MooseQueryTest >> testOutgoingInvocationWithin [
	self assert: ((method1 queryOutgoing: FamixTInvocation) within: class2) size equals: 1.

]

{ #category : #tests }
MooseQueryTest >> testParents [
	self assert: class2 parents size equals: 1.
	self assert: class2 parents anyOne equals: package2.
	self assert: method1 parents size equals: 1.
	self assert: method1 parents anyOne equals: class1.
]

{ #category : #tests }
MooseQueryTest >> testQueryWith [
"queryIncoming: is equivalent to query: #in with:"
	self assert: (package1 query: #out with: FamixTInvocation) size equals: 1.
]

{ #category : #tests }
MooseQueryTest >> testToAnyScope [
	self assertCollection: (class2 toAnyScope: {FAMIXMethod . FAMIXAttribute}) hasSameElements: {method2 . method3 . methodExt . var1 . var2}.
	self assertCollection: (class2 toAnyScope: {FAMIXMethod . FAMIXStructuralEntity}) hasSameElements: {method2 . method3 . methodExt . var1 . var2}.
	self assertCollection: (class2 toAnyScope: {FAMIXClass . FAMIXMethod}) hasSameElements: {class2}.
	self assertCollection: (method1 toAnyScope: {FAMIXClass . FAMIXPackage}) hasSameElements: {}
]

{ #category : #tests }
MooseQueryTest >> testToScope [
	self assertCollection: (class1 toScope: FAMIXMethod) hasSameElements: {method1}.
	self assertCollection: (class2 toScope: FAMIXAttribute) hasSameElements: {var1 . var2}.
	self assertCollection: (class2 toScope: FAMIXStructuralEntity) hasSameElements: {var1 . var2. localVariable}.
	self assertCollection: (package1 toScope: FAMIXMethod) hasSameElements: {method1 . methodExt}
]

{ #category : #tests }
MooseQueryTest >> testWithAllChildren [
	self assert: package2 withAllChildren size equals: 8.
	self assert: class2 withAllChildren size equals: 7.
	self assert: method2 withAllChildren size equals: 2
]

{ #category : #tests }
MooseQueryTest >> testWithAllParents [
	self assert: package2 withAllParents size equals: 1.
	self assert: class2 withAllParents size equals: 2.
	self assert: method2 withAllParents size equals: 3.
	self assert: var2 withAllParents size equals: 3
]

{ #category : #tests }
MooseQueryTest >> testWithAnyScope [
	self assertCollection: (class2 withAnyScope: {FamixTMethod . FamixTAttribute}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt}.
	self assertCollection: (class2 withAnyScope: {FamixTClass . FamixTPackage}) hasSameElements: {class2}.
	self assertCollection: (class2 withAnyScope: {FamixTMethod . FamixTAttribute . FamixTPackage}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt . package2}.
	self assertCollection: (class2 withAnyScope: {FamixTMethod . FAMIXStructuralEntity . FamixTPackage}) hasSameElements: {method2 . method3 . var1 . var2 . methodExt . package2}
]

{ #category : #tests }
MooseQueryTest >> testWithScope [
	self assertCollection: (class1 withScope: FamixTMethod) hasSameElements: {method1}.
	self
		assertCollection: (class2 toScope: FamixTAttribute)
		hasSameElements:
			{var1.
			var2}.
	self
		assertCollection: (package1 toScope: FamixTMethod)
		hasSameElements:
			{method1.
			methodExt}.
	self assertCollection: (class1 withScope: FamixTClass) hasSameElements: {class1}.
	self assertCollection: (class1 withScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 withScope: FamixTPackage) hasSameElements: {package1}.
	self
		assertCollection: (class1 withScope: FamixTScopingEntity)
		hasSameElements:
			{package1.
			namespace}
]

{ #category : #tests }
MooseQueryTest >> testWithSpecializedAssociation [
	"The goal of this test is to check that MooseQuery is also able to query specialized associations."

	| invoSpecialized result |
	invoSpecialized := MooseQueryMockSpecializedInvocation new
		sender: method1;
		addCandidate: method2;
		receiver: var2;
		mooseModel: model.
	result := method1 query: #out with: MooseQueryMockSpecializedInvocation.
	self assert: result size equals: 1.
	self assert: result anyOne equals: invoSpecialized
]
