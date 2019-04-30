Class {
	#name : #ConcreteMergerTest,
	#superclass : #TypeMergerTestsRoot,
	#category : #'RoelTyper-Tests-Tests'
}

{ #category : #auxiliary }
ConcreteMergerTest >> mergeClass [
	^ConcreteMerger
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test1 [
	"assignment type Array is subtype of interface type Collection
		-> folding keeps Array and loses Collection"

	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size equals: 1.
	self assert: mergeResult first equals: Array
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test10 [
	"Dictionary and Array are in unrelated hierarchies -> keep both."

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Collection).
	self assert: mergeResult size equals: 3.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test11 [
	"Dictionary and Array are in unrelated hierarchies -> keep both."

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Collection
				with: Array).
	self assert: mergeResult size equals: 3.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test12 [
	"Dictionary and Array are in unrelated hierarchies -> keep both. Collection bites the dust because it is superclass."

	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes:
			(OrderedCollection
				with: Dictionary
				with: Array).
	self assert: mergeResult size equals: 2.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test13 [
	"Dictionary and Array are in unrelated hierarchies -> keep both. Collection bites the dust because it is superclass."

	self
		mergeInterfaceTypes: (OrderedCollection with: Collection)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Dictionary).
	self assert: mergeResult size equals: 2.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test14 [
	self
		mergeInterfaceTypes:
			(OrderedCollection
				with: SequenceableCollection
				with: Bag)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size equals: 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Bag)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test2 [
	"interface type Array is subclass of assignment type Collection
		-> folding keeps Array and loses Collection"

	self
		mergeInterfaceTypes: (OrderedCollection with: Array)
		assignmentTypes: (OrderedCollection with: Collection).
	self assert: mergeResult size equals: 2.
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Collection)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test3 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: OrderedCollection new.
	self assert: mergeResult size equals: 1.
	self assert: mergeResult first equals: Object
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test4 [
	self
		mergeInterfaceTypes: (OrderedCollection with: Object)
		assignmentTypes: OrderedCollection new.
	self assert: mergeResult size equals: 1.
	self assert: mergeResult first equals: Object
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test5 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: (OrderedCollection with: Object).
	self assert: mergeResult size equals: 1.
	self assert: mergeResult first equals: Object
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test6 [
	"Dictionary and Array are in unrelated hierarchies -> keep both"

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size equals: 2.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test7 [
	self
		mergeInterfaceTypes: OrderedCollection new
		assignmentTypes: (OrderedCollection with: Array).
	self assert: mergeResult size equals: 1.
	self assert: (mergeResult includes: Array)
]

{ #category : #'folding tests' }
ConcreteMergerTest >> test8 [
	"Dictionary and Array are in unrelated hierarchies -> keep both"

	self
		mergeInterfaceTypes: (OrderedCollection with: Dictionary)
		assignmentTypes:
			(OrderedCollection
				with: Array
				with: Object).
	self assert: mergeResult size equals: 3.
	self assert: (mergeResult includes: Dictionary).
	self assert: (mergeResult includes: Array).
	self assert: (mergeResult includes: Object)
]
