Class {
	#name : #FamixStType,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTType + FamixTWithTypedStructures',
	#classTraits : 'FamixTType classTrait + FamixTWithTypedStructures classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStType class >> annotation [

	<MSEClass: #Type super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStType class >> requirements [

	<generated>
	^ { FamixStContainerEntity }
]

{ #category : #accessing }
FamixStType >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixStType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]
