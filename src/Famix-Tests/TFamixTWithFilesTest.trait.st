Trait {
	#name : #TFamixTWithFilesTest,
	#instVars : [
		'file1',
		'file2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithFilesTest >> testContainerFiles [
file1 := MooseEntity new copyWithTalent: FamixTFile.
file1 class initializeSlots: file1.
model add: file1.
file2 := MooseEntity new copyWithTalent: FamixTFile.
file2 class initializeSlots: file2.
model add: file2.
self entity addContainerFile: file1.
self entity addContainerFile: file2.
self assert: (self entity containerFiles notEmpty).
self assertCollection: self entity containerFiles hasSameElements: {  file1. file2 }.
self assertCollection: file1 entities hasSameElements: {self entity}
]
