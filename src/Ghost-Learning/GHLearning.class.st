"
I am behaviour of Student which collected all recieved messages as study result. For all intercepted messages I find real method by my  teacher class and execute it. At the end my list of studiedMessages contains all messages which was received during education process.

My users then can install studied messages to ghost meta messages class.
	learning installStudiedMessagesInto:  aMetaMessagesClass
 
I can be created with concrete teacher class: 
	learning := GHLearning by: Object

Internal Representation and Key Implementation Points.

    Instance Variables
	metaLevel:		<GHMetaLevel>
	studiedMessages:		<Dictionary>
	teacher:		<Class>
"
Class {
	#name : #GHLearning,
	#superclass : #GHGhostBehaviour,
	#instVars : [
		'metaLevel',
		'studiedMessages',
		'teacher'
	],
	#category : #'Ghost-Learning'
}

{ #category : #'instance creation' }
GHLearning class >> by: aTeacherClass [

	^self new 
		teacher: aTeacherClass 
]

{ #category : #accessing }
GHLearning >> currentMetaLevel [

	^metaLevel
]

{ #category : #initialization }
GHLearning >> initialize [
	super initialize.
	
	metaLevel := GHMetaLevel empty.
	studiedMessages := Dictionary new.
]

{ #category : #operations }
GHLearning >> installStudiedMessagesInto: aMetaMessagesClass [

	studiedMessages do: [ :each |
		(aMetaMessagesClass includes: each selector) ifFalse: [ 
			aMetaMessagesClass compile: each sourceCode classified: each category ]
	]
]

{ #category : #'message interception' }
GHLearning >> learnMessage: aMessage sentTo: aGhost [

	| sender method learnedMessage |
	sender := thisContext sender.
	[sender notNil and: [ sender receiver ghostClass == GHLearning
			or: [ sender receiver isGhost ] ]] whileTrue: [ sender := sender sender ].
	
	method := teacher lookupSelector: aMessage selector.

	learnedMessage := GHLearnedMessage from: sender method: method.
	studiedMessages at: aMessage selector put: learnedMessage.
	^learnedMessage
]

{ #category : #initialization }
GHLearning >> metaMessages: aMetaMessagesClass [

	metaLevel := GHMetaLevel with: aMetaMessagesClass 

	
]

{ #category : #'message interception' }
GHLearning >> send: aMessage to: aGhost [

	|  learnedMessage |
	learnedMessage := studiedMessages at: aMessage selector ifAbsent: [ nil].
	learnedMessage ifNil: [ 
		learnedMessage := self learnMessage: aMessage sentTo: aGhost].
	
	"here we should explicitly execute method by primitive to not introduce new messages to ghost because it not what it learn"
	^GHMetaMessages executeWith: aGhost andArguments: aMessage arguments method: learnedMessage method
]

{ #category : #accessing }
GHLearning >> studiedMessages [
	^ studiedMessages
]

{ #category : #accessing }
GHLearning >> studiedMessages: anObject [
	studiedMessages := anObject
]

{ #category : #accessing }
GHLearning >> teacher [
	^ teacher
]

{ #category : #accessing }
GHLearning >> teacher: anObject [
	teacher := anObject
]
