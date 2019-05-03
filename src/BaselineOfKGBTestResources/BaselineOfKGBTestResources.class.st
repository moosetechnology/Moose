"
Baseline for KGBTestRessource 
"
Class {
	#name : #BaselineOfKGBTestResources,
	#superclass : #BaselineOf,
	#category : #BaselineOfKGBTestResources
}

{ #category : #baselines }
BaselineOfKGBTestResources >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'Moose-TestResources-KGB-P1FullReferencer';
				package: 'Moose-TestResources-KGB-P2InteractedReferencerReferee';
				package: 'Moose-TestResources-KGB-P3InteractedReferencer';
				package: 'Moose-TestResources-KGB-P4FullInteracted';
				package: 'Moose-TestResources-KGB-P5FullReferee';
				package: 'Moose-TestResources-KGB-P6InteractedReferee';
				package: 'Moose-TestResources-KGB-P7ReferencerReferee';
				package: 'Moose-TestResources-KGB-P8FullReferencer';
				package: 'Moose-TestResources-KGB-P9FullReferencer';
				package: 'Moose-TestResources-KGB-P10InteractedReferee';
				package: 'Moose-TestResources-KGB-P11FullReferee';
				package: 'Moose-TestResources-KGB-P12FullReferencer';
				package: 'Moose-TestResources-KGB-P13FullReferencer';
				package: 'Moose-TestResources-KGB-P14FullReferee';
				package: 'Moose-TestResources-KGB-PExtensions' ]
]

{ #category : #accessing }
BaselineOfKGBTestResources >> project [
	^ super project
		loadType: #atomic;
		yourself
]
