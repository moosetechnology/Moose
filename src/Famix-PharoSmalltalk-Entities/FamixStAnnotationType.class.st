Class {
	#name : #FamixStAnnotationType,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTAnnotationType + FamixTWithAttributes',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTWithAttributes classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationType class >> annotation [

	<MSEClass: #AnnotationType super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStAnnotationType class >> requirements [

	<generated>
	^ { FamixStContainerEntity }
]

{ #category : #accessing }
FamixStAnnotationType >> belongsTo [

	<generated>
	^ self annotationTypesContainer

]

{ #category : #accessing }
FamixStAnnotationType >> belongsTo: anObject [

	<generated>
	self annotationTypesContainer: anObject

]

{ #category : #compatibility }
FamixStAnnotationType >> directSubclasses [
	^ OrderedCollection new
]

{ #category : #compatibility }
FamixStAnnotationType >> hierarchyNestingLevel [ 

	^ 1
]
