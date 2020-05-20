Extension { #name : #MooseEntityState }

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> allProperties [
	self deprecated: 'Use #allProperties instead' transformWith: '`@receiver allProperties' -> '`@receiver allCachedValues'. 
	^ self allCachedValues
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> flushGroups [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushGroups' -> '`@receiver flush'.
	self flush
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> flushProperties [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushProperties' -> '`@receiver flush'.
	self flush
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> propertyAt: name ifAbsent: aBlock [
	self
		deprecated: 'Use cacheAt:ifAbsent: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsent: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsent: `@arg2'.
	^ self cacheAt: name ifAbsent: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> propertyAt: name ifAbsentPut: aBlock [
	self
		deprecated: 'Use cache:ifAbsentPut: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsentPut: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: name ifAbsentPut: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> propertyAt: name put: value [
	self deprecated: 'Use cacheAt:put: instead' transformWith: '`@receiver propertyAt: `@arg1 put: `@arg2' -> '`@receiver cacheAt: `@arg1 put: `@arg2'.
	^ self cacheAt: name put: value
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState >> removeProperty: name [
	self deprecated: 'Use removeCache: instead' transformWith: '`@receiver removeProperty: `@arg' -> '`@receiver removeCache: `@arg'.
	^ self removeCache: name
]

{ #category : #'*Famix-Deprecated' }
MooseEntityState class >> with: aMooseEntity [
	self deprecated: 'Use #for: instead.' transformWith: '`@receiver with: `@arg' -> '`@receiver for: `@arg'.
	^ self for: aMooseEntity
]
