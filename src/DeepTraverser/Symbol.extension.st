Extension { #name : #Symbol }

{ #category : #'*DeepTraverser-private' }
Symbol >> dtAction: anObject using: aStream [
	anObject perform: self
]

{ #category : #'*DeepTraverser-private' }
Symbol >> dtActionfrom: fromObject to: toObject using: aStream [
	fromObject perform: self with: toObject
]

{ #category : #'*DeepTraverser-private' }
Symbol >> dtTraverse: anObject using: aStream [
	(anObject perform: self) dtTraverseUsing: aStream
]
