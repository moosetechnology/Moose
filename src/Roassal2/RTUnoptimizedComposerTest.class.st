Class {
	#name : #RTUnoptimizedComposerTest,
	#superclass : #RTComposerTest,
	#category : #'Roassal2-Builder-Composer'
}

{ #category : #running }
RTUnoptimizedComposerTest >> setUp [
	super setUp.
	composer := RTComposer new.
	view := composer view
]
