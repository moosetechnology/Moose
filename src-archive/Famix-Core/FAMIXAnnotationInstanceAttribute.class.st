"
This models the actual value of an attribute in an AnnotationInstance.

In the following AnnotationInstance of Java, timeout is an annotation instance attribute :
@Test(timeout = 500)

Instance Variables:
	parentAnnotationInstance	<FAMIXAnnotationInstance>
	annotationTypeAttribute	<FAMIXAnnotationTypeAttribute>
	value	<Object>
"
Class {
	#name : #FAMIXAnnotationInstanceAttribute,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'TEntityMetaLevelDependency + TDependencyQueries',
	#classTraits : 'TEntityMetaLevelDependency classTrait + TDependencyQueries classTrait',
	#instVars : [
		'parentAnnotationInstance',
		'annotationTypeAttribute',
		'value'
	],
	#classInstVars : [
		'childrenSelectors',
		'allParentTypes',
		'allChildrenTypes',
		'parentSelectors'
	],
	#category : #'Famix-Core'
}

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute class >> allIncomingAssociationTypes [
   ^ self privateAllIncomingAssociationTypes
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute class >> allOutgoingAssociationTypes [
	^ self privateAllOutgoingAssociationTypes
]

{ #category : #meta }
FAMIXAnnotationInstanceAttribute class >> annotation [
	<MSEClass: #AnnotationInstanceAttribute super: #FAMIXSourcedEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> annotationTypeAttribute [
	<MSEProperty: #annotationTypeAttribute type: #FAMIXAnnotationTypeAttribute opposite: #annotationAttributeInstances> 
	<MSEComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> annotationTypeAttribute: anAnnotationTypeAttribute [
	annotationTypeAttribute := FMMultivalueLink on: self
					update: #annotationAttributeInstances
					from: self annotationTypeAttribute
					to: anAnnotationTypeAttribute
]

{ #category : #'moosequery-queries-incoming' }
FAMIXAnnotationInstanceAttribute >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> name [ 
	^ self annotationTypeAttribute notNil 
		ifTrue: [ self annotationTypeAttribute name ]
		ifFalse: [ nil ]
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXAnnotationInstanceAttribute >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> parentAnnotationInstance [
	<MSEProperty: #parentAnnotationInstance type: #FAMIXAnnotationInstance opposite: #attributes> 
	<MSEComment: 'The instance of the annotation in which the attribute is used.'>
	<container>
	^ parentAnnotationInstance
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> parentAnnotationInstance: anAnnotationInstance [
	parentAnnotationInstance := FMMultivalueLink on: self
					update: #attributes
					from: self parentAnnotationInstance  
					to: anAnnotationInstance
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> value [
	<MSEProperty: #value type: #String> 
	<MSEComment: 'Actual value of the attribute used in an annotation'>
	^ value
]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> value: anObject [
	value := anObject
]
