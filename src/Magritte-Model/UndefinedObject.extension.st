Extension { #name : #UndefinedObject }

{ #category : #'*Magritte-Model' }
UndefinedObject >> asAccessor [
	^ MANullAccessor new
]

{ #category : #'*Magritte-Model' }
UndefinedObject >> label [
	^ 'n/a'
]

{ #category : #'*Magritte-Model' }
UndefinedObject >> magritteDescription [
	^ MAContainer new
]
