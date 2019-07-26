Class {
	#name : #BaselineOfTalents,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTalents'
}

{ #category : #baselines }
BaselineOfTalents >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Talents' ]
]
