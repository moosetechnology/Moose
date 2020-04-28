Extension { #name : #FamixTHasModifiers }

{ #category : #'*Famix-Deprecated' }
FamixTHasModifiers >> addModifier: aString [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use visibility instead.'.
	self visibility: aString
]

{ #category : #'*Famix-Deprecated' }
FamixTHasModifiers >> modifiers [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use visibility instead.'.
	^ { self visibility } asSet
]

{ #category : #'*Famix-Deprecated' }
FamixTHasModifiers >> modifiers: anObject [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use visibility instead.'.
	self visibility: anObject anyOne
]

{ #category : #'*Famix-Deprecated' }
FamixTHasModifiers >> removeModifier: aString [
	self deprecated: 'This property is deprecated from Moose 7.0. Please use visibility instead.'.
	self visibility: nil
]
