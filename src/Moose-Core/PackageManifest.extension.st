Extension { #name : #PackageManifest }

{ #category : #'*Moose-Core' }
PackageManifest class >> shouldBeIncludedByDefaultInMetamodels [
	"My subclasses returning true will be used during the creation of famix's meta models by default. 
	
	This means that each annotated classes (with Fame's annotations) will be processed by the pragma processor to create a meta model."

	^ false
]
