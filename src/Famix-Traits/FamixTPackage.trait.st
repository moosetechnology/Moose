"
FAMIXPackage represents a package in the source language, meaning that it provides a means to group entities without any baring on lexical scoping. 

Java extractors map Java packages to FAMIXNamespaces. They can also mirror the same information in terms of FAMIXPackage instances.
"
Trait {
	#name : #FamixTPackage,
	#instVars : [
		'#childEntities => FMMany type: #FamixTPackageable opposite: #parentPackage',
		'#packageOwner => FMOne type: #FamixTWithPackages opposite: #packages'
	],
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTPackage classSide >> annotation [

	<FMClass: #TPackage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTPackage classSide >> famixTPackageRelatedGroup [

	<mooseGroup>
	
	^ FAMIXPackageGroup
]

{ #category : #accessing }
FamixTPackage >> addChildEntity: anObject [
	childEntities add: anObject

]

{ #category : #accessing }
FamixTPackage >> childEntities [
	"Relation named: #childEntities type: #FamixTPackageable opposite: #parentPackage"

	<generated>
	<derived>
	^ childEntities
]

{ #category : #accessing }
FamixTPackage >> childEntities: anObject [

	<generated>
	childEntities value: anObject
]

{ #category : #testing }
FamixTPackage >> isPackage [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTPackage >> packageOwner [
	"Relation named: #packageOwner type: #FamixTWithPackages opposite: #packages"

	<generated>
	^ packageOwner
]

{ #category : #accessing }
FamixTPackage >> packageOwner: anObject [

	<generated>
	packageOwner := anObject
]

{ #category : #metrics }
FamixTPackage >> weightedMethodCount [
	<FMProperty: #weightedMethodCount type: #Number>
	<FMComment: 'The sum of the complexity in a package'>
	<derived>
	^ self lookUpPropertyNamed: #WMC computedAs: [ (self toScope: FamixTWithMethods) detectSum: #weightedMethodCount ]
]
