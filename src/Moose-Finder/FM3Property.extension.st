Extension { #name : #FM3Property }

{ #category : #'*Moose-Finder' }
FM3Property >> methodClass [
	^ self implementingClass
]

{ #category : #'*Moose-Finder' }
FM3Property >> methodSelector [
	^ self name
]
