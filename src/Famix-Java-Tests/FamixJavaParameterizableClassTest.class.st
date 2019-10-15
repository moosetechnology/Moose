Class {
	#name : #FamixJavaParameterizableClassTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaParameterizableClassTest >> testParameterTypes [
	| model aParameterizableClass |
	model := FamixJavaModel new.
	model
		importFromMSEStream:
			'(
		(Famix-Java-Entities.Namespace (id: 1) (name ''NamespaceA''))
		(Famix-Java-Entities.ParameterizableClass (id: 2) (name ''ParameterizableClassA'') )
		(Famix-Java-Entities.ParameterizableClass (id: 3) (name ''ParameterizableClassB'') )
		(Famix-Java-Entities.ParameterizableClass (id: 4) (name ''ParameterizableClassC'') )
		(Famix-Java-Entities.ParameterType (id: 5) (name ''A'') (typeContainer (ref: 2)))
		(Famix-Java-Entities.ParameterType (id: 6) (name ''B'') (typeContainer (ref: 2)))
		(Famix-Java-Entities.ParameterType (id: 7) (name ''C'') (typeContainer (ref: 3)))
	)' readStream.
	self assert: model entities size equals: 7.
	self assert: model allParameterizableClasses size equals: 3.
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassA.
	self assert: aParameterizableClass parameters size equals: 2.
	self assert: aParameterizableClass parameters first equals: (model allParameterTypes entityNamed: #'ParameterizableClassA::A').
	self assert: aParameterizableClass parameters last equals: (model allParameterTypes entityNamed: #'ParameterizableClassA::B').
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassB.
	self assert: aParameterizableClass parameters size equals: 1.
	self assert: aParameterizableClass parameters first equals: (model allParameterTypes entityNamed: #'ParameterizableClassB::C').
	aParameterizableClass := model allParameterizableClasses entityNamed: #ParameterizableClassC.
	self assert: aParameterizableClass parameters isEmpty
]
