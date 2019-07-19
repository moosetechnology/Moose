Trait {
	#name : #TFamixTFileSystemEntityTest,
	#instVars : [
		'parentFolder'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFileSystemEntityTest >> testParentFolder [
parentFolder := MooseEntity new copyWithTalent: FamixTFolder. 
parentFolder class initializeSlots: parentFolder.
model add: parentFolder.
self entity parentFolder: parentFolder. 
self assert: (self entity parentFolder notNil).
self assert: self entity parentFolder equals: parentFolder.
self assertCollection: parentFolder childrenFileSystemEntities hasSameElements: {self entity}
]
