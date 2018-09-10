"
I represent meta level of particular ghost implementation.

I include set of meta messages as explicit GHMetaMessages subclass. All messages which defined on it hierarchy I treat as meta.

Public API and Key Messages

- isMetaMessage: aMessage    
- executeMetaMessage: aMessage on: aGhost 
it executes given meta message by sending it  to metaMessages instance created on given aGhost.

I can be created by 
	GHMetaLevel with: GHEmptyMetaMessages
 
Internal Representation and Key Implementation Points.

    Instance Variables
	metaMessages:		<GHMetaMessages class>
"
Class {
	#name : #GHMetaLevel,
	#superclass : #Object,
	#instVars : [
		'metaMessages'
	],
	#classVars : [
		'Empty',
		'Standard'
	],
	#category : 'Ghost-ObjectGhost'
}

{ #category : #accessing }
GHMetaLevel class >> empty [
	^Empty ifNil: [ Empty := GHMetaLevel with: GHEmptyMetaMessages ]
]

{ #category : #accessing }
GHMetaLevel class >> standard [
	^Standard ifNil: [ Standard := GHMetaLevel with: GHStandardMetaMessages ]
]

{ #category : #'instance creation' }
GHMetaLevel class >> with: aMetaMessagesClass [
	^self new 
		metaMessages: aMetaMessagesClass 
]

{ #category : #operations }
GHMetaLevel >> executeMetaMessage: aMessage on: aGhost [
	
	| metaMessageImplementor |
	metaMessageImplementor := metaMessages for: aGhost.
	
	^metaMessageImplementor executeMetaMessage: aMessage
]

{ #category : #initialize }
GHMetaLevel >> initialize [
	super initialize.
	
	metaMessages := GHEmptyMetaMessages 
]

{ #category : #testing }
GHMetaLevel >> isMetaMessage: aMessage [
	^metaMessages includes: aMessage selector
]

{ #category : #accessing }
GHMetaLevel >> metaMessages [
	^ metaMessages
]

{ #category : #accessing }
GHMetaLevel >> metaMessages: anObject [
	metaMessages := anObject
]
