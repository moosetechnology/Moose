Extension { #name : #FM3PropertyDescription }

{ #category : #'*Moose-Finder' }
FM3PropertyDescription >> methodClass [
	^ self implementingClass
]

{ #category : #'*Moose-Finder' }
FM3PropertyDescription >> methodSelector [
	^ self name
]
