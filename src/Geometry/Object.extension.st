Extension { #name : #Object }

{ #category : #'*Geometry' }
Object >> <~ other [
	^ (self greaterOrDifferentThan: other) not
]

{ #category : #'*Geometry' }
Object >> >~ other [
	^ other <~ self
]

{ #category : #'*Geometry' }
Object >> greaterOrDifferentThan: other [
	^ other lesserOrDifferentThan: self
]

{ #category : #'*Geometry' }
Object >> lesserOrDifferentThan: other [
	^ self < other or: [ self =~ other ]
]
