Class {
	#name : #GHStateSpecsSupportTests,
	#superclass : #TestCase,
	#category : 'Ghost-StateSpecsSupport-Tests'
}

{ #category : #tests }
GHStateSpecsSupportTests >> testConvertingGhostToStateSpec [
	| ghost result |
	ghost := GHObjectGhostStub new.
	
	result := ghost asStateSpec.
	
	self assert: result class equals: SpecOfIdentity.
	self assert: result requiredValue == ghost
]

{ #category : #tests }
GHStateSpecsSupportTests >> testEqualityOfArrayContainingGhost [
	| ghost |
	ghost := GHObjectGhostStub new.
	
	self shouldnt: [{ghost} should equal: {ghost}] raise: SpecOfFailed.
	self should: [{ghost} should equal: {2}] raise: SpecOfFailed.
	self should: [{2} should equal: {ghost}] raise: SpecOfFailed.
]

{ #category : #tests }
GHStateSpecsSupportTests >> testEqualitySpec [
	| ghost |
	ghost := GHObjectGhostStub new.
	
	self shouldnt: [ghost should equal: ghost] raise: SpecOfFailed.
	self should: [ghost should equal: 2] raise: SpecOfFailed.
	self should: [2 should equal: ghost] raise: SpecOfFailed.
]

{ #category : #tests }
GHStateSpecsSupportTests >> testGhostsAreNotStateSpecs [
	| ghost |
	ghost := GHObjectGhostStub new.
		
	self deny: ghost isStateSpec
]

{ #category : #tests }
GHStateSpecsSupportTests >> testIdentitySpec [
	| ghost |
	ghost := GHObjectGhostStub new.
	
	self shouldnt: [ghost should be: ghost] raise: SpecOfFailed.
	self should: [ghost should be: 2] raise: SpecOfFailed.
	self should: [2 should be: ghost] raise: SpecOfFailed.
]

{ #category : #tests }
GHStateSpecsSupportTests >> testObjectClassSpec [
	| ghost |
	ghost := GHObjectGhostStub new.
	
	self shouldnt: [ghost should beInstanceOf: GHObjectGhostStub] raise: SpecOfFailed.
	self should: [ghost should beInstanceOf: Object] raise: SpecOfFailed
]

{ #category : #tests }
GHStateSpecsSupportTests >> testObjectSuperclassSpec [
	| ghost |
	ghost := GHObjectGhostStub new.
	
	self shouldnt: [ghost should beKindOf: GHObjectGhost] raise: SpecOfFailed.
	self should: [ghost should beKindOf: Object] raise: SpecOfFailed
]

{ #category : #tests }
GHStateSpecsSupportTests >> testPrintingSpecTitle [
	| ghost result |
	ghost := GHObjectGhostStub new.
	
	result := ghost stringForSpecTitle.
	
	self assert: result equals: 'a GHObjectGhostStub'
]

{ #category : #tests }
GHStateSpecsSupportTests >> testPrintingSpecValidation [
	| ghost result |
	ghost := GHObjectGhostStub new.
	
	result := ghost stringForSpecValidation.
	
	self assert: result equals: 'a GHObjectGhostStub'
]
