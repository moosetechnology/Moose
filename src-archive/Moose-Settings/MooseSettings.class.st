Class {
	#name : #MooseSettings,
	#superclass : #Object,
	#category : #'Moose-Settings'
}

{ #category : #settings }
MooseSettings class >> mooseSettingsOn: aBuilder [ 
	<moosesettings>
	(aBuilder group: #moose)
		label: 'Moose' translated;  
		description: 'All Moose settings' translated;
		noOrdering
]
