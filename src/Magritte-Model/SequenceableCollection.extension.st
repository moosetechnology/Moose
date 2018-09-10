Extension { #name : #SequenceableCollection }

{ #category : #'*magritte-model' }
SequenceableCollection >> asAccessor [
	^ MAChainAccessor accessors: self
]

{ #category : #'*magritte-model' }
SequenceableCollection >> moveDown: anObject [
	| first second |
	first := self findFirst: [ :value | value == anObject ].
	second := (first > 0 and: [ first < self size ])
		ifTrue: [ first + 1 ]
		ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second
]

{ #category : #'*magritte-model' }
SequenceableCollection >> moveUp: anObject [
	| first second |

	first := self findFirst: [ :value | value == anObject ].
	second := first > 1 ifTrue: [ first - 1 ] ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second
]
