Trait {
	#name : #TFamixTWithCompilationUnitTest,
	#instVars : [
		'compilationUnit'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithCompilationUnitTest >> testCompilationUnit [
compilationUnit := MooseEntity new copyWithTalent: FamixTCompilationUnit. 
compilationUnit class initializeSlots: compilationUnit.
model add: compilationUnit.
self entity compilationUnit: compilationUnit. 
self assert: (self entity compilationUnit notNil).
self assert: self entity compilationUnit equals: compilationUnit.
self assert: compilationUnit compilationUnitOwner equals: self entity
]
