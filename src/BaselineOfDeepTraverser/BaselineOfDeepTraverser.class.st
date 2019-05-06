"
Baseline to load the project DeepTraverser
"
Class {
	#name : #BaselineOfDeepTraverser,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeepTraverser
}

{ #category : #baselines }
BaselineOfDeepTraverser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Packages"
			spec
				package: 'DeepTraverser';
				package: 'DeepTraverser-Examples' with: [ spec requires: #('DeepTraverser') ];
				package: 'DeepTraverser-Tests' with: [ spec requires: #('DeepTraverser') ].
				
			"Groups"
			spec
				group: 'Core' with: #('DeepTraverser');
				group: 'Examples' with: #('DeepTraverser-Examples');
				group: 'Tests' with: #('DeepTraverser-Tests') ]
]
