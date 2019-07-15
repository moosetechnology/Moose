Extension { #name : #Integer }

{ #category : #'*grease-core' }
Integer >> greaseInteger [
	^ self
]

{ #category : #'*grease-core' }
Integer >> pluralize: aSingularString [ 
	^ self 
		pluralize: aSingularString
		with: (GRInflector pluralize: aSingularString)
]

{ #category : #'*grease-core' }
Integer >> pluralize: aSingularString with: aPluralString [
	^ self printString , ' ' , (self abs = 1 ifTrue: [ aSingularString ] ifFalse: [ aPluralString ])
]
