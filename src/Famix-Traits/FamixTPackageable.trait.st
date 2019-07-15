Trait {
	#name : #FamixTPackageable,
	#instVars : [
		'#parentPackage => FMOne type: #FamixTPackage opposite: #childEntities'
	],
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTPackageable classSide >> annotation [

	<MSEClass: #TPackageable super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTPackageable classSide >> generatedSlotNames [
	<generated>
	'FamixTPackageable class>>#generatedSlotNames'.
	^ #(parentPackage)
]

{ #category : #generator }
FamixTPackageable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTPackageable >> isExtension [
	^self belongsTo packageScope ~~ self packageScope.
]

{ #category : #accessing }
FamixTPackageable >> packageScope [

	self explicitRequirement
]

{ #category : #accessing }
FamixTPackageable >> parentPackage [

	<generated>
	<MSEComment: 'Package containing the entity in the code structure (if applicable)'>
	<container>

	^ parentPackage
]

{ #category : #accessing }
FamixTPackageable >> parentPackage: anObject [

	<generated>
	parentPackage := anObject

]

{ #category : #navigation }
FamixTPackageable >> parentPackageGroup [

	<generated>
	<navigation: 'ParentPackage'>
	^ MooseGroup
			with: (self parentPackage)
]
