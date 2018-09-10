Class {
	#name : #HismoNamespaceVersion,
	#superclass : #HismoEntityVersion,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoNamespaceVersion class >> annotation [
	<MSEClass: #NamespaceVersion super: #HismoEntityVersion>
	<package: #Hismo>
]

{ #category : #properties }
HismoNamespaceVersion >> additionOfNumberOfMethods [
	<MSEProperty: #additionOfNumberOfMethods type: #Number>
	<MSEComment: 'Version addition of number of methods'>

	^self additionOfPropertyNamed: #NOM
]

{ #category : #properties }
HismoNamespaceVersion >> evolutionOfNumberOfClasses [
	<MSEProperty: #evolutionOfNumberOfClasses type: #Number>
	<MSEComment: 'Version evolution of number of classes'>

	^self evolutionOfPropertyNamed: #NOCls
]
