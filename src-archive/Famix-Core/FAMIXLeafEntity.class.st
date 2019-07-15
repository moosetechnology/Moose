"
FAMIXLeafEntity is the abstract superclass for source code entities that do not have children in Abstract syntax tree. For example, it represents variables of programming languages.


"
Class {
	#name : #FAMIXLeafEntity,
	#superclass : #FAMIXNamedEntity,
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXLeafEntity class >> annotation [
	<MSEClass: #LeafEntity super: #FAMIXNamedEntity>
	<package: #FAMIX>
]
