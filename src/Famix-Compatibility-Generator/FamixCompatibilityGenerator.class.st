"
g := FamixCompatibilityGenerator  new.
g builder traitsFlattening: true.
g generateWithoutCleaning.
FamixCompatibilityGenerator resetMetamodel.
"
Class {
	#name : #FamixCompatibilityGenerator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#instVars : [
		'access',
		'annotationInstance',
		'annotationInstanceAttribute',
		'annotationType',
		'annotationTypeAttribute',
		'attribute',
		'behaviouralEntity',
		'cFile',
		'cPPSourceLanguage',
		'cSourceLanguage',
		'cUSTOMSourceLanguage',
		'caughtException',
		'class',
		'compilationUnit',
		'containerEntity',
		'declaredException',
		'dereferencedInvocation',
		'enum',
		'enumValue',
		'exception',
		'function',
		'globalVariable',
		'header',
		'implicitVariable',
		'include',
		'inheritance',
		'invocation',
		'jAVASourceLanguage',
		'leafEntity',
		'localVariable',
		'method',
		'module',
		'namespace',
		'package',
		'parameter',
		'parameterType',
		'parameterizableClass',
		'parameterizedType',
		'pharoAnchor',
		'preprocessorDefine',
		'preprocessorIfdef',
		'preprocessorStatement',
		'primitiveType',
		'reference',
		'sMALLTALKSourceLanguage',
		'scopingEntity',
		'structuralEntity',
		'thrownException',
		'type',
		'typeAlias',
		'uNKNOWNSourceLanguage',
		'unknownVariable',
		'trait',
		'traitUsage'
	],
	#category : #'Famix-Compatibility-Generator'
}

