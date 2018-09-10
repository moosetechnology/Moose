"
PhexampleClassTest has is like PhexampleTest, but inherits from Phexample. That's a bit circular, which is why more 'advanced' tests go here.
"
Class {
	#name : #PhexampleClassTest,
	#superclass : #Phexample,
	#instVars : [
		'factory'
	],
	#category : #'Phexample-Test'
}

{ #category : #tests }
PhexampleClassTest >> assertForTestResult: aResult runCount: aRunCount passed: aPassedCount failed: aFailureCount errors: anErrorCount expectedFailures: anExpectedFailureCount [

	self
		assert: aResult runCount = aRunCount;
		assert: aResult expectedPassCount = aPassedCount;
		assert: aResult failureCount = aFailureCount;
		assert: aResult errorCount = anErrorCount;
		assert: aResult expectedDefectCount = anExpectedFailureCount
]

{ #category : #private }
PhexampleClassTest >> expectedFailureFails [
	<expectedFailure>
	self assert: false.
]

{ #category : #private }
PhexampleClassTest >> expectedFailurePasses [
	<expectedFailure>
	self assert: true.
]

{ #category : #tests }
PhexampleClassTest >> shouldComputeNumberOfTests [
	self class allTestSelectors size should equal: 4.
]

{ #category : #tests }
PhexampleClassTest >> testExpectedFailure [

	| case result |
	case := self class selector: #expectedFailureFails.
	self deny: case shouldPass.
	result := case run.
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 0
		expectedFailures: 1.
]

{ #category : #tests }
PhexampleClassTest >> testExpectedFailureDetection [
	self assert: self expectedFailures asSet equals: #(expectedFailureFails expectedFailurePasses) asSet
]

{ #category : #tests }
PhexampleClassTest >> testExpectedFailurePass [

	| case result |
	case := self class selector: #expectedFailurePasses.
	self deny: case shouldPass.
	result := case run.
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 1
		errors: 0
		expectedFailures: 0.
]
