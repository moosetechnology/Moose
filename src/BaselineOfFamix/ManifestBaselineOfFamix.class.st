"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfFamix,
	#superclass : #PackageManifest,
	#category : #'BaselineOfFamix-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfFamix class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfFamix #baseline: #false)) #'2018-11-21T15:44:33.994206+01:00') )
]
