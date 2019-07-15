Extension { #name : #FMRepository }

{ #category : #'*Fame-SmalltalkBinding' }
FMRepository >> asMetarepository [
	^ (FMMetaRepository with: FMMetaRepository fm3)
		addAll: elements;
		yourself
]
