Extension { #name : #String }

{ #category : #'*Famix-Compatibility-Entities' }
String >> asFAMIXComment [
	^ FAMIXComment content: self
]
