Class {
	#name : #DTDExternalEntityResolverTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-DTD'
}

{ #category : #testing }
DTDExternalEntityResolverTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
DTDExternalEntityResolverTest >> entityLimitsClass [
	^ DTDExternalEntityLimits
]

{ #category : #testing }
DTDExternalEntityResolverTest >> isTestingLimiting [
	^ false
]

{ #category : #'instance creation' }
DTDExternalEntityResolverTest >> newEntityLimits [
	^ self entityLimitsClass new
]

{ #category : #'instance creation' }
DTDExternalEntityResolverTest >> newResolver [
	^ self isTestingLimiting
		ifTrue: [self resolverClass new asLimitingExternalEntityResolver]
		ifFalse: [self resolverClass new]
]

{ #category : #accessing }
DTDExternalEntityResolverTest >> resolverClass [
	^ DTDExternalEntityResolver
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testCopy [
	| resolver copy |

	(resolver := self newResolver)
		externalSubsetReadLimit: 1000000;
		maxExternalEntities: 10;
		maxExternalEntitySize: 10000;
		resolvesLocalFromNonLocal: true.

	copy := resolver copy.
	self
		deny: copy == resolver;
		assert: copy externalSubsetReadLimit = 1000000;
		assert: copy maxExternalEntities = 10;
		assert: copy maxExternalEntitySize = 10000;
		assert: copy resolvesLocalFromNonLocal.

	self isTestingLimiting
		ifTrue: [
			self
				assert: copy externalEntityResolver == resolver externalEntityResolver;
				assert: copy externalEntityLimits == resolver externalEntityLimits]
		ifFalse: [
			self deny: copy externalEntityLimits == resolver externalEntityLimits]
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testDecoratorInterfaceCompatibility [
	| resolver resolverBaseClass |

	self isTestingLimiting
		ifFalse: [^ self].

	"decorators must support the resolver base class's public interface"
	resolver := self newResolver.
	resolverBaseClass := DTDExternalEntityResolver.
	"avoid #methodsDo: for GS compatibility"
	resolverBaseClass selectorsDo: [:each |
		"use #whichCategoryIncludesSelector: for backwards compatibility"
		((resolverBaseClass whichCategoryIncludesSelector: each)
			asString beginsWith: 'private')
			ifFalse: [
				self assert: (resolver respondsTo: each)]].
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testExternalEntityLimits [
	| resolver newEntityLimits |

	resolver := self newResolver.
	self assert: resolver externalEntityLimits class == self entityLimitsClass.

	newEntityLimits := self newEntityLimits.
	self
		assert: (resolver externalEntityLimits: newEntityLimits) == resolver;
		assert: resolver externalEntityLimits == newEntityLimits.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testExternalSubsetReadLimit [
	| resolver |

	resolver := self newResolver.
	self assert:
		resolver externalSubsetReadLimit =
			DTDExternalEntityLimits defaultExternalSubsetReadLimit.
	self
		assert: (resolver externalSubsetReadLimit: 1000000) == resolver;
		assert: resolver externalSubsetReadLimit = 1000000;
		assert: (resolver externalSubsetReadLimit: nil) == resolver;
		assert: resolver externalSubsetReadLimit isNil.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testMaxExternalEntities [
	| resolver |

	resolver := self newResolver.
	self
		assert: resolver maxExternalEntities > 0;
		assert: (resolver maxExternalEntities: 10) == resolver;
		assert: resolver maxExternalEntities = 10;
		assert: (resolver maxExternalEntities: nil) == resolver;
		assert: resolver maxExternalEntities isNil.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testMaxExternalEntitySize [
	| resolver |

	resolver := self newResolver.
	self assert:
		resolver maxExternalEntitySize =
			DTDExternalEntityLimits defaultMaxExternalEntitySize.
	self
		assert: (resolver maxExternalEntitySize: 10000) == resolver;
		assert: resolver maxExternalEntitySize = 10000;
		assert: (resolver maxExternalEntitySize: nil) == resolver;
		assert: resolver maxExternalEntitySize isNil.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testRemoveLimits [
	| readLimit entityLimit entitySizeLimit resolver |

	readLimit := 100.
	entityLimit := 10.
	entitySizeLimit := 100.
	(resolver := self newResolver)
		externalSubsetReadLimit: readLimit;
		maxExternalEntities: entityLimit;
		maxExternalEntitySize: entitySizeLimit;
		resolvesLocalFromNonLocal: true.
	self
		assert: resolver externalSubsetReadLimit = readLimit;
		assert: resolver maxExternalEntities = entityLimit;
		assert: resolver maxExternalEntitySize = entitySizeLimit;
		assert: resolver resolvesLocalFromNonLocal.

	resolver removeLimits.
	self
		assert: resolver externalSubsetReadLimit isNil;
		assert: resolver maxExternalEntities isNil;
		assert: resolver maxExternalEntitySize isNil;
		assert: resolver resolvesLocalFromNonLocal.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testResolvesLocalFromNonLocal [
	| resolver |

	resolver := self newResolver.
	self
		deny: resolver resolvesLocalFromNonLocal;
		assert: (resolver resolvesLocalFromNonLocal: false) == resolver;
		deny: resolver resolvesLocalFromNonLocal;
		assert: (resolver resolvesLocalFromNonLocal: true) == resolver;
		assert: resolver resolvesLocalFromNonLocal.
]

{ #category : #tests }
DTDExternalEntityResolverTest >> testTotalResolvedExternalEntities [
	| resolver |

	self isTestingLimiting
		ifFalse: [^ self].

	resolver := self newResolver.
	self assert: resolver totalResolvedExternalEntities = 0.

	resolver incrementTotalResolvedExternalEntities.
	self assert: resolver totalResolvedExternalEntities = 1.

	self assert:
		(self newResolver
			incrementTotalResolvedExternalEntities;
			totalResolvedExternalEntities) = 1.
]
