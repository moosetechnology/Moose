Class {
	#name : #FamixJavaGenerator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#instVars : [
		'access',
		'annotationInstance',
		'annotationInstanceAttribute',
		'annotationType',
		'annotationTypeAttribute',
		'attribute',
		'caughtException',
		'class',
		'containerEntity',
		'declaredException',
		'enum',
		'enumValue',
		'exception',
		'globalVariable',
		'implicitVariable',
		'inheritance',
		'invocation',
		'localVariable',
		'method',
		'module',
		'namespace',
		'package',
		'parameter',
		'parameterType',
		'parameterizableClass',
		'primitiveType',
		'reference',
		'scopingEntity',
		'structuralEntity',
		'thrownException',
		'type',
		'unknownVariable',
		'unknownSourceLanguage',
		'parameterizedType'
	],
	#category : #'Famix-Java-Generator'
}

{ #category : #accessing }
FamixJavaGenerator class >> packageName [

	^ #'Famix-Java-Entities'
]

{ #category : #accessing }
FamixJavaGenerator class >> prefix [

	^ #'FamixJava'
]

{ #category : #accessing }
FamixJavaGenerator class >> wantsAllEntitiesNavigation [

	^ false
]

{ #category : #definition }
FamixJavaGenerator >> defineClasses [

	super defineClasses.

	access := builder newClassNamed: #Access.
	annotationInstance := builder newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := builder newClassNamed: #AnnotationInstanceAttribute.
	annotationType := builder newClassNamed: #AnnotationType.
	annotationTypeAttribute := builder newClassNamed: #AnnotationTypeAttribute.
	attribute := builder newClassNamed: #Attribute.
	caughtException := builder newClassNamed: #CaughtException.
	class := builder newClassNamed: #Class.
	containerEntity := builder newClassNamed: #ContainerEntity.
	declaredException := builder newClassNamed: #DeclaredException.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	exception := builder newClassNamed: #Exception.
	globalVariable := builder newClassNamed: #GlobalVariable.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	method := builder newClassNamed: #Method.
	namespace := builder newClassNamed: #Namespace.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	parameterType := builder newClassNamed: #ParameterType.
	parameterizableClass := builder newClassNamed: #ParameterizableClass.
	parameterizedType := builder newClassNamed: #ParameterizedType.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	scopingEntity := builder newClassNamed: #ScopingEntity.
	structuralEntity := builder newClassNamed: #StructuralEntity.
	thrownException := builder newClassNamed: #ThrownException.
	type := builder newClassNamed: #Type.
	unknownSourceLanguage := builder newClassNamed: #UnknownSourceLanguage.
	unknownVariable := builder newClassNamed: #UnknownVariable.
	
	primitiveType withTesting.
	containerEntity withTesting.


]

{ #category : #definition }
FamixJavaGenerator >> defineHierarchy [

	super defineHierarchy.

	entity <|-- exception.
	
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
	annotationInstanceAttribute --|> #TDependencyQueries.

	annotationType --|> type.
	annotationType --|> #TAnnotationType.

	annotationTypeAttribute --|> attribute.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.

	attribute --|> structuralEntity.
	attribute --|> #TAttribute.
	attribute --|> #TWithClassScope.

	method --|> containerEntity.
	method --|> #TMethod.
	method --|> #TWithParameters.
	method --|> #TInvocable.
	method --|> #TWithInvocations.
	method --|> #TWithReferences.
	method --|> #TTypedStructure.
	method --|> #TWithAccesses.
	method --|> #TWithLocalVariables.
	method --|> #TWithImplicitVariables.
	method --|> #TWithSignature.
	method --|> #TWithThrownExceptions.
	method --|> #TWithDeclaredExceptions.
	method --|> #TWithCaughtExceptions.
	method --|> #TWithClassScope.
	method --|> #TWithStatements.

	caughtException --|> exception.
	caughtException --|> #TCaughtException.

	class --|> type.
	class --|> #TWithExceptions.
	class --|> #TClass.

	containerEntity --|> namedEntity.
	containerEntity --|> #TWithTypes.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	declaredException --|> exception.
	declaredException --|> #TDeclaredException.

	enum --|> type.
	enum --|> #TWithEnumValues.

	enumValue --|> structuralEntity.
	enumValue --|> #TEnumValue.

	exception --|> #TException.

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

	parameterType --|> type.

	parameterizableClass --|> class.
	parameterizableClass --|> #TWithParameterizedTypes.

	parameterizedType --|> type.
	parameterizedType --|> #TParameterizedType.
	parameterizedType --|> #TWithParameterizedTypeUsers.

	primitiveType --|> type.

	reference --|> association.
	reference --|> #TReference.

	scopingEntity --|> containerEntity.
	scopingEntity --|> #TGlobalVariableScope.
	scopingEntity --|> #TScopingEntity.

	structuralEntity --|> namedEntity.
	structuralEntity --|> #TAccessible.
	structuralEntity --|> #TWithDereferencedInvocations.
	structuralEntity --|> #TTypedStructure.

	thrownException --|> exception.
	thrownException --|> #TThrownException.

	type --|> containerEntity.
	type --|> #TType.
	type --|> #TReferenceable.
	type --|> #TWithTypedStructures.
	type --|> #TWithTypeAliases.
	type --|> #TWithMethods.
	type --|> #TWithSuperInheritances.
	type --|> #TWithSubInheritances.
	type --|> #TWithAttributes.
	type --|> #TParameterizedTypeUser.
	type --|> #TClassHierarchyNavigation. 

	unknownSourceLanguage --|> entity.
	unknownSourceLanguage --|> #TSourceLanguage.

	unknownVariable --|> structuralEntity.
	


]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [

	^ self builderWithStandardTraits
		withImportingContext;
		yourself
		
		
	
]
