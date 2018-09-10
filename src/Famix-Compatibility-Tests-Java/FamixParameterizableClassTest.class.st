Class {
	#name : #FamixParameterizableClassTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Java'
}

{ #category : #tests }
FamixParameterizableClassTest >> testParameterTypes [
	| model aParameterizableClass |
	MooseModel resetMeta.
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
		(FAMIX.Namespace (id: 1) (name ''NamespaceA''))
		(FAMIX.ParameterizableClass (id: 2) (name ''ParameterizableClassA'') )
		(FAMIX.ParameterizableClass (id: 3) (name ''ParameterizableClassB'') )
		(FAMIX.ParameterizableClass (id: 4) (name ''ParameterizableClassC'') )
		(FAMIX.ParameterType (id: 5) (name ''A'') (container (ref: 2)))
		(FAMIX.ParameterType (id: 6) (name ''B'') (container (ref: 2)))
		(FAMIX.ParameterType (id: 7) (name ''C'') (container (ref: 3)))
	)' readStream.
	self assert: model entities size equals: 7.
	self assert: model allParameterizableClasses size equals: 3.
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassA.
	self assert: aParameterizableClass parameters size equals: 2.
	self
		assert: aParameterizableClass parameters first
		equals: (model allParameterTypes entityNamed: #ParameterizableClassA::A).
	self
		assert: aParameterizableClass parameters last
		equals: (model allParameterTypes entityNamed: #ParameterizableClassA::B).
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassB.
	self assert: aParameterizableClass parameters size equals: 1.
	self
		assert: aParameterizableClass parameters first
		equals: (model allParameterTypes entityNamed: #ParameterizableClassB::C).
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassC.
	self assert: aParameterizableClass parameters isEmpty
]
