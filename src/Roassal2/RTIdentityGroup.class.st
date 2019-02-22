"
This class is useful to contains objects for which their class have overriden #= (e.g., AST Nodes)
"
Class {
	#name : #RTIdentityGroup,
	#superclass : #RTGroup,
	#category : #'Roassal2-Core'
}

{ #category : #public }
RTIdentityGroup >> elementFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	^ self detect: [ :el | el model == anObject ] ifNone: [ nil ]
]
