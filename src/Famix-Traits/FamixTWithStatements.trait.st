Trait {
	#name : #FamixTWithStatements,
	#traits : 'FamixTSourceEntity + FamixTWithAccesses + FamixTWithInvocations',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTWithStatements classSide >> annotation [

	<FMClass: #TWithStatements super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTWithStatements >> isBehavioural [

	<generated>
	^ true
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements [
	<FMProperty: #numberOfStatements type: #Number>
	<derived>
	<FMComment: 'The number of statements in a class'>
	^ self lookUpPropertyNamed: #numberOfStatements computedAs: [ (self toScope: FamixTWithStatements) detectSum: #numberOfStatements ]
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements: aNumber [

	self privateState propertyAt: #numberOfStatements put: aNumber
]

{ #category : #asserting }
FamixTWithStatements >> shouldCountChildrenForLinesOfCodeIfNoSourceAnchor [
	^ false
]
