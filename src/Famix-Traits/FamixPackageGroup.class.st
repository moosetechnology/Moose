Class {
	#name : #FamixPackageGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixPackageGroup class >> annotation [

	<FMClass: #PackageGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixPackageGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #navigation }
FamixPackageGroup >> allClasses [
	^ self flatCollect: [ :p | p localClasses ]
]

{ #category : #navigation }
FamixPackageGroup >> allMethods [
	^ self flatCollect: [ :p | p methods ]
]

{ #category : #navigation }
FamixPackageGroup >> allPackages [
	^ self
]
