"
AnnotationInstance is an instance of an AnnotationType. It links an AnnotationType to an actual entity.

For example, the following is an annotation instance in Smalltalk.
<primitive: 'primAnyBitFromTo' module:'LargeIntegers'>.

And the following is an AnnotationInstance in Java:
@Test(timeout = 500)

Instance Variables:
	annotatedEntity	<FAMIXEntity>
	annotationType		<FAMIXAnnotationType>
"
Class {
	#name : #FAMIXAnnotationInstance,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'TEntityMetaLevelDependency + TDependencyQueries',
	#classTraits : 'TEntityMetaLevelDependency classTrait + TDependencyQueries classTrait',
	#instVars : [
		'annotatedEntity',
		'annotationType',
		'attributes'
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
FAMIXAnnotationInstance class >> allIncomingAssociationTypes [
   ^ self privateAllIncomingAssociationTypes
]

{ #category : #accessing }
FAMIXAnnotationInstance class >> allOutgoingAssociationTypes [
	^ self privateAllOutgoingAssociationTypes
]

{ #category : #meta }
FAMIXAnnotationInstance class >> annotation [
	<MSEClass: #AnnotationInstance super: #FAMIXSourcedEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXAnnotationInstance >> annotatedEntity [
	<MSEProperty: #annotatedEntity type: #FAMIXNamedEntity opposite: #annotationInstances>
	<MSEComment: 'The NamedEntity on which the annotation occurs.'>
	<container>
	^ annotatedEntity
]

{ #category : #accessing }
FAMIXAnnotationInstance >> annotatedEntity: anEntity [
	annotatedEntity := FMMultivalueLink on: self
					update: #annotationInstances
					from: self annotatedEntity
					to: anEntity
]

{ #category : #accessing }
FAMIXAnnotationInstance >> annotationType [
	<MSEProperty: #annotationType type: #FAMIXAnnotationType opposite: #instances> 
	<MSEComment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). '>
	<container>
	^ annotationType
]

{ #category : #accessing }
FAMIXAnnotationInstance >> annotationType: anAnnotationType [
	annotationType := FMMultivalueLink on: self
					update: #instances
					from: self annotationType
					to: anAnnotationType
]

{ #category : #accessing }
FAMIXAnnotationInstance >> attributes [
	<MSEProperty: #attributes type: #FAMIXAnnotationInstanceAttribute opposite: #parentAnnotationInstance> <multivalued> <derived> 
	<MSEComment: 'This corresponds to the actual values of the attributes in an AnnotationInstance'>
	^ attributes
]

{ #category : #accessing }
FAMIXAnnotationInstance >> attributes: anAnnotationInstanceAttribute [
	attributes value: anAnnotationInstanceAttribute
]

{ #category : #accessing }
FAMIXAnnotationInstance >> belongsTo [
	^ self annotatedEntity
]

{ #category : #'moosequery-queries-incoming' }
FAMIXAnnotationInstance >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'initialize-release' }
FAMIXAnnotationInstance >> initialize [
	super initialize.
	attributes := FMNullMultivalueLink on: self opposite: #parentAnnotationInstance: selector: #attributes
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

{ #category : #'moosequery-queries-outgoing' }
FAMIXAnnotationInstance >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseChefTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]
