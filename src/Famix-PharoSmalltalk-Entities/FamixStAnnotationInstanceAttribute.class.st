Class {
	#name : #FamixStAnnotationInstanceAttribute,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationInstanceAttribute class >> annotation [

	<FMClass: #AnnotationInstanceAttribute super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStAnnotationInstanceAttribute class >> requirements [

	<generated>
	^ { FamixStAnnotationInstance }
]

{ #category : #accessing }
FamixStAnnotationInstanceAttribute >> name [ 
	^ self annotationTypeAttribute notNil 
		ifTrue: [ self annotationTypeAttribute name ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
FamixStAnnotationInstanceAttribute >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]
