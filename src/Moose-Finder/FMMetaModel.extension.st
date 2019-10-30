Extension { #name : #FMMetaModel }

{ #category : #'*Moose-Finder' }
FMMetaModel >> allImplementingClasses [
	^ self classes collect: #implementingClass
]
