"
Baseline for PackageBlueprintTestResources
"
Class {
	#name : #BaselineOfPackageBlueprintTestResources,
	#superclass : #BaselineOf,
	#category : #BaselineOfPackageBlueprintTestResources
}

{ #category : #baselines }
BaselineOfPackageBlueprintTestResources >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Packages"
			spec
				package: 'Moose-TestResources-PackageBlueprint-P1' with: [ spec requires: #('Moose-TestResources-PackageBlueprint-P2' 'Moose-TestResources-PackageBlueprint-P3' 'Moose-TestResources-PackageBlueprint-P4') ];
				package: 'Moose-TestResources-PackageBlueprint-P2';
				package: 'Moose-TestResources-PackageBlueprint-P3';
				package: 'Moose-TestResources-PackageBlueprint-P4' with: [ spec requires: #('Moose-TestResources-PackageBlueprint-P3') ] ]
]
