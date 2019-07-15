Trait {
	#name : #FamixTWithStatements,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithStatements classSide >> annotation [

	<MSEClass: #TWithStatements super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithStatements classSide >> generatedSlotNames [
	<generated>
	'FamixTWithStatements class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTWithStatements classSide >> generatedTraitNames [
	<generated>
	^ #()
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
