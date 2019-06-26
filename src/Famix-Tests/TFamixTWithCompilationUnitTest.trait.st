Trait {
	#name : #TFamixTWithCompilationUnitTest,
	#instVars : [
		'compilationunit'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithCompilationUnitTest >> testWithCompilationUnit [
compilationunit:= MooseEntity new copyWithTalent: FamixTCompilationUnit.
self entity compilationUnit: compilationunit.
self assert: (self entity compilationUnit notNil).
self assert: self entity compilationUnit equals: compilationunit.
self assert: compilationunit compilationUnitOwner equals: entity
]
