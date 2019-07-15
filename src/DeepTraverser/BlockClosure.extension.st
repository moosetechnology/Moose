Extension { #name : #BlockClosure }

{ #category : #'*DeepTraverser-private' }
BlockClosure >> dtAction: anObject using: aStream [
	self value: anObject
]

{ #category : #'*DeepTraverser-private' }
BlockClosure >> dtActionfrom: fromObject to: toObject using: aStream [
	self value: fromObject value: toObject
]

{ #category : #'*DeepTraverser-private' }
BlockClosure >> dtTraverse: anObject using: aStream [
	(self value: anObject) dtTraverseUsing: aStream
]
