"
FAMIXClassGroup is a MooseGroup containing only FAMIX enities of type FAMIXClass.
"
Class {
	#name : #FAMIXClassGroup,
	#superclass : #FAMIXTypeGroup,
	#category : #'Famix-Compatibility-Groups'
}

{ #category : #meta }
FAMIXClassGroup class >> annotation [
	<MSEClass: #ClassGroup super: #FAMIXTypeGroup>
	<package: #FAMIX>

]

{ #category : #navigation }
FAMIXClassGroup >> asSmalltalkClassCollection [
	^(self
		collect:
			[:each | 
			MooseUtilities
				smalltalkClassFromFamixClassName: each mooseName
				ifAbsent: [nil]]) select: #notNil
]
