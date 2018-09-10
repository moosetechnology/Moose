Extension { #name : #String }

{ #category : #'*Famix-Extensions' }
String >> asFAMIXComment [
	^ FAMIXComment content: self
]
