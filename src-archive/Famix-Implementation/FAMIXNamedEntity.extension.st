Extension { #name : #FAMIXNamedEntity }

{ #category : #'*Famix-Implementation' }
FAMIXNamedEntity >> addModifier: aString [
	modifiers add: aString
]

{ #category : #'*Famix-Implementation' }
FAMIXNamedEntity >> addReceivingInvocation: anInvocation [
	receivingInvocations add: anInvocation
]

{ #category : #'*Famix-Implementation' }
FAMIXNamedEntity >> modifierSet: aBoolean for: aSymbol [
	^ aBoolean ifTrue: [self addModifier: aSymbol] ifFalse: [self removeModifier: aSymbol]
]

{ #category : #'*Famix-Implementation' }
FAMIXNamedEntity >> mooseNameOn: stream [
	self name ifNotNil: [ :n | stream nextPutAll: n ]
]

{ #category : #'*Famix-Implementation' }
FAMIXNamedEntity >> removeModifier: aString [
	modifiers remove: aString ifAbsent: []
]
