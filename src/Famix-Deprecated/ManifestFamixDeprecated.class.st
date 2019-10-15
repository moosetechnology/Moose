"
I contain all the deprecated code of Famix and Fame.
"
Class {
	#name : #ManifestFamixDeprecated,
	#superclass : #PackageManifest,
	#category : #'Famix-Deprecated-Manifest'
}

{ #category : #deprecation }
ManifestFamixDeprecated class >> isDeprecated [
	^ true
]

{ #category : #asserting }
ManifestFamixDeprecated class >> shouldBeIncludedByDefaultInMetamodels [
	^ true
]
