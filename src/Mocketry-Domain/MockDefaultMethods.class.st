"
I am a special class which provide default methods which should be used for unexpected mock messages.

Idea is to simplify mock usage in two scenarios:
- when new domain message is sent to mock
- when trivial Object behaviour is used in code. For example message #-> to mock should return association by default as for any other object. Or many kind of convertion methods like asLink, asOrderedCollection, asString should be processed by default as any other object. It is expected and intuitive behaviour for mock users.

To achieve these goals I lookup method from Object to execute it on mock for given message. If method is not found I just return another new mock as result.
 
But problem is that Object defines huge protocol and there many not trivial methods which could produce undesirable behaviour in context of mocks: 

1) methods which could fail for mock and given arguments. For example Object defines #at: which fails by default (no inst vars). But in case of mock it should be handled as domain message by returning another mock.
To address this problem I catch any error during default method execution and if it fails I return default mock. So result will be same as for new domain messages.

2) some methods can require special logic in context of mock or particular Object methods should not be used at all. For example default #copy method will return just a copy of receiver mock. But we want more clever behaviour where another special mock is returned which indicates that it is a copy. Then during debugging we will explicitly see that some mocks was produced by copy.
To address this problem my instance side methods are used as actual default methods implementation instead of Object. In fact I perform lookup of methods starting at myself and not at Object.
Users can disable particular default method by implementing it on me with error (using ""self disableDefaultMethod""). Then it will lead to case #1) where new default mock will be returned. Default mock always provide information where it was produced
"
Class {
	#name : #MockDefaultMethods,
	#superclass : #Object,
	#category : 'Mocketry-Domain'
}

{ #category : #execution }
MockDefaultMethods class >> execute: anOccurredMessage on: aMock [
	"look at class comment for explanation"
	| defaultMethod |
	defaultMethod := self lookupSelector: anOccurredMessage selector.
	defaultMethod ifNotNil: [
		GHCurrentMetaLevelDepth increaseFor: [ 
			[^GHMetaMessages 
				executeWith: aMock andArguments: anOccurredMessage arguments method: defaultMethod] 
					on: Error do: [ :err | ]].
	].

	^MockForMessageReturn from: anOccurredMessage withBehaviour: aMock ghostBehaviour
]

{ #category : #copying }
MockDefaultMethods >> copy [
	self disableDefaultMethod
]

{ #category : #'error signalling' }
MockDefaultMethods >> disableDefaultMethod [
	self error: 'Sender method should not be used as default for mocks'
]

{ #category : #copying }
MockDefaultMethods >> shallowCopy [
	self disableDefaultMethod
]
