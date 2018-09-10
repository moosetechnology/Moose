"
A RTAnnounceableObject is the root of the class hierarchy to have an announcer, useful to define event callbacks.

Instance Variables
	announcer:		<Object>

announcer
	- xxxxx

"
Class {
	#name : #RTAnnounceableObject,
	#superclass : #RTObject,
	#instVars : [
		'announcer',
		'attributes'
	],
	#category : #'Roassal2-Core'
}

{ #category : #adding }
RTAnnounceableObject >> @ anInteractionClassOrInstance [
	"Add an interaction to the node"
	
	self addInteraction: anInteractionClassOrInstance
]

{ #category : #adding }
RTAnnounceableObject >> addInteraction: anInteractionClassOrInstance [
 	anInteractionClassOrInstance initializeElement: self
]

{ #category : #announce }
RTAnnounceableObject >> announce: evt [
	"Announce the event. If a callback for the event evt is defined, then it is executed, with myself as argument."
	| t |
	t := evt asAnnouncement.
	t shape: self trachelShape.
	self announcer announce: evt
]

{ #category : #accessing }
RTAnnounceableObject >> announcer [
	announcer ifNil: [ self announcer: Announcer new ].
	^ announcer
]

{ #category : #accessing }
RTAnnounceableObject >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : #attributes }
RTAnnounceableObject >> attributeAt: aKey [
	^ self attributes at: aKey
]

{ #category : #attributes }
RTAnnounceableObject >> attributeAt: aKey ifAbsent: aBlockClosure [ 
	
	^ self attributes at: aKey ifAbsent: aBlockClosure 
]

{ #category : #attributes }
RTAnnounceableObject >> attributeAt: aKey ifAbsentPut: aBlockClosure [ 
	
	^ self attributes at: aKey ifAbsentPut: aBlockClosure 
]

{ #category : #attributes }
RTAnnounceableObject >> attributeAt: aKey put: value [
	^ self attributes at: aKey put: value
]

{ #category : #attributes }
RTAnnounceableObject >> attributes [
	"Return the list of attributes associated to the element. Attributes are useful for caching values"

	^ attributes ifNil: [ attributes := Dictionary new ]
]

{ #category : #testing }
RTAnnounceableObject >> getInteractionForClass: anInteractionClass [
	"Return the Announcement subscription for the interaction"
	^ self announcer subscriptions getInteractionForClass: anInteractionClass
]

{ #category : #testing }
RTAnnounceableObject >> getInteractionsForClass: anInteractionClass [
	"Return the Announcement subscriptions for the interaction"
	^ self announcer subscriptions getInteractionsForClass: anInteractionClass
]

{ #category : #attributes }
RTAnnounceableObject >> hasAttribute: aKey [ 
	"Return true if attributes includes aKey"
	
	^ attributes notNil and: [ attributes includesKey: aKey ]
]

{ #category : #attributes }
RTAnnounceableObject >> hasAttributes [ 
	"Return true if at least one attributes is present"
	
	^ attributes notNil and: [ attributes notEmpty ]
]

{ #category : #testing }
RTAnnounceableObject >> hasInteraction: anInteractionClass [
	"Return true or false if the receiver has an interaction. Note that the argument has to be an interaction class. And not an event"
	self announcer subscriptions ifNil: [ ^ false ].
	
	^ self announcer subscriptions handleSubscriberClass: anInteractionClass
]

{ #category : #attributes }
RTAnnounceableObject >> hasNotAttribute: aKey [ 
	"Return false if attributes includes aKey"
	
	^ (self hasAttribute: aKey) not 
]

{ #category : #testing }
RTAnnounceableObject >> isEdge [
	^ false
]

{ #category : #testing }
RTAnnounceableObject >> isElement [
	^ false
]

{ #category : #testing }
RTAnnounceableObject >> isView [
	^ false
]

{ #category : #attributes }
RTAnnounceableObject >> removeAttributeAt: aKey [
	^ self attributes removeKey: aKey
]

{ #category : #attributes }
RTAnnounceableObject >> removeAttributeAt: aKey ifAbsent: anErrorBlock [
	^ self attributes removeKey: aKey ifAbsent: anErrorBlock
]

{ #category : #removing }
RTAnnounceableObject >> removeInteractionIfPresent: anInteractionClass [
	"Remove all the callbacks associated to the interaction."
	(self hasInteraction: anInteractionClass) ifFalse: [ ^ self ].
	(self getInteractionsForClass: anInteractionClass) do: [ :int | self announcer unsubscribe: int ]
]

{ #category : #accessing }
RTAnnounceableObject >> resetAnnouncer [
	"Remove all the interaction added in the view"
	self announcer: nil
]

{ #category : #interaction }
RTAnnounceableObject >> when: evt do: aOneArgBlock [
	"Define a callback for the event evt (which could be a class event or an instance of a class event. aOneArgBlock is evaluated whenever the event is received."
	self announcer when: evt do: aOneArgBlock
]
