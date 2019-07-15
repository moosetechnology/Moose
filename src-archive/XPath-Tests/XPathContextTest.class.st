Class {
	#name : #XPathContextTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #accessing }
XPathContextTest >> contextClass [
	^ XPathContext
]

{ #category : #accessing }
XPathContextTest >> functionSetClass [
	^ XPathFunctionSet
]

{ #category : #accessing }
XPathContextTest >> functions [
	^ self contextClass defaultFunctions
]

{ #category : #accessing }
XPathContextTest >> namespaces [
	^ Dictionary new
		at: 'prefix1' put: 'ns1';
		at: 'prefix2' put: 'ns2';
		yourself
]

{ #category : #'instance creation' }
XPathContextTest >> newContext [
	^ self contextClass new
]

{ #category : #'instance creation' }
XPathContextTest >> newFunctionSet [
	^ self functionSetClass new
]

{ #category : #'instance creation' }
XPathContextTest >> newNodeSet [
	^ self nodeSetClass new
]

{ #category : #accessing }
XPathContextTest >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #tests }
XPathContextTest >> testAddFunction [
	| context |

	context := self newContext.
	context functions: self newFunctionSet.
	self functions do: [:each | | oldFunctionSet |
		"test copy-on-write"
		oldFunctionSet := context functions.
		self
			deny: (context includesFunction: each);
			assert: (context addFunction: each) == each;
			assert: (context includesFunction: each);
			deny: context functions == oldFunctionSet;
			deny: context functions = oldFunctionSet].
]

{ #category : #tests }
XPathContextTest >> testDeclarePrefixURI [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self assert:
			(context
				declarePrefix: key
				uri: value) == context.
		self assert: (context resolvePrefix: key) = value.
		self assert:
			(context
				declarePrefix: key
				uri: 'newValue') == context.
		self assert: (context resolvePrefix: key) = 'newValue'].
]

{ #category : #tests }
XPathContextTest >> testFunctionNamed [
	| context |

	context := self newContext.
	self functions do: [:each |
		self assert: (context functionNamed: each prototypeName) == each.
		context removeFunction: each.
		self assert: (context functionNamed: each prototypeName) isNil].
]

{ #category : #tests }
XPathContextTest >> testFunctionNamedIfAbsent [
	| context |

	context := self newContext.
	self functions do: [:each |
		self assert:
			(context
				functionNamed: each prototypeName
				ifAbsent: [#absent]) == each.
		context removeFunction: each.
		self assert:
			(context
				functionNamed: each prototypeName
				ifAbsent: [#absent]) = #absent].
]

{ #category : #tests }
XPathContextTest >> testFunctions [
	| context functions |

	context := self newContext.
	functions := self functions.
	self
		assert: context functions = functions;
		assert: context functions == functions.

	functions := self functionSetClass default.
	self
		assert: (context functions: functions) == context;
		assert: context functions = functions;
		assert: context functions == functions.

	self
		assert: (context functions: functions asArray) == context;
		assert: context functions = functions;
		deny: context functions == functions.
]

{ #category : #tests }
XPathContextTest >> testHasFunctions [
	| context |

	context := self newContext.
	self assert: context hasFunctions.

	context functions: self newFunctionSet.
	self deny: context hasFunctions.
]

{ #category : #tests }
XPathContextTest >> testHasNamespaces [
	| context |

	context := self newContext.
	self deny: context hasNamespaces.

	context declareNamespaces: self namespaces.
	self assert: context hasNamespaces.
]

{ #category : #tests }
XPathContextTest >> testHasVariables [
	| context |

	context := self newContext.
	self deny: context hasVariables.

	context variables: self variables.
	self assert: context hasVariables.

	context removeVariables.
	self deny: context hasVariables.
]

{ #category : #tests }
XPathContextTest >> testIncludesFunction [
	| context |

	context := self newContext.
	self functions do: [:each |
		self assert: (context includesFunction: each).
		context removeFunction: each.
		self deny: (context includesFunction: each)].
]

{ #category : #tests }
XPathContextTest >> testIncludesVariable [
	| context |

	context := self newContext.
	self variables keysAndValuesDo: [:key :value |
		self deny: (context includesVariable: key).
		context
			variableAt: key
			put: value.
		self assert: (context includesVariable: key)].
]

{ #category : #tests }
XPathContextTest >> testIsDeclaredPrefix [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self deny: (context isDeclaredPrefix: key).
		context
			declarePrefix: key
			uri: value.
		self assert: (context isDeclaredPrefix: key)].
]

{ #category : #tests }
XPathContextTest >> testIsDeclaredPrefixURI [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self deny:
			(context
				isDeclaredPrefix: key
				uri: value).
		context
			declarePrefix: key
			uri: value.
		self assert:
			(context
				isDeclaredPrefix: key
				uri: value).
		self deny:
			(context
				isDeclaredPrefix: key
				uri: 'newNS')].
]

{ #category : #tests }
XPathContextTest >> testRemoveFunction [
	| context |

	context := self newContext.
	self functions do: [:each | | oldFunctionSet |
		"test copy-on-write"
		oldFunctionSet := context functions.
		self
			assert: (context includesFunction: each);
			assert: (context removeFunction: each) == each;
			deny: (context includesFunction: each);
			deny: context functions == oldFunctionSet;
			deny: context functions = oldFunctionSet.
	
		self
			should: [context removeFunction: each]
			raise: Error].
]

{ #category : #tests }
XPathContextTest >> testRemoveFunctionIfAbsent [
	| context |

	context := self newContext.
	self functions do: [:each | | oldFunctionSet |
		"test copy-on-write"
		oldFunctionSet := context functions.
		self
			assert: (context includesFunction: each);
			assert:
				(context
					removeFunction: each
					ifAbsent: [#absent]) == each;
			deny: (context includesFunction: each);
			deny: context functions == oldFunctionSet;
			deny: context functions = oldFunctionSet.

		self
			assert:
				(context
					removeFunction: each
					ifAbsent: [#absent]) == #absent].
]

{ #category : #tests }
XPathContextTest >> testRemoveFunctions [
	| context |

	context := self newContext.
	self
		assert: context removeFunctions == context;
		deny: context hasFunctions.
]

{ #category : #tests }
XPathContextTest >> testRemoveVariable [
	| context |

	context := self newContext.
	context variables: self variables.
	self variables keysAndValuesDo: [:key :value |
		self assert: (context removeVariable: key) = value.
		self
			should: [context removeVariable: key]
			raise: Error].
]

{ #category : #tests }
XPathContextTest >> testRemoveVariableIfAbsent [
	| context |

	context := self newContext.
	context variables: self variables.
	self variables keysAndValuesDo: [:key :value |
		self assert:
			(context
				removeVariable: key
				ifAbsent: [#absent]) = value.
		self assert:
			(context
				removeVariable: key
				ifAbsent: [#absent]) = #absent].
]

{ #category : #tests }
XPathContextTest >> testRemoveVariables [
	| context |

	context := self newContext.
	context variables: self variables.
	self
		assert: context removeVariables == context;
		deny: context hasVariables.
]

{ #category : #tests }
XPathContextTest >> testResolvePrefix [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self assert: (context resolvePrefix: key) = ''.
		context
			declarePrefix: key
			uri: value.
		self assert: (context resolvePrefix: key) = value].

	self assert:
		(context resolvePrefix: 'xml') = XMLNamespaceScope xmlNamespaceURI.
	self assert:
		(context resolvePrefix: 'xmlns') = XMLNamespaceScope xmlnsNamespaceURI.
]

{ #category : #tests }
XPathContextTest >> testResolvePrefixIfUnresolvable [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self assert:
			(context
				resolvePrefix: key
				ifUnresolvable: ['unresolvable']) = 'unresolvable'.
		context
			declarePrefix: key
			uri: value.
		self assert:
			(context
				resolvePrefix: key
				ifUnresolvable: [self fail]) = value].

	self assert:
		(context
			resolvePrefix: 'xml'
			ifUnresolvable: [self fail]) = XMLNamespaceScope xmlNamespaceURI.
	self assert:
		(context
			resolvePrefix: 'xmlns'
			ifUnresolvable: [self fail]) = XMLNamespaceScope xmlnsNamespaceURI.
]

{ #category : #tests }
XPathContextTest >> testResolvePrefixesOfNamespaceURI [
	| context |

	context := self newContext.
	self namespaces keysAndValuesDo: [:key :value |
		self assert:
			(context resolvePrefixesOfNamespaceURI: value) isEmpty.

		context
			declarePrefix: key
			uri: value.
		self assert:
			(context resolvePrefixesOfNamespaceURI: value) =
				(Set with: key).

		context
			declarePrefix: 'newPrefix'
			uri: value.
		self assert:
			(context resolvePrefixesOfNamespaceURI: value) =
				(Set with: key with: 'newPrefix')].

	self assert:
		(context resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlNamespaceURI) =
				(Set with: 'xml').

	self assert:
		(context resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlnsNamespaceURI) =
				(Set with: 'xmlns').
]

{ #category : #tests }
XPathContextTest >> testUndeclarePrefix [
	| context |

	context := self newContext.
	context declareNamespaces: self namespaces.
	self namespaces keysDo: [:each |
		self
			assert: (context isDeclaredPrefix: each);
			assert: (context undeclarePrefix: each) == context;
			deny: (context isDeclaredPrefix: each)].
]

{ #category : #tests }
XPathContextTest >> testUndeclarePrefixes [
	| context |

	context := self newContext.
	context declareNamespaces: self namespaces.
	self
		assert: context hasNamespaces;
		assert: context undeclarePrefixes == context;
		deny: context hasNamespaces.
]

{ #category : #tests }
XPathContextTest >> testVariableAt [
	| context |

	context := self newContext.
	self variables keysAndValuesDo: [:key :value |
		self assert: (context variableAt: key) isNil.
		context
			variableAt: key
			put: value.
		self assert: (context variableAt: key) = value].
]

{ #category : #tests }
XPathContextTest >> testVariableAtIfAbsent [
	| context |

	context := self newContext.
	self variables keysAndValuesDo: [:key :value |
		self assert:
			(context
				variableAt: key
				ifAbsent: [#absent]) = #absent.
		context
			variableAt: key
			put: value.
		self assert:
			(context
				variableAt: key
				ifAbsent: [#absent]) = value].
]

{ #category : #tests }
XPathContextTest >> testVariableAtIfAbsentPut [
	| context |

	context := self newContext.
	self variables keysAndValuesDo: [:key :value |
		self assert:
			(context
				variableAt: key
				ifAbsentPut: [value]) = value.
		self assert: (context variableAt: key) = value.
		self assert:
			(context
				variableAt: key
				ifAbsentPut: [#new]) = value.
		self assert: (context variableAt: key) = value].
]

{ #category : #tests }
XPathContextTest >> testVariableAtPut [
	| context |

	context := self newContext.
	self variables keysAndValuesDo: [:key :value |
		self assert:
			(context
				variableAt: key
				put: value) = value.
		self assert: (context variableAt: key) = value].
]

{ #category : #tests }
XPathContextTest >> testVariables [
	| context variables |

	context := self newContext.
	self
		assert: context variables isDictionary;
		assert: context variables isEmpty.

	variables := self variables.
	self
		assert: (context variables: variables) == context;
		assert: context variables = variables;
		deny: context variables == variables.

	variables := Array with: 'newName' -> 'newValue'.
	self
		assert: (context variables: variables) == context;
		assert: context variables associations asArray = variables.
]

{ #category : #accessing }
XPathContextTest >> variables [
	^ Dictionary new
		at: 'one' put: '1';
		at: 'two' put: 2;
		at: 'three' put: self newNodeSet;
		yourself
]
