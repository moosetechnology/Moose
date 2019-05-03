"
Description
--------------------

BaselineOfReferenceTestResources
"
Class {
	#name : #BaselineOfReferenceTestResources,
	#superclass : #BaselineOf,
	#category : #BaselineOfReferenceTestResources
}

{ #category : #baseline }
BaselineOfReferenceTestResources >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Packages"
			spec
				package: 'Moose-TestResources-Reference-External';
				package: 'Moose-TestResources-Reference-Core';
				package: 'Moose-TestResources-Reference-PackageOne' with: [ spec requires: #('Moose-TestResources-Reference-Core') ];
				package: 'Moose-TestResources-Reference-PackageTwo' with: [ spec requires: #('Moose-TestResources-Reference-PackageOne' 'Moose-TestResources-Reference-External') ] ]
]
