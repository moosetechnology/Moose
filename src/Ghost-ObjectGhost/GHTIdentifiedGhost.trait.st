"
I am trait for ghosts which are not required special identity interception because they supposed to be identified as any other objects.
"
Trait {
	#name : #GHTIdentifiedGhost,
	#traits : 'GHTMinimalGhost',
	#classTraits : 'GHTMinimalGhost classTrait',
	#category : 'Ghost-ObjectGhost'
}

{ #category : #comparing }
GHTIdentifiedGhost >> = anObject [ 
	"Answer whether the receiver and the argument represent the same object.
	If = is redefined in any subclass, consider also redefining the message hash."

	^self == anObject
]

{ #category : #comparing }
GHTIdentifiedGhost >> basicIdentityHash [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	This method must not be overridden, except by SmallInteger.
	Primitive. Fails if the receiver is a SmallInteger. Essential.
	See Object documentation whatIsAPrimitive.

	Do not override. Use #identityHash unless you really know what you're doing.'"

	<primitive: 75>
	self primitiveFailed
]

{ #category : #comparing }
GHTIdentifiedGhost >> hash [
	^self identityHash
]

{ #category : #comparing }
GHTIdentifiedGhost >> identityHash [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	 This method must not be overridden, except by SmallInteger.  As of
	 2014, the 32-bit Spur VM has 22 bits of hash and 31-bit SmallIntegers
	 (30 bits + 1 sign bit).  Shifting by 8 will not create large integers.
	
	 Do not override."

	^self basicIdentityHash bitShift: 8
]
