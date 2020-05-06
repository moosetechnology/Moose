Extension { #name : #MooseEntity }

{ #category : #'*Moose-Query' }
MooseEntity >> entityHasIncomingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
MooseEntity >> entityHasOutgoingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
MooseEntity >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'*Moose-Query' }
MooseEntity >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]
