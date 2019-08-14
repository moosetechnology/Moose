Class {
	#name : #FAMIXAnnotationInstanceAttribute,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationInstanceAttribute class >> annotation [

	<MSEClass: #AnnotationInstanceAttribute super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXAnnotationInstanceAttribute class >> requirements [

	<generated>
	^ { FAMIXAnnotationInstance }
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> belongsTo [

	<generated>
	^ self parentAnnotationInstance

]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> belongsTo: anObject [

	<generated>
	self parentAnnotationInstance: anObject

]

{ #category : #'as yet unclassified' }
FAMIXAnnotationInstanceAttribute >> name [ 
	^ self annotationTypeAttribute notNil 
		ifTrue: [ self annotationTypeAttribute name ]
		ifFalse: [ nil ]
]
