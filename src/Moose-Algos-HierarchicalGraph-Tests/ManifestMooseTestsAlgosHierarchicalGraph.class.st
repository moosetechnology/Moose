"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMooseTestsAlgosHierarchicalGraph,
	#superclass : #PackageManifest,
	#category : #'Moose-Algos-HierarchicalGraph-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestMooseTestsAlgosHierarchicalGraph class >> ruleRBCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MalHierarchicalGraphTest #setupSimpleTopDownModel #false)) #'2018-11-14T22:35:14.073913+01:00') )
]
