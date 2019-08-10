Class {
	#name : #FamixPharoSmalltalkGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'access',
		'annotationInstance',
		'annotationInstanceAttribute',
		'annotationType',
		'annotationTypeAttribute',
		'attribute',
		'class',
		'containerEntity',
		'globalVariable',
		'implicitVariable',
		'inheritance',
		'invocation',
		'localVariable',
		'method',
		'namespace',
		'package',
		'parameter',
		'reference',
		'scopingEntity',
		'smalltalkSourceLanguage',
		'unknownVariable',
		'tStructuralEntity'
	],
	#category : #'Famix-PharoSmalltalk-Generator'
}

{ #category : #accessing }
FamixPharoSmalltalkGenerator class >> packageName [

	^ #'Famix-PharoSmalltalk-Entities'
]

{ #category : #accessing }
FamixPharoSmalltalkGenerator class >> prefix [

	^ #'FamixSt'
]

{ #category : #accessing }
FamixPharoSmalltalkGenerator class >> wantsAllEntitiesNavigation [

	^ false
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineClasses [
	super defineClasses.

	access := builder newClassNamed: #Access.
	annotationInstance := builder newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := builder newClassNamed: #AnnotationInstanceAttribute.
	annotationType := builder newClassNamed: #AnnotationType.
	annotationTypeAttribute := builder newClassNamed: #AnnotationTypeAttribute.
	attribute := builder newClassNamed: #Attribute.
	class := builder newClassNamed: #Class.
	containerEntity := builder newClassNamed: #ContainerEntity.
	globalVariable := builder newClassNamed: #GlobalVariable.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	method := builder newClassNamed: #Method.
	namespace := builder newClassNamed: #Namespace.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	reference := builder newClassNamed: #Reference.
	scopingEntity := builder newClassNamed: #ScopingEntity.
	smalltalkSourceLanguage := builder newClassNamed: #SmalltalkSourceLanguage.
	unknownVariable := builder newClassNamed: #UnknownVariable
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineHierarchy [

	super defineHierarchy.

	access --|> association.
	access --|> #TAccess.

	annotationInstance --|> sourcedEntity.
	annotationInstance --|> #TAnnotationInstance.
	annotationInstance --|> #TWithAnnotationInstanceAttributes.
	annotationInstance --|> #TTypedAnnotationInstance.
	annotationInstance --|> #TEntityMetaLevelDependency.
	annotationInstance --|> #TDependencyQueries.

	annotationInstanceAttribute --|> sourcedEntity.
	annotationInstanceAttribute --|> #TAnnotationInstanceAttribute.
	annotationInstanceAttribute --|> #TTypedAnnotationInstanceAttribute.
	annotationInstanceAttribute --|> #TEntityMetaLevelDependency.
	annotationInstanceAttribute --|> #TDependencyQueries.

	annotationType --|> containerEntity.
	annotationType --|> #TAnnotationType.
	annotationType --|> #TWithAttributes.

	annotationTypeAttribute --|> attribute.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.

	attribute --|> namedEntity.
	attribute --|> tStructuralEntity.
	attribute --|> #TAttribute.
	attribute --|> #TWithClassScope.

	class --|> containerEntity.
	class --|> #TWithExceptions.
	class --|> #TClass.
	class --|> #TClassHierarchyNavigation.
	class --|> #TWithTypedStructures.
	
	containerEntity --|> namedEntity.
	containerEntity --|> #TWithTypes.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	globalVariable --|> namedEntity.
	globalVariable --|> tStructuralEntity.
	globalVariable --|> #TGlobalVariable.

	implicitVariable --|> namedEntity.
	implicitVariable --|> tStructuralEntity.
	implicitVariable --|> #TImplicitVariable.

	inheritance --|> association.
	inheritance --|> #TSubInheritance.
	inheritance --|> #TSuperInheritance.

	invocation --|> association.
	invocation --|> #TInvocation.
	invocation --|> #TWithSignature.

	localVariable --|> namedEntity.
	localVariable --|> tStructuralEntity.
	localVariable --|> #TLocalVariable.

	method --|> containerEntity.
	method --|> #TMethod.

	namedEntity --|> #TPackageable.
	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TWithAnnotationInstances.
	namedEntity --|> #TWithModifiers.
	namedEntity --|> #TPossibleStub.

	namespace --|> scopingEntity.
	namespace --|> #TNamespace.
	namespace --|> #TInvocationsReceiver.

	package --|> scopingEntity.
	package --|> #TPackage.
	package --|> #TCohesionCouplingMetrics.

	parameter --|> namedEntity.
	parameter --|> tStructuralEntity.
	parameter --|> #TParameter.

	reference --|> association.
	reference --|> #TReference.

	smalltalkSourceLanguage --|> sourceLanguage.

	scopingEntity --|> containerEntity.
	scopingEntity --|> #TGlobalVariableScope.
	scopingEntity --|> #TScopingEntity.

	tStructuralEntity --|> #TStructuralEntity.

	unknownVariable --|> namedEntity.
	unknownVariable --|> tStructuralEntity.

	sourceAnchor --|> #TWithImmediateSource.
	

	

]

{ #category : #definition }
FamixPharoSmalltalkGenerator >> defineProperties [
	super defineProperties.
	((method property: #protocol type: #String)
		comment: 'Protocol of the method').
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineTraits [
	super defineTraits.
	tStructuralEntity := builder newTraitNamed: #TStructuralEntity
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> newBuilder [

	^ self builderWithStandardTraits
		withImportingContext;
		yourself
		
		
	
]
