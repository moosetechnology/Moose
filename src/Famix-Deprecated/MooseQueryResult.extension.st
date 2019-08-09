Extension { #name : #MooseQueryResult }

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinClass: aFAMIXClass [
	self deprecated: 'Use #within: instead' transformWith: '`@receiver withinClass: `@statements1' -> '`@receiver within: `@statements1'.
	^ self within: aFAMIXClass
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinNamespace: aFamixPackage [
	self deprecated: 'Use #within: instead' transformWith: '`@receiver withinNamespace: `@statements1' -> '`@receiver within: `@statements1'.
	^ self within: aFamixPackage
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinPackage: aFamixPackage [
	self deprecated: 'Use #within: instead' transformWith: '`@receiver withinPackage: `@statements1' -> '`@receiver within: `@statements1'.
	^ self within: aFamixPackage
]
