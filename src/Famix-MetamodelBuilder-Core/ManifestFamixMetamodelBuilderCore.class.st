"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFamixMetamodelBuilderCore,
	#superclass : #PackageManifest,
	#category : #'Famix-MetamodelBuilder-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestFamixMetamodelBuilderCore class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FamixMetamodelGeneratorCleanGeneratedStrategy #cleanBeforeGeneration: #false)) #'2019-05-29T15:24:14.318913+02:00') )
]
