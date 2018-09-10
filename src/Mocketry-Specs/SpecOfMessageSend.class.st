"
I specify message send signature. I consist of receiver, selector and arguments specs (as conjunction).

I can be created from MessageSend tempalte:
	SpecOfMessageSend from: aMessageSend

where aMessageSend is supposed to include specs in place of receiver, selector and arguments (objects will be converted to specs anyway).

Public API and Key Messages

- receiver
- selector
- arguments
"
Class {
	#name : #SpecOfMessageSend,
	#superclass : #SpecOfAndConjunction,
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfMessageSend class >> from: aMessageSendTemplateWithSpecs [

	^self new 
		readSpecsFrom: aMessageSendTemplateWithSpecs 

]

{ #category : #accessing }
SpecOfMessageSend >> arguments [
	^(specs last: (specs size - 2)) collect: [ :each | each requiredValue ] 
]

{ #category : #'capturing arguments' }
SpecOfMessageSend >> captureArgumentsFrom: aMessageSend [

	self arguments withIndexDo: [ :argSpec :argIndex | | argValue |
		argValue := aMessageSend arguments at: argIndex.
		argSpec captureValue: argValue]
]

{ #category : #printing }
SpecOfMessageSend >> description [
	^String streamContents: [ :s |
		self printReceiverOn: s.
		s << ' ' << self shouldPrefixPhrase << ' receive '.
		self printMessageOn: s
	]
]

{ #category : #printing }
SpecOfMessageSend >> printArgumentsArrayOn: aStream [

	| args |
	aStream << ${.

	args := self arguments.
	
	args do: [:each |
		each isSimpleValue 
			ifTrue: [ aStream << each asSimpleValue stringForSpecTitle]
			ifFalse: [ aStream << each title ].
		each == args last ifFalse: [ aStream << $.]].	

	aStream << $}.
]

{ #category : #printing }
SpecOfMessageSend >> printMessageOn: aStream [

	self selector isSimpleValue 
			ifTrue: [ self printSimpleMessageOn: aStream ]
			ifFalse: [ 
				aStream << self selector title << ' with '.
				self printArgumentsArrayOn: aStream ]
]

{ #category : #printing }
SpecOfMessageSend >> printReceiverOn: aStream [

	aStream << self receiver printSimpleValue 
]

{ #category : #printing }
SpecOfMessageSend >> printSimpleMessageOn: aStream [

	| selector args |
	selector := self selector asSimpleValue.
	args := self arguments.

	args isEmpty ifTrue: [^ aStream << selector].
	args with: selector keywords do: [:arg :word |
		aStream << word; space.
		arg isSimpleValue 
			ifTrue: [aStream << arg asSimpleValue stringForSpecTitle] 
			ifFalse: [aStream << $( << arg stringForSpecTitle << $)].
		aStream space.
	].
	aStream skip: -1
]

{ #category : #accessing }
SpecOfMessageSend >> readSpecsFrom: aMessageSend [

	specs := OrderedCollection new: 2 + aMessageSend numArgs.
	specs add: (SpecOfMessageReceiver requiredValue: aMessageSend receiver).
	specs add: (	SpecOfMessageSelector requiredValue: aMessageSend selector).
	
	aMessageSend arguments withIndexDo: [:each :i |
		specs add: (each asSpecOfArg: i of: self) ]
]

{ #category : #accessing }
SpecOfMessageSend >> receiver [
	^specs first requiredValue
]

{ #category : #accessing }
SpecOfMessageSend >> receiver: aStateSpec [
	^specs first requiredValue: aStateSpec
]

{ #category : #accessing }
SpecOfMessageSend >> selector [
	^specs second requiredValue
]
