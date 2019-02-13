Class {
	#name : #RTAutomaticFlowLayout,
	#superclass : #RTInteraction,
	#instVars : [
		'elements'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #'as yet unclassified' }
RTAutomaticFlowLayout >> initialize [
	super initialize.
	elements := #yourself
]

{ #category : #'as yet unclassified' }
RTAutomaticFlowLayout >> initializeElement: view [
	view canvas when: TRResizeCanvasEvent do: [ :evt |
		RTFlowLayout new maxWidth: evt newExtent x; on: (view elements rtValue: elements)
	].
]
