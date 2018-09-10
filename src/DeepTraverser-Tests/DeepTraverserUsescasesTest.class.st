Class {
	#name : #DeepTraverserUsescasesTest,
	#superclass : #DeepTraverserGraphTest,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #tests }
DeepTraverserUsescasesTest >> testStartCollectionWithNil [
	self assert: ({ 1 -> { nil } } deepCollect: #value) = {  } asOrderedCollection
]

{ #category : #tests }
DeepTraverserUsescasesTest >> testStartWithNil [
	self assert: ({ 1 . nil } withDeepCollect: [ :each | each  ]) = { 1 } asOrderedCollection
]
