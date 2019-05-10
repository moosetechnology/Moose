Extension { #name : #FM3PropertyDescription }

{ #category : #'*Moose-Finder' }
FM3PropertyDescription >> methodClass [
	^ self mmClass implementingClass
]

{ #category : #'*Moose-Finder' }
FM3PropertyDescription >> methodSelector [
	^ self name
]
