"
This class is a limited read stream adapter that will not read beyond a limit. Position changes are limited so you can only move forward as many positions as the limit allows, and moving backwards increases the number of objects that can be read.
"
Class {
	#name : #XMLLimitedReadStreamAdapter,
	#superclass : #XMLReadStreamAdapter,
	#instVars : [
		'limit'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #accessing }
XMLLimitedReadStreamAdapter class >> defaultLimit [
	^ 1014
]

{ #category : #'instance creation' }
XMLLimitedReadStreamAdapter class >> on: aStream [
	^ self
		on: aStream
		limit: self defaultLimit
]

{ #category : #'instance creation' }
XMLLimitedReadStreamAdapter class >> on: aStream limit: aLimit [
	^ (self basicOn: aStream)
		limit: aLimit
]

{ #category : #testing }
XMLLimitedReadStreamAdapter >> atEnd [
	^ stream atEnd
		or: [limit <= 0]
]

{ #category : #testing }
XMLLimitedReadStreamAdapter >> atLimitedEnd [
	^ limit <= 0
		and: [stream atEnd not]
]

{ #category : #accessing }
XMLLimitedReadStreamAdapter >> limit [
	^ limit
]

{ #category : #accessing }
XMLLimitedReadStreamAdapter >> limit: anInteger [
	limit := anInteger
]

{ #category : #accessing }
XMLLimitedReadStreamAdapter >> next [
	(stream atEnd
		or: [limit <= 0])
		ifTrue: [^ nil]
		ifFalse: [
			limit := limit - 1.
			^ stream next]
]

{ #category : #accessing }
XMLLimitedReadStreamAdapter >> peek [
	(stream atEnd
		or: [limit <= 0])
		ifTrue: [^ nil]
		ifFalse: [^ stream peek]
]

{ #category : #positioning }
XMLLimitedReadStreamAdapter >> position: anInteger [
	| netPosition |

	(netPosition := anInteger - stream position) > limit
		ifTrue: [
			"skip as far ahead as allowed"
			self skip: limit]
		ifFalse: [
			limit := (limit - netPosition) max: 0.
			stream position: anInteger]
]

{ #category : #positioning }
XMLLimitedReadStreamAdapter >> reset [
	| oldPosition |

	oldPosition := stream position.
	stream reset.
	limit := limit + (oldPosition - stream position).
]
