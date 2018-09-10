"
I am trait for ghost implementations which can not be nil.

Most of my messages (ifNil friends) are never sent to objects because they are special. But I define it here to explicitly mention that NotNilGhost should not intercept them
"
Trait {
	#name : #GHTNotNilGhost,
	#traits : 'GHTMinimalGhost',
	#classTraits : 'GHTMinimalGhost classTrait',
	#category : 'Ghost-ObjectGhost'
}

{ #category : #testing }
GHTNotNilGhost >> ifNil: nilBlock [
	"Return self, or evaluate the block if I'm == nil (q.v.)"

	^ self
]

{ #category : #testing }
GHTNotNilGhost >> ifNil: nilBlock ifNotNil: ifNotNilBlock [
	"Evaluate the block, unless I'm == nil (q.v.)"

	^ ifNotNilBlock cull: self
]

{ #category : #testing }
GHTNotNilGhost >> ifNotNil: ifNotNilBlock [
	"Evaluate the block, unless I'm == nil (q.v.)"

	^ ifNotNilBlock cull: self
]

{ #category : #testing }
GHTNotNilGhost >> ifNotNil: ifNotNilBlock ifNil: nilBlock [ 
	"If I got here, I am not nil, so evaluate the block ifNotNilBlock"

	^ ifNotNilBlock cull: self
]

{ #category : #testing }
GHTNotNilGhost >> isNil [
	"Coerces nil to true and everything else to false."

	^false
]

{ #category : #testing }
GHTNotNilGhost >> isNotNil [
	"Coerces nil to false and everything else to true."

	^true
]

{ #category : #testing }
GHTNotNilGhost >> notNil [
	"Coerces nil to false and everything else to true."

	^true
]
