Class {
	#name : #GHStudentTests,
	#superclass : #GHGhostTestCase,
	#instVars : [
		'teacher'
	],
	#category : #'Ghost-Learning-Tests'
}

{ #category : #running }
GHStudentTests >> ghostClass [
	^GHStudent 
]

{ #category : #running }
GHStudentTests >> setUp [
	super setUp.
	
	ghost teacher: GHTeacherStub.
	teacher := GHTeacherStub new
]

{ #category : #tests }
GHStudentTests >> testInstallingStudiedMessages [
	
	| class |
	class := GHMetaMessages newAnonymousSubclass.
	ghost someMessage.
	ghost printString.

	[ghost learning installStudiedMessagesInto: class] on: AuthorNameRequest  do: [:err | err resume: nil].
	
	self assert: (class includesSelector: #someMessage).
	self assert: (class includesSelector: #printString)
]

{ #category : #tests }
GHStudentTests >> testLearningMessageFromObject [

	| actual |

	actual := ghost printString.
	
	self assert: actual equals: 'a GHStudent'
]

{ #category : #tests }
GHStudentTests >> testLearningMessageShouldAddItToStudiedMessages [
	
	| actual |
	ghost someMessage.
	
	actual := ghost learning studiedMessages at: #someMessage.
	
	self assert: actual method equals: GHTeacherStub >> #someMessage.
	self assert: actual firstSender equals: thisContext
]

{ #category : #tests }
GHStudentTests >> testLearningMessageShouldExecuteIt [

	| expected actual |
	expected := teacher someMessage.
	
	actual := ghost someMessage.
	
	self assert: actual equals: expected
]
