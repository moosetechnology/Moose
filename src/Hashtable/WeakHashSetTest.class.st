Class {
	#name : #WeakHashSetTest,
	#superclass : #HashSetTest,
	#category : #'Hashtable-Test'
}

{ #category : #running }
WeakHashSetTest >> setUp [
	super setUp.
	set := WeakHashSet new
]

{ #category : #testing }
WeakHashSetTest >> testWeakInstance [
	| createBlock string |
	createBlock := [(String new: 3)
		at: 1 put: $n;
		at: 2 put: $e;
		at: 3 put: $w;
		yourself ].
	string := createBlock value.
	
	set add: string.
	self assert: (set includes: string).
	self assert: (set includes: createBlock value).
	self assert: set size = 1.
	string := nil.
	Smalltalk garbageCollect.
	
	string := createBlock value.
	self deny: (set includes: string).
	self assert: set isEmpty.
]
