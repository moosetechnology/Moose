"
FAMIXAnnotationType represents the type of an annotation. In some languages, Java and C#, an annotation as an explicit type. An AnnotationType can have a container in which it resides.

Instance Variables:
	instances	<(FMMultivalueLink of: FAMIXAnnotationInstance)>
	container	<FAMIXContainerEntity>
"
Class {
	#name : #FAMIXAnnotationType,
	#superclass : #FAMIXType,
	#instVars : [
		'instances'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXAnnotationType class >> annotation [
	<MSEClass: #AnnotationType super: #FAMIXType>
	<package: #FAMIX>
]

{ #category : #'accessing-query' }
FAMIXAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'accessing-query' }
FAMIXAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FAMIXAnnotationType >> belongsTo [
	^ container
]

{ #category : #accessing }
FAMIXAnnotationType >> container [
	<MSEProperty: #container type: #FAMIXContainerEntity opposite: #definedAnnotationTypes> 
	<MSEComment: 'Container in which an AnnotationType may reside'>
	<container>
	
	^ container
]

{ #category : #accessing }
FAMIXAnnotationType >> container: aContainer [
	container := FMMultivalueLink
		on: self
		update: #definedAnnotationTypes
		from: self container
		to: aContainer.
	self resetMooseName
]

{ #category : #'initialize-release' }
FAMIXAnnotationType >> initialize [
	super initialize.
	instances := FMNullMultivalueLink 
		on: self
		opposite: #annotationType:
		selector: #instances.
	attributes := FMNullMultivalueLink 
		on: self
		opposite: #parentAnnotationType:
		selector: #attributes.


]

{ #category : #accessing }
FAMIXAnnotationType >> instances [
	<MSEProperty: #instances type: #FAMIXAnnotationInstance opposite: #annotationType> <multivalued> <derived> 
	<MSEComment: 'Annotations of this type'>
	^ instances
]

{ #category : #accessing }
FAMIXAnnotationType >> instances: anAnnotationInstance [
	instances value: anAnnotationInstance
]
