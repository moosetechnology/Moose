"
I am a test resource building a FamixStModel with some of KGB packages used for metrics tests.
"
Class {
	#name : #KGBForMetricsTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #setup }
KGBForMetricsTestResource >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-KGB-P1FullReferencer';
		addFromPackageNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee';
		run
]
