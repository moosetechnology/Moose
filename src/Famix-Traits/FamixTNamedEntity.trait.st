Trait {
	#name : #FamixTNamedEntity,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Famix-Traits-Named'
}

{ #category : #meta }
FamixTNamedEntity classSide >> annotation [

	<FMClass: #TNamedEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTNamedEntity classSide >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
FamixTNamedEntity >> hasUniqueMooseNameInModel [
	" all subclasses should call the method: 'resetMooseName' if a change causes the moosename to change "
	^ true
]

{ #category : #printing }
FamixTNamedEntity >> mooseNameOn: stream [
	self name ifNotNil: [ :n | stream nextPutAll: n ]
]

{ #category : #accessing }
FamixTNamedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	<FMComment: 'Basic name of the entity, not full reference.'>
	^ name
]

{ #category : #accessing }
FamixTNamedEntity >> name: anObject [

	name := anObject.
	self resetMooseName

]

{ #category : #accessing }
FamixTNamedEntity >> resetMooseName [
	(super resetMooseName and: [ self class withAllSuperclasses anySatisfy: [ :class | class isComposedBy: TEntityMetaLevelDependency ] ]) ifTrue: [ self children do: [ :entity | entity resetMooseName ] ].
	^ false
]
