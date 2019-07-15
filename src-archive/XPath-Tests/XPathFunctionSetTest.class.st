Class {
	#name : #XPathFunctionSetTest,
	#superclass : #XMLAbstractSetTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathFunctionSetTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XPathFunctionSetTest >> absentSetElement [
	^ XPathStringFunction
]

{ #category : #accessing }
XPathFunctionSetTest >> disjointSameNameSetElements [
	"these functions are different from #setElements, but because they
	are stub subclasses of them, they have the same function names"
	^ Array
		with: XPathOtherCeilingFunction
		with: XPathOtherFloorFunction
		with: XPathOtherRoundFunction
		with: XPathOtherSumFunction
]

{ #category : #accessing }
XPathFunctionSetTest >> disjointSetElements [
	^ Array
		with: XPathSubstringFunction
		with: XPathSubstringBeforeFunction;
		with: XPathSubstringAfterFunction
]

{ #category : #accessing }
XPathFunctionSetTest >> setClass [
	^ XPathFunctionSet
]

{ #category : #accessing }
XPathFunctionSetTest >> setElements [
	^ Array
		with: XPathCeilingFunction
		with: XPathFloorFunction
		with: XPathRoundFunction
		with: XPathSumFunction
]

{ #category : #asserting }
XPathFunctionSetTest >> should: aBlock add: aFirstObject and: aSecondObject equaling: anExpectedSum [
	| firstCopy secondCopy sum |

	firstCopy := aFirstObject asXPathFunctionSet copy.
	secondCopy := aSecondObject asXPathFunctionSet copy.
	sum := aBlock value.
	self
		assert: sum = anExpectedSum;
		deny: sum == aFirstObject;
		deny: sum == aSecondObject;
		assert: firstCopy = aFirstObject asXPathFunctionSet;
		assert: secondCopy = aSecondObject asXPathFunctionSet.
]

{ #category : #asserting }
XPathFunctionSetTest >> should: aBlock subtract: aFirstObject from: aSecondObject equaling: anExpectedDifference [
	| firstCopy secondCopy difference |

	firstCopy := aFirstObject asXPathFunctionSet copy.
	secondCopy := aSecondObject asXPathFunctionSet copy.
	difference := aBlock value.
	self
		assert: difference = anExpectedDifference;
		deny: difference == aFirstObject;
		deny: difference == aSecondObject;
		assert: firstCopy = aFirstObject asXPathFunctionSet;
		assert: secondCopy = aSecondObject asXPathFunctionSet.
]

{ #category : #tests }
XPathFunctionSetTest >> testAsFunctionSet [
	| set function |

	set := self setClass new.
	function := self setElements anyOne.
	self
		assert: set asXPathFunctionSet == set;
		assert: (function asXPathFunctionSet) = (self setClass with: function);
		assert: self setElements asXPathFunctionSet = self setWithElements.
]

{ #category : #tests }
XPathFunctionSetTest >> testCopy [
	| set copy |

	super testCopy.

	set := self setWithElements.
	copy := set copy.
	self
		assert: set functionsByName = copy functionsByName;
		deny: set functionsByName == copy functionsByName.
]

{ #category : #tests }
XPathFunctionSetTest >> testFunctionNamed [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self assert: (set functionNamed: each prototypeName) == each].

	self
		shouldnt: [set functionNamed: self absentSetElement prototypeName]
		raise: Error.
	self assert: (set functionNamed: self absentSetElement prototypeName) isNil.
]

{ #category : #tests }
XPathFunctionSetTest >> testFunctionNamedIfAbsent [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self assert:
			(set
				functionNamed: each prototypeName
				ifAbsent: [self absentSetElement]) == each].
	self assert:
		(set
			functionNamed: self absentSetElement prototypeName
			ifAbsent: [self absentSetElement]) == self absentSetElement.
]

{ #category : #tests }
XPathFunctionSetTest >> testIncludes [
	| set |

	super testIncludes.

	set := self setWithElements.
	self setElements
		with: self disjointSameNameSetElements
		do: [:function :sameNameFunction |
			self deny: (set includes: sameNameFunction).

			set add: sameNameFunction.
			self
				deny: (set includes: function);
				assert: (set includes: sameNameFunction)].
]

{ #category : #tests }
XPathFunctionSetTest >> testIncludesFunctionNamed [
	| set |

	set := self emptySet.
	self setElements do: [:each |
		self deny: (set includesFunctionNamed: each prototypeName)].

	set := self setWithElements.
	self setElements do: [:each |
		self assert: (set includesFunctionNamed: each prototypeName)].
	self disjointSetElements do: [:each |
		self deny: (set includesFunctionNamed: each prototypeName)].

	set := self setWithDisjointElements.
	self disjointSetElements do: [:each |
		self assert: (set includesFunctionNamed: each prototypeName)].
]

{ #category : #tests }
XPathFunctionSetTest >> testMinusFunction [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self
			should: [set - each]
			subtract: each
			from: set
			equaling: (self setClass newFrom: (self setElements copyWithout: each))].

	self disjointSetElements do: [:each |
		self
			should: [set - each]
			subtract: each
			from: set
			equaling: self setWithElements].

	self assert:
		(self setElements first - self setElements second) =
			(self setClass with: self setElements first).
	self assert:
		(self setElements first - self setElements first) =
			self emptySet.
]

{ #category : #tests }
XPathFunctionSetTest >> testMinusSet [
	| firstSet secondSet |

	firstSet := self setWithElements.
	secondSet := self emptySet.
	self
		should: [firstSet - secondSet]
		subtract: secondSet
		from: firstSet
		equaling: self setWithElements.

	secondSet := self setWithDisjointElements.
	self
		should: [firstSet - secondSet]
		subtract: secondSet
		from: firstSet
		equaling: self setWithElements.
	self
		should: [firstSet - firstSet]
		subtract: firstSet
		from: firstSet
		equaling: self emptySet.
]

{ #category : #tests }
XPathFunctionSetTest >> testPlusFunction [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self
			should: [set + each]
			add: each
			and: set
			equaling: self setWithElements].

	set := self setWithElements.
	self disjointSetElements do: [:each |
		self
			should: [set + each]
			add: each
			and: set
			equaling: (self setClass newFrom: (self setElements copyWith: each))].

	self assert:
		(self setElements first + self setElements second) =
			(self setClass
				with: self setElements first
				with: self setElements second).

	self assert:
		(self setElements first + self setElements first) =
			(self setClass with: self setElements first).
]

{ #category : #tests }
XPathFunctionSetTest >> testPlusSet [
	| firstSet secondSet |

	firstSet := self setWithElements.
	secondSet := self emptySet.
	self
		should: [firstSet + secondSet]
		add: firstSet
		and: secondSet
		equaling: self setWithElements.
	self
		should: [firstSet + firstSet]
		add: firstSet
		and: firstSet
		equaling: self setWithElements.

	secondSet := self setWithDisjointElements.
	self
		should: [firstSet + secondSet]
		add: firstSet
		and: secondSet
		equaling:
			(self setClass newFrom:
				self setWithDisjointElements, self setWithElements).
]

{ #category : #tests }
XPathFunctionSetTest >> testRemoveFunctionNamed [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self
			assert: (set removeFunctionNamed: each prototypeName) == each;
			deny: (set includes: each).
		self
			should: [set removeFunctionNamed: each prototypeName]
			raise: Error].
	self assert: set isEmpty.
]

{ #category : #tests }
XPathFunctionSetTest >> testRemoveFunctionNamedIfAbsent [
	| set |

	set := self setWithElements.
	self setElements do: [:each |
		self assert:
			(set
				removeFunctionNamed: each prototypeName
				ifAbsent: [self fail]) == each.
		self deny: (set includes: each).
		self
			assert:
				(set
					removeFunctionNamed: each prototypeName
					ifAbsent: [self absentSetElement]) == self absentSetElement].
	self assert: set isEmpty.
]

{ #category : #tests }
XPathFunctionSetTest >> testRemoveIfAbsent [
	| set |

	super testRemoveIfAbsent.

	set := self setWithElements.
	self setElements
		with: self disjointSameNameSetElements
		do: [:function :sameNameFunction |
			self assert:
				(set
					remove: sameNameFunction
					ifAbsent: [self absentSetElement]) = self absentSetElement.

			set add: sameNameFunction.
			self assert:
				(set
					remove: function
					ifAbsent: [self absentSetElement]) = self absentSetElement.
			self assert:
				(set
					remove: sameNameFunction
					ifAbsent: [self fail]) = sameNameFunction].
]
