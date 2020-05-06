Extension { #name : #Object }

{ #category : #'*Moose-Query' }
Object >> entityHasIncomingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
Object >> entityHasOutgoingTypeDeclarations [
	^ false
]

{ #category : #'*Moose-Query' }
Object >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'*Moose-Query' }
Object >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]
