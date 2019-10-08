Trait {
	#name : #FamixTWithStatements,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithStatements classSide >> annotation [

	<MSEClass: #TWithStatements super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements [
	<MSEProperty: #numberOfStatements type: #Number>
	<derived>
	<MSEComment: 'The number of statements in a class'>
	^ self lookUpPropertyNamed: #numberOfStatements computedAs: [ (self toScope: FamixTWithStatements) detectSum: #numberOfStatements ]
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements: aNumber [

	self privateState propertyAt: #numberOfStatements put: aNumber
]
