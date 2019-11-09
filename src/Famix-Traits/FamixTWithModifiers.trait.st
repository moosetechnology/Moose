Trait {
	#name : #FamixTWithModifiers,
	#instVars : [
		'#modifiers => FMProperty'
	],
	#category : #'Famix-Traits-Modifiers'
}

{ #category : #meta }
FamixTWithModifiers classSide >> annotation [

	<FMClass: #TWithModifiers super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FamixTWithModifiers >> addModifier: aString [
	self modifiers add: aString
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> bePrivate [
	^ self isPrivate: true
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> beProtected [
	^ self isProtected: true
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> bePublic [
	^ self isPublic: true
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isAbstract [
	<FMProperty: #isAbstract type: #Boolean> <derived>
	<FMComment: 'Flag true for abstract entities. Language dependent.'>
	
	^ self modifiers includes: #abstract
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isAbstract: aBoolean [
	^ self modifierSet: aBoolean for: #abstract
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isFinal [
	<FMProperty: #isFinal type: #Boolean> <derived>
	<FMComment: 'Flag true for entities defined as being final. Language dependent.'>	

	^ self modifiers includes: #final
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isFinal: aBoolean [
	^ self modifierSet: aBoolean for: #final
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPackage [
	<FMProperty: #isPackage type: #Boolean> <derived>
	<FMComment: 'Flag true for entities that have a package visibility. Language dependent.'>
	
	^ self modifiers includes: #package
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPackage: aBoolean [
	^ self modifierSet: aBoolean for: #package
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPrivate [
	<FMProperty: #isPrivate type: #Boolean> <derived>
	<FMComment: 'Flag true for entities invisible out of their owner scope. Language dependent.'>
	
	^ self modifiers includes: #private
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPrivate: aBoolean [
	^ self modifierSet: aBoolean for: #private
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isProtected [
	<FMProperty: #isProtected type: #Boolean> <derived>
	<FMComment: 'Flag true for protected entities, depending on language semantics.'>
	
	^ self modifiers includes: #protected
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isProtected: aBoolean [
	^ self modifierSet: aBoolean for: #protected
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPublic [
	<FMProperty: #isPublic type: #Boolean> <derived>
	<FMComment: 'Flag true for entities accessible from anywhere. Language dependent.'>	

	^ self modifiers includes: #public
]

{ #category : #'Famix-Extensions' }
FamixTWithModifiers >> isPublic: aBoolean [
	^ self modifierSet: aBoolean for: #public
]

{ #category : #'Famix-Implementation' }
FamixTWithModifiers >> modifierSet: aBoolean for: aSymbol [
	^ aBoolean ifTrue: [self addModifier: aSymbol] ifFalse: [self removeModifier: aSymbol]
]

{ #category : #accessing }
FamixTWithModifiers >> modifiers [

	<FMProperty: #modifiers type: #String>
	<multivalued>
	<FMComment: 'Generic container for language dependent modifiers.'>
	^ modifiers ifNil: [ modifiers := Set new ]
]

{ #category : #accessing }
FamixTWithModifiers >> modifiers: anObject [
	<generated>
	modifiers := anObject
]

{ #category : #'Famix-Implementation' }
FamixTWithModifiers >> removeModifier: aString [
	self modifiers remove: aString ifAbsent: []
]
