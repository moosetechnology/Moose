Trait {
	#name : #FamixTWithStatements,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithStatements classSide >> annotation [

	<MSEClass: #TWithStatements super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements [
	<MSEProperty: #numberOfStatements type: #Number>
	<MSEComment: 'The number of statements in a method'>
	^ self
		lookUpPropertyNamed: #numberOfStatements
		computedAs: [ self notExistentMetricValue ] 
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements: aNumber [

	self privateState propertyAt: #numberOfStatements put: aNumber
]
