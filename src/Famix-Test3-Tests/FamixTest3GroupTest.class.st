Class {
	#name : #FamixTest3GroupTest,
	#superclass : #FamixTest3SimpleModelTest,
	#category : #'Famix-Test3-Tests'
}

{ #category : #tests }
FamixTest3GroupTest >> testClassGroupSuperclassIsTypeGroup [
	self assert: self classGroup superclass equals: self typeGroup
]

{ #category : #tests }
FamixTest3GroupTest >> testGroupsAreGenerated [
	self assert: (self class environment includesKey: #FamixTest3TypeGroup).
	self assert: (self class environment includesKey: #FamixTest3ClassGroup)
]

{ #category : #tests }
FamixTest3GroupTest >> testMooseGroupAllWith [
	self assert: (model allUsing: FamixTClass) class equals: self classGroup
]
