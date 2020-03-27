Class {
	#name : #FamixTPackageGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTPackageGroup class >> annotation [

	<FMClass: #TPackageGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTPackageGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #navigation }
FamixTPackageGroup >> allClasses [

	^ self flatCollect: [:p| p localClasses ]
]

{ #category : #navigation }
FamixTPackageGroup >> allMethods [

	^ self flatCollect: [:p | p methods ]
]

{ #category : #navigation }
FamixTPackageGroup >> allPackages [

	^ self
]
