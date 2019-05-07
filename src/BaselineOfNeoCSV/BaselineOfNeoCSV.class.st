"
I am BaselineOfNeoCSV, a way to load the code of the NeoCSV project.
I am a BaselineOf.
"
Class {
	#name : #BaselineOfNeoCSV,
	#superclass : #BaselineOf,
	#category : 'BaselineOfNeoCSV'
}

{ #category : #baselines }
BaselineOfNeoCSV >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'Neo-CSV-Core';
				package: 'Neo-CSV-Tests' with: [ spec requires: #('Neo-CSV-Core') ];
				
				group: 'default' with: #('core' 'tests');
				group: 'core' with: #('Neo-CSV-Core');
				group: 'tests' with: #('Neo-CSV-Tests') ]
]
