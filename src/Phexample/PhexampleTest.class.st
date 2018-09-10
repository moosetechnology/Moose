Class {
	#name : #PhexampleTest,
	#superclass : #Phexample,
	#instVars : [
		'factory'
	],
	#category : #'Phexample-Test'
}

{ #category : #'as yet unclassified' }
PhexampleTest class >> allTestSelectors [ 
	| selectors |
	selectors := self selectors select: [ :each | each beginsWith: 'should' ].
	^ selectors union: super allTestSelectors 
]

{ #category : #running }
PhexampleTest >> setUp [
	super setUp.
	factory := ClassFactoryForTestCase new
]

{ #category : #examples }
PhexampleTest >> shouldExecuteExampleMethod [
	| class testcase hasRun result |
	class := factory newSubclassOf: Phexample
		instanceVariableNames: 'action'
		classVariableNames: ''.
	class compile: 'shouldRun action value'.
	class compile: 'action: aBlock action := aBlock'.
	testcase := class selector: #shouldRun.
	testcase action: [ hasRun := true ].
	result := testcase run.
	result tests size should equal: 1.
	result passed size should equal: 1.
	hasRun should be: true
]

{ #category : #examples }
PhexampleTest >> shouldHaveGivenAsResource [
	Phexample resources should include: Given 
]

{ #category : #examples }
PhexampleTest >> shouldNicelyHandleNotifications [
	"Checks whether notifications are properly ignored, both immediately and in dependent tests."
	| class   result suite |
	class := factory newSubclassOf: Phexample
		instanceVariableNames: ''
		classVariableNames: ''.
	class compile: 'throwNotification Notification  signal:''Waa!'''.
	class compile: 'consumeNotification   self given: #throwNotification. '.
	suite := TestSuite new.
	suite 
		addTest: (class selector: #throwNotification);
		addTest: (class selector: #consumeNotification).
	result := suite run.
	result passedCount should equal: 2 .
	result failureCount should equal: 0.
	result errorCount should equal: 0 .
	result unexpectedPassCount should equal: 0.
	result unexpectedErrorCount should equal: 0.
	result unexpectedFailureCount should equal: 0.
			
]

{ #category : #examples }
PhexampleTest >> shouldNotHaveTestsInPhexample [
	Phexample allTestSelectors isEmpty should be: true.
	
	
]

{ #category : #running }
PhexampleTest >> tearDown [
	factory cleanUp.
	super tearDown
]
