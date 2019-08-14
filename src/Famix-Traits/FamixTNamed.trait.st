Trait {
	#name : #FamixTNamed,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Famix-Traits-Named'
}

{ #category : #meta }
FamixTNamed classSide >> annotation [

	<MSEClass: #TNamed super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTNamed classSide >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #testing }
FamixTNamed >> hasUniqueMooseNameInModel [
	" all subclasses should call the method: 'resetMooseName' if a change causes the moosename to change "
	^ true
]

{ #category : #printing }
FamixTNamed >> mooseNameOn: stream [
	self name ifNotNil: [ :n | stream nextPutAll: n ]
]

{ #category : #accessing }
FamixTNamed >> name [

	<MSEProperty: #name type: #String>
	<generated>
	<MSEComment: 'Basic name of the entity, not full reference.'>
	^ name
]

{ #category : #accessing }
FamixTNamed >> name: anObject [

	name := anObject.
	self resetMooseName

]

{ #category : #accessing }
FamixTNamed >> resetMooseName [
	super resetMooseName ifTrue: [ self children do: [ :entity | entity resetMooseName ] ].
	^ false
]
