"
Helper class for displaying charts specific for a MessageTally.
"
Class {
	#name : #GTInspectorMessageTallyCharter,
	#superclass : #GLMCompositePresentation,
	#category : #'GT-InspectorExtensions-CoreRoassal'
}

{ #category : #visualization }
GTInspectorMessageTallyCharter >> performanceOf: aMessageTally with: builder in: presentation [
	"Displays a double chart showing the top 20 most costly methods within a MessageTally.
	For each method it sows the number of occurences of a method and the 
	total amount of local tallies for that method. Useful for identifying outliers 
	within one execution."
	
	| all grouped metric |
	metric := #localTally.
	all := aMessageTally deepCollect: [ :each | each sonsOver: 1 ].
	grouped := (all groupedBy: [ :each | String streamContents: [:s | each gtDisplayIdentifierOn: s] ]) 
						associations sorted: [:a :b | 
									(a value sumNumbers: metric) > 
									(b value sumNumbers: metric) ].
	grouped := (grouped first: (20 min: grouped size)) select: [:each | (each value sumNumbers: metric) > 0].
	builder pointName: [ :each | each key ].
	builder points: grouped.
	builder bottomValue: [ :each | each key size ] titled: 'Locations'.
	builder topValue: [ :each | each value sumNumbers: metric ] titled: 'Tallies'
]
