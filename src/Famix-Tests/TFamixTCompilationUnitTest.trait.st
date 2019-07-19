Trait {
	#name : #TFamixTCompilationUnitTest,
	#instVars : [
		'compilationUnitOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTCompilationUnitTest >> testCompilationUnitOwner [
compilationUnitOwner := MooseEntity new copyWithTalent: FamixTWithCompilationUnit. 
compilationUnitOwner class initializeSlots: compilationUnitOwner.
model add: compilationUnitOwner.
self entity compilationUnitOwner: compilationUnitOwner. 
self assert: (self entity compilationUnitOwner notNil).
self assert: self entity compilationUnitOwner equals: compilationUnitOwner.
self assert: compilationUnitOwner compilationUnit equals: self entity
]
