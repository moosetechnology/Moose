Trait {
	#name : #FamixTHasModifiers,
	#instVars : [
		'#visibility => FMProperty'
	],
	#category : #'Famix-Traits-Modifiers'
}

{ #category : #meta }
FamixTHasModifiers classSide >> annotation [

	<FMClass: #THasModifiers super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHasModifiers >> bePrivate [
	^ self isPrivate: true
]

{ #category : #accessing }
FamixTHasModifiers >> beProtected [
	^ self isProtected: true
]

{ #category : #accessing }
FamixTHasModifiers >> bePublic [
	^ self isPublic: true
]

{ #category : #accessing }
FamixTHasModifiers >> isFinal [
	<FMProperty: #isFinal type: #Boolean>
	<derived>
	<FMComment: 'Flag true for entities defined as being final. Language dependent.'>
	^ self visibility = #final
]

{ #category : #accessing }
FamixTHasModifiers >> isFinal: aBoolean [
	^ aBoolean
		ifTrue: [ self visibility: #final ]
		ifFalse: [ self ]
]

{ #category : #accessing }
FamixTHasModifiers >> isPackage [
	<FMProperty: #isPackage type: #Boolean>
	<derived>
	<FMComment:
		'Flag true for entities that have a package visibility. Language dependent.'>
	^ self visibility = #package
]

{ #category : #accessing }
FamixTHasModifiers >> isPackage: aBoolean [
	^ aBoolean
		ifTrue: [ self visibility: #package ]
		ifFalse: [ self ]
]

{ #category : #accessing }
FamixTHasModifiers >> isPrivate [
	<FMProperty: #isPrivate type: #Boolean>
	<derived>
	<FMComment:
		'Flag true for entities invisible out of their owner scope. Language dependent.'>
	^ self visibility = #private
]

{ #category : #accessing }
FamixTHasModifiers >> isPrivate: aBoolean [
	^ aBoolean
		ifTrue: [ self visibility: #private ]
		ifFalse: [ self ]
]

{ #category : #accessing }
FamixTHasModifiers >> isProtected [
	<FMProperty: #isProtected type: #Boolean>
	<derived>
	<FMComment: 'Flag true for protected entities, depending on language semantics.'>
	^ self visibility = #protected
]

{ #category : #accessing }
FamixTHasModifiers >> isProtected: aBoolean [
	^ aBoolean
		ifTrue: [ self visibility: #protected ]
		ifFalse: [ self ]
]

{ #category : #accessing }
FamixTHasModifiers >> isPublic [
	<FMProperty: #isPublic type: #Boolean>
	<derived>
	<FMComment: 'Flag true for entities accessible from anywhere. Language dependent.'>
	^ self visibility = #public
]

{ #category : #accessing }
FamixTHasModifiers >> isPublic: aBoolean [
	^ aBoolean
		ifTrue: [ self visibility: #public ]
		ifFalse: [ self ]
]

{ #category : #accessing }
FamixTHasModifiers >> visibility [

	<FMProperty: #visibility type: #String>
	<generated>
	<FMComment: 'Generic container for language dependent visibility(public, private, protected, default, ...).'>
	^ visibility
]

{ #category : #accessing }
FamixTHasModifiers >> visibility: anObject [
	<generated>
	visibility := anObject
]
