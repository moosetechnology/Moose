Extension { #name : #MooseQueryResult }

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
