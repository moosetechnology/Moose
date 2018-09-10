"
I am process specific variable to count current depth of ghost meta level calls.
I am used to prevent calls from meta level to domain level because domain level is intercepted by ghost but it should not happen during meta level call

- increaseFor: aBlock
it  increases current meta level depth for given block of code
"
Class {
	#name : #GHCurrentMetaLevelDepth,
	#superclass : #ProcessLocalVariable,
	#category : 'Ghost-ObjectGhost'
}

{ #category : #private }
GHCurrentMetaLevelDepth class >> decrease [
	self value: self value - 1
]

{ #category : #evaluating }
GHCurrentMetaLevelDepth class >> decreaseFor: aBlock [

	self decrease.
	^aBlock ensure: [ self increase ]
]

{ #category : #private }
GHCurrentMetaLevelDepth class >> increase [
	self value: self value + 1
]

{ #category : #evaluating }
GHCurrentMetaLevelDepth class >> increaseFor: aBlock [

	self increase.
	^aBlock ensure: [ self decrease ]
]

{ #category : #default }
GHCurrentMetaLevelDepth >> default [
	^0
]
