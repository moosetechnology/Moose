Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> entityNamed: aSymbol withType: aFamixType [
	self
		deprecated: 'Use #allWithType: association to #entityNamed: instead.'
		transformWith: '`@receiver entityNamed: `@statements1 withType: `@statements2' -> '(`@receiver allWithType: `@statements2) entityNamed: `@statements1'.

	^ (self allWithType: aFamixType) entityNamed: aSymbol
]

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> entityNamed: aSymbol withType: aFamixType ifAbsent: aBlock [
	self
		deprecated: 'Use #allWithType: association to #entityNamed:ifAbsent: instead.'
		transformWith:
			'`@receiver entityNamed: `@statements1 withType: `@statements2 ifAbsent: `@statements3'
				-> '(`@receiver allWithType: `@statements2) entityNamed: `@statements1 ifAbsent: `@statements3'.

	^ (self allWithType: aFamixType) entityNamed: aSymbol ifAbsent: aBlock
]
