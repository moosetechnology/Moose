Class {
	#name : #AnyClassTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
AnyClassTests >> testAsSimpleValue [
	self assert: Any asSimpleValue equals: Any name
]

{ #category : #tests }
AnyClassTests >> testAsStateSpec [
	self assert: Any asStateSpec = Any
]

{ #category : #tests }
AnyClassTests >> testBasicMatchesAnyObject [
	| result |
	result := Any basicMatches: nil.
	self assert: result
]

{ #category : #tests }
AnyClassTests >> testIsSimpleValue [
	self assert: Any isSimpleValue
]

{ #category : #tests }
AnyClassTests >> testIsStateSpec [
	self assert: Any isStateSpec
]

{ #category : #tests }
AnyClassTests >> testMatchesAnyObject [
	| result |
	result := Any matches: nil.
	self assert: result
]

{ #category : #tests }
AnyClassTests >> testValidate [
	| result |
	result := Any validate: nil.
	self assert: result isSuccess
]
