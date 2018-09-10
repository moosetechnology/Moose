Extension { #name : #Collection }

{ #category : #'*DeepTraverser-private' }
Collection >> dtTraverseStartUsing: aStream [
	self do: [ :each | each dtTraverseStartUsing: aStream ]
]

{ #category : #'*DeepTraverser-private' }
Collection >> dtTraverseUsing: aStream [
	self do: [ :each | each dtTraverseUsing: aStream ]
]
