"
I represent mock expectation.

I consist of:  

- expected message spec (description of expected message defined by SpecOfExpectedMessage)

- current usage count (counter which holds how much times expected message was used)

- expected actions (what should be done as result of intercepted message send)

- extra conditions spec (extra specs which should be validated before actions will be executed. It allows to check conditions and immediatelly stop execution when it is wrong) 
 
My instance returned as result of intercepted message send during mocks teaching. Then following messages can be used to specify different kind of expected behaviour:

- will: aBlock
- willReturn: anObject
- willRaise: anExceptionOfClass
- willReturnValueFrom: anArray
- willReturnYourself

To specify how much times expected message should be used for intercepted sends try this:

- use: aNumber 
- useOne
- useTwice

And to specify conditions which should be valid when expectation is executed use this:

- when: aBlock is: aSpecOfObjectState
- when: aBlock satisfying: aBlock 
- shouldOccurInThisThread
- shouldOccurInAnotherThread 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	actions:		<MockExpectedActionSequence>
	conditionsSpec:		<SpecOfAndConjunction>
	spec:		<SpecOfExpectedMessage>
	usageCount:		<Integer>
"
Class {
	#name : #MockExpectedMessage,
	#superclass : #Object,
	#instVars : [
		'spec',
		'usageCount',
		'actions',
		'conditionsSpec'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedMessage class >> from: aMessageSend [ 
	^self new
		spec: (SpecOfExpectedMessage from: aMessageSend)
]

{ #category : #accessing }
MockExpectedMessage >> actions [
	^ actions
]

{ #category : #accessing }
MockExpectedMessage >> actions: anObject [
	actions := anObject
]

{ #category : #converting }
MockExpectedMessage >> asExpectedMessageSpec [

	| expectedMessage |
	expectedMessage := spec copy.
	expectedMessage usage beUnlimited.
	^expectedMessage
]

{ #category : #evaluating }
MockExpectedMessage >> executeAs: aMessageSend [

	spec captureArgumentsFrom: aMessageSend.
	(conditionsSpec validate: aMessageSend) raise.

	usageCount := usageCount + 1.
	^actions executeFor: aMessageSend
]

{ #category : #initialization }
MockExpectedMessage >> initialize [
	super initialize.
	
	actions := MockExpectedActionSequence new.
	usageCount := 0.
	conditionsSpec := SpecOfAndConjunction new
]

{ #category : #testing }
MockExpectedMessage >> isAbout: aMessageSend [

	(spec matches: {aMessageSend}) ifFalse: [ ^false ].
	
	^spec allowSendsCount: usageCount + 1
]

{ #category : #testing }
MockExpectedMessage >> isForLimitedUsage [
	
	^spec usage isUnlimited not
]

{ #category : #printing }
MockExpectedMessage >> printOn: aStream [
	super printOn: aStream.
	 
	aStream << $( << spec printMessageSend << $)
]

{ #category : #accessing }
MockExpectedMessage >> restrictUsage [
	
	spec restrictUsage
]

{ #category : #conditions }
MockExpectedMessage >> shouldBeSentInAnotherProcess [
	conditionsSpec addSpec: SpecOfAsynchMessage forActiveProcess
]

{ #category : #conditions }
MockExpectedMessage >> shouldBeSentInThisProcess [
	conditionsSpec addSpec: SpecOfAsynchMessage forActiveProcess not
]

{ #category : #accessing }
MockExpectedMessage >> spec [
	^ spec
]

{ #category : #accessing }
MockExpectedMessage >> spec: anObject [
	spec := anObject
]

{ #category : #accessing }
MockExpectedMessage >> usageCount [
	^ usageCount
]

{ #category : #accessing }
MockExpectedMessage >> usageCount: anObject [
	usageCount := anObject
]

{ #category : #'usage specs' }
MockExpectedMessage >> use: numberOfTimes [

	spec usage maxCount:  numberOfTimes
]

{ #category : #'usage specs' }
MockExpectedMessage >> useArbitrarily [
	"It is default usage strategy. But for lenient/strict logic default is useOnce"
	spec usage beUnlimited
]

{ #category : #'usage specs' }
MockExpectedMessage >> useOnce [

	self use: 1
]

{ #category : #'usage specs' }
MockExpectedMessage >> useTwice [

	self use: 2
]

{ #category : #conditions }
MockExpectedMessage >> when: subjectBlock is: aSpecOfOBjectState [
	conditionsSpec addSpec: (SpecOfMessageSendCondition of: subjectBlock by: aSpecOfOBjectState)
]

{ #category : #conditions }
MockExpectedMessage >> when: subjectBlock satisfy: conditionBlock [
	self when: subjectBlock is: (Satisfying for: conditionBlock)
]

{ #category : #actions }
MockExpectedMessage >> will: anObject [
	actions add: anObject asMockExpectationAction
]

{ #category : #actions }
MockExpectedMessage >> willCallOriginalMethod [
	self will: MockExpectedOriginalMethodCall new
]

{ #category : #actions }
MockExpectedMessage >> willLogMessage [
	self will: MockExpectedMessageLogging new
]

{ #category : #actions }
MockExpectedMessage >> willRaise: anExceptionOrClass [ 
	self will: (MockExpectedException exception: anExceptionOrClass)
]

{ #category : #actions }
MockExpectedMessage >> willReturn: anObject [ 
	self will: (MockExpectedValueReturn value: anObject)
]

{ #category : #actions }
MockExpectedMessage >> willReturnValueFrom: anArray [ 
	self will: (MockExpectedValueForForEachCall values: anArray).
	spec usage maxCount: anArray size
]

{ #category : #actions }
MockExpectedMessage >> willReturnYourself [
	self will: MockExpectedReceiverReturn new
]