{ #category : #accessing }
FamixCompatibilityGenerator class >> packageName [

	^ #'Famix-Compatibility-Entities'
]

{ #category : #accessing }
FamixCompatibilityGenerator class >> packageNameForAnnotations [

	^ #'FAMIX'
]

{ #category : #accessing }
FamixCompatibilityGenerator class >> prefix [

	^ #'FAMIX'
]

{ #category : #accessing }
FamixCompatibilityGenerator class >> translationDictionary [

	| classNames associations |

	classNames := 'Famix-Compatibility-Entities' asPackage definedClasses collect: [:e | e name withoutPrefix: 'FAMIX' ].
	
	associations := classNames collect: [ :each | ('FAMIX.', each) -> ('FAMIX.', each) ] as: OrderedCollection.

	^ Dictionary newFrom: associations.	
]

{ #category : #accessing }
FamixCompatibilityGenerator class >> wantsAllEntitiesNavigation [

	^ false
]

{ #category : #initialization }
FamixCompatibilityGenerator >> defineClasses [

	super defineClasses.

	access := builder newClassNamed: #Access.
	annotationInstance := builder newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := builder newClassNamed: #AnnotationInstanceAttribute.
	annotationType := builder newClassNamed: #AnnotationType.
	annotationTypeAttribute := builder newClassNamed: #AnnotationTypeAttribute.
	attribute := builder newClassNamed: #Attribute.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	cFile := builder newClassNamed: #CFile.
	cPPSourceLanguage := builder newClassNamed: #CppSourceLanguage.
	cSourceLanguage := builder newClassNamed: #CSourceLanguage.
	cUSTOMSourceLanguage := builder newClassNamed: #CustomSourceLanguage.
	caughtException := builder newClassNamed: #CaughtException.
	class := builder newClassNamed: #Class.
	compilationUnit := builder newClassNamed: #CompilationUnit.
	containerEntity := builder newClassNamed: #ContainerEntity.
	declaredException := builder newClassNamed: #DeclaredException.
	dereferencedInvocation := builder newClassNamed: #DereferencedInvocation.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	exception := builder newClassNamed: #Exception.
	function := builder newClassNamed: #Function.
	globalVariable := builder newClassNamed: #GlobalVariable.
	header := builder newClassNamed: #Header.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	include := builder newClassNamed: #Include.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	jAVASourceLanguage := builder newClassNamed: #JavaSourceLanguage.
	leafEntity := builder newClassNamed: #LeafEntity.
	localVariable := builder newClassNamed: #LocalVariable.
	method := builder newClassNamed: #Method.
	module := builder newClassNamed: #Module.
	namespace := builder newClassNamed: #Namespace.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	parameterType := builder newClassNamed: #ParameterType.
	parameterizableClass := builder newClassNamed: #ParameterizableClass.
	parameterizedType := builder newClassNamed: #ParameterizedType.
	pharoAnchor := builder newClassNamed: #PharoAnchor.
	preprocessorDefine := builder newClassNamed: #PreprocessorDefine.
	preprocessorIfdef := builder newClassNamed: #PreprocessorIfdef.
	preprocessorStatement := builder newClassNamed: #PreprocessorStatement.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	sMALLTALKSourceLanguage := builder newClassNamed: #SmalltalkSourceLanguage.
	scopingEntity := builder newClassNamed: #ScopingEntity.
	structuralEntity := builder newClassNamed: #StructuralEntity.
	thrownException := builder newClassNamed: #ThrownException.
	type := builder newClassNamed: #Type.
	typeAlias := builder newClassNamed: #TypeAlias.
	uNKNOWNSourceLanguage := builder newClassNamed: #UnknownSourceLanguage.
	unknownVariable := builder newClassNamed: #UnknownVariable.
	trait := builder newClassNamed: #Trait.
	traitUsage := builder newClassNamed: #TraitUsage.

	primitiveType withTesting.
	containerEntity withTesting.


]

{ #category : #initialization }
FamixCompatibilityGenerator >> defineHierarchy [

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

	behaviouralEntity --|> containerEntity.
	behaviouralEntity --|> #TWithParameters.
	behaviouralEntity --|> #TInvocable.
	behaviouralEntity --|> #TWithInvocations.
	behaviouralEntity --|> #TWithReferences.
	behaviouralEntity --|> #TTypedStructure.
	behaviouralEntity --|> #TWithAccesses.
	behaviouralEntity --|> #TWithLocalVariables.
	behaviouralEntity --|> #TWithImplicitVariables.
	behaviouralEntity --|> #TWithDereferencedInvocations.
	behaviouralEntity --|> #TWithSignature.
	behaviouralEntity --|> #TWithStatements.

	cFile --|> file.
	cFile --|> #TWithFileInclude.

	cPPSourceLanguage --|> cSourceLanguage.

	cSourceLanguage --|> sourceLanguage.

	cUSTOMSourceLanguage --|> sourceLanguage.
	cUSTOMSourceLanguage --|> #TNamed.

	caughtException --|> exception.
	caughtException --|> #TCaughtException.

	class --|> type.
	class --|> #TWithExceptions.
	class --|> #TClass.

	compilationUnit --|> cFile.
	compilationUnit --|> #TCompilationUnit.
	compilationUnit --|> #TDefinedInModule.

	containerEntity --|> namedEntity.
	containerEntity --|> #TWithTypes.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithFunctions.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	declaredException --|> exception.
	declaredException --|> #TDeclaredException.

	dereferencedInvocation --|> invocation.
	dereferencedInvocation --|> #TDereferencedInvocation.

	enum --|> type.
	enum --|> #TWithEnumValues.

	enumValue --|> structuralEntity.
	enumValue --|> #TEnumValue.

	exception --|> #TException.

	function --|> behaviouralEntity.
	function --|> #TFunction.
	function --|> #TDefinedInModule.

	globalVariable --|> structuralEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TDefinedInModule.

	header --|> cFile.
	header --|> #THeader.

	implicitVariable --|> structuralEntity.
	implicitVariable --|> #TImplicitVariable.

	include --|> association.
	include --|> #TFileInclude.

	inheritance --|> association.
	inheritance --|> #TSubInheritance.
	inheritance --|> #TSuperInheritance.

	invocation --|> association.
	invocation --|> #TInvocation.
	invocation --|> #TWithSignature.

	jAVASourceLanguage --|> sourceLanguage.

	leafEntity --|> namedEntity.

	localVariable --|> structuralEntity.
	localVariable --|> #TLocalVariable.

	method --|> behaviouralEntity.
	method --|> #TMethod.
	method --|> #TWithThrownExceptions.
	method --|> #TWithDeclaredExceptions.
	method --|> #TWithCaughtExceptions.
	method --|> #TWithClassScope.

	module --|> scopingEntity.
	module --|> #TModule.
	module --|> #TWithCompilationUnit.
	module --|> #TWithHeader.

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

	pharoAnchor --|> sourceAnchor.

	preprocessorDefine --|> preprocessorStatement.
	preprocessorDefine --|> #TPreprocessorIfdef.

	preprocessorIfdef --|> preprocessorStatement.

	preprocessorStatement --|> sourcedEntity.

	primitiveType --|> type.

	reference --|> association.
	reference --|> #TReference.

	sMALLTALKSourceLanguage --|> sourceLanguage.

	scopingEntity --|> containerEntity.
	scopingEntity --|> #TGlobalVariableScope.
	scopingEntity --|> #TScopingEntity.

	structuralEntity --|> leafEntity.
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
	type --|> #TTraitUser. 

	typeAlias --|> type.
	typeAlias --|> #TTypeAlias.

	uNKNOWNSourceLanguage --|> sourceLanguage.

	unknownVariable --|> structuralEntity.
	
	trait --|> type.
	trait --|> #TTrait.
	
	traitUsage --|> association.
	traitUsage --|> #TTraitUsage.
	

]
