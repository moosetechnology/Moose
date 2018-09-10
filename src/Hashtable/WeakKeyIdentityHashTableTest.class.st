Class {
	#name : #WeakKeyIdentityHashTableTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'testsize'
	],
	#category : #'Hashtable-Test'
}

{ #category : #running }
WeakKeyIdentityHashTableTest >> setUp [
	super setUp.
	table := WeakKeyIdentityHashTable new.
	testsize := 100.
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddAll [
	"(self run: #testAddAll)"
	
	|  table2 |
	table at: #a put:1.
	table at: #b put: 2. 
	
	table2 := table species new.
	table2 at: #a put: 3.
	table2 at: #c put: 4.
	
	table addAll: table2.
	self assert: (table at: #a) = 3.
	self assert: (table at: #b) = 2.
	self assert: (table at: #c) = 4.
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddAndModifyString [
	| key value |
	key := String newFrom: 'testme!'.
	value := 1.
	table at: key put: value.
	
	self assert: (table at: key) = value.
	
	key at: 1 put: $x.
	
	self assert: (table at: key) = value
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddAssoc [
	0 to: testsize do: [ :each |
		self assert: table size = each.
		table add: each -> each asString ].
	0 to: testsize do: [ :each |
		self assert: (table at: each) = each asString ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddCopy [
	| table2 |
	0 to: testsize do: [ :each |
		table add: each -> each asString ].
	table2 := table copy.
	table2 at: testsize + 1 put: true.
	self assert: (table2 includesKey: testsize + 1).
	self deny: (table includesKey: testsize + 1).
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddEqualStrings [
	| key1 key2 value1 value2 |
	key1 := String newFrom: 'testme!'.
	key2 := String newFrom: 'testme!'.
	
	self assert: key1 ~~ key2.
	
	value1 := 1.
	value2 := 2.
	
	table at: key1 put: value1.
	table at: key2 put: value2.
	
	self assert: (table at: key1) = value1.
	self assert: (table at: key2) = value2.
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddEqualStrings2 [
	| firstKeys secondsKeys |
	firstKeys := (1 to: testsize) collect: [ :each | each asString].
	secondsKeys := (1 to: testsize) collect: [ :each | each asString].
	
	firstKeys do: [ :each |
		table at: each put: each asNumber ].
	
	secondsKeys do: [ :each |
		table at: each put: each asNumber negated ].
	
	firstKeys do: [ :each |
		self assert: (table at: each) = each asNumber ].
	
	secondsKeys do: [ :each |
		self assert: (table at: each) = each asNumber negated ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddInteger [
	0 to: testsize do: [ :each |
		self assert: table size = each.
		table at: each put: each asString ].
	0 to: testsize do: [ :each |
		self assert: (table at: each) = each asString ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddString [
	| keys |
	keys := (0 to: testsize) collect: [ :each | each asString ].
	keys do: [ :each |
		self assert: table size = each asNumber.
		table at: each put: each asNumber ].
	keys do: [ :each |
		self assert: (table at: each ) = each asNumber ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testAddSymbol [
	| keys |
	keys := (0 to: testsize) collect: [ :each | each asString asSymbol ].
	keys do: [ :each |
		self assert: table size = each asNumber.
		table at: each put: each asNumber ].
	keys do: [ :each |
		self assert: (table at: each) = each asNumber ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testComma [
	"(self run: #testComma)"
	
	| table1 table2 |
	table at: #a put:1.
	table at: #b put: 2. 
	
	table1 := table species new.
	table1 at: #a put: 3.
	table1 at: #c put: 4.
	
	table2 := table, table1.
	self assert: (table2 at: #a) = 3.
	self assert: (table2 at: #b) = 2.
	self assert: (table2 at: #c) = 4.
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testEqualsDictionary [
	| dictionary |
	dictionary := Dictionary new.
	0 to: testsize do: [ :each |
		dictionary at: each put: each asString.
		table at: each put: each asString ].
	
	self assert: table = dictionary
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testEqualsTransitive [
	| table2 |
	table2 := table species new.
	0 to: testsize do: [ :each |
		table2 at: each put: each asString.
		table at: each put: each asString ].
	
	self assert: table = table2.
	self assert: table2 = table
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testKeys [
	| keys |
	keys := (1 to: 100) asOrderedCollection collect: [ :each | each asString ].
	keys do: [ :each |
		table at: each put: each , '0' ].
	self assert: ((table keys collect: [ :each | each asNumber ]) asArray sort = (1 to: 100) asArray)

]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testKeysAndValuesDo [
	| keys |
	keys := (1 to: 100) asOrderedCollection collect: [ :each | each asString ].
	keys do: [ :each |
		table at: each put: each ].
	table keysAndValuesDo: [ :key :value |
		self assert: key = value.
		self assert: (keys includes: key).
		keys remove: key ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testKeysDo [
	| keys |
	keys := (1 to: 100) asOrderedCollection collect: [ :each | each asString ].
	keys do: [ :each |
		table at: each put: each ].
	table keysDo: [ :each |
		self assert: (keys includes: each).
		keys remove: each ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testRemoveString [
	| key keys |
	keys := (0 to: testsize) collect: [ :each | each asString ].
	keys do: [ :each |
		self assert: table size = each asNumber.
		table at: each put: each asNumber ].
	
	0 to: testsize by: 2 do: [ :each |
		key := keys at: each + 1.
		self assert: (table includesKey: key).
		table removeKey: key.
		self deny: (table includesKey: key) ].
	
	1 to: testsize by: 2 do: [ :each |
		key := keys at: each + 1.
		self assert: (table at: key) = each asNumber ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testRemoveSymbol [
	| key keys |
	keys := (0 to: testsize) collect: [ :each | each asString asSymbol ].	
	keys do: [ :each |
		self assert: table size = each asNumber.
		table at: each put: each asNumber ].
	
	0 to: testsize by: 2 do: [ :each |
		key := (keys at: each + 1).
		self assert: (table includesKey: key).
		table removeKey: key.
		self deny: (table includesKey: key) ].
	
	1 to: testsize by: 2 do: [ :each |
		key := (keys at: each + 1).
		self assert: (table at: key) = each asNumber ].
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testValues [
	| keys |
	keys := (1 to: 100) asOrderedCollection collect: [ :each | each asString ].
	keys do: [ :each |
		table at: each put: each , '0' ].
	self assert: ((table values collect: [ :each | each asNumber ]) asArray sort = (10 to: 1000 by: 10) asArray)
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testValuesDo [
	| keys |
	keys := (1 to: 100) asOrderedCollection.
	keys do: [ :each |
		table at: each put: each ].
	table valuesDo: [ :each |
		self assert: (keys includes: each).
		keys remove: each ifAbsent: [ self fail ] ].
	self assert: keys isEmpty
]

{ #category : #testing }
WeakKeyIdentityHashTableTest >> testWeakInstance [
	| createBlock string1 string2 |
	createBlock := [(String new: 3)
		at: 1 put: $n;
		at: 2 put: $e;
		at: 3 put: $w;
		yourself ].
	string1 := createBlock value.
	string2 := createBlock value.
	
	table at: string1 put: 'string1'.
	table at: string2 put: 'string2'.
	self assert: (table at: string1) = 'string1'.
	self assert: (table at: string2) = 'string2'.
	self deny: (table includesKey: createBlock value).
	self assert: table size = 2.
	string1 := nil.
	string2 := nil.
	Smalltalk garbageCollect.
	
	string1 := createBlock value.
	self deny: (table includesKey: string1).
	table keysAndValuesDo: [ :key :value | ]. "that should acutally not be needed"
	self assert: table isEmpty.
]
