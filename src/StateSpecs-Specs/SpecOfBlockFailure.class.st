"
I describe blocks which raise specific kind of exceptions.

	[ 1 /0 ] should raise: ZeroDivide

My instances can be created by: 

	SpecOfBlockFailure requiredFailure: ZeroDivide.

I also support using specs for required failure:

	SpecOfBlockFailure requiredFailure: (Instance of: Error).		
			
By default I implement special logic to catch unexpected exceptions and return it as special kind of validation falure. For example:

	[ #() at: 1 ] should raise: ZeroDivide 

This code will not show debugger at point of SubscriptOutOfBounds error.  But it will show that specification is failed and SubscriptOutOfBounds was thrown instead of ZeroDivide. Pressing proceed in debugger will move it to original failure. 

To disable this behaviour I have variable shouldPassUnexpectedFailure.
Also I have array of special failures which should be always passed without validation logic. It is Halt, MessageNotUnderstood and SpecOfFailed. Usually this errorrs should be thrown immediatly in debugger. 

	[ 1 someMessage ] should raise: Error

This code will open debugger at DNU method where absent message can be created.
But if errors are explicitly expected failures then they will be checked by validation logic:

	[ 1 someMessage ] should raise: MessageNotUnderstood 

This code will not openes debugger because validation is succeed.

Internal Representation and Key Implementation Points.

    Instance Variables
	requiredFailure:		<SpecOfObjectState>
	passingFailures:		<Collection of<Exception>>
	shouldPassUnexpectedFailures:		<Boolean>

"
Class {
	#name : #SpecOfBlockFailure,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredFailure',
		'shouldPassUnexpectedFailures',
		'passingFailures'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfBlockFailure class >> requiredFailure: anExceptionClass [ 
	^self new requiredFailure: anExceptionClass
]

{ #category : #testing }
SpecOfBlockFailure >> basicMatches: aBlockContext [ 
	^
	[aBlockContext value.
	false] on: Exception
			do: 
				[:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass].
				(requiredFailure matches: ex) ifTrue: [true] ifFalse: [
					shouldPassUnexpectedFailures ifTrue: [ ex pass] ifFalse: [false] ]]
]

{ #category : #displaying }
SpecOfBlockFailure >> defaultTitle [
	^requiredFailure title
]

{ #category : #initialization }
SpecOfBlockFailure >> initialize [
	super initialize.
	
	shouldPassUnexpectedFailures := false.
	passingFailures := {SpecOfFailed. Halt. MessageNotUnderstood. Deprecation} asOrderedCollection
]

{ #category : #accessing }
SpecOfBlockFailure >> invertChildren [
	super invertChildren.
	requiredFailure invert
]

{ #category : #accessing }
SpecOfBlockFailure >> passUnexpectedFailures [
	shouldPassUnexpectedFailures := true
]

{ #category : #accessing }
SpecOfBlockFailure >> requiredFailure [
	^requiredFailure
]

{ #category : #accessing }
SpecOfBlockFailure >> requiredFailure: exceptionClassOrSpec [

	passingFailures remove: exceptionClassOrSpec ifAbsent: [  ]. "if this spec explicitly about passing failure then we should not pass it during validation"
	
	requiredFailure := self specForFailure: exceptionClassOrSpec
]

{ #category : #testing }
SpecOfBlockFailure >> shouldAlwaysPassFailure: anException [
	
	^passingFailures anySatisfy: [ :each | 
		anException isKindOf: each]
]

{ #category : #accessing }
SpecOfBlockFailure >> shouldPassUnexpectedFailures [
	^ shouldPassUnexpectedFailures
]

{ #category : #accessing }
SpecOfBlockFailure >> shouldPassUnexpectedFailures: anObject [
	shouldPassUnexpectedFailures := anObject
]

{ #category : #accessing }
SpecOfBlockFailure >> specForFailure: exceptionClassOrSpec [

	^exceptionClassOrSpec isClass & (exceptionClassOrSpec ~= Any)
		ifTrue: [ SpecOfObjectClass requiredClass: exceptionClassOrSpec ]
		ifFalse: [ exceptionClassOrSpec asStateSpec ]
]

{ #category : #validation }
SpecOfBlockFailure >> validate: aBlock [

	| result |
	^[aBlock value.
	(requiredFailure matches: Any) 
		ifTrue: [ SpecOfValidationResult success ]
		ifFalse: [ SpecOfBlockValidationFailure noErrorIn: aBlock butShouldBe: self]]
			on: Exception do: [:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass]. "we want to pass by default DNU, Halt and internal SpecOfFailed failures"
			
				requiredFailure denial: denial. 
				result := requiredFailure validate: ex.
			
				result isSuccess 
					ifTrue: [ result ] 
					ifFalse: [ 
						shouldPassUnexpectedFailures
							ifTrue: [ ex pass ]
							ifFalse: [ SpecOfBlockValidationFailure unexpectedError: result in: aBlock butShouldBe: self]]
		]
]
