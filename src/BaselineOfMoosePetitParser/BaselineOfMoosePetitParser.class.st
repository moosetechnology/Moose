"
This baseline claims Petitparser packages. Define the minimal requirements relationships. It does also provides groups for loading with and without UI
"
Class {
	#name : #BaselineOfMoosePetitParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoosePetitParser
}

{ #category : #baselines }
BaselineOfMoosePetitParser >> baseline: spec [
	<baseline>
	spec
		package: 'PetitParser';
		package: 'PetitTests' with: [ spec requires: #(PetitParser) ];
		package: 'PetitAnalyzer' with: [ spec requires: #(PetitParser) ];
		package: 'PetitMSE' with: [ spec requires: #(PetitParser) ];
		package: 'PetitGui'
			with: [ spec requires: #(MooseRoassal PetitAnalyzer) ].
	spec group: #default with: #(PetitParser PetitMSE).
	spec group: #UI with: #(default PetitGui)
]

{ #category : #baselines }
BaselineOfMoosePetitParser >> baselineRoassal2: spec [
	spec baseline: 'MooseRoassal' with: [ spec repository:  self packageRepositoryURL. ]
]
