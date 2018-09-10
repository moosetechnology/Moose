"
FAMIXInvocation represents the invocation of a message (signature) on a receiver by a behavioural entity. 
FAMIXInvocation has:
   (i)  sender: the behavioral entity that sends the message;
   (ii) receiver: the structural entity (variable) that receives the message;
   (iii) candidates: the list of potential behavioral entities that are actually being invoked. This is particularly useful for dynamic languages.

In an invocation, From is the sender of the message and To is the list of candidates. For each invocation in the source code, there is one famix invocation created even if it is from the same behavioral entity towards the same variable and the same message. For example in smalltalk, the following code
anObject aSelector.
will produce one invocation association from current method to a variable anObject with candidate aSelector. The list of candidates will also contain all the methods defining a similar signature as aSelector. 

"
Class {
	#name : #FAMIXInvocation,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'sender',
		'receiver',
		'signature',
		'candidates'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXInvocation class >> annotation [
	<MSEClass: #Invocation super: #FAMIXAssociation>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXInvocation >> addCandidate: aBehaviouralEntity [ 
	candidates add: aBehaviouralEntity
]

{ #category : #accessing }
FAMIXInvocation >> candidates [
	<MSEProperty: #candidates type: #FAMIXBehaviouralEntity opposite: #incomingInvocations>
	<multivalued>
	<MSEComment: 'List of candidate behavioural entities for receiving the invocation'>
	<target>
	^ candidates
]

{ #category : #accessing }
FAMIXInvocation >> candidates: aCollection [ 
	candidates nocheckValue: aCollection
]

{ #category : #accessing }
FAMIXInvocation >> from [
	^ self sender
]

{ #category : #accessing }
FAMIXInvocation >> from: aSender [
	self sender: aSender
]

{ #category : #'initialize-release' }
FAMIXInvocation >> initialize [
	super initialize.
	signature := 'nosignature'.
	candidates := FMMultiMultivalueLink on: self opposite: #incomingInvocations
]

{ #category : #accessing }
FAMIXInvocation >> receiver [
	<MSEProperty: #receiver type: #FAMIXNamedEntity opposite: #receivingInvocations>
	<MSEComment: 'Named entity (variable, class...) receiving the invocation. to-side of the association'>
	
	^receiver
]

{ #category : #accessing }
FAMIXInvocation >> receiver: aNamedEntity [
	receiver := FMMultivalueLink on: self
					update: #receivingInvocations
					from: self receiver
					to: aNamedEntity
]

{ #category : #accessing }
FAMIXInvocation >> receiverSourceCode [
	^ self receiver sourceText
]

{ #category : #accessing }
FAMIXInvocation >> receiverSourceCode: aString [
	"CyrilFerlicot: Deprecated the 19 sept 2017"

	self
		deprecated:
			'The source code of the receiver should not be saved as a property. Instead access it via the receiver entity and it should be created as a sourceAnchor in the receiver.'
]

{ #category : #accessing }
FAMIXInvocation >> sender [
	<MSEProperty: #sender type: #FAMIXBehaviouralEntity opposite: #outgoingInvocations>
	<MSEComment: 'Behavioural entity making the call. from-side of the association'>
	<source>
	^sender
]

{ #category : #accessing }
FAMIXInvocation >> sender: aBehaviouralEntity [
	sender := FMMultivalueLink on: self
					update: #outgoingInvocations
					from: self sender
					to: aBehaviouralEntity
]

{ #category : #accessing }
FAMIXInvocation >> signature [
	<MSEProperty: #signature type: #String>
	<MSEComment: 'Signature of the message being sent'>
	
	^signature
]

{ #category : #accessing }
FAMIXInvocation >> signature: aString [

	signature := aString
]

{ #category : #accessing }
FAMIXInvocation >> to [
	^ self candidates
]

{ #category : #accessing }
FAMIXInvocation >> to: aCollCandidates [
	self candidates: aCollCandidates 
]
