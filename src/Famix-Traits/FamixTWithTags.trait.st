"
Trait to enable tags on an entity
"
Trait {
	#name : #FamixTWithTags,
	#instVars : [
		'#tags => FMMany type: #FamixTag opposite: #entities'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithTags classSide >> annotation [

	<FMClass: #TWithTags super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithTags >> addTag: anObject [
	<generated>
	^ self tags add: anObject
]

{ #category : #removing }
FamixTWithTags >> removeTag: aTag [
	self tags remove: aTag
]

{ #category : #accessing }
FamixTWithTags >> tags [
	"Relation named: #tags type: #FamixTag opposite: #entities"

	<generated>
	<FMComment: 'List of Tags of this entity'>
	^ tags
]

{ #category : #accessing }
FamixTWithTags >> tags: anObject [

	<generated>
	tags value: anObject
]
