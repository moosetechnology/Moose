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
		'structuralEntity',
		'scopingEntity',
		'smalltalkSourceLanguage',
		'type',
		'unknownSourceLanguage',
		'unknownVariable'
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
FamixPharoSmalltalkGenerator class >> submetamodels [ 
	^ { FamixCompatibilityGenerator }
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
	structuralEntity := builder newClassNamed: #StructuralEntity.
	smalltalkSourceLanguage := builder newClassNamed: #SmalltalkSourceLanguage.
	type := builder newClassNamed: #Type.
	unknownSourceLanguage := builder newClassNamed: #UnknownSourceLanguage.
	unknownVariable := builder newClassNamed: #UnknownVariable.
		
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

	annotationType --|> type.
	annotationType --|> #TAnnotationType.

	annotationTypeAttribute --|> attribute.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.

	attribute --|> structuralEntity.
	attribute --|> #TAttribute.
	attribute --|> #TWithClassScope.

	class --|> type.
	class --|> #TWithExceptions.
	class --|> #TClass.
	class --|> #TWithMethods.
	class --|> #TWithSuperInheritances.
	class --|> #TWithSubInheritances.
	class --|> #TClassHierarchyNavigation.
	
	containerEntity --|> namedEntity.
	containerEntity --|> #TWithTypes.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	globalVariable --|> structuralEntity.
	globalVariable --|> #TGlobalVariable.

	implicitVariable --|> structuralEntity.
	implicitVariable --|> #TImplicitVariable.

	inheritance --|> association.
	inheritance --|> #TSubInheritance.
	inheritance --|> #TSuperInheritance.

	invocation --|> association.
	invocation --|> #TInvocation.
	invocation --|> #TWithSignature.

	localVariable --|> structuralEntity.
	localVariable --|> #TLocalVariable.

	method --|> containerEntity.
	method --|> #TWithParameters.
	method --|> #TInvocable.
	method --|> #TWithInvocations.
	method --|> #TWithReferences.
	method --|> #TWithAccesses.
	method --|> #TWithLocalVariables.
	method --|> #TWithImplicitVariables.
	method --|> #TWithSignature.
	method --|> #TMethod.
	method --|> #TWithClassScope.
	method --|> #TTypedStructure.

	namedEntity --|> #TPackageable.
	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TWithAnnotationInstances.
	namedEntity --|> #TWithModifiers.
	namedEntity --|> #TPossibleStub.

	namespace --|> scopingEntity.
	namespace --|> #TNamespace.

	package --|> scopingEntity.
	package --|> #TPackage.

	parameter --|> structuralEntity.
	parameter --|> #TParameter.

	reference --|> association.
	reference --|> #TReference.

	smalltalkSourceLanguage --|> sourceLanguage.

	scopingEntity --|> containerEntity.
	scopingEntity --|> #TGlobalVariableScope.
	scopingEntity --|> #TScopingEntity.

	structuralEntity --|> namedEntity.
	structuralEntity --|> #TAccessible.
	structuralEntity --|> #TTypedStructure.

	type --|> containerEntity.
	type --|> #TType.
	type --|> #TReferenceable.
	type --|> #TWithAttributes.
	type --|> #TWithTypedStructures.

	unknownSourceLanguage --|> sourceLanguage.

	unknownVariable --|> structuralEntity.

	sourceAnchor --|> #TWithImmediateSource.
	

	

]

{ #category : #definition }
FamixPharoSmalltalkGenerator >> defineProperties [
	super defineProperties.
	((method property: #protocol type: #String)
		comment: 'Protocol of the method').
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> newBuilder [

	^ self builderWithStandardTraits
		withImportingContext;
		yourself
		
		
	
]
