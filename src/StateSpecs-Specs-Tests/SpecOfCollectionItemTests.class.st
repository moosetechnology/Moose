Class {
	#name : #SpecOfCollectionItemTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfCollectionItemTests >> testDescriptionWhenRequiredItemIsSimpleValue [
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #value.
	
	self assert: spec description equals: 'should include #value at #expectedKey'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testDescriptionWhenRequiredItemIsSpec [
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: (Kind of: Integer).
	
	self assert: spec description equals: 'should include (be a kind of Integer) at #expectedKey'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testFailedValidationWhenContainingKeyAbsent [
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 10.
	
	result := spec validate: #(1 2).
	self assert: result isFailure.
	self assert: result description equals: '#(1 2) not includes key 3 which item should equal "10"'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testFailedValidationWhenRequiredItemIsWrong [
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 3.
	
	result := spec validate: #(1 2 4).
	self assert: result isFailure.
	self assert: result description equals: 'Got "4" at key 3 of #(1 2 4) but should equal "3"'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testFailedValidationWhenSpecWithDenialAndContainingKeyAbsent [
	| spec result |

	spec := (SpecOfCollectionItem at: 3 requiredItem: 10) not.
	
	result := spec validate: #(1 2).
	self assert: result isFailure.
	self assert: result description equals: '#(1 2) not includes key 3 which item should not equal "10"'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testFailedValidationWhenSpecWithDenialAndRequiredItemIsWrong [
	| spec result |

	spec := (SpecOfCollectionItem at: 3 requiredItem: 10) not.
	
	result := spec validate: #(1 2 10).
	self assert: result isFailure.
	self assert: result description equals: 'Got "10" at key 3 of #(1 2 10) but should not equal "10"'
]

{ #category : #tests }
SpecOfCollectionItemTests >> testMatches [
	| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #expectedValue.

	self assert: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1 #expectedKey #expectedValue))).
	self deny: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1 #expectedKey #wrongValueValue)))
]

{ #category : #tests }
SpecOfCollectionItemTests >> testMatchesWhenRequiredKeyAbsent [
		| spec |
	spec := SpecOfCollectionItem at: #expectedKey requiredItem: #expectedValue.

	self deny: (spec matches: (Dictionary newFromPairs: 
			#(#key1 #value1)))
]

{ #category : #tests }
SpecOfCollectionItemTests >> testMatchesWithExplicitItemSpec [
	| spec |

	spec := SpecOfCollectionItem at: 3 requiredItem: (SpecOfObjectSuperclass requiredClass: String).
	self assert: (spec matches: #(1 2 'someString')).
	self deny: (spec matches: #(1 2 3)).
	self deny: (spec matches: #(1 2)).
]

{ #category : #tests }
SpecOfCollectionItemTests >> testSucceeedValidation [
	| spec result |

	spec := SpecOfCollectionItem at: 3 requiredItem: 3.
	
	result := spec validate: #(1 2 3).
	self assert: result isSuccess
]
