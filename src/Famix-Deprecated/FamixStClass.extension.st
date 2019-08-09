Extension { #name : #FamixStClass }

{ #category : #'*Famix-Deprecated' }
FamixStClass >> hasMethodWithSignature: aSignature [
	self deprecated: 'Use #implements: instead' transformWith: '`@receiver hasMethodWithSignature: `@statements1' -> '`@receiver implements: `@statements1'.
	^ self implements: aSignature
]

{ #category : #'*Famix-Deprecated' }
FamixStClass >> isSUnitTestCase [
	self deprecated: 'Use #isTestCase instead' transformWith: '`@receiver isSUnitTestCase' -> '`@receiver isTestCase'.
	^ self isTestCase
]
