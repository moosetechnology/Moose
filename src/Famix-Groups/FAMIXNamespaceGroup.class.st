"
FAMIXNamespaceGroup is a MooseGroup containing only FAMIX enities of type FAMIXNamespace.
"
Class {
	#name : #FAMIXNamespaceGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXNamespaceGroup class >> annotation [
	<MSEClass: #NamespaceGroup super: #MooseGroup>
	<package: #FAMIX>
]

{ #category : #algorithms }
FAMIXNamespaceGroup >> cyclesToAllProviderNamespaces [
	^ self cyclesToAll: #providerNamespaces
]
