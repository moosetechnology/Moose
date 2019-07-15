"
I implement minimal set of meta messages which define only class, hash and equality
"
Class {
	#name : #GHMinimalMetaMessages,
	#superclass : #GHMetaMessages,
	#category : 'Ghost-ObjectGhost'
}

{ #category : #comparing }
GHMinimalMetaMessages >> = anObject [ 

	^ghost == anObject
]

{ #category : #comparing }
GHMinimalMetaMessages >> basicIdentityHash [
	^self ghostIdentityHash
]

{ #category : #accessing }
GHMinimalMetaMessages >> basicSize [
	^self ghostSize
]

{ #category : #'class membership' }
GHMinimalMetaMessages >> class [

	^self ghostClass
]

{ #category : #comparing }
GHMinimalMetaMessages >> hash [
	^self identityHash
]

{ #category : #comparing }
GHMinimalMetaMessages >> identityHash [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	 This method must not be overridden, except by SmallInteger.  As of
	 2014, the 32-bit Spur VM has 22 bits of hash and 31-bit SmallIntegers
	 (30 bits + 1 sign bit).  Shifting by 8 will not create large integers.
	
	 Do not override."

	^self basicIdentityHash bitShift: 8
]
