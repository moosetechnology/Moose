Extension { #name : #FamixStClass }

{ #category : #'*Famix-Deprecated' }
FamixStClass >> hasMethodWithSignature: aSignature [
	self deprecated: 'Use #implements: instead' transformWith: '`@receiver hasMethodWithSignature: `@statements1' -> '`@receiver implements: `@statements1'.
	^ self implements: aSignature
]

{ #category : #'*Famix-Deprecated' }
FamixStClass >> implementationOf: signature [
	self deprecated: 'Use #lookUp: instead' transformWith: '`@receiver implementationOf: `@statements1' -> '`@receiver lookUp: `@statements1'.
	^ self lookUp: signature
]

{ #category : #'*Famix-Deprecated' }
FamixStClass >> isSUnitTestCase [
	self deprecated: 'Use #isTestCase instead' transformWith: '`@receiver isSUnitTestCase' -> '`@receiver isTestCase'.
	^ self isTestCase
]
