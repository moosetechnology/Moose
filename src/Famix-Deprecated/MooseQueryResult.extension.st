Extension { #name : #MooseQueryResult }

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfClass: aFAMIXClass [
	self deprecated: 'Use #outOf: instead' transformWith: '`@receiver outOfClass: `@statements1' -> '`@receiver outOf: `@statements1'.
	^ self outOf: aFAMIXClass
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfMyClass [
	self deprecated: 'Use #outOfParentUsing: instead' transformWith: '`@receiver outOfMyClass' -> '`@receiver outOfParentUsing: FamixTClass'.
	^ self outOfParentUsing: FamixTClass
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfMyNamespace [
	self deprecated: 'Use #outOfParentUsing: instead' transformWith: '`@receiver outOfMyNamespace' -> '`@receiver outOfParentUsing: FamixTNamespace'.
	^ self outOfParentUsing: FamixTNamespace
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfMyPackage [
	self deprecated: 'Use #outOfParentUsing: instead' transformWith: '`@receiver outOfMyPackage' -> '`@receiver outOfParentUsing: FamixTPackage'.
	^ self outOfParentUsing: FamixTPackage
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfNamespace: aFAMIXNamespace [
	self deprecated: 'Use #outOf: instead' transformWith: '`@receiver outOfNamespace: `@statements1' -> '`@receiver outOf: `@statements1'.
	^ self outOf: aFAMIXNamespace
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> outOfPackage: aFAMIXPackage [
	self deprecated: 'Use #outOf: instead' transformWith: '`@receiver outOfPackage: `@statements1' -> '`@receiver outOf: `@statements1'.
	^ self outOf: aFAMIXPackage
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinClass: aFAMIXClass [
	self deprecated: 'Use #within: instead' transformWith: '`@receiver withinClass: `@statements1' -> '`@receiver within: `@statements1'.
	^ self within: aFAMIXClass
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinMyClass [
	self deprecated: 'Use #withinParentUsing: instead' transformWith: '`@receiver withinMyClass' -> '`@receiver withinParentUsing: FamixTClass'.
	^ self withinParentUsing: FamixTClass
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinMyNamespace [
	self deprecated: 'Use #withinParentUsing: instead' transformWith: '`@receiver withinMyNamespace' -> '`@receiver withinParentUsing: FamixTNamespace'.
	^ self withinParentUsing: FamixTNamespace
]

{ #category : #'*Famix-Deprecated' }
MooseQueryResult >> withinMyPackage [
	self deprecated: 'Use #withinParentUsing: instead' transformWith: '`@receiver withinMyPackage' -> '`@receiver withinParentUsing: FamixTPackage'.
	^ self withinParentUsing: FamixTPackage
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
