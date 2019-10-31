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
		'thrownException',
		'type',
		'unknownVariable',
		'parameterizedType',
		'tStructuralEntity'
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
	thrownException := builder newClassNamed: #ThrownException.
	type := builder newClassNamed: #Type.
	unknownVariable := builder newClassNamed: #UnknownVariable.
	
	primitiveType withTesting.

	self defineComments
]

{ #category : #definition }
FamixJavaGenerator >> defineComments [
	entity comment: 'file :=  ''ArgoUML-0.34.mse'' asFileReference readStream.

dictionary := Dictionary newFrom: (
	FamixJavaEntity withAllSubclasses collect: [ :c | 
		cn := c name withoutPrefix: #FamixJava.
		(''FAMIX.'', cn) -> (''FamixJava-Entities.'', cn) ]).

dictionary at: ''FAMIX.JavaSourceLanguage'' put: ''FamixJava-Entities.SourceLanguage''.

repo := MooseModel importFrom: file withMetamodel: FamixJavaGenerator metamodel translationDictionary: dictionary.

model := MooseModel new.
	model silentlyAddAll: repo elements.
	model entityStorage forRuntime.
model.'
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

	annotationInstanceAttribute --|> sourcedEntity.
	annotationInstanceAttribute --|> #TAnnotationInstanceAttribute.
	annotationInstanceAttribute --|> #TTypedAnnotationInstanceAttribute.

	annotationType --|> type.
	annotationType --|> #TAnnotationType.
	annotationType --|> #TWithAttributes.

	annotationTypeAttribute --|> attribute.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.

	attribute --|> entity.
	attribute --|> tStructuralEntity.
	attribute --|> #TAttribute.
	attribute --|> #TWithClassScope.
	attribute --|> #TWithAnnotationInstances.

	method --|> namedEntity.
	method --|> #TMethod.
	method --|> #TWithThrownExceptions.
	method --|> #TWithDeclaredExceptions.
	method --|> #TWithCaughtExceptions.
	method --|> #TWithStatements.
	method --|> #TWithTypes.
	method --|> #TWithClasses.
	method --|> #TWithAnnotationInstances.

	caughtException --|> exception.
	caughtException --|> #TCaughtException.

	class --|> type.
	class --|> #TWithExceptions.
	class --|> #TClass.
	class --|> #TLCOMMetrics.
	class --|> #TWithAnnotationInstances.
	class --|> #TWithTypes.

	declaredException --|> exception.
	declaredException --|> #TDeclaredException.

	enum --|> type.
	enum --|> #TWithEnumValues.

	enumValue --|> entity.
	enumValue --|> tStructuralEntity.
	enumValue --|> namedEntity.
	enumValue inheritsFromTrait: tStructuralEntity without: #(#mooseNameOn:).
	enumValue --|> #TEnumValue.

	exception --|> #TException.

	globalVariable --|> entity.
	globalVariable --|> tStructuralEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TWithModifiers .

	implicitVariable --|> entity.
	implicitVariable --|> tStructuralEntity.
	implicitVariable --|> #TImplicitVariable.

	inheritance --|> association.
	inheritance --|> #TInheritance.

	invocation --|> association.
	invocation --|> #TInvocation.
	invocation --|> #TWithSignature.

	localVariable --|> entity.
	localVariable --|> tStructuralEntity.
	localVariable --|> #TLocalVariable.

	namedEntity --|> #TPackageable.
	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TWithAnnotationInstances.
	namedEntity --|> #TPossibleStub.

	namespace --|> scopingEntity.
	namespace --|> #TNamespace.
	namespace --|> #TWithAnnotationTypes.
	namespace --|> #TWithClasses.

	package --|> scopingEntity.
	package --|> #TPackage.

	parameter --|> entity.
	parameter --|> tStructuralEntity.
	parameter --|> #TParameter.

	parameterType --|> type.
	parameterType --|> #TParameterType.

	parameterizableClass --|> class.
	parameterizableClass --|> #TWithParameterizedTypes.

	parameterizedType --|> type.
	parameterizedType --|> #TParameterizedType.
	parameterizedType --|> #TWithParameterizedTypeUsers.
	parameterizedType --|> #TWithInheritances.

	primitiveType --|> type.

	reference --|> association.
	reference --|> #TReference.

	scopingEntity --|> namedEntity.
	scopingEntity --|> #TGlobalVariableScope.
	scopingEntity --|> #TScopingEntity.
	scopingEntity --|> #TWithTypes.
	scopingEntity --|> #TOODependencyQueries.
	
	thrownException --|> exception.
	thrownException --|> #TThrownException.

	type --|> namedEntity.
	type --|> #TType.
	type --|> #TWithTypeAliases.
	type --|> #TParameterizedTypeUser.
	type --|> #TClassHierarchyNavigation. 
	type --|> #TWithMethods.
	type --|> #TWithTypes.
	type --|> #TWithAttributes.

	tStructuralEntity --|> #TStructuralEntity.
	tStructuralEntity --|> #TWithDereferencedInvocations.

	unknownVariable --|> namedEntity.
	unknownVariable --|> entity.
	unknownVariable --|> tStructuralEntity.
	


]

{ #category : #definition }
FamixJavaGenerator >> defineTraits [
	super defineTraits.
	tStructuralEntity := builder newTraitNamed: #TStructuralEntity
]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
