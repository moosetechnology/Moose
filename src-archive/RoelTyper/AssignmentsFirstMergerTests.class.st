Class {
	#name : #AssignmentsFirstMergerTests,
	#superclass : #TypeMergerTestsRoot,
	#category : #'RoelTyper-Tests'
}

{ #category : #auxiliary }
AssignmentsFirstMergerTests >> mergeClass [
	^AssignmentsFirstMerger
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test1 [
	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size = 1.
	self assert: mergeResult first = Array
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test10 [
	"Dictionary and Array are in unrelated hierarchies -> keep both."

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Collection).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test11 [
	"Dictionary and Array are in unrelated hierarchies -> keep both."

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Collection
				with: Array).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test12 [
	"Dictionary and Array are in unrelated hierarchies -> keep both. Collection bites the dust because it is superclass."

	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes:
			(OrderedCollection
				with: Dictionary
				with: Array).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test13 [
	"Dictionary and Array are in unrelated hierarchies -> keep both. Collection bites the dust because it is superclass."

	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Dictionary).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Dictionary)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test14 [
	self
		mergeInterfaceTypes:
			(OrderedCollection
				with: SequenceableCollection
				with: Bag)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size = 1.
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test2 [
	self
		mergeInterfaceTypes: (OrderedCollection with: Array)
		assignmentTypes: (OrderedCollection with: Collection).
	self assert: mergeResult size = 1.
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test3 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: OrderedCollection new.
	self assert: mergeResult size = 1.
	self assert: mergeResult first = Object
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test4 [
	self
		mergeInterfaceTypes: (OrderedCollection with: Object)
		assignmentTypes: OrderedCollection new.
	self assert: mergeResult size = 1.
	self assert: mergeResult first = Object
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test5 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: (OrderedCollection with: Object).
	self assert: mergeResult size = 1.
	self assert: mergeResult first = Object
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test6 [
	"Dictionary and Array are in unrelated hierarchies -> keep both"

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test7 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size = 1.
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
AssignmentsFirstMergerTests >> test8 [
	"Dictionary and Array are in unrelated hierarchies -> keep both"

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Object).
	self assert: mergeResult size = 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Object)
]
