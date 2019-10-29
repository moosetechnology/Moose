"
FAMIXPackageGroup is a MooseGroup containing only FAMIX enities of type FAMIXPackage.
"
Class {
	#name : #FAMIXPackageGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXPackageGroup class >> annotation [
	<FMClass: #PackageGroup super: #MooseGroup>
	<package: #FAMIX>

]

{ #category : #navigation }
FAMIXPackageGroup >> allClasses [

	^ self flatCollect: [:p| p localClasses ]
]

{ #category : #navigation }
FAMIXPackageGroup >> allMethods [

	^ self flatCollect: [:p | p methods ]
]

{ #category : #navigation }
FAMIXPackageGroup >> allPackages [

	^ self
]
