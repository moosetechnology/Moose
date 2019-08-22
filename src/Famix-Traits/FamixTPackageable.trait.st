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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTPackageable >> isExtension [
	^ (self belongsTo atScope: FamixTPackage) ~= (self atScope: FamixTPackage)
]

{ #category : #accessing }
FamixTPackageable >> parentPackage [
	"Relation named: #parentPackage type: #FamixTPackage opposite: #childEntities"

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
	^ MooseGroup with: self parentPackage
]
