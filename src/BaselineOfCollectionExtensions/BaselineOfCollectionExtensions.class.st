Class {
	#name : #BaselineOfCollectionExtensions,
	#superclass : #BaselineOf,
	#category : #BaselineOfCollectionExtensions
}

{ #category : #baselines }
BaselineOfCollectionExtensions >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Packages"
			spec
				package: 'CollectionExtensions';
				package: 'CollectionExtensions-Tests' with: [ spec requires: #('CollectionExtensions') ].
			
			"Groups"
			spec
				group: 'Core' with: #('CollectionExtensions');
				group: 'Tests' with: #('CollectionExtensions-Tests') ]
]

{ #category : #accessing }
BaselineOfCollectionExtensions >> projectClass [
	^ MetacelloCypressBaselineProject
]
