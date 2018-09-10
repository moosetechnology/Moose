Trait {
	#name : #FamixTNamed,
	#instVars : [
		'name'
	],
	#category : #'Famix-Traits-Named'
}

{ #category : #meta }
FamixTNamed classSide >> annotation [

	<MSEClass: #TNamed super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTNamed classSide >> generatedSlotNames [
	<generated>
	'FamixTNamed class>>#generatedSlotNames'.
	^ #(name)
]

{ #category : #generator }
FamixTNamed classSide >> generatedTraitNames [
	<generated>
	^ #()
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
	^true
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

{ #category : #'Famix-Extensions' }
FamixTNamed >> nameLength [
	<MSEProperty: #nameLength type: #Number>
	<derived>
	<MSEComment: 'The number of characters in the name'>
	
	^self
		lookUpPropertyNamed: #nameLength
		computedAs: [self name size]
]

{ #category : #'Famix-Extensions' }
FamixTNamed >> nameLength: aNumber [
	
	self privateState propertyAt: #nameLength put: aNumber
]

{ #category : #accessing }
FamixTNamed >> resetMooseName [

	super resetMooseName.
	self children do: [ :entity | entity resetMooseName ]
]
