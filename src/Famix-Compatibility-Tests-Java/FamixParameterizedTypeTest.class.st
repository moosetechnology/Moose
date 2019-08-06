Class {
	#name : #FamixParameterizedTypeTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Compatibility-Tests-Java'
}

{ #category : #running }
FamixParameterizedTypeTest >> setUp [

	super setUp.
	model := MooseModel new.
	
	model importFromMSEStream: '(
		(FAMIX.Namespace (id: 1) (name ''NamespaceA''))
		(FAMIX.Class (id: 2) (name ''ClassA''))
		
		(FAMIX.ParameterizableClass (id: 3) (name ''ParameterizableClassA''))
		(FAMIX.ParameterType (id: 5) (name ''A'') (container (ref: 3)))
		(FAMIX.ParameterType (id: 6) (name ''B'') (container (ref: 3)))
		(FAMIX.ParameterType (id: 7) (name ''C'') (container (ref: 3)))
		
		(FAMIX.Type (id: 4) (name ''TypeB''))
		(FAMIX.Type (id: 5) (name ''TypeC''))		
		(FAMIX.ParameterizedType (id: 6) (parameterizableClass (ref: 3)) (arguments (ref: 4)))
		(FAMIX.ParameterizedType (id: 7) (parameterizableClass (ref: 3)) (arguments (ref: 4) (ref: 5)))
		
		(FAMIX.Attribute (id: 8) (name ''attributeA1'') (parentType (ref: 2)) (declaredType (ref: 6)))
		(FAMIX.Attribute (id: 9) (name ''attributeA2'') (parentType (ref: 2)) (declaredType (ref: 7)))

		(FAMIX.Method (id: 10) (name ''methodA1'') (parentType (ref: 2)) (declaredType (ref: 6)))
		(FAMIX.Method (id: 11) (name ''methodA2'') (parentType (ref: 2)) (declaredType (ref: 7)))
		
		(FAMIX.Parameter (id: 12) (name ''parameterMtdA1'') (parentBehaviouralEntity (ref: 10)) (declaredType (ref: 6)))
		(FAMIX.Parameter (id: 13) (name ''parameterMtdA2'') (parentBehaviouralEntity (ref: 11)) (declaredType (ref: 7)))
		
		(FAMIX.LocalVariable (id: 14) (name ''localVariableMtdA1'') (parentBehaviouralEntity (ref: 10)) (declaredType (ref: 6)))
		(FAMIX.LocalVariable (id: 15) (name ''localVariableMtdA2'') (parentBehaviouralEntity (ref: 11)) (declaredType (ref: 7)))
	)' readStream
]

{ #category : #tests }
FamixParameterizedTypeTest >> testArgumentTypes [
	| fmxEntity fmxMethod declaredType typeB typeC parameterizedTypeA parameterizedTypeB parameterizableClassA |
	parameterizedTypeB := model allParameterizedTypes entityNamed: #'ParameterizableClassA<TypeB,TypeC>'.
	parameterizedTypeA := model allParameterizedTypes entityNamed: #'ParameterizableClassA<TypeB>'.
	parameterizableClassA := (model entities select: [ :each | each name = 'ParameterizableClassA' ]) at: 1.
	typeB := (model entities select: [ :each | each name = 'TypeB' ]) at: 1.
	typeC := (model entities select: [ :each | each name = 'TypeC' ]) at: 1.
	fmxEntity := model allAttributes entityNamed: #'ClassA.attributeA1'.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeA.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 1.
	self assert: (declaredType arguments at: 1) equals: typeB.
	fmxEntity := model allAttributes entityNamed: #'ClassA.attributeA2'.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeB.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 2.
	self assert: (declaredType arguments at: 1) equals: typeB.
	self assert: (declaredType arguments at: 2) equals: typeC.
	fmxMethod := (model allMethods select: [ :each | each name = 'methodA1' ]) at: 1.
	declaredType := fmxMethod declaredType.
	self assert: declaredType equals: parameterizedTypeA.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 1.
	self assert: (declaredType arguments at: 1) equals: typeB.
	fmxEntity := (fmxMethod parameters select: [ :each | each name = 'parameterMtdA1' ]) at: 1.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeA.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 1.
	self assert: (declaredType arguments at: 1) equals: typeB.
	fmxEntity := (fmxMethod localVariables select: [ :each | each name = 'localVariableMtdA1' ]) at: 1.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeA.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 1.
	self assert: (declaredType arguments at: 1) equals: typeB.
	fmxMethod := (model allMethods select: [ :each | each name = 'methodA2' ]) at: 1.
	declaredType := fmxMethod declaredType.
	self assert: declaredType equals: parameterizedTypeB.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 2.
	self assert: (declaredType arguments at: 1) equals: typeB.
	self assert: (declaredType arguments at: 2) equals: typeC.
	fmxEntity := (fmxMethod parameters select: [ :each | each name = 'parameterMtdA2' ]) at: 1.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeB.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 2.
	self assert: (declaredType arguments at: 1) equals: typeB.
	self assert: (declaredType arguments at: 2) equals: typeC.
	fmxEntity := (fmxMethod localVariables select: [ :each | each name = 'localVariableMtdA2' ]) at: 1.
	declaredType := fmxEntity declaredType.
	self assert: declaredType equals: parameterizedTypeB.
	self assert: declaredType parameterizableClass equals: parameterizableClassA.
	self assert: declaredType arguments size equals: 2.
	self assert: (declaredType arguments at: 1) equals: typeB.
	self assert: (declaredType arguments at: 2) equals: typeC
]

{ #category : #tests }
FamixParameterizedTypeTest >> testArguments [
	| parameterizableType |
	parameterizableType := model allParameterizedTypes entityNamed: #'ParameterizableClassA<TypeB,TypeC>'.
	self assert: parameterizableType arguments notEmpty.
	self assert: parameterizableType arguments size equals: 2
]

{ #category : #tests }
FamixParameterizedTypeTest >> testArgumentsConstruction [
	| parameterizableType argument1 argument2 |
	parameterizableType := FAMIXParameterizedType new.
	argument1 := FAMIXClass new.
	argument2 := FAMIXClass new.
	parameterizableType arguments: {argument1}.
	parameterizableType arguments add: argument2.
	self assert: parameterizableType arguments size equals: 2.
	self assert: argument1 argumentsInParameterizedTypes size equals: 1.
	self assert: argument1 argumentsInParameterizedTypes first equals: parameterizableType.
	self assert: argument2 argumentsInParameterizedTypes size equals: 1.
	self assert: argument2 argumentsInParameterizedTypes first equals: parameterizableType
]

{ #category : #tests }
FamixParameterizedTypeTest >> testModelSize [
	self assert: model entities size equals: 18.
	self assert: model allParameterizedTypes size equals: 2
]

{ #category : #tests }
FamixParameterizedTypeTest >> testMooseName [

	| parameterizableType |
	parameterizableType := model allParameterizedTypes entityNamed: #'ParameterizableClassA<TypeB,TypeC>'.
	self assert: parameterizableType notNil
]

{ #category : #tests }
FamixParameterizedTypeTest >> testParameterizableClass [
	self assert: model allParameterizableClasses anyOne parameterizedTypes size = 2
]
