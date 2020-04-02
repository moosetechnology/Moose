Class {
	#name : #ManifestFamixTagging,
	#superclass : #PackageManifest,
	#category : #'Famix-Tagging-Manifest'
}

{ #category : #asserting }
ManifestFamixTagging class >> shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages [
	^ true
]
