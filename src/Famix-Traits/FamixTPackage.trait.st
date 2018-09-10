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

	<MSEClass: #TPackage super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTPackage classSide >> generatedSlotNames [
	<generated>
	'FamixTPackage class>>#generatedSlotNames'.
	^ #(childEntities packageOwner)
]

{ #category : #generator }
FamixTPackage classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTPackage >> childEntities [

	<generated>
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

	<generated>
	^ packageOwner
]

{ #category : #accessing }
FamixTPackage >> packageOwner: anObject [

	<generated>
	packageOwner := anObject

]

{ #category : #accessing }
FamixTPackage >> packageScope [

	^ self
]
