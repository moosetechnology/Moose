Class {
	#name : #RTNullLayout,
	#superclass : #RTLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTNullLayout >> doExecute: elements [
	elements do: [ :e | e translateTo: 0 @ 0 ]
]
