Class {
	#name : #FAMIXCImportingTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #running }
FAMIXCImportingTest >> setUp [
	super setUp.
	self flag: 'setUp commented until C MM defintion'.
	"MooseModel resetMeta.
	model := MooseModel new.
	model
		importFromMSEStream:
			'(		
		(FAMIX.Class (id: 1) (name ''AClass'') (sourceAnchor (ref: 3)) (container (ref: 5)))
		(FAMIX.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)) (sourceAnchor (ref: 4)))
		(FAMIX.FileAnchor (id: 3) (element (ref: 1)) (fileName ''afile''))
		(FAMIX.FileAnchor (id: 4) (element (ref: 2)) (fileName ''afile'') (startLine 3) (endLine 30) )
		(FAMIX.Module (id: 5)
			(compilationUnit (ref: 6))
		)
		(FAMIX.CompilationUnit (id: 6) 
			(name ''foobar.cpp'')
		)
		
		(FAMIX.Include (id: 7)
			(source (ref: 6))
			(target (ref: 8)))

		(FAMIX.Include (id: 10)
			(source (ref: 6))
			(target (ref: 9)))
			
		(FAMIX.Header (id: 8)
			(name ''foobar.hpp'')
			)
			
		(FAMIX.Header (id: 9)
			(name ''foobar2.hpp'')
			)
	)' readStream.

	"
]

{ #category : #tests }
FAMIXCImportingTest >> testBasic [
	self skip: 'Test skipped until C metamodel definition'.
	self assert: model entities size equals: 10
]

{ #category : #tests }
FAMIXCImportingTest >> testClassInContainer [	
	| cls module |
	self skip: 'Test skipped until C metamodel definition'.
	cls := model entityNamed: #'::AClass'.
	module := model entities detect: [ :e | e class == FAMIXModule ].
	self assert: cls belongsTo equals: module.

]

{ #category : #tests }
FAMIXCImportingTest >> testCompilationUnitIncludes [
	| cu |
	self skip: 'Test skipped until C metamodel definition'.
	cu := model entities detect: [ :e | e class == FAMIXCompilationUnit ].
	self assert: cu notNil.
	self assert: cu name equals: 'foobar.cpp'.
	self assert: cu numberOfIncludes equals: 2
]

{ #category : #tests }
FAMIXCImportingTest >> testHeader [	
	| headers module |
	self skip: 'Test skipped until C metamodel definition'.
	headers := model entities select: [ :e | e class == FAMIXHeader ].
	module := model entities detect: [ :e | e class == FAMIXModule ].
	self assert: headers size equals: 2.
	self assert: (headers allSatisfy: [ :h | h incomingIncludeRelations anyOne from == module compilationUnit ])

]

{ #category : #tests }
FAMIXCImportingTest >> testModuleContainsClass [
	| cls module |
	self skip: 'Test skipped until C metamodel definition'.
	cls := model entityNamed: #'::AClass'.
	module := model entities detect: [ :e | e class == FAMIXModule ].
	self assert: module types size equals: 1.
	self assert: module types anyOne equals: cls.
]

{ #category : #tests }
FAMIXCImportingTest >> testModuleHasCompilationUnit [
	| module cu |
	self skip: 'Test skipped until C metamodel definition'.
	module := model entities detect: [ :e | e class == FAMIXModule ].
	cu := module compilationUnit.
	self assert: cu notNil.
	self assert: cu name equals: 'foobar.cpp'
]
