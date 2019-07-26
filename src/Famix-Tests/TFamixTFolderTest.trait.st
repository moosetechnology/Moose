Trait {
	#name : #TFamixTFolderTest,
	#instVars : [
		'fileSystemEntity1',
		'fileSystemEntity2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFolderTest >> testChildrenFileSystemEntities [
fileSystemEntity1 := MooseEntity new copyWithTalent: FamixTFileSystemEntity.
fileSystemEntity1 class initializeSlots: fileSystemEntity1.
model add: fileSystemEntity1.
fileSystemEntity2 := MooseEntity new copyWithTalent: FamixTFileSystemEntity.
fileSystemEntity2 class initializeSlots: fileSystemEntity2.
model add: fileSystemEntity2.
self entity addChildFileSystemEntity: fileSystemEntity1.
self entity addChildFileSystemEntity: fileSystemEntity2.
self assert: (self entity childrenFileSystemEntities notEmpty).
self assertCollection: self entity childrenFileSystemEntities hasSameElements: {  fileSystemEntity1. fileSystemEntity2 }.
self assert: fileSystemEntity1 parentFolder equals: self entity
]
