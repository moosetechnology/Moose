Trait {
	#name : #FamixTWithPackages,
	#instVars : [
		'#packages => FMMany type: #FamixTPackage opposite: #packageOwner'
	],
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTWithPackages classSide >> annotation [

	<MSEClass: #TWithPackages super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #accessing }
FamixTWithPackages >> addPackage: anObject [
	packages add: anObject

]

{ #category : #accessing }
FamixTWithPackages >> packages [

	<generated>
	^ packages
]

{ #category : #accessing }
FamixTWithPackages >> packages: anObject [

	<generated>
	packages value: anObject

]
