Class {
	#name : #SpecOfObjectStateTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfObjectStateTests >> testAsStateSpec [
	| stateSpec |
	stateSpec := SpecOfObjectState new.
	self assert: stateSpec asStateSpec == stateSpec
]

{ #category : #tests }
SpecOfObjectStateTests >> testDescriptionWithTitle [
	| stateSpec result |
	stateSpec := SpecOfObjectState new.
	stateSpec title: 'some title'.
	result := stateSpec description.
	self assert: result = 'should some title'
]

{ #category : #tests }
SpecOfObjectStateTests >> testDescriptionWithTitleButDenial [
	| stateSpec result |
	stateSpec := SpecOfObjectState new.
	stateSpec
		title: 'some title';
		denial: true.
	result := stateSpec description.
	self assert: result = 'should not some title'
]

{ #category : #tests }
SpecOfObjectStateTests >> testDescriptionWithoutTitle [
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	result := stateSpec description.
	expected := 'should satisfy for ' , stateSpec class name.
	self assert: result = expected
]

{ #category : #tests }
SpecOfObjectStateTests >> testDescriptionWithoutTitleAndDenial [
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	stateSpec denial: true.
	result := stateSpec description.
	expected := 'should not satisfy for ' , stateSpec class name.
	self assert: result = expected
]

{ #category : #tests }
SpecOfObjectStateTests >> testIsStateSpec [
	| stateSpec |
	stateSpec := SpecOfObjectState new.
	self assert: stateSpec isStateSpec
]

{ #category : #tests }
SpecOfObjectStateTests >> testNotDenialByDefault [
	| stateSpec |
	stateSpec := SpecOfObjectState new.
	self deny: stateSpec denial
]

{ #category : #tests }
SpecOfObjectStateTests >> testTitleByDefault [
	| stateSpec result expected |
	stateSpec := SpecOfObjectState new.
	result := stateSpec title.
	expected := 'satisfy for ' , stateSpec class name.
	self assert: result = expected
]
