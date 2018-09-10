Class {
	#name : #HashSetTest,
	#superclass : #TestCase,
	#instVars : [
		'set'
	],
	#category : #'Hashtable-Test'
}

{ #category : #'as yet unclassified' }
HashSetTest class >> testSet [
	"self testSet"
	| set1 set2 |
	set1 := Set new
		add: 1;
		yourself.
	set2 := set1 copy.
	set2 add: 2.
	^set1 includes: 2
]

{ #category : #running }
HashSetTest >> setUp [
	super setUp.
	set := HashSet new
]

{ #category : #testing }
HashSetTest >> testAdd [
	| set2 |
	0 to: 10 do: [ :each |
		set add: each ].
	set2 := set species new.
	11 to: 20 do: [ :each |
		set2 add: each ].
	set2 addAll: set.
	0 to: 20 do: [ :each |
		self assert: (set2 includes: each) ].
]

{ #category : #testing }
HashSetTest >> testAddNil [
	self should: [ set add: nil ] raise: Error
]

{ #category : #testing }
HashSetTest >> testCopy [
	| newSet |
	0 to: 10 do: [ :each |
		set add: each ].
	newSet := set copy.
	newSet add: 11.
	self assert: (newSet includes: 11).
	self deny: (set includes: 11).
	self assert: (newSet = (set copyWith: 11))
]

{ #category : #testing }
HashSetTest >> testDo [
	0 to: 10 do: [ :each |
		set add: each ].
	set do: [ :each |
		self assert: ((0 to: 10) includes: each)].
]

{ #category : #testing }
HashSetTest >> testEqualsSet [
	| set2 |
	set2 := Set new.
	0 to: 10 do: [ :each |
		set2 add: each.
		set add: each ].	
		
	self assert: set = set2
]

{ #category : #testing }
HashSetTest >> testEqualsSetTransitive [
	| set2 |
	set2 := set species new.
	0 to: 10 do: [ :each |
		set2 add: each.
		set add: each ].	
	
	self assert: set = set2.
	self assert: set2 = set
]

{ #category : #testing }
HashSetTest >> testRemove [
	0 to: 10 do: [ :each |
		set add: each ].
	0 to: 10 do: [ :each |
		set remove: each ].
	0 to: 10 do: [ :each |
		self deny: (set includes: each) ]
]

{ #category : #testing }
HashSetTest >> testSameHash [

	| string1 string2 |
	string1 := String newFrom: 'testme!'.
	string2 := String newFrom: 'testme!'.
	
	self assert: set isEmpty.
	self deny: (set includes: string1).
	self deny: (set includes: string2).
	
	set add: string1.
	self assert: set size = 1.
	self assert: (set includes: string1).
	self assert: (set includes: string2).
	
	set add: string1.
	self assert: set size = 1.
	self assert: (set includes: string1).
	self assert: (set includes: string2).
	
	set add: string2.
	self assert: set size = 1.
	self assert: (set includes: string1).
	self assert: (set includes: string2).
	
	set remove: string1.
	self assert: set isEmpty.
	self deny: (set includes: string1).
	self deny: (set includes: string2).
	
	self should: [ set remove: string2 ] raise: Error.
]

{ #category : #testing }
HashSetTest >> testSelect [
	| result |
	0 to: 10 do: [ :each |
		set add: each ].
	
	result := set select: [ :each | each even ].
	self assert: result size = 6.
	self assert: result = (0 to: 10 by: 2) asSet.
]

{ #category : #testing }
HashSetTest >> testSize [
	self assert: set size = 0.
	1 to: 10 do: [ :each |		
		set add: each.
		set size = each ].
	1 to: 10 do: [ :each |		
		set add: each.
		set size = 10 ].
	
	10 to: 1 by: -1 do: [ :each |		
		set size = each.
		set remove: each ].
	
	self assert: set size = 0.
]
