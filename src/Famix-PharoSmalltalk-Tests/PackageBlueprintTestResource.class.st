"
I am a test resource building a FamixStModel with the package blueprint test resource entities.
"
Class {
	#name : #PackageBlueprintTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #setup }
PackageBlueprintTestResource >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-PackageBlueprint-P1';
		addFromPackageNamed: #'Moose-TestResources-PackageBlueprint-P2';
		addFromPackageNamed: #'Moose-TestResources-PackageBlueprint-P3';
		addFromPackageNamed: #'Moose-TestResources-PackageBlueprint-P4';
		run
]
