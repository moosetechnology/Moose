"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRoelTyperTests,
	#superclass : #PackageManifest,
	#category : #'RoelTyper-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestRoelTyperTests class >> ruleGRTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TypeCollectorTest #methodWithTmpInBlock: #false)) #'2018-11-15T18:15:36.392243+01:00') )
]
