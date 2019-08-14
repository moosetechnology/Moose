Class {
	#name : #FAMIXAnnotationInstance,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationInstance class >> annotation [

	<MSEClass: #AnnotationInstance super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXAnnotationInstance class >> requirements [

	<generated>
	^ { FAMIXNamedEntity }
]

{ #category : #accessing }
FAMIXAnnotationInstance >> belongsTo [

	<generated>
	^ self annotatedEntity

]

{ #category : #accessing }
FAMIXAnnotationInstance >> belongsTo: anObject [

	<generated>
	self annotatedEntity: anObject

]

{ #category : #accessing }
FAMIXAnnotationInstance >> mooseNameOn: aStream [
	self annotationType notNil ifTrue: [
		self annotationType mooseNameOn: aStream ].
	aStream nextPut: $(.
	self attributes 
			do: [:each | aStream nextPutAll: each value asString ]
			separatedBy: [aStream nextPut: $,].  
	aStream nextPut: $).
	aStream nextPut: $-.
	self annotatedEntity notNil ifTrue: [
		self annotatedEntity mooseNameOn: aStream ]
]

{ #category : #accessing }
FAMIXAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]

{ #category : #'query dependencies' }
FAMIXAnnotationInstance >> throughAllTo [
	"Collect all the targets of the receiver and its children.
	
	Example:
		aFAMIXMethod throughAllTo.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) throughAllFor: self
]
