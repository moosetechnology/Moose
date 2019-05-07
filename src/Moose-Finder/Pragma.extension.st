Extension { #name : #Pragma }

{ #category : #'*Moose-Finder' }
Pragma >> formatForNavigationPresentation [
	^ (' ' join: ((self argumentAt: 1) piecesCutWhereCamelCase collect: #capitalized)) , ' - '
]
