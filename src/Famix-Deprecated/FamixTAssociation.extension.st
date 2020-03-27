Extension { #name : #FamixTAssociation }

{ #category : #'*Famix-Deprecated' }
FamixTAssociation >> from [
	self
		deprecated: 'Use association source instad'
		transformWith: '`@receiver from' -> '`@receiver source'.
	^ self source
]

{ #category : #'*Famix-Deprecated' }
FamixTAssociation >> from: aFrom [
	self
		deprecated: 'Use association source instad'
		transformWith: '`@receiver from: `@arg' -> '`@receiver source: `@arg'.
	self source: aFrom
]

{ #category : #'*Famix-Deprecated' }
FamixTAssociation >> to [
	self
		deprecated: 'Use association target instad'
		transformWith: '`@receiver to' -> '`@receiver target'.
	^ self target
]

{ #category : #'*Famix-Deprecated' }
FamixTAssociation >> to: aTo [
	self
		deprecated: 'Use association target instad'
		transformWith: '`@receiver to: `@arg' -> '`@receiver target: `@arg'.
	self target: aTo
]
