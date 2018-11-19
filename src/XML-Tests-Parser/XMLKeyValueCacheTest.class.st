Class {
	#name : #XMLKeyValueCacheTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #accessing }
XMLKeyValueCacheTest >> associations [
	| associations |

	associations := Array new: self maxSize.
	1 to: associations size do: [:i |
		associations
			at: i
			put: ('key', i asString) -> ('value', i asString)].
	^ associations.
]

{ #category : #accessing }
XMLKeyValueCacheTest >> cacheClass [
	^ XMLKeyValueCache
]

{ #category : #accessing }
XMLKeyValueCacheTest >> defaultMaxSize [
	^ 32
]

{ #category : #accessing }
XMLKeyValueCacheTest >> keys [
	^ self associations collect: [:each | each key]
]

{ #category : #enumerating }
XMLKeyValueCacheTest >> keysAndValuesDo: aBlock [
	self associations do: [:each |
		aBlock
			value: each key
			value: each value]
]

{ #category : #accessing }
XMLKeyValueCacheTest >> maxSize [
	^ 20
]

{ #category : #'instance creation' }
XMLKeyValueCacheTest >> newCache [
	^ self cacheClass new
]

{ #category : #'instance creation' }
XMLKeyValueCacheTest >> newCacheWithEntries [
	| cache |

	cache := self cacheClass maxSize: self maxSize.
	self keysAndValuesDo: [:key :value |
		cache
			at: key
			put: value].
	^ cache.
]

{ #category : #asserting }
XMLKeyValueCacheTest >> should: aBlock inAnyOrderEnumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated addLast: each].
	self
		assert: enumerated size = aCollection size;
		assert: enumerated asSet = aCollection asSet.
]

{ #category : #asserting }
XMLKeyValueCacheTest >> should: aBlock inAnyOrderEnumerateKeysAndValues: anAssociationCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:first :second |
		enumerated addLast: first -> second].
	self
		assert: enumerated size = anAssociationCollection size;
		assert: enumerated asSet = anAssociationCollection asSet.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAt [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert: (cache at: key) = value].
	self assert: (cache at: 'absentKey') isNil.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAtIfAbsent [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				at: key
				ifAbsent: [self fail]) = value].
	self assert:
		(cache
			at: 'absentKey'
			ifAbsent: ['absentValue']) = 'absentValue'.

	"the ifAbsent: block can modify the cache too, so make sure
	it is cleared if needed to make room"
	self assert:
		(cache
			at: 'absentKey'
			ifAbsent: [
				cache
					at: 'newKey'
					put: 'newValue']) = 'newValue'.
	self
		assert: cache size = 1;
		assert: (cache at: 'newKey') = 'newValue'.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAtIfAbsentPut [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				at: key
				ifAbsentPut: [self fail]) = value.
		self
			assert: (cache at: key) = value;
			assert: cache size = self maxSize].
	self assert:
		(cache
			at: 'newKey'
			ifAbsentPut: ['newValue']) = 'newValue'.
	self
		assert: (cache at: 'newKey') = 'newValue';
		assert: cache size = 1.

	"the ifAbsentPut: block can modify the cache too, so make sure
	it is cleared if needed to make room"
	cache := self newCacheWithEntries.
	self assert:
		(cache
			at: 'newKey'
			ifAbsentPut: [
				cache
					at: 'newKeyTwo'
					put: 'newValue']) = 'newValue'.
	self
		assert: cache size = 2;
		assert: (cache at: 'newKey') = 'newValue';
		assert: (cache at: 'newKeyTwo') = 'newValue'.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAtIfPresent [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				at: key
				ifPresent: [:each | #present -> each]) = (#present -> value).
		"ensure cull: is used"
		self assert:
			(cache
				at: key
				ifPresent: [#present]) = #present].
	self assert:
		(cache
			at: 'absentKey'
			ifPresent: [self fail]) isNil.

	"the ifPresent: block can modify the cache too, so make sure
	it is cleared if needed to make room"
	self assert:
		(cache
			at: 'absentKey'
			ifAbsent: [
				cache
					at: 'newKey'
					put: 'newValue']) = 'newValue'.
	self
		assert: cache size = 1;
		assert: (cache at: 'newKey') = 'newValue'.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAtIfPresentPut [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				at: key
				ifPresent: [:each | each ~= value]
				put: [self fail]) = value.
		self assert: (cache at: key) = value.

		"ensure cull: is used"
		self assert:
			(cache
				at: key
				ifPresent: [false]
				put: [self fail]) = value.
		self assert: (cache at: key) = value.

		self assert:
			(cache
				at: key
				ifPresent: [:each | each = value]
				put: ['newValue']) = 'newValue'.
		self assert: (cache at: key) = 'newValue'].

	self assert:
		(cache
			at: 'absentKey'
			ifPresent: [self fail]
			put: [self fail]) isNil.
	self deny: (cache includesKey: 'absentKey').

	"the ifPresent: block can modify the cache too, so make sure
	it is cleared if needed to make room"
	self assert:
		(cache
			at: self keys first
			ifPresent: [
				cache
					at: 'newKey'
					put: 'newValue'.
				false]
			put: [self fail]) = 'newValue'.
	self
		assert: cache size = 1;
		assert: (cache at: 'newKey') = 'newValue'.

	"the put: block can modify the cache too, so make sure
	it is cleared if needed to make room"
	cache := self cacheClass maxSize: 1.
	cache
		at: self keys first
		put: self values first.
	self assert:
		(cache
			at: self keys first
			ifPresent: [true]
			put: [
				cache
					at: 'newKey'
					put: 'newValue']) = 'newValue'.
	self
		assert: cache size = 1;
		assert: (cache at: self keys first) = 'newValue'.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testAtPut [
	| cache |

	cache := self cacheClass maxSize: self maxSize.
	self associations withIndexDo: [:each :i | | key value |
		key := each key.
		value := each value.
		self assert:
			(cache
				at: key
				put: value) = value.
		self
			assert: (cache at: key) = value;
			assert: cache size = i].
	self assert:
		(cache
			at: 'newKey'
			put: 'newValue') = 'newValue'.
	self
		assert: (cache at: 'newKey') = 'newValue';
		assert: cache size = 1.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testCapacity [
	self
		assert: self newCache capacity = self defaultMaxSize;
		assert: self newCacheWithEntries capacity = self maxSize
]

{ #category : #tests }
XMLKeyValueCacheTest >> testClear [
	| cache |

	cache := self newCacheWithEntries.
	self deny: cache isEmpty.

	cache clear.
	self assert: cache isEmpty.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testCopy [
	| cache copy |

	cache := self newCacheWithEntries.
	copy := cache copy.
	self
		deny: cache == copy;
		assert: cache collection = copy collection;
		deny: cache collection == copy collection;
		deny: cache mutex == copy mutex.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testIncludesKey [
	| cache |

	cache := self newCacheWithEntries.
	self keys do: [:key |
		self assert: (cache includesKey: key)].
	self deny: (cache includesKey: 'absentKey').
]

{ #category : #tests }
XMLKeyValueCacheTest >> testIsEmpty [
	self
		assert: self newCache isEmpty;
		deny: self newCacheWithEntries isEmpty
]

{ #category : #tests }
XMLKeyValueCacheTest >> testKeys [
	self
		assert: self newCache keys isEmpty;
		assert: self newCacheWithEntries keys asSet = self keys asSet
]

{ #category : #tests }
XMLKeyValueCacheTest >> testKeysAndValuesDo [
	self
		should: [:block | self newCache keysAndValuesDo: block]
		inAnyOrderEnumerateKeysAndValues: #().

	self
		should: [:block | self newCacheWithEntries keysAndValuesDo: block]
		inAnyOrderEnumerateKeysAndValues: self associations.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testKeysDo [
	self
		should: [:block | self newCache keysDo: block]
		inAnyOrderEnumerate: #().

	self
		should: [:block | self newCacheWithEntries keysDo: block]
		inAnyOrderEnumerate: self keys.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testMaxSize [
	| cache |

	cache := self newCache.
	self
		assert: cache size = 0;
		assert: cache maxSize = self defaultMaxSize.

	cache := self newCacheWithEntries.
	self
		assert: cache size = self maxSize;
		assert: cache maxSize = self maxSize.

	self
		assert: (cache maxSize: self maxSize + 1) == cache;
		assert: cache maxSize = (self maxSize + 1);
		assert: cache size = self maxSize.

	self
		assert: (cache maxSize: 0) == cache;
		assert: cache maxSize = 0;
		assert: cache size = 0.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testNotEmpty [
	self
		deny: self newCache notEmpty;
		assert: self newCacheWithEntries notEmpty
]

{ #category : #tests }
XMLKeyValueCacheTest >> testRemoveAll [
	| cache |

	cache := self newCacheWithEntries.
	self deny: cache isEmpty.

	cache removeAll.
	self assert: cache isEmpty.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testRemoveKey [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self
			assert: (cache removeKey: key) = value;
			deny: (cache includesKey: key).

		"does not raise errors to support concurrent removal"
		self assert: (cache removeKey: key) isNil].
	self assert: cache isEmpty.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testRemoveKeyIfAbsent [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				removeKey: key
				ifAbsent: [self fail]) = value.
		self deny: (cache includesKey: key).
		self assert:
			(cache
				removeKey: key
				ifAbsent: ['absentValue']) = 'absentValue'].
	self assert: cache isEmpty.

	cache := self newCacheWithEntries.
	self assert:
		(cache
			removeKey: 'absentKey'
			ifAbsent: [
				cache
					at: 'newKey'
					put: 'newValue']) = 'newValue'.
	self
		assert: cache size = 1;
		assert: (cache at: 'newKey') = 'newValue'.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testRemoveKeyIfPresent [
	| cache |

	cache := self newCacheWithEntries.
	self keysAndValuesDo: [:key :value |
		self assert:
			(cache
				removeKey: key
				ifPresent: [:each | each ~= value]) = value.
		self assert: (cache includesKey: key).

		"ensure cull: is used"
		self assert:
			(cache
				removeKey: key
				ifPresent: [false]) = value.
		self assert: (cache includesKey: key).

		self assert:
			(cache
				removeKey: key
				ifPresent: [:each | each = value]) = value.
		self deny: (cache includesKey: key).

		self assert:
			(cache
				removeKey: key
				ifPresent: [self fail]) isNil.
		self deny: (cache includesKey: key)].
	self assert: cache isEmpty.
]

{ #category : #tests }
XMLKeyValueCacheTest >> testSize [
	self
		assert: self newCache size = 0;
		assert: self newCacheWithEntries size = self maxSize
]

{ #category : #tests }
XMLKeyValueCacheTest >> testValues [
	self
		assert: self newCache values isEmpty;
		assert: self newCacheWithEntries values asSet = self values asSet
]

{ #category : #tests }
XMLKeyValueCacheTest >> testValuesDo [
	self
		should: [:block | self newCache valuesDo: block]
		inAnyOrderEnumerate: #().

	self
		should: [:block | self newCacheWithEntries valuesDo: block]
		inAnyOrderEnumerate: self values.
]

{ #category : #accessing }
XMLKeyValueCacheTest >> values [
	^ self associations collect: [:each | each value]
]
