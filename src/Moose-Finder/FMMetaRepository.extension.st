Extension { #name : #FMMetaRepository }

{ #category : #'*Moose-Finder' }
FMMetaRepository >> allImplementingClasses [
	^ self classes collect: #implementingClass
]
