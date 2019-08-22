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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithPackages >> addPackage: anObject [
	packages add: anObject

]

{ #category : #accessing }
FamixTWithPackages >> packages [
	"Relation named: #packages type: #FamixTPackage opposite: #packageOwner"

	<generated>
	^ packages
]

{ #category : #accessing }
FamixTWithPackages >> packages: anObject [

	<generated>
	packages value: anObject

]
