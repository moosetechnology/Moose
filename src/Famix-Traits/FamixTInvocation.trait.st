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
Trait {
	#name : #FamixTInvocation,
	#instVars : [
		'#candidates => FMMany type: #FamixTInvocable opposite: #incomingInvocations',
		'#receiver => FMOne type: #FamixTInvocationsReceiver opposite: #receivingInvocations',
		'#sender => FMOne type: #FamixTWithInvocations opposite: #outgoingInvocations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTInvocation classSide >> famixTInvocationRelatedGroup [

	<mooseGroup>
	
	^ FAMIXInvocationGroup
]

{ #category : #adding }
FamixTInvocation >> addCandidate: aBehaviouralEntity [ 
	candidates add: aBehaviouralEntity
]

{ #category : #accessing }
FamixTInvocation >> anyCandidate [
	^self candidates isEmpty
		ifFalse: [self candidates at: 1]
		ifTrue: [nil]
]

{ #category : #accessing }
FamixTInvocation >> candidates [
	"Relation named: #candidates type: #FamixTInvocable opposite: #incomingInvocations"

	<generated>
	<FMComment: 'List of candidate behavioural entities for receiving the invocation'>
	<target>
	^ candidates
]

{ #category : #accessing }
FamixTInvocation >> candidates: anObject [

	<generated>
	candidates value: anObject
]

{ #category : #testing }
FamixTInvocation >> isInvocation [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTInvocation >> receiver [
	"Relation named: #receiver type: #FamixTInvocationsReceiver opposite: #receivingInvocations"

	<generated>
	<FMComment: 'Named entity (variable, class...) receiving the invocation. to-side of the association'>
	^ receiver
]

{ #category : #accessing }
FamixTInvocation >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : #accessing }
FamixTInvocation >> sender [
	"Relation named: #sender type: #FamixTWithInvocations opposite: #outgoingInvocations"

	<generated>
	<FMComment: 'Behavioural entity making the call. from-side of the association'>
	<source>
	^ sender
]

{ #category : #accessing }
FamixTInvocation >> sender: anObject [

	<generated>
	sender := anObject
]

{ #category : #accessing }
FamixTInvocation >> source [
	^ self sender
]

{ #category : #accessing }
FamixTInvocation >> source: aSender [
	self sender: aSender
]

{ #category : #accessing }
FamixTInvocation >> target [
	^ self candidates
]

{ #category : #accessing }
FamixTInvocation >> target: aCollCandidates [
	self candidates: aCollCandidates 
]
