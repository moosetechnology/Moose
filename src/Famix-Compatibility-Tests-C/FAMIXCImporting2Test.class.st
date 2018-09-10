Class {
	#name : #FAMIXCImporting2Test,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Compatibility-Tests-C'
}

{ #category : #running }
FAMIXCImporting2Test >> setUp [
	super setUp.

	MooseModel resetMeta.
	model := MooseModel new.
	model
		importFromMSEStream:
			'(
	(FAMIX.Package (id: 0)
		(name ''Siconos''))
	(FAMIX.CompilationUnit (id: 1)
		(filepath ''example.cpp'')
		(name ''example.cpp'')
		(language ''C++''))
	(FAMIX.Header (id: 2)
		(filepath ''example.hpp'')
		(name ''example.hpp'')
		(language ''C++''))
	(FAMIX.Include (id: 3)
		(source (ref: 1))
		(target (ref: 2)))
	(FAMIX.FileAnchor (id: 5)
		(element (ref: 4))
		(unit (ref: 2))
		(fileName ''example.hpp''))
	(FAMIX.Method (id: 6)
		(name ''TestFunction'')
		(signature ''void TestFunction()'')
		(parentType (ref: 4)))
	(FAMIX.Class (id: 4)
		(name ''MyClass'')
		(container (ref: 0))
		(sourceAnchor (ref: 5)))
)
' readStream.

	
]

{ #category : #tests }
FAMIXCImporting2Test >> testBasic [

	self assert: model entities size equals: 7

]

{ #category : #tests }
FAMIXCImporting2Test >> testClassInContainer [	
	| cls module |
	cls := model entityNamed: #'Siconos::MyClass'.
	module := model entities detect: [ :e | e class == FAMIXPackage ].
	self assert: cls belongsTo equals: module.

]

{ #category : #tests }
FAMIXCImporting2Test >> testCompilationUnitIncludes [
	| cu header |
	cu := model entities detect: [ :e | e class == FAMIXCompilationUnit ].
	header := model entities detect: [ :e | e class == FAMIXHeader ].
	self assert: cu notNil.
	self assert: cu name equals: 'example.cpp'.
	self assert: cu numberOfIncludes equals: 1.
	self assert: cu outgoingIncludeRelations size equals: 1.
	self assert: cu outgoingIncludeRelations anyOne notNil.
	self assert: cu outgoingIncludeRelations anyOne class equals: FAMIXInclude.
	self assert: cu outgoingIncludeRelations anyOne from equals: cu.
	self assert: cu outgoingIncludeRelations anyOne to equals: header.
]
