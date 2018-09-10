Class {
	#name : #DelphiParser,
	#superclass : #SmaCCGLRParser,
	#instVars : [
		'lastInsertPosition'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #'generated-accessing' }
DelphiParser class >> cacheId [
	^'2018-03-19T12:40:24.823267-05:00'
]

{ #category : #generated }
DelphiParser class >> definitionComment [
"%start File Statement SimpleDefinedType NamedDefinedType;

%glr;
%ignorecase;

%ignore_variables leftParen rightParen semicolon comma;

# Binary precedence handled by parser -- this grammar is ambiguous
%right ""ELSE"" ""OF"" <identifier>;
%right "":="";
%left ""OR"";
%left ""AND"";
%left ""XOR"" ;
#%left "","" ;
#%nonassoc ""<>"" "">"" ""<"" ""="" ""<="" "">="" ""IN"" ;
%nonassoc ""AS"" ""IS"" ""ABSOLUTE"" ;
%left <plus> <minus> ;
%left ""DIV"" ""MOD"" ""SHL"" ""SHR"" ""*"" ""/"";
%left ""@"";
%left ""."" <upArrow> ;
%left ""["" ""("";

%id <number> <minus> <plus> <identifier> <constantIdentifier> <semicolon> <upArrow> <controlCharacter> <at>;

%prefix Delphi ;
%suffix Node;
%root Program;

%hierarchy MethodModifier ( 
	ExternalMethodModifier
	MessageMethodModifier
);
%hierarchy Expression (
	AddressExpression 
	ArrayExpression 
	AssignmentExpression 
	BinaryExpression 
	ConstantArrayExpression 
	InheritedFunctionCall 
	LiteralExpression 
	MemExpression
	MethodCallExpression 
	MinusExpression 
	PlusExpression
	NotExpression
	PointerExpression 
	PropertyExpression 
	RecordExpression
	SetExpression 
	VariableExpression 
) ;
%hierarchy VariableExpression (
	InstantiatedGenericVariableExpression
);
%hierarchy AnonymousMethodType (
	AnonymousFunctionType 
	AnonymousProcedureType
);
%hierarchy SetType (
	ExpressionSetType 
	RangeSetType 
	ValuesSetType
);
%hierarchy Type (
	AbsoluteType
	AnonymousMethodType 
	ArrayType 
	ClassOrInterfaceType
	EnumType
	FileType
	InstantiatedGenericType 
	MetaclassType 
	NamedType 
	PointerType 
	RangeType 
	RecordType 
	SetType 
	SimpleArrayType 
);
%hierarchy ClassOrInterfaceType (
	ClassType
	InterfaceType
);
%hierarchy ClassSection (
	ImplicitClassSection
	PrivateClassSection 
	ProtectedClassSection 
	PublicClassSection 
	PublishedClassSection 
);
%hierarchy Statement (
	AsmBlock 
	EmptyStatement 
	Expression 
	ForStatement 
	ForInStatement
	GotoStatement
	IfStatement 
	LabeledStatement
	MultiStatement
	RaiseStatement 
	WhileStatement 
	WithStatement 
);
%hierarchy MultiStatement (
	CaseStatement 
	TryStatement 
	StatementBlock 
	RepeatStatement 
);
%hierarchy ClassType (
	NewClassType
	OldClassType 
	ClassHelperType
) ;
%hierarchy SetValue (
	RangeSetValue 
	SingleSetValue
) ;
%hierarchy MethodHeader (
	ClassOperatorHeader
	ConstructorHeader 
	DestructorHeader
	FunctionHeader 
	ProcedureHeader 
);
%hierarchy FunctionHeader (
	ClassFunctionHeader
);
%hierarchy ProcedureHeader (
	ClassProcedureHeader
);
%hierarchy MethodDefinition ( 
	ConstructorDefinition 
	DestructorDefinition
	FunctionDefinition 
	ProcedureDefinition 
);
%hierarchy FunctionDefinition (
	ClassFunctionDefinition
	ClassOperatorDefinition
);
%hierarchy ProcedureDefinition (
	ClassProcedureDefinition
);
%hierarchy PropertyHeader (
	ClassPropertyHeader
);
%hierarchy CodeSection (
	FinalizationSection 
	ImplementationCode
	InitializationSection 
);
%hierarchy Vars (
	ClassVars
);


<at>
	: AT
	;
<minus> 
	: \- 
	;
<plus> 
	: \+ 
	;
<semicolon> 
	: \; 
	;
<upArrow> 
	: \^ 
	;
 <LETTER> 
	: <isLetter>
	;
<DIGIT> 
	: [0-9] 
	;
<H>
	: [a-fA-F0-9]
	;
<D>
	: [0-9]
	;
<E>
	: [Ee][\+\-]?<D>+
	;
<identifier> 
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<constantIdentifier> 
	: <identifier> 
	;
<unsignedInt> 
	: (\$<H>+) 
	| (<D>+) 
	;
<unsignedReal> 
	: <D>+<E> 
	| (<D>+\.<D>* | \.<D>+)<E>?
	;
<number> 
	: [\-\+]? (<unsignedInt> | <unsignedReal>) 
	;
<integerWithRange> 
	: [\-\+]? <D>+\.\. 
	;
<char> 
	: \# <unsignedInt>
	;
<control_character>
	: \^ [a-z] 
	;
<string> 
	: (<char> | <control_character>)* (\' [^\']* \' (<char> | <control_character>)*)+
	| <char>+  
	;
<comment>
	: \{[^\}]*\} 
	| \(\*([^*]|[\r\n]|(\*+([^*)]|[\r\n])))*\*+\) 
	| \/\/ [^\r\n]* [\r\n] 
	;
<whitespace>
	: (\s|\x1A)+
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;

<multiple_control_chars>
	: <control_character> <control_character>+
	;

#These below are probably wrong

<labelID> 
	: <identifier> 
	; 
#<unitName> : <identifier> ;
<immCharID> 
	: \\\@ 
	;

File 
	: UnitFile {{UnitFile}}
	| ProgramFile {{ProgramFile}}
	| LibraryFile {{LibraryFile}}
	;
ProgramFile
	: ProgramLine UsesList MainMethod 'main' ""."" 'period'
	| UsesList MainMethod 'main' ""."" 'period'
	;
ProgramLine
	: ""PROGRAM"" 'programToken' <identifier> 'programName' OptionalPlatform <semicolon> 'semicolon' 
	;
LibraryFile
	: LibraryLine UsesList Exports MainMethod 'main' ""."" 'period'
	;
LibraryLine
	: ""LIBRARY"" 'libraryToken' <identifier> 'libraryName' OptionalPlatform <semicolon> 'semicolon' 
	;
Exports
	: 
	| Exports LibraryExport 'export'
	;
LibraryExport
	: ""EXPORTS"" 'exportsToken' <identifier> 'name' <semicolon> 'semicolon' {{LibraryExport}}
	;
MainMethod
	: MethodComponents {{MainMethodDefinition}}
	;
UnitFile 
	: UnitLine InterfaceSection 'interfaceSection' ImplementationSection 'implementationSection' InitializationSection 'initializationSection' FinalizationSection 'finalizationSection' EndFile
	| UnitLine
	;
UnitLine
	: ""UNIT"" 'unitToken' FullModuleName 'unitName' OptionalPlatform <semicolon> 'semicolon' 
	;
InterfaceSection
	: 
	| ""INTERFACE"" 'interfaceToken' UsesList InterfaceSectionValueList {{InterfaceSection}}
	;
UsesList
	: 
	| ""USES"" 'usesToken' UsesModuleList <semicolon> 'semicolon'
	;
UsesModuleList
	: UsesModule
	| UsesModuleList "","" 'comma' UsesModule
	;
UsesModule
	: FullModuleName 'moduleName'
	| FullModuleName 'moduleName' ""IN"" 'inToken' <string> 'filename'
	;
FullModuleName
	: <identifier> 'name' {{ModuleName}}
	| FullModuleName ""."" 'period' <identifier> 'name' {{ModuleName}}
	;
InterfaceSectionValueList
	: 
	| InterfaceSectionValueList InterfaceSectionValue 'value'
	;
InterfaceSectionValue
	: DefinedTypeList
	| ResourceStringList
	| ConstantValueList
	| ProcedureHeader
	| FunctionHeader
	| Vars
	;
ConstantValueList
	: ""CONST"" 'constToken' ConstantValues {{ConstantList}}
	;
ConstantValues
	: ConstantValue 'definition'
	| ConstantValues ConstantValue 'definition'
	;
ConstantValue
	: <identifier> 'name' OptionalType ""="" 'equalToken' ConstantExpression 'expression' OptionalPlatform OptionalDeprecated <semicolon> 'semicolon' {{ConstantDefinition}} 
	;
ResourceStringList
	: ""RESOURCESTRING"" 'resourceStringToken' Resources {{ResourceStringList}}
	;
Resources
	: Resource 'definition'
	| Resources Resource 'definition'
	;
Resource
	: <identifier> 'name' ""="" 'equalToken' ConstantExpression 'value' OptionalDeprecated <semicolon> 'semicolon' {{ResourceStringDefinition}} 
	;
DefinedTypeList
	: ""TYPE"" 'typeToken' NamedDefinedTypes {{DefinedTypeList}}
	;
NamedDefinedTypes
	: NamedDefinedType 'definition'
	| NamedDefinedTypes NamedDefinedType 'definition'
	;
NamedDefinedType
	: <identifier> 'name'  OptionalGenericTypeArguments ""="" 'equalToken' DefinedType {{NamedDefinedType}}
	;
OptionalGenericTypeArguments
	:
	| ""<"" 'left' GenericTypeArgumentList "">"" 'right'
	;
GenericTypeArgumentList
	: <identifier> 'genericTypeArgument'
	|  GenericTypeArgumentList "","" 'comma' <identifier> 'genericTypeArgument'
	;
DefinedType 
	: SimpleDefinedType 'type' OptionalPlatform <semicolon> 'semicolon'
	| EnumType 'type' <semicolon> 'semicolon'
	| AnonymousProcedureType 'type'
	| AnonymousFunctionType 'type'
	| ClassOrInterfaceType 'type' OptionalPlatform <semicolon> 'semicolon'
	;
EnumType
	: ""("" 'left' EnumList "")"" 'right' {{}}
	;
EnumList
	: EnumName 'name'
	| EnumList "","" 'comma' EnumName 'name'
	;
EnumName
	: <identifier> 'name' {{}}
	| <identifier> 'name' ""="" 'equal' ConstantExpression 'value' {{}}
	;
ClassOrInterfaceType
	: NewClassType
	| OldClassType
	| InterfaceType
	| MetaclassType
	| ClassHelperType
	;
SimpleDefinedType
	: NamedType 'typeExpression' {{NamedType}}
	| <upArrow> 'upArrowToken' Type 'type' {{PointerType}}
	| ArrayType
	| RecordType
	| Type 'type' InstantiatedGenericTypeArguments {{InstantiatedGenericType}}
	| Type 'type' ""["" 'left' ConstantExpression 'bounds' ""]"" 'right' {{SimpleArrayType}} 
	| FileType
	| Type 'type' ""ABSOLUTE"" 'absoluteToken' Type 'variable' {{AbsoluteType}}
	| SetType
	| RangeType
	| ""TYPE"" 'typeToken' QualifiedName 'typeName' {{TypeType}}
	;
InstantiatedGenericTypeArguments
	: ""<"" 'left' InstantiatedGenericTypeArgumentList "">"" 'right'
	;
InstantiatedGenericTypeArgumentList
	: SimpleDefinedType 'typeArgument'
	| InstantiatedGenericTypeArgumentList "","" 'comma' SimpleDefinedType 'typeArgument'
	;
NamedType
	: | <constantIdentifier> 'name' {{VariableExpression}}
	| NamedType 'expression' ""."" 'period' <constantIdentifier> 'name' {{PropertyExpression}} 
	#: ConstantExpression 'typeExpression' {{NamedType}} #should be check if we have a valid type
	;
OptionalPlatform
	:
	| ""PLATFORM"" 'modifier'
	| ""DEPRECATED"" 'modifier'
	;
AnonymousProcedureType
	: ""PROCEDURE"" 'procedureToken' OptionalArguments OptionalOfObject <semicolon> 'semicolon' MethodModifiers {{AnonymousProcedureType}}
	;
AnonymousFunctionType
	: ""FUNCTION"" 'functionToken' OptionalArguments "":"" 'colon' Type 'type' OptionalOfObject  <semicolon> 'semicolon' MethodModifiers {{AnonymousFunctionType}}
	;
OptionalArguments
	:
	| ""("" 'left' ArgumentList "")"" 'right'
	;
SetType
	: ""SET"" 'setToken' ""OF"" 'ofToken' ConstantExpression 'setValue' {{ExpressionSetType}} 
	| ""SET"" 'setToken' ""OF"" 'ofToken' RangeType 'setValue' {{RangeSetType}}
	| ""SET"" 'setToken' ""OF"" 'ofToken' ""("" 'left' TwoItemSetNameList "")"" 'right' {{ValuesSetType}} ###
	;
TwoItemSetNameList	#hacked for two items since one item conflicts with constant expression set
	: <constantIdentifier> 'name' "","" 'comma' SetNameList
	;
SetNameList
	: <constantIdentifier> 'name'
	| SetNameList "","" 'comma' <constantIdentifier> 'name'
	;
MetaclassType
	: ""CLASS"" 'classToken' ""OF"" 'ofToken' <identifier> 'name' {{MetaclassType}}
	;
RecordType
	: OptionalPacked ""RECORD"" 'recordToken' RecordFieldList ""END"" 'endToken' {{RecordType}}
	;
RecordFieldList
	: ImplicitClassSection 'section' ClassSections
	| ImplicitClassSection 'section' ClassSections VariantRecordPart
	;
OptionalPacked
	: 
	| ""PACKED"" 'packedToken'
	;
VariantRecordPart
	: ""CASE"" 'caseToken' <identifier> 'value' OptionalType ""OF"" 'ofToken' VariantTypes OptionalSemicolon #{{VariantRecordPart}}
	;
VariantTypes
	: VariantType 'variantType'
	| VariantTypes <semicolon> 'semicolon' VariantType 'variantType' 
	;
VariantType
	: VariantNames "":"" 'colon' ""("" 'left' RecordFieldList "")"" 'right' {{VariantType}}
	;
VariantNames
	: VariantName 'name'
	| VariantNames "","" 'comma' VariantName 'name'
	;
VariantName
	: ConstantExpression
	;
RangeType
	: RangeValue 'startValue' "".."" 'dots' RangeValue 'endValue' {{RangeType}}
	;
RangeValue
	: ConstantExpression	#should really be numbers
	;
Number
	: <number>
	;
ConstantExpression
	: Number 'value' {{LiteralExpression}}
	| <controlCharacter> 'value' {{LiteralExpression}}
	| <constantIdentifier> 'name' {{VariableExpression}}
	| ConstantExpression 'expression' ""."" 'period' <constantIdentifier> 'name' {{PropertyExpression}}
	| ConstantExpression 'leftExpression' ConstantOperator 'operator' ConstantExpression 'rightExpression' {{BinaryExpression}}
	| String 'value' {{LiteralExpression}}
	| <multiple_control_chars> 'value' {{LiteralExpression}}
	| ConstantExpression 'receiver' ""("" 'left' ConstantArguments "")"" 'right' {{MethodCallExpression}}
	| SetConstructor
	| ""("" 'left' ConstantRecord OptionalSemicolon "")"" 'right' {{RecordExpression}}
	| ""("" 'left' ConstantArray "")"" 'right' {{ConstantArrayExpression}}
	| ""NOT"" 'notToken' ConstantExpression 'expression' {{NotExpression}}
	| <minus> 'minus' ConstantExpression 'expression' {{MinusExpression}}
	| <plus> 'plus' ConstantExpression 'expression' {{PlusExpression}}
	| ""@"" 'atToken' ConstantExpression 'expression' {{AddressExpression}}
	;
ConstantArray
	: ConstantExpressionList
	|
	;
ConstantExpressionList
	: EnumExpression # hacked -- need one value arrays but that conflicts with parened expressions
	| ConstantExpressionList "","" 'comma' EnumExpression 
	;
EnumExpression
	: ConstantExpression 'expression'
	| ConstantExpression 'expression' ""="" 'equalToken' ConstantExpression 'value'
	;
ConstantRecord
	: ConstantRecordFields
	;
ConstantRecordFields
	: ConstantRecordField 'field'
	| ConstantRecordFields <semicolon> 'semicolon' ConstantRecordField 'field'
	;
ConstantRecordField
	: <constantIdentifier> 'name' "":"" 'colon' ConstantExpression 'expression' {{ConstantRecordField}}
	;
ConstantArguments
	: ConstantExpression 'argument'
	| ConstantArguments "","" 'comma' ConstantExpression 'argument'
	;
NewClassType
	: ""CLASS"" 'classToken' ClassAttributes Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{NewClassType}}
	| ""CLASS"" 'classToken' ClassAttributes Superclass {{NewClassType}}
	;
ClassHelperType	# attributes and superclass are likely not used
	: ""CLASS""'classToken' ClassAttributes ""HELPER"" 'helperToken' ""FOR"" 'forToken' QualifiedName 'class' Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{ClassHelperType}}
	| ""CLASS""'classToken' ClassAttributes ""HELPER"" 'helperToken' ""FOR"" 'forToken' QualifiedName 'class' Superclass {{ClassHelperType}}
	;
ClassAttributes
	:
	| ClassAttributes ClassAttribute 'classAttribute'
	;
ClassAttribute
	: ""ABSTRACT""
	| ""SEALED""
	;
OldClassType
	: ""OBJECT"" 'objectToken' Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{OldClassType}} 
	;
OptionalDeprecated
	:
	| ""DEPRECATED"" 'deprecatedToken'
	;
ImplicitClassSection
	: NewClassComponents {{ImplicitClassSection}}
	;
ClassSections
	: 
	| ClassSections ClassSection 'section'
	;
ClassSection
	: PrivateClassSection
	| ProtectedClassSection
	| PublicClassSection
	| PublishedClassSection
	;
PrivateClassSection
	: ""STRICT"" 'strictToken' ""PRIVATE"" 'privateToken' NewClassComponents {{PrivateClassSection}}
	| ""PRIVATE"" 'privateToken' NewClassComponents {{PrivateClassSection}}
	;
ProtectedClassSection
	: ""STRICT"" 'strictToken' ""PROTECTED"" 'protectedToken' NewClassComponents {{ProtectedClassSection}}
	| ""PROTECTED"" 'protectedToken' NewClassComponents {{ProtectedClassSection}}
	;
PublicClassSection
	: ""PUBLIC"" 'publicToken' NewClassComponents {{PublicClassSection}}
	;
PublishedClassSection
	: ""PUBLISHED"" 'publishedToken' NewClassComponents {{PublishedClassSection}}
	;
Superclass
	: 
	| ""("" 'left' SuperclassList "")"" 'right' 
	;
SuperclassList
	: NamedType 'superclass'
	| SuperclassList "","" 'comma' NamedType 'superclass'
	;
QualifiedName
	: <identifier> 'name' OptionalGenericTypeArguments {{QualifiedName}}
	| <identifier> 'namespace' OptionalGenericTypeArguments ""."" 'period' <identifier> 'name'  {{QualifiedName}}
	;
NewClassComponents
	: 
	| NewClassComponents NewClassComponent 'component'
	;
NewClassComponent
	: VariableNames "":"" 'colon' Type 'type' OptionalPlatform <semicolon> 'semicolon' {{VariableDefinition}}
	| ""CLASS"" 'classToken' VarsVars {{ClassVars}}
	| Vars
	| ConstructorHeader
	| MethodAttribute 'attribute' ConstructorHeader {{ConstructorHeader}}
	| DestructorHeader
	| MethodAttribute 'attribute' DestructorHeader {{DestructorHeader}}
	| NewClassMethodComponent
	| InterfacePropertyComponent
	| InterfaceFunctionAssignment
	| InterfaceProcedureAssignment
	| ConstantValueList
	;
NewClassMethodComponent
	: MethodAttribute 'attribute' ProcedureHeader {{ProcedureHeader}}
	| MethodAttribute 'attribute' ClassProcedureHeader {{ClassProcedureHeader}}
	| MethodAttribute 'attribute' FunctionHeader {{FunctionHeader}}
	| MethodAttribute 'attribute' ClassFunctionHeader {{ClassFunctionHeader}}
	| MethodAttribute 'attribute' ClassOperatorHeader {{ClassOperatorHeader}}
	| InterfaceMethodComponent
	;
MethodAttribute
	: ""["" 'left' ConstantExpression 'expression' ""]"" 'right' {{MethodAttribute}}
	;
InterfaceFunctionAssignment
	: ""FUNCTION"" 'function' QualifiedName 'qualifiedName' ""="" 'equalToken' <identifier> 'name' <semicolon> 'semicolon' {{InterfaceFunctionAssignment}}
	;
InterfaceProcedureAssignment
	: ""PROCEDURE"" 'procedureToken' QualifiedName 'qualifiedName' ""="" 'equalToken' <identifier> 'name' <semicolon> 'semicolon' {{InterfaceProcedureAssignment}}
	;
Type
	: SimpleDefinedType
	| AnonymousProcedureType
	| AnonymousFunctionType
	;
FileType
	: ""FILE"" 'fileToken' ""OF"" 'ofToken' Type 'type' {{FileType}}
	| ""FILE"" 'fileToken' {{FileType}}
	;
ArrayType
	: OptionalPacked ""ARRAY"" 'arrayToken' ArrayBounds ""OF"" 'ofToken' Type 'type' {{ArrayType}}
	| OptionalPacked ""ARRAY"" 'arrayToken' ArrayBounds ""OF"" 'ofToken' ""CONST"" 'constToken' {{ArrayType}}
	;
ArrayBounds
	: ""["" 'left' ArrayBoundsIndices ""]"" 'right'
	| 
	;
ArrayBoundsIndices
	: ArrayBoundsIndex 'index'
	| ArrayBoundsIndices "","" 'comma' ArrayBoundsIndex 'index'
	;
ArrayBoundsIndex
	: ConstantExpression
	| RangeType
	;
InterfaceType
	: InterfaceKeyword 'interfaceToken' Superclass Guid 'guid' NewInterfaceComponents ""END"" 'endToken' {{InterfaceType}}
	| InterfaceKeyword 'interfaceToken' {{InterfaceType}}
	;
InterfaceKeyword
	: ""INTERFACE""
	| ""DISPINTERFACE""
	;
Guid
	:
	| ""["" 'left' ConstantExpression 'string' ""]"" 'right' {{Guid}}
	;
NewInterfaceComponents
	: 
	| NewInterfaceComponents NewInterfaceComponent 'component'
	;
NewInterfaceComponent
	: InterfaceMethodComponent
	| InterfacePropertyComponent
	;
InterfacePropertyComponent
	: PropertyHeader
	| ClassPropertyHeader
	;
InterfaceMethodComponent
	: ProcedureHeader
	| ClassProcedureHeader
	| FunctionHeader
	| ClassFunctionHeader
	| ClassOperatorHeader
	;
ConstructorHeader
	: ExternalConstructorHeader
	| NonExternalConstructorHeader
	;
DestructorHeader
	: ExternalDestructorHeader
	| NonExternalDestructorHeader
	;
ProcedureHeader
	: ExternalProcedureHeader
	| NonExternalProcedureHeader
	;
ClassProcedureHeader
	: ExternalClassProcedureHeader
	| NonExternalClassProcedureHeader
	;
OptionalOfObject # Don't know what this is
	:
	| ""OF"" 'ofToken' ""OBJECT"" 'objectToken'
	;
FunctionHeader
	: ExternalFunctionHeader
	| NonExternalFunctionHeader
	;
ClassFunctionHeader
	: ExternalClassFunctionHeader
	| NonExternalClassFunctionHeader
	;
ClassOperatorHeader
	: ExternalClassOperatorHeader
	| NonExternalClassOperatorHeader
	;
OptionalType
	: 
	| "":"" 'colon' Type 'type'
	;
PropertyHeader
	: PropertyHeaderVars {{PropertyHeader}}
	;
PropertyHeaderVars
	: ""PROPERTY"" 'propertyToken' <identifier> 'name' PropertyArrayAccessors 'arrayAccessors' OptionalType PropertyValues <semicolon> 'semicolon' PropertyModifiers 'modifier'
	;
ClassPropertyHeader
	: ""CLASS"" 'classToken' PropertyHeaderVars {{ClassPropertyHeader}}
	;
PropertyValues
	:
	| PropertyValues PropertyIndex 'index'
	| PropertyValues PropertyReader 'reader'
	| PropertyValues PropertyWriter 'writer'
	| PropertyValues PropertyDefault 'default'
	| PropertyValues PropertyStored 'stored'
	| PropertyValues PropertyImplements 'implements'
	| PropertyValues PropertyDispid 'dispid'
	;
PropertyArrayAccessors
	:
	| ""["" 'left' ArgumentList ""]"" 'right' {{PropertyArrayAccessors}}
	;
PropertyIndex
	: ""INDEX"" 'indexToken' ConstantExpression 'expression' {{PropertyIndex}}
	;
PropertyReader
	: ""READ"" 'readToken' Expression 'expression' {{PropertyReader}}
	;
PropertyWriter
	: ""WRITE"" 'writeToken' Expression 'expression' {{PropertyWriter}}
	;
PropertyDispid
	: ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	| ""READONLY"" 'readOnlyToken' ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	| ""WRITEONLY"" 'writeOnlyToken' ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	;
PropertyDefault
	: ""DEFAULT"" 'defaultToken' ConstantExpression 'expression' {{PropertyDefault}}
	| ""DEFAULT"" 'defaultToken' {{PropertyDefault}}
	| ""NODEFAULT"" 'nodefaultToken' {{PropertyDefault}}
	;
PropertyImplements
	: ""IMPLEMENTS"" 'implementsToken' PropertyImplementsList {{PropertyImplements}}
	;
PropertyImplementsList
	: <identifier> 'interface'
	| PropertyImplementsList "","" 'comma' <identifier> 'interface'
	;
PropertyStored
	: ""STORED"" 'storedToken' <identifier> 'isStored' {{PropertyStored}}
	;
PropertyModifiers
	: 
	| ""DEFAULT"" 'defaultToken' <semicolon> 'semicolon' {{PropertyModifier}}
	;
MethodModifiers
	: 
	| MethodModifiers MethodModifier 'modifier' 
	;
NonExternalMethodModifiers
	: 
	| NonExternalMethodModifiers NonExternalMethodModifier 'modifier'
	;
MethodModifier
	: NonExternalMethodModifier
	| ExternalMethodModifier
	;
NonExternalMethodModifier
	: ModifierKeyword 'modifier' <semicolon> 'semicolon' {{MethodModifier}}
	| ""MESSAGE"" 'modifier' ConstantExpression 'expression' <semicolon> 'semicolon' {{MessageMethodModifier}}
	| ""DISPID"" 'modifier' ConstantExpression 'expression' <semicolon> 'semicolon' {{MessageMethodModifier}}
	;
ExternalMethodModifier
	: ""EXTERNAL"" 'modifier' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <string> 'library' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <string> 'library' ""NAME"" 'nameToken' <string> 'methodName' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <identifier> 'library' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <identifier> 'library' ""NAME"" 'nameToken' <string> 'methodName' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""FORWARD"" 'modifier' <semicolon> 'semicolon' {{MethodModifier}}
	;
ModifierKeyword
	: ""OVERLOAD"" | ""OVERRIDE"" | ""STDCALL"" | ""REGISTER"" | ""ASSEMBLER"" | ""PASCAL"" | ""REINTRODUCE"" | ""VIRTUAL"" | ""DEPRECATED"" | ""UNSAFE""
	| ""ABSTRACT"" | ""NEAR"" | ""FAR"" | ""CDECL"" | ""DYNAMIC"" | ""STATIC"" | ""PLATFORM"" | ""EXPORT"" | ""LOCAL"" | ""INLINE"" | ""FINAL"" | ""SAFECALL""
	;
ArgumentList
	: 
	| Arguments
	;
Arguments
	: Argument 'argument'
	| Arguments <semicolon> 'semicolon' Argument 'argument'
	;
Argument
	: ArgumentType VariableNames "":"" 'colon' Type 'type' OptionalValue {{Argument}}
	| ArgumentType VariableNames {{Argument}}
	;
VariableNames
	: <identifier> 'name'
	| VariableNames "","" 'comma' <identifier> 'name'
	;
OptionalValue
	: 
	| ""="" 'equal' ConstantExpression 'value'
	;
ArgumentType
	: 
	| ""VAR"" 'typeToken'
	| ""CONST"" 'typeToken'
	| ""OUT"" 'typeToken'
	;
ImplementationSection
	:
	| ""IMPLEMENTATION"" 'implementationToken' UsesList Definitions ImplementationCode 'code' {{ImplementationSection}}
	;
ImplementationCode
	: 
	| ""BEGIN"" 'beginToken' Statements {{ImplementationCode}}
	;
Definitions
	: 
	| Definitions Definition 'definition'
	;
Definition
	: ConstructorDefinition
	| DestructorDefinition
	| ProcedureDefinition
	| ClassProcedureDefinition
	| FunctionDefinition
	| ClassFunctionDefinition
	| ClassOperatorDefinition
	| DefinedTypeList
	| Vars
	| ConstantValueList
	| ResourceStringList
	;
ConstructorDefinition
	: NonExternalConstructorHeader 'header' MethodComponents {{ConstructorDefinition}}
	| ExternalConstructorHeader 'header' {{ConstructorDefinition}}
	;
ExternalConstructorHeader
	: NonExternalConstructorHeader ExternalMethodModifier 'modifier' MethodModifiers {{ConstructorHeader}}
	;
NonExternalConstructorHeader
	: ""CONSTRUCTOR"" 'constructorToken' QualifiedName 'qualifiedName' OptionalArguments <semicolon> 'semicolon' NonExternalMethodModifiers {{ConstructorHeader}}
	;
DestructorDefinition
	: NonExternalDestructorHeader 'header' MethodComponents {{DestructorDefinition}}
	| ExternalDestructorHeader 'header' {{DestructorDefinition}}
	;
ExternalDestructorHeader
	: NonExternalDestructorHeader ExternalMethodModifier 'modifier' MethodModifiers {{DestructorHeader}}
	;
NonExternalDestructorHeader
	: ""DESTRUCTOR"" 'destructorToken' QualifiedName 'qualifiedName' OptionalParens <semicolon> 'semicolon' NonExternalMethodModifiers {{DestructorHeader}}
	;
OptionalParens
	:
	| ""("" 'left' "")"" 'right'
	;
ProcedureDefinition
	: NonExternalProcedureHeader 'header' MethodComponents {{ProcedureDefinition}}
	| ExternalProcedureHeader 'header' {{ProcedureDefinition}}
	;
ExternalProcedureHeader
	: ExternalProcedureHeaderVars {{ProcedureHeader}}
	;
ExternalProcedureHeaderVars
	: NonExternalProcedureHeaderVars ExternalMethodModifier 'modifier' MethodModifiers
	;
NonExternalProcedureHeader
	: NonExternalProcedureHeaderVars {{ProcedureHeader}}
	;
NonExternalProcedureHeaderVars
	: ""PROCEDURE"" 'procedureToken' QualifiedName 'qualifiedName' OptionalArguments <semicolon> 'semicolon' NonExternalMethodModifiers 
	;
ClassProcedureDefinition
	: NonExternalClassProcedureHeader 'header' MethodComponents {{ClassProcedureDefinition}}
	| ExternalClassProcedureHeader 'header' {{ClassProcedureDefinition}}
	;
ExternalClassProcedureHeader
	: ""CLASS"" 'classToken' ExternalProcedureHeaderVars {{ClassProcedureHeader}}
	;
NonExternalClassProcedureHeader
	: ""CLASS"" 'classToken' NonExternalProcedureHeaderVars {{ClassProcedureHeader}}
	;
FunctionDefinition
	: NonExternalFunctionHeader 'header' MethodComponents {{FunctionDefinition}}
	| ExternalFunctionHeader 'header' {{FunctionDefinition}}
	;
ExternalFunctionHeader
	: ExternalFunctionHeaderVars {{FunctionHeader}}
	;
ExternalFunctionHeaderVars
	: NonExternalFunctionHeaderVars ExternalMethodModifier 'modifier' MethodModifiers
	;
NonExternalFunctionHeader
	: NonExternalFunctionHeaderVars {{FunctionHeader}}
	;
NonExternalFunctionHeaderVars
	: ""FUNCTION"" 'functionToken' QualifiedName 'qualifiedName' OptionalArguments OptionalType <semicolon> 'semicolon' NonExternalMethodModifiers
	;
ClassFunctionDefinition
	: NonExternalClassFunctionHeader 'header' MethodComponents {{ClassFunctionDefinition}}
	| ExternalClassFunctionHeader 'header' {{ClassFunctionDefinition}}
	;
ExternalClassFunctionHeader
	: ""CLASS"" 'classToken' ExternalFunctionHeaderVars {{ClassFunctionHeader}}
	;
NonExternalClassFunctionHeader
	: ""CLASS"" 'classToken' NonExternalFunctionHeaderVars {{ClassFunctionHeader}}
	;
ClassOperatorDefinition
	: NonExternalClassOperatorHeader 'header' MethodComponents {{ClassOperatorDefinition}}
	| ExternalClassOperatorHeader 'header' {{ClassOperatorDefinition}}
	;
ExternalClassOperatorHeader
	: NonExternalClassOperatorHeader ExternalMethodModifier 'modifier' MethodModifiers {{ClassOperatorHeader}}
	;
NonExternalClassOperatorHeader
	: ""CLASS"" 'classToken' ""OPERATOR"" 'operatorToken' QualifiedName 'qualifiedName' OptionalArguments OptionalType <semicolon> 'semicolon' NonExternalMethodModifiers {{ClassOperatorHeader}}
	;
MethodComponents
	: MethodVariables StatementBlock 'block' <semicolon> 'semicolon'
	;
MethodVariables
	: MethodVariables MethodVariable 'definition'
	| 
	;
MethodVariable
	: Vars
	| DefinedTypeList
	| ConstantValueList
	| ProcedureDefinition
	| FunctionDefinition
	| Labels
	;
Labels
	: ""LABEL"" 'labelToken' VariableNames <semicolon> 'semicolon' {{LabelVariable}}
	;
Vars
	: VarsVars {{Vars}}
	;
VarsVars
	: ""VAR"" 'varToken' VariablesList
	| ""THREADVAR"" 'varToken' VariablesList
	;
VariablesList
	: Variable 'variableDefinition'
	| VariablesList Variable 'variableDefinition'
	;
Variable
	: VariableNames "":"" 'colon' Type 'type' OptionalPlatform OptionalValue <semicolon> 'semicolon' {{Variable}}
	;
Statements
	: Statement 'statement' 
	| Statements <semicolon> 'semicolon' Statement 'statement' 
	;
Statement
	: Expression
	| RepeatStatement {{RepeatStatement}}
	| IfStatement {{IfStatement}} 
	| WithStatement {{WithStatement}}
	| TryStatement {{TryStatement}} 
	| CaseStatement {{CaseStatement}} 
	| RaiseStatement {{RaiseStatement}}  
	| ForStatement {{ForStatement}}
	| ForInStatement {{ForInStatement}}
	| WhileStatement {{WhileStatement}}
	| GotoStatement {{GotoStatement}}
	| StatementBlock
	| LabeledStatement {{LabeledStatement}}
	| {{EmptyStatement}}
	;
LabeledStatement
	: <identifier> 'label' "":"" 'colon' Statement 'statement'
	| <number> 'label' "":"" 'colon' Statement 'statement'
	;
GotoStatement
	: ""GOTO"" 'gotoToken' <identifier> 'label'
	| ""GOTO"" 'gotoToken' <number> 'label'
	;
RepeatStatement
	: ""REPEAT"" 'repeatToken' Statements ""UNTIL"" 'untilToken' Expression 'expression'
	;
IfStatement
	: ""IF"" 'ifToken' Expression 'expression' ""THEN"" 'thenToken' Statement 'thenStatement'
	| ""IF"" 'ifToken' Expression 'expression' ""THEN"" 'thenToken' Statement 'thenStatement' ""ELSE"" 'elseToken' Statement 'elseStatement'
	;
WithStatement
	: ""WITH"" 'withToken' WithExpressions ""DO"" 'doToken' Statement 'statement'
	;
WithExpressions
	: Expression 'expression' 
	| WithExpressions "","" 'comma' Expression 'expression' 
	;
TryStatement
	: ""TRY"" 'tryToken' Statements Except 'except' Finally 'finally' ""END"" 'endToken'
	;
Except
	:
	| ""EXCEPT"" 'exceptToken' OnDos PossibleExceptElse 'else' {{Except}}
	| ""EXCEPT"" 'exceptToken' Statements PossibleExceptElse 'else' {{Except}}
	;
OnDos
	: OnDo 'exceptionCase'
	| OnDos OnDo 'exceptionCase'
	;
OnDo
	: ""ON"" 'onToken' QualifiedName 'exception' OptionalType ""DO"" 'doToken' Statements {{OnDo}}
	;
PossibleExceptElse
	: 
	| ""ELSE"" 'elseToken' Statements {{ExceptElse}}
	;
Finally
	: 
	| ""FINALLY"" 'finallyToken' Statements {{Finally}}
	;
CaseStatement
	: ""CASE"" 'caseToken' Expression 'expression' ""OF"" 'ofToken' CaseOptionList ElseCase ""END"" 'endToken'
	;
OptionalSemicolon
	:
	| <semicolon> 'semicolon'
	;
CaseOptionList
	: CaseOptions OptionalSemicolon
	;
CaseOptions
	: CaseOption 'option'
	| CaseOptions <semicolon> 'semicolon'  CaseOption 'option'  
	;
CaseOption
	: CaseLabel 'label' "":"" 'colon' Statement 'statement' {{CaseOption}}
	;
CaseLabel
	: BaseCaseLabel 
	| CaseLabels "","" 'comma' BaseCaseLabel 'label' {{MultiValueCaseLabel}}
	;
CaseLabels
	: BaseCaseLabel 'label'
	| CaseLabels "","" 'comma' BaseCaseLabel 'label'
	;
BaseCaseLabel
	: ConstantExpression 'value' {{CaseLabel}} 
	| ConstantExpression 'fromValue'  "".."" 'dots' ConstantExpression 'toValue' {{RangeCaseLabel}} 
	;
ElseCase
	: 
	| ""ELSE"" 'elseToken' Statements
	;
RaiseStatement
	: ""RAISE"" 'raiseToken' Expression 'expression' OptionalRaiseAt
	| ""RAISE"" 'raiseToken'
	;
OptionalRaiseAt
	: 
	| <at> 'atToken' QualifiedName 'location'
	;
ForStatement
	: ""FOR"" 'forToken' VariableExpression 'variable' "":="" 'assignmentToken' Expression 'fromExpr' ToDownTo  'toToken' Expression 'toExpr' ""DO"" 'doToken' Statement 'statement' 
	;
ForInStatement
	: ""FOR"" 'forToken' VariableExpression 'variable' ""IN"" 'inToken' Expression 'fromExpr' ""DO"" 'doToken' Statement 'statement' 
	;
ToDownTo
	: ""TO""
	| ""DOWNTO""
	;
WhileStatement
	: ""WHILE"" 'whileToken' Expression 'expression' ""DO"" 'doToken' Statement 'statement'
	;
StatementBlock
	: ""BEGIN"" 'beginToken' Statements ""END"" 'endToken' {{StatementBlock}} 
	| AsmBlock
	;
AsmBlock
	: BeforeAsm ""ASM"" 'asmToken' ""END"" 'endToken' {{AsmBlock}} 
	;
BeforeAsm
	: {parseAll ifFalse: [scanner skipToEndToken. currentState scannerState: scanner currentState]. nil}
	;
Expression
	: VariableExpression
	| InstantiatedGenericVariableExpression
	| Expression 'expression' ""."" 'period' <identifier> 'name' {{PropertyExpression}}
	| Expression 'expression' ""."" 'period' ""&OPERATOR"" 'name' {{PropertyExpression}}
	| Expression 'receiver' ""("" 'left' MethodArguments "")"" 'right' {{MethodCallExpression}}
	| Expression 'receiver' ""("" 'left' "")"" 'right' {{MethodCallExpression}}
	| InheritedFunctionCall
	| Number 'value' {{LiteralExpression}}
	| String 'value' {{LiteralExpression}}
	| <multiple_control_chars> 'value' {{LiteralExpression}}
	| Expression 'leftExpression' Operator 'operator' Expression 'rightExpression' {{BinaryExpression}}
	| ""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
	| Expression 'lhs' "":="" 'assignment' Expression 'value' {{AssignmentExpression}} # allows for non-sense assignments
	| Expression 'expression' ArrayIndex {{ArrayExpression}}
	| ""@"" 'atToken' Expression 'expression' {{AddressExpression}} # should only be variables
	| ""NOT"" 'notToken' Expression 'expression' {{NotExpression}} 
	| <minus> 'minus' Expression 'expression' {{MinusExpression}}
	| <plus> 'plus' Expression 'expression' {{PlusExpression}}
	| SetConstructor 
	| Expression 'expression' <upArrow> 'upArrow' {{PointerExpression}} 
	| <controlCharacter> 'value' {{LiteralExpression}}
	| MemExpression 
	;
MemExpression
	: ""MEM"" 'mem' ""["" 'leftBrace' Expression 'baseExpression' "":"" 'colon' Expression 'addressExpression' ""]"" 'rightBrace' {{}}
	| ""MEMW"" 'mem' ""["" 'leftBrace' Expression 'baseExpression' "":"" 'colon' Expression 'addressExpression' ""]"" 'rightBrace' {{}}
	;
VariableExpression
	: <identifier> 'name' {{VariableExpression}}
	;
InstantiatedGenericVariableExpression
	: <identifier> 'name' InstantiatedGenericTypeArguments {{}}
	;
SetConstructor
	: ""["" 'left' SetConstructorValues ""]"" 'right' {{SetExpression}}
	| ""["" 'left' ""]"" 'right' {{SetExpression}}
	;
SetConstructorValues
	: SetValue 'value' 
	| SetConstructorValues "","" 'comma' SetValue 'value'
	;
SetValue
	: Expression 'value' {{SingleSetValue}}
	| Expression 'fromValue' "".."" 'dots' Expression 'toValue' {{RangeSetValue}}
	;
ArrayIndex
	: ""["" 'left' ArrayIndices ""]"" 'right'
	;
ArrayIndices
	: Expression 'index'
	| ArrayIndices "","" 'comma' Expression 'index' 
	;
String
	: <string>
	;
InheritedFunctionCall
	: ""INHERITED"" 'inheritedToken' <identifier> 'name' ""("" 'left' MethodArguments "")"" 'right' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' <identifier> 'name' ""("" 'left' "")"" 'right' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' <identifier> 'name' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' {{InheritedFunctionCall}} 
	;
MethodArguments
	: MethodArgument 'argument'
	| MethodArguments "","" 'comma' MethodArgument 'argument'
	;
MethodArgument
	: Expression
	| MethodArgument 'argument' "":"" 'colon' Expression 'formatExpression' {{FormattedMethodArgument}}
	;
Operator
	: ""="" 'operator' 
	| ConstantOperator 'operator' 
	;
ConstantOperator
	: ""AND""
	| ""OR""
	| ""XOR""
	| ""<>""
	| ""DIV""
	| ""MOD""
	| ""*""
	| ""/""
	| <plus>
	| <minus>
	| ""SHL""
	| ""SHR""
	| ""AS""
	| "">""
	| ""<""
	| ""<=""
	| "">=""
	| ""IN""
	| ""IS""
	;
InitializationSection
	:
	| ""INITIALIZATION"" 'initializationToken' Statements {{InitializationSection}} 
	;
FinalizationSection
	: 
	| ""FINALIZATION"" 'finalizationToken' Statements {{FinalizationSection}} 
	;
EndFile
	: ""END"" 'endToken' ""."" 'period'
	;"
]

{ #category : #'file types' }
DelphiParser class >> fileExtension [
	^ '.pas'
]

{ #category : #'file types' }
DelphiParser class >> fileExtensionType [
	^ 'Delphi files'
]

{ #category : #'generated-accessing' }
DelphiParser class >> scannerClass [
	^DelphiScanner
]

{ #category : #generated }
DelphiParser class >> startingStateForFile [
	^ 1
]

{ #category : #generated }
DelphiParser class >> startingStateForNamedDefinedType [
	^ 4
]

{ #category : #generated }
DelphiParser class >> startingStateForSimpleDefinedType [
	^ 3
]

{ #category : #generated }
DelphiParser class >> startingStateForStatement [
	^ 2
]

{ #category : #private }
DelphiParser >> actionsForCurrentToken [
	| actions action ids newToken |
	actions := OrderedCollection new: 1.
	ids := currentToken ids.
	ids
		do: [ :anInteger | 
			self addActionsFor: anInteger to: actions.
			(anInteger = scanner atId or: [ currentToken value sameAs: 'on' ])
				ifTrue: [ self
						addActionsFor: scanner identifierId to: actions;
						addActionsFor: scanner constantIdentifierId to: actions ].
			actions notEmpty
				ifTrue: [ ^ actions ] ].
	((ids includes: scanner identifierId)
		and: [ (ids includes: scanner constantIdentifierId) not ])
		ifTrue: [ action := self actionFor: scanner constantIdentifierId.
			(action bitAnd: self actionMask) ~= self errorAction
				ifTrue: [ actions add: action.
					^ actions ] ].
	(ids includes: scanner upArrowId)
		ifTrue: [ newToken := scanner scanControlCharacter.
			newToken notNil
				ifTrue: [ currentToken := newToken.
					currentState scannerState: scanner currentState.
					self addActionsFor: scanner controlCharacterId to: actions.
					actions notEmpty
						ifTrue: [ ^ actions ] ] ].
	action := self actionFor: scanner semicolonId.
	((action bitAnd: self actionMask) ~= self errorAction
		and: [ states size = 1 ])
		ifTrue: [ lastInsertPosition = currentToken startPosition
				ifTrue: [ ^ actions ].	"Don't get into a loop inserting ;'s"
			lastInsertPosition := currentToken startPosition.
			self position: currentToken startPosition - 1.
			currentToken := scanner tokenClass
				value: ';'
				start: nil
				ids: (Array with: scanner semicolonId).
			self addActionsFor: scanner semicolonId to: actions.
			actions notEmpty
				ifTrue: [ ^ actions ] ].
	^ actions
]

{ #category : #private }
DelphiParser >> addActionsFor: anInteger to: anOrderedCollection [
	| action |
	action := self actionForState: self currentState and: anInteger.
	action = self errorAction
		ifTrue:
			[ action := self actionFor: anInteger.
			(action bitAnd: self actionMask) = self errorAction
				ifFalse: [ ^ anOrderedCollection add: action ].
			(anInteger = scanner numberId
				and:
					[ currentToken value notEmpty
						and: [ '+-' includes: currentToken value first ] ])
				ifTrue:
					[ currentToken := scanner tokenClass
						value: (currentToken value copyFrom: 1 to: 1)
						start: currentToken startPosition
						ids:
							(Array
								with:
									(currentToken value first = $-
										ifTrue: [ scanner minusId ]
										ifFalse: [ scanner plusId ])).
					self position: currentToken stopPosition.
					^ self
						addActionsFor:
							(currentToken value first = $-
								ifTrue: [ scanner minusId ]
								ifFalse: [ scanner plusId ])
						to: anOrderedCollection ].
			^ self ].
	(action bitAnd: self actionMask) = 2r11
		ifTrue:
			[ self
				ambiguousTransitionsAt: (action bitShift: -2)
				into: anOrderedCollection ]
		ifFalse: [ anOrderedCollection add: action ]
]

{ #category : #generated }
DelphiParser >> ambiguousTransitions [
^#(
#[ 0 58 2 49] 
#[ 0 146 0 150] 
#[ 0 170 2 85] 
#[ 0 170 2 101] 
#[ 0 210 2 85] 
#[ 0 210 2 89] 
#[ 0 210 2 93] 
#[ 0 210 2 97] 
#[ 0 210 2 101] 
#[ 0 210 2 105] 
#[ 0 210 2 121] 
#[ 0 226 2 85] 
#[ 0 226 2 89] 
#[ 0 226 2 93] 
#[ 0 226 2 97] 
#[ 0 226 2 101] 
#[ 0 226 2 105] 
#[ 0 226 2 121] 
#[ 0 254 2 85] 
#[ 0 254 2 89] 
#[ 0 254 2 93] 
#[ 0 254 2 97] 
#[ 0 254 2 101] 
#[ 0 254 2 105] 
#[ 0 254 2 121] 
#[ 1 2 2 85] 
#[ 1 2 2 89] 
#[ 1 2 2 93] 
#[ 1 2 2 97] 
#[ 1 2 2 101] 
#[ 1 2 2 105] 
#[ 1 2 2 121] 
#[ 1 42 4 125] 
#[ 1 50 2 85] 
#[ 1 50 2 89] 
#[ 1 50 2 93] 
#[ 1 50 2 101] 
#[ 1 50 2 105] 
#[ 1 50 2 121] 
#[ 1 62 2 85] 
#[ 1 62 2 89] 
#[ 1 62 2 93] 
#[ 1 62 2 101] 
#[ 1 62 2 105] 
#[ 1 62 2 121] 
#[ 0 178 3 49] 
#[ 1 74 2 85] 
#[ 1 74 2 89] 
#[ 1 74 2 93] 
#[ 1 74 2 101] 
#[ 1 74 2 105] 
#[ 1 74 2 121] 
#[ 1 78 2 85] 
#[ 1 78 2 89] 
#[ 1 78 2 93] 
#[ 1 78 2 101] 
#[ 1 78 2 105] 
#[ 1 78 2 121] 
#[ 1 82 2 49] 
#[ 1 202 2 85] 
#[ 1 202 2 89] 
#[ 1 202 2 93] 
#[ 1 202 2 97] 
#[ 1 202 2 101] 
#[ 1 202 2 105] 
#[ 1 202 2 121] 
#[ 1 210 2 85] 
#[ 1 210 2 89] 
#[ 1 210 2 93] 
#[ 1 210 2 97] 
#[ 1 210 2 101] 
#[ 1 210 2 105] 
#[ 1 210 2 121] 
#[ 1 222 2 49] 
#[ 1 242 2 85] 
#[ 1 242 2 101] 
#[ 2 18 2 85] 
#[ 2 18 2 89] 
#[ 2 18 2 93] 
#[ 2 18 2 101] 
#[ 2 18 2 105] 
#[ 2 18 2 121] 
#[ 2 22 2 49] 
#[ 0 146 8 85] 
#[ 3 190 9 233] 
#[ 3 190 9 237] 
#[ 3 190 10 29] 
#[ 2 49 3 210] 
#[ 0 182 3 57] 
#[ 5 26 9 233] 
#[ 5 26 9 237] 
#[ 5 26 10 29]
	).
]

{ #category : #private }
DelphiParser >> parse [
	| node expressionVisitor result |
	expressionVisitor := DelphiBinaryExpressionVisitor new.	"Hack to handle the incorrect parsing of a * b + c as a * (b + c)"
	result := super parse.
	^ parseAll
		ifTrue:
			[ result
				collect:
					[ :each | 
					node := expressionVisitor accept: each.
					(node isKindOf: SmaCCParseNode)
						ifTrue:
							[ node
								attributeNamed: #ifDefs put: scanner ifDefs;
								attributeNamed: #opts put: scanner optComments ].
					node ] ]
		ifFalse:
			[ node := expressionVisitor accept: result.
			(node isKindOf: SmaCCParseNode)
				ifTrue:
					[ node
						attributeNamed: #ifDefs put: scanner ifDefs;
						attributeNamed: #opts put: scanner optComments ].
			node ]
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAnonymousFunctionType1: nodes [
	| result |
	result := DelphiAnonymousFunctionTypeNode new.
	result functionToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result right: ((nodes at: 2) at: 4).
	result colon: (nodes at: 3).
	result type: (nodes at: 4).
	result ofToken: ((nodes at: 5) at: 1).
	result objectToken: ((nodes at: 5) at: 2).
	result addToken: (nodes at: 6) to: result semicolons.
	result addNodes: (nodes at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAnonymousProcedureType1: nodes [
	| result |
	result := DelphiAnonymousProcedureTypeNode new.
	result procedureToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result right: ((nodes at: 2) at: 4).
	result ofToken: ((nodes at: 3) at: 1).
	result objectToken: ((nodes at: 3) at: 2).
	result addToken: (nodes at: 4) to: result semicolons.
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgument1: nodes [
	| result |
	result := DelphiArgumentNode new.
	result typeToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result colon: (nodes at: 3).
	result type: (nodes at: 4).
	result equal: ((nodes at: 5) at: 1).
	result value: ((nodes at: 5) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgument2: nodes [
	| result |
	result := DelphiArgumentNode new.
	result typeToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgumentList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArrayType1: nodes [
	| result |
	result := DelphiArrayTypeNode new.
	result packedToken: (nodes at: 1).
	result arrayToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result indexes.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result ofToken: (nodes at: 4).
	result type: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArrayType2: nodes [
	| result |
	result := DelphiArrayTypeNode new.
	result packedToken: (nodes at: 1).
	result arrayToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result indexes.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result ofToken: (nodes at: 4).
	result constToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAsmBlock1: nodes [
	| result |
	result := DelphiAsmBlockNode new.
	result asmToken: (nodes at: 2).
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBaseCaseLabel1: nodes [
	| result |
	result := DelphiCaseLabelNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBaseCaseLabel2: nodes [
	| result |
	result := DelphiRangeCaseLabelNode new.
	result fromValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result toValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBeforeAsm1: nodes [
	parseAll
		ifFalse: [ scanner skipToEndToken.
			currentState scannerState: scanner currentState ].
	^ nil
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseLabel2: nodes [
	| result |
	result := DelphiMultiValueCaseLabelNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result labels.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result addToken: (nodes at: 2) to: result commas.
	result addNode: (nodes at: 3) to: result labels.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseOption1: nodes [
	| result |
	result := DelphiCaseOptionNode new.
	result label: (nodes at: 1).
	result colon: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseOptionList1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseStatement1: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: ((nodes at: 5) at: 1).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 5).
	result at: 8 put: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassFunctionDefinition1: nodes [
	| result |
	result := DelphiClassFunctionDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassFunctionDefinition2: nodes [
	| result |
	result := DelphiClassFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassHelperType1: nodes [
	| result |
	result := DelphiClassHelperTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result helperToken: (nodes at: 3).
	result forToken: (nodes at: 4).
	result _class: (nodes at: 5).
	result left: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result right: ((nodes at: 6) at: 4).
	result implicitClassSection: (nodes at: 7).
	result addNodes: (nodes at: 8) to: result sections.
	result endToken: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassHelperType2: nodes [
	| result |
	result := DelphiClassHelperTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result helperToken: (nodes at: 3).
	result forToken: (nodes at: 4).
	result _class: (nodes at: 5).
	result left: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result right: ((nodes at: 6) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassOperatorDefinition1: nodes [
	| result |
	result := DelphiClassOperatorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassOperatorDefinition2: nodes [
	| result |
	result := DelphiClassOperatorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassProcedureDefinition1: nodes [
	| result |
	result := DelphiClassProcedureDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassProcedureDefinition2: nodes [
	| result |
	result := DelphiClassProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassPropertyHeader1: nodes [
	| result |
	result := DelphiClassPropertyHeaderNode new.
	result classToken: (nodes at: 1).
	result propertyToken: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result arrayAccessors: ((nodes at: 2) at: 3).
	result colon: ((nodes at: 2) at: 4).
	result type: ((nodes at: 2) at: 5).
	result addNodes: ((nodes at: 2) at: 6) to: result indexes.
	result addNodes: ((nodes at: 2) at: 7) to: result readers.
	result addNodes: ((nodes at: 2) at: 8) to: result writers.
	result addNodes: ((nodes at: 2) at: 9) to: result defaults.
	result addNodes: ((nodes at: 2) at: 10) to: result storeds.
	result addNodes: ((nodes at: 2) at: 11) to: result implementses.
	result addNodes: ((nodes at: 2) at: 12) to: result dispids.
	result semicolon: ((nodes at: 2) at: 13).
	result modifier: ((nodes at: 2) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantArray1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantArray2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantExpression10: nodes [
	| result |
	result := DelphiRecordExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result fields.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result addToken: (nodes at: 3) to: result semicolons.
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantExpression11: nodes [
	| result |
	result := DelphiConstantArrayExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result equalTokens.
	result addNodes: ((nodes at: 2) at: 3) to: result values.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantRecordField1: nodes [
	| result |
	result := DelphiConstantRecordFieldNode new.
	result name: (nodes at: 1).
	result colon: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValue1: nodes [
	| result |
	result := DelphiConstantDefinitionNode new.
	result name: (nodes at: 1).
	result colon: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result equalToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result modifier: (nodes at: 5).
	result deprecatedToken: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValueList1: nodes [
	| result |
	result := DelphiConstantListNode new.
	result constToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValues1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstructorDefinition1: nodes [
	| result |
	result := DelphiConstructorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstructorDefinition2: nodes [
	| result |
	result := DelphiConstructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDefinedType2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDefinedTypeList1: nodes [
	| result |
	result := DelphiDefinedTypeListNode new.
	result typeToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDestructorDefinition1: nodes [
	| result |
	result := DelphiDestructorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDestructorDefinition2: nodes [
	| result |
	result := DelphiDestructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForElseCase1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForElseCase2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumName1: nodes [
	| result |
	result := DelphiEnumNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumName2: nodes [
	| result |
	result := DelphiEnumNameNode new.
	result name: (nodes at: 1).
	result equal: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumType1: nodes [
	| result |
	result := DelphiEnumTypeNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExcept2: nodes [
	| result |
	result := DelphiExceptNode new.
	result exceptToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result exceptionCases.
	result else: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExcept3: nodes [
	| result |
	result := DelphiExceptNode new.
	result exceptToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result else: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression10: nodes [
	| result |
	result := DelphiLiteralExpressionNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression11: nodes [
	| result |
	result := DelphiBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression12: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression13: nodes [
	| result |
	result := DelphiAssignmentExpressionNode new.
	result lhs: (nodes at: 1).
	result assignment: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression14: nodes [
	| result |
	result := DelphiArrayExpressionNode new.
	result expression: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result indexes.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression15: nodes [
	| result |
	result := DelphiAddressExpressionNode new.
	result atToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression16: nodes [
	| result |
	result := DelphiNotExpressionNode new.
	result notToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression17: nodes [
	| result |
	result := DelphiMinusExpressionNode new.
	result minus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression18: nodes [
	| result |
	result := DelphiPlusExpressionNode new.
	result plus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression20: nodes [
	| result |
	result := DelphiPointerExpressionNode new.
	result expression: (nodes at: 1).
	result upArrow: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression4: nodes [
	| result |
	result := DelphiPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression5: nodes [
	| result |
	result := DelphiMethodCallExpressionNode new.
	result receiver: (nodes at: 1).
	result left: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression6: nodes [
	| result |
	result := DelphiMethodCallExpressionNode new.
	result receiver: (nodes at: 1).
	result left: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalClassFunctionHeader1: nodes [
	| result |
	result := DelphiClassFunctionHeaderNode new.
	result classToken: (nodes at: 1).
	result functionToken: ((nodes at: 2) at: 1).
	result qualifiedName: ((nodes at: 2) at: 2).
	result left: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result arguments.
	result addTokens: ((nodes at: 2) at: 5) to: result semicolons.
	result right: ((nodes at: 2) at: 6).
	result colon: ((nodes at: 2) at: 7).
	result type: ((nodes at: 2) at: 8).
	result addNodes: ((nodes at: 2) at: 9) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalClassProcedureHeader1: nodes [
	| result |
	result := DelphiClassProcedureHeaderNode new.
	result classToken: (nodes at: 1).
	result procedureToken: ((nodes at: 2) at: 1).
	result qualifiedName: ((nodes at: 2) at: 2).
	result left: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result arguments.
	result addTokens: ((nodes at: 2) at: 5) to: result semicolons.
	result right: ((nodes at: 2) at: 6).
	result addNodes: ((nodes at: 2) at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalConstructorHeader1: nodes [
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result modifiers.
	result addNodes: (nodes at: 3) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalFunctionHeader1: nodes [
	| result |
	result := DelphiFunctionHeaderNode new.
	result functionToken: ((nodes at: 1) at: 1).
	result qualifiedName: ((nodes at: 1) at: 2).
	result left: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result arguments.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result right: ((nodes at: 1) at: 6).
	result colon: ((nodes at: 1) at: 7).
	result type: ((nodes at: 1) at: 8).
	result addNodes: ((nodes at: 1) at: 9) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalFunctionHeaderVars1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 9).
	self addAll: (nodes at: 3) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier1: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier4: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result library: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier5: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result library: (nodes at: 2).
	result nameToken: (nodes at: 3).
	result methodName: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier6: nodes [
	| result |
	result := DelphiMethodModifierNode new.
	result modifier: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalProcedureHeader1: nodes [
	| result |
	result := DelphiProcedureHeaderNode new.
	result procedureToken: ((nodes at: 1) at: 1).
	result qualifiedName: ((nodes at: 1) at: 2).
	result left: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result arguments.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result right: ((nodes at: 1) at: 6).
	result addNodes: ((nodes at: 1) at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalProcedureHeaderVars1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 7).
	self addAll: (nodes at: 3) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile1: nodes [
	| result |
	result := DelphiUnitFileNode new.
	result unitToken: ((nodes at: 1) at: 1).
	result unitName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result semicolon: ((nodes at: 1) at: 4).
	result interfaceSection: ((nodes at: 1) at: 5).
	result implementationSection: ((nodes at: 1) at: 6).
	result initializationSection: ((nodes at: 1) at: 7).
	result finalizationSection: ((nodes at: 1) at: 8).
	result endToken: ((nodes at: 1) at: 9).
	result period: ((nodes at: 1) at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile2: nodes [
	| result |
	result := DelphiProgramFileNode new.
	result programToken: ((nodes at: 1) at: 1).
	result programName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result addTokens: ((nodes at: 1) at: 4) to: result semicolons.
	result usesToken: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result moduleNames.
	result addTokens: ((nodes at: 1) at: 7) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result filenames.
	result addTokens: ((nodes at: 1) at: 9) to: result commas.
	result main: ((nodes at: 1) at: 10).
	result period: ((nodes at: 1) at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile3: nodes [
	| result |
	result := DelphiLibraryFileNode new.
	result libraryToken: ((nodes at: 1) at: 1).
	result libraryName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result addTokens: ((nodes at: 1) at: 4) to: result semicolons.
	result usesToken: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result moduleNames.
	result addTokens: ((nodes at: 1) at: 7) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result filenames.
	result addTokens: ((nodes at: 1) at: 9) to: result commas.
	result addNodes: ((nodes at: 1) at: 10) to: result exports.
	result main: ((nodes at: 1) at: 11).
	result period: ((nodes at: 1) at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFileType1: nodes [
	| result |
	result := DelphiFileTypeNode new.
	result fileToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result type: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFileType2: nodes [
	| result |
	result := DelphiFileTypeNode new.
	result fileToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFinalizationSection2: nodes [
	| result |
	result := DelphiFinalizationSectionNode new.
	result finalizationToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFinally2: nodes [
	| result |
	result := DelphiFinallyNode new.
	result finallyToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForForInStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForForStatement1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFullModuleName1: nodes [
	| result |
	result := DelphiModuleNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFullModuleName2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periods.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFunctionDefinition1: nodes [
	| result |
	result := DelphiFunctionDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFunctionDefinition2: nodes [
	| result |
	result := DelphiFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForGotoStatement1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForGuid2: nodes [
	| result |
	result := DelphiGuidNode new.
	result left: (nodes at: 1).
	result string: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForIfStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplementationCode2: nodes [
	| result |
	result := DelphiImplementationCodeNode new.
	result beginToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplementationSection2: nodes [
	| result |
	result := DelphiImplementationSectionNode new.
	result implementationToken: (nodes at: 1).
	result usesToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result moduleNames.
	result addTokens: ((nodes at: 2) at: 3) to: result inTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result filenames.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result semicolon: ((nodes at: 2) at: 6).
	result addNodes: (nodes at: 3) to: result definitions.
	result code: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplicitClassSection1: nodes [
	| result |
	result := DelphiImplicitClassSectionNode new.
	result addNodes: (nodes at: 1) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall1: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall2: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall3: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall4: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInitializationSection2: nodes [
	| result |
	result := DelphiInitializationSectionNode new.
	result initializationToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInstantiatedGenericTypeArguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInstantiatedGenericVariableExpression1: nodes [
	| result |
	result := DelphiInstantiatedGenericVariableExpressionNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result typeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceFunctionAssignment1: nodes [
	| result |
	result := DelphiInterfaceFunctionAssignmentNode new.
	result function: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result name: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceProcedureAssignment1: nodes [
	| result |
	result := DelphiInterfaceProcedureAssignmentNode new.
	result procedureToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result name: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceSection2: nodes [
	| result |
	result := DelphiInterfaceSectionNode new.
	result interfaceToken: (nodes at: 1).
	result usesToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result moduleNames.
	result addTokens: ((nodes at: 2) at: 3) to: result inTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result filenames.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result semicolon: ((nodes at: 2) at: 6).
	result addNodes: (nodes at: 3) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceType1: nodes [
	| result |
	result := DelphiInterfaceTypeNode new.
	result interfaceToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result guid: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result components.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceType2: nodes [
	| result |
	result := DelphiInterfaceTypeNode new.
	result interfaceToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLabeledStatement1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLabels1: nodes [
	| result |
	result := DelphiLabelVariableNode new.
	result labelToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLibraryExport1: nodes [
	| result |
	result := DelphiLibraryExportNode new.
	result exportsToken: (nodes at: 1).
	result name: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLibraryFile1: nodes [
	| result |
	result := Array new: 12.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	result at: 5 put: ((nodes at: 2) at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 9).
	self add: ((nodes at: 2) at: 6) to: (result at: 4).
	self addAll: (nodes at: 3) to: (result at: 10).
	result at: 11 put: (nodes at: 4).
	result at: 12 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLibraryLine1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMainMethod1: nodes [
	| result |
	result := DelphiMainMethodDefinitionNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result definitions.
	result block: ((nodes at: 1) at: 2).
	result semicolon: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMemExpression1: nodes [
	| result |
	result := DelphiMemExpressionNode new.
	result mem: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result baseExpression: (nodes at: 3).
	result colon: (nodes at: 4).
	result addressExpression: (nodes at: 5).
	result rightBrace: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMetaclassType1: nodes [
	| result |
	result := DelphiMetaclassTypeNode new.
	result classToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodArgument2: nodes [
	| result |
	result := DelphiFormattedMethodArgumentNode new.
	result argument: (nodes at: 1).
	result colon: (nodes at: 2).
	result formatExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodAttribute1: nodes [
	| result |
	result := DelphiMethodAttributeNode new.
	result left: (nodes at: 1).
	result expression: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodComponents1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodVariables1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodVariables2: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNamedDefinedType1: nodes [
	| result |
	result := DelphiNamedDefinedTypeNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result equalToken: (nodes at: 3).
	result type: ((nodes at: 4) at: 1).
	result modifier: ((nodes at: 4) at: 2).
	result semicolon: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassComponent1: nodes [
	| result |
	result := DelphiVariableDefinitionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result colon: (nodes at: 2).
	result type: (nodes at: 3).
	result modifier: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassComponent2: nodes [
	| result |
	result := DelphiClassVarsNode new.
	result classToken: (nodes at: 1).
	result varToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result variableDefinitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassComponent5: nodes [
	| result |
	result := nodes at: 2.
	result attribute: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassType1: nodes [
	| result |
	result := DelphiNewClassTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result implicitClassSection: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result sections.
	result endToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassType2: nodes [
	| result |
	result := DelphiNewClassTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalClassOperatorHeader1: nodes [
	| result |
	result := DelphiClassOperatorHeaderNode new.
	result classToken: (nodes at: 1).
	result operatorToken: (nodes at: 2).
	result qualifiedName: (nodes at: 3).
	result left: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result semicolons.
	result right: ((nodes at: 4) at: 4).
	result colon: ((nodes at: 5) at: 1).
	result type: ((nodes at: 5) at: 2).
	result addToken: (nodes at: 6) to: result semicolons.
	result addNodes: (nodes at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalConstructorHeader1: nodes [
	| result |
	result := DelphiConstructorHeaderNode new.
	result constructorToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result semicolons.
	result right: ((nodes at: 3) at: 4).
	result addToken: (nodes at: 4) to: result semicolons.
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalDestructorHeader1: nodes [
	| result |
	result := DelphiDestructorHeaderNode new.
	result destructorToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result right: ((nodes at: 3) at: 2).
	result semicolon: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalFunctionHeaderVars1: nodes [
	| result |
	result := Array new: 9.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	result at: 6 put: ((nodes at: 3) at: 4).
	result at: 7 put: ((nodes at: 4) at: 1).
	result at: 8 put: ((nodes at: 4) at: 2).
	self add: (nodes at: 5) to: (result at: 5).
	self addAll: (nodes at: 6) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalMethodModifier3: nodes [
	| result |
	result := DelphiMessageMethodModifierNode new.
	result modifier: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalProcedureHeaderVars1: nodes [
	| result |
	result := Array new: 7.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	result at: 6 put: ((nodes at: 3) at: 4).
	self add: (nodes at: 4) to: (result at: 5).
	self addAll: (nodes at: 5) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOldClassType1: nodes [
	| result |
	result := DelphiOldClassTypeNode new.
	result objectToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result implicitClassSection: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result sections.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOnDo1: nodes [
	| result |
	result := DelphiOnDoNode new.
	result onToken: (nodes at: 1).
	result exception: (nodes at: 2).
	result colon: ((nodes at: 3) at: 1).
	result type: ((nodes at: 3) at: 2).
	result doToken: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result statements.
	result addTokens: ((nodes at: 5) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOptionalArguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOptionalRaiseAt1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPossibleExceptElse2: nodes [
	| result |
	result := DelphiExceptElseNode new.
	result elseToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPrivateClassSection1: nodes [
	| result |
	result := DelphiPrivateClassSectionNode new.
	result strictToken: (nodes at: 1).
	result privateToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPrivateClassSection2: nodes [
	| result |
	result := DelphiPrivateClassSectionNode new.
	result privateToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProcedureDefinition1: nodes [
	| result |
	result := DelphiProcedureDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProcedureDefinition2: nodes [
	| result |
	result := DelphiProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProgramFile1: nodes [
	| result |
	result := Array new: 11.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	result at: 5 put: ((nodes at: 2) at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 9).
	self add: ((nodes at: 2) at: 6) to: (result at: 4).
	result at: 10 put: (nodes at: 3).
	result at: 11 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProgramFile2: nodes [
	| result |
	result := Array new: 11.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 5 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 9).
	self add: ((nodes at: 1) at: 6) to: (result at: 4).
	result at: 10 put: (nodes at: 2).
	result at: 11 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyArrayAccessors2: nodes [
	| result |
	result := DelphiPropertyArrayAccessorsNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result arguments.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault1: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault2: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault3: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result nodefaultToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid1: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result dispidToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid2: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result readOnlyToken: (nodes at: 1).
	result dispidToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid3: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result writeOnlyToken: (nodes at: 1).
	result dispidToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyHeader1: nodes [
	| result |
	result := DelphiPropertyHeaderNode new.
	result propertyToken: ((nodes at: 1) at: 1).
	result name: ((nodes at: 1) at: 2).
	result arrayAccessors: ((nodes at: 1) at: 3).
	result colon: ((nodes at: 1) at: 4).
	result type: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result indexes.
	result addNodes: ((nodes at: 1) at: 7) to: result readers.
	result addNodes: ((nodes at: 1) at: 8) to: result writers.
	result addNodes: ((nodes at: 1) at: 9) to: result defaults.
	result addNodes: ((nodes at: 1) at: 10) to: result storeds.
	result addNodes: ((nodes at: 1) at: 11) to: result implementses.
	result addNodes: ((nodes at: 1) at: 12) to: result dispids.
	result semicolon: ((nodes at: 1) at: 13).
	result modifier: ((nodes at: 1) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyHeaderVars1: nodes [
	| result |
	result := Array new: 14.
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: ((nodes at: 4) at: 1).
	result at: 5 put: ((nodes at: 4) at: 2).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 4) to: (result at: 9).
	self addAll: ((nodes at: 5) at: 5) to: (result at: 10).
	self addAll: ((nodes at: 5) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 5) at: 7) to: (result at: 12).
	result at: 13 put: (nodes at: 6).
	result at: 14 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyImplements1: nodes [
	| result |
	result := DelphiPropertyImplementsNode new.
	result implementsToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result interfaces.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyIndex1: nodes [
	| result |
	result := DelphiPropertyIndexNode new.
	result indexToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyModifiers2: nodes [
	| result |
	result := DelphiPropertyModifierNode new.
	result defaultToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyReader1: nodes [
	| result |
	result := DelphiPropertyReaderNode new.
	result readToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyStored1: nodes [
	| result |
	result := DelphiPropertyStoredNode new.
	result storedToken: (nodes at: 1).
	result isStored: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues4: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues5: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues6: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues7: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues8: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyWriter1: nodes [
	| result |
	result := DelphiPropertyWriterNode new.
	result writeToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProtectedClassSection1: nodes [
	| result |
	result := DelphiProtectedClassSectionNode new.
	result strictToken: (nodes at: 1).
	result protectedToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProtectedClassSection2: nodes [
	| result |
	result := DelphiProtectedClassSectionNode new.
	result protectedToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPublicClassSection1: nodes [
	| result |
	result := DelphiPublicClassSectionNode new.
	result publicToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPublishedClassSection1: nodes [
	| result |
	result := DelphiPublishedClassSectionNode new.
	result publishedToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForQualifiedName1: nodes [
	| result |
	result := DelphiQualifiedNameNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForQualifiedName2: nodes [
	| result |
	result := DelphiQualifiedNameNode new.
	result namespace: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result period: (nodes at: 3).
	result name: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRaiseStatement1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	result at: 4 put: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRaiseStatement2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRangeType1: nodes [
	| result |
	result := DelphiRangeTypeNode new.
	result startValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result endValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordFieldList1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordFieldList2: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	result at: 2 put: ((nodes at: 3) at: 1).
	result at: 3 put: ((nodes at: 3) at: 2).
	result at: 4 put: ((nodes at: 3) at: 3).
	result at: 5 put: ((nodes at: 3) at: 4).
	result at: 6 put: ((nodes at: 3) at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordType1: nodes [
	| result |
	result := DelphiRecordTypeNode new.
	result packedToken: (nodes at: 1).
	result recordToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result sections.
	result caseToken: ((nodes at: 3) at: 2).
	result value: ((nodes at: 3) at: 3).
	result colon: ((nodes at: 3) at: 4).
	result type: ((nodes at: 3) at: 5).
	result ofToken: ((nodes at: 3) at: 6).
	result addNodes: ((nodes at: 3) at: 7) to: result variantTypes.
	result addTokens: ((nodes at: 3) at: 8) to: result semicolons.
	result endToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRepeatStatement1: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForResource1: nodes [
	| result |
	result := DelphiResourceStringDefinitionNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	result deprecatedToken: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForResourceStringList1: nodes [
	| result |
	result := DelphiResourceStringListNode new.
	result resourceStringToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructor1: nodes [
	| result |
	result := DelphiSetExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructor2: nodes [
	| result |
	result := DelphiSetExpressionNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType1: nodes [
	| result |
	result := DelphiExpressionSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result setValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType2: nodes [
	| result |
	result := DelphiRangeSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result setValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType3: nodes [
	| result |
	result := DelphiValuesSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result left: (nodes at: 3).
	result addTokens: ((nodes at: 4) at: 1) to: result names.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetValue1: nodes [
	| result |
	result := DelphiSingleSetValueNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetValue2: nodes [
	| result |
	result := DelphiRangeSetValueNode new.
	result fromValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result toValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType11: nodes [
	| result |
	result := DelphiTypeTypeNode new.
	result typeToken: (nodes at: 1).
	result typeName: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType1: nodes [
	| result |
	result := DelphiNamedTypeNode new.
	result typeExpression: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType2: nodes [
	| result |
	result := DelphiPointerTypeNode new.
	result upArrowToken: (nodes at: 1).
	result type: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType5: nodes [
	| result |
	result := DelphiInstantiatedGenericTypeNode new.
	result type: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result typeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType6: nodes [
	| result |
	result := DelphiSimpleArrayTypeNode new.
	result type: (nodes at: 1).
	result left: (nodes at: 2).
	result bounds: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType8: nodes [
	| result |
	result := DelphiAbsoluteTypeNode new.
	result type: (nodes at: 1).
	result absoluteToken: (nodes at: 2).
	result variable: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement10: nodes [
	| result |
	result := DelphiWhileStatementNode new.
	result whileToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result doToken: ((nodes at: 1) at: 3).
	result statement: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement11: nodes [
	| result |
	result := DelphiGotoStatementNode new.
	result gotoToken: ((nodes at: 1) at: 1).
	result label: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement13: nodes [
	| result |
	result := DelphiLabeledStatementNode new.
	result label: ((nodes at: 1) at: 1).
	result colon: ((nodes at: 1) at: 2).
	result statement: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement14: nodes [
	| result |
	result := DelphiEmptyStatementNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement2: nodes [
	| result |
	result := DelphiRepeatStatementNode new.
	result repeatToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result statements.
	result addTokens: ((nodes at: 1) at: 3) to: result semicolons.
	result untilToken: ((nodes at: 1) at: 4).
	result expression: ((nodes at: 1) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement3: nodes [
	| result |
	result := DelphiIfStatementNode new.
	result ifToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result thenToken: ((nodes at: 1) at: 3).
	result thenStatement: ((nodes at: 1) at: 4).
	result elseToken: ((nodes at: 1) at: 5).
	result elseStatement: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement4: nodes [
	| result |
	result := DelphiWithStatementNode new.
	result withToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result expressions.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result doToken: ((nodes at: 1) at: 4).
	result statement: ((nodes at: 1) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement5: nodes [
	| result |
	result := DelphiTryStatementNode new.
	result tryToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result statements.
	result addTokens: ((nodes at: 1) at: 3) to: result semicolons.
	result except: ((nodes at: 1) at: 4).
	result finally: ((nodes at: 1) at: 5).
	result endToken: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement6: nodes [
	| result |
	result := DelphiCaseStatementNode new.
	result caseToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result ofToken: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result options.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result elseToken: ((nodes at: 1) at: 6).
	result addNodes: ((nodes at: 1) at: 7) to: result statements.
	result endToken: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement7: nodes [
	| result |
	result := DelphiRaiseStatementNode new.
	result raiseToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result atToken: ((nodes at: 1) at: 3).
	result location: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement8: nodes [
	| result |
	result := DelphiForStatementNode new.
	result forToken: ((nodes at: 1) at: 1).
	result variable: ((nodes at: 1) at: 2).
	result assignmentToken: ((nodes at: 1) at: 3).
	result fromExpr: ((nodes at: 1) at: 4).
	result toToken: ((nodes at: 1) at: 5).
	result toExpr: ((nodes at: 1) at: 6).
	result doToken: ((nodes at: 1) at: 7).
	result statement: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement9: nodes [
	| result |
	result := DelphiForInStatementNode new.
	result forToken: ((nodes at: 1) at: 1).
	result variable: ((nodes at: 1) at: 2).
	result inToken: ((nodes at: 1) at: 3).
	result fromExpr: ((nodes at: 1) at: 4).
	result doToken: ((nodes at: 1) at: 5).
	result statement: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatementBlock1: nodes [
	| result |
	result := DelphiStatementBlockNode new.
	result beginToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatements1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatements2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForTryStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: (nodes at: 4).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForTwoItemSetNameList1: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUnitFile1: nodes [
	| result |
	result := Array new: 10.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 5 put: (nodes at: 2).
	result at: 6 put: (nodes at: 3).
	result at: 7 put: (nodes at: 4).
	result at: 8 put: (nodes at: 5).
	result at: 9 put: ((nodes at: 6) at: 1).
	result at: 10 put: ((nodes at: 6) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUnitFile2: nodes [
	| result |
	result := Array new: 10.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesList1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesList2: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModule1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModuleList1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModuleList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariable1: nodes [
	| result |
	result := DelphiVariableNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result colon: (nodes at: 2).
	result type: (nodes at: 3).
	result modifier: (nodes at: 4).
	result equal: ((nodes at: 5) at: 1).
	result value: ((nodes at: 5) at: 2).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariableExpression1: nodes [
	| result |
	result := DelphiVariableExpressionNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariantRecordPart1: nodes [
	| result |
	result := Array new: 7.
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	result at: 4 put: ((nodes at: 3) at: 2).
	result at: 5 put: (nodes at: 4).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self add: (nodes at: 6) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariantType1: nodes [
	| result |
	result := DelphiVariantTypeNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result addToken: (nodes at: 2) to: result colons.
	result left: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result sections.
	result caseToken: ((nodes at: 4) at: 2).
	result value: ((nodes at: 4) at: 3).
	result addToken: ((nodes at: 4) at: 4) to: result colons.
	result type: ((nodes at: 4) at: 5).
	result ofToken: ((nodes at: 4) at: 6).
	result addNodes: ((nodes at: 4) at: 7) to: result variantTypes.
	result addTokens: ((nodes at: 4) at: 8) to: result semicolons.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVars1: nodes [
	| result |
	result := DelphiVarsNode new.
	result varToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result variableDefinitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVarsVars2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #generated }
DelphiParser >> reduceTable [
^#(
	#(156 0 #reduceActionForUsesList1:) 
	#(348 0 #reduceActionForBeforeAsm1:) 
	#(318 0 #reduceActionForStatement14:) 
	#(181 0 #nil) 
	#(192 0 #nil) 
	#(145 1 #reduceActionForFile2:) 
	#(145 1 #reduceActionForFile3:) 
	#(145 1 #reduceActionForFile1:) 
	#(155 0 #nil) 
	#(153 1 #reduceActionForUnitFile2:) 
	#(310 0 #reduceActionForMethodVariables2:) 
	#(359 1 #reduceActionForInheritedFunctionCall4:) 
	#(340 1 #reduceActionForRaiseStatement2:) 
	#(351 1 #reduceActionForVariableExpression1:) 
	#(200 1 #liftFirstValue:) 
	#(358 1 #liftFirstValue:) 
	#(349 1 #reduceActionForExpression10:) 
	#(318 1 #reduceActionForStatement13:) 
	#(318 1 #reduceActionForStatement11:) 
	#(318 1 #reduceActionForStatement2:) 
	#(318 1 #reduceActionForStatement3:) 
	#(318 1 #reduceActionForStatement4:) 
	#(318 1 #reduceActionForStatement5:) 
	#(318 1 #reduceActionForStatement6:) 
	#(318 1 #reduceActionForStatement7:) 
	#(318 1 #reduceActionForStatement8:) 
	#(318 1 #reduceActionForStatement9:) 
	#(318 1 #reduceActionForStatement10:) 
	#(318 1 #liftFirstValue:) 
	#(346 1 #liftFirstValue:) 
	#(349 1 #liftFirstValue:) 
	#(202 0 #reduceActionForConstantArray2:) 
	#(232 1 #reduceActionForFileType2:) 
	#(185 0 #reduceActionForOptionalArguments1:) 
	#(192 1 #liftFirstValue:) 
	#(201 1 #reduceActionForVariableExpression1:) 
	#(181 1 #reduceActionForVariableExpression1:) 
	#(201 1 #reduceActionForExpression10:) 
	#(231 1 #liftFirstValue:) 
	#(178 1 #reduceActionForSimpleDefinedType1:) 
	#(178 1 #liftFirstValue:) 
	#(199 1 #liftFirstValue:) 
	#(201 1 #liftFirstValue:) 
	#(171 0 #reduceActionForOptionalArguments1:) 
	#(182 0 #nil) 
	#(159 1 #reduceActionForFullModuleName1:) 
	#(157 1 #reduceActionForUsesModuleList1:) 
	#(158 1 #reduceActionForUsesModule1:) 
	#(150 0 #reduceActionForMethodVariables2:) 
	#(279 0 #nil) 
	#(152 1 #reduceActionForMainMethod1:) 
	#(349 2 #reduceActionForExpression15:) 
	#(317 1 #reduceActionForStatements1:) 
	#(320 2 #reduceActionForGotoStatement1:) 
	#(359 2 #reduceActionForInheritedFunctionCall3:) 
	#(349 2 #reduceActionForExpression16:) 
	#(341 0 #reduceActionForOptionalRaiseAt1:) 
	#(326 0 #nil) 
	#(324 1 #reduceActionForStatements1:) 
	#(353 2 #reduceActionForSetConstructor2:) 
	#(355 1 #reduceActionForSetValue1:) 
	#(354 1 #reduceActionForStatements1:) 
	#(349 2 #reduceActionForExpression17:) 
	#(349 2 #reduceActionForExpression18:) 
	#(352 2 #reduceActionForInstantiatedGenericVariableExpression1:) 
	#(363 1 #liftFirstValue:) 
	#(362 1 #liftFirstValue:) 
	#(349 2 #reduceActionForExpression20:) 
	#(349 2 #reduceActionForExpression14:) 
	#(204 1 #reduceActionForUsesModule1:) 
	#(202 1 #reduceActionForConstantArray1:) 
	#(203 1 #reduceActionForUsesModuleList1:) 
	#(332 0 #nil) 
	#(205 1 #reduceActionForConstantArray1:) 
	#(206 1 #reduceActionForStatements1:) 
	#(201 2 #reduceActionForExpression15:) 
	#(273 0 #reduceActionForArgumentList1:) 
	#(278 0 #nil) 
	#(201 2 #reduceActionForExpression16:) 
	#(248 0 #reduceActionForOptionalRaiseAt1:) 
	#(178 2 #reduceActionForSimpleDefinedType11:) 
	#(201 2 #reduceActionForExpression17:) 
	#(201 2 #reduceActionForExpression18:) 
	#(178 2 #reduceActionForSimpleDefinedType2:) 
	#(234 0 #reduceActionForOptionalArguments1:) 
	#(225 0 #reduceActionForMethodVariables2:) 
	#(178 2 #reduceActionForSimpleDefinedType5:) 
	#(182 1 #liftFirstValue:) 
	#(156 3 #reduceActionForUsesList2:) 
	#(160 0 #reduceActionForMethodVariables2:) 
	#(364 0 #nil) 
	#(146 3 #reduceActionForProgramFile2:) 
	#(311 1 #liftFirstValue:) 
	#(290 1 #reduceActionForProcedureDefinition2:) 
	#(291 1 #reduceActionForExternalProcedureHeader1:) 
	#(293 1 #reduceActionForExternalProcedureHeader1:) 
	#(298 1 #reduceActionForFunctionDefinition2:) 
	#(299 1 #reduceActionForExternalFunctionHeader1:) 
	#(301 1 #reduceActionForExternalFunctionHeader1:) 
	#(310 2 #reduceActionForMethodVariables1:) 
	#(313 1 #reduceActionForVars1:) 
	#(349 3 #reduceActionForExpression12:) 
	#(346 3 #reduceActionForStatementBlock1:) 
	#(340 3 #reduceActionForRaiseStatement1:) 
	#(330 0 #nil) 
	#(353 3 #reduceActionForSetConstructor1:) 
	#(319 3 #reduceActionForLabeledStatement1:) 
	#(180 1 #reduceActionForStatements1:) 
	#(347 3 #reduceActionForAsmBlock1:) 
	#(349 3 #reduceActionForExpression6:) 
	#(361 1 #liftFirstValue:) 
	#(360 1 #reduceActionForStatements1:) 
	#(349 3 #reduceActionForExpression4:) 
	#(349 3 #reduceActionForExpression13:) 
	#(357 1 #reduceActionForStatements1:) 
	#(349 3 #reduceActionForExpression11:) 
	#(201 3 #reduceActionForConstantExpression11:) 
	#(332 1 #liftFirstValue:) 
	#(232 3 #reduceActionForFileType1:) 
	#(278 1 #liftFirstValue:) 
	#(273 1 #reduceActionForConstantArray1:) 
	#(274 1 #reduceActionForStatements1:) 
	#(186 3 #reduceActionForSetType2:) 
	#(186 3 #reduceActionForSetType1:) 
	#(224 2 #reduceActionForQualifiedName1:) 
	#(181 3 #reduceActionForExpression4:) 
	#(216 0 #reduceActionForMethodVariables2:) 
	#(215 1 #reduceActionForImplicitClassSection1:) 
	#(198 3 #reduceActionForRangeType1:) 
	#(208 1 #reduceActionForStatements1:) 
	#(201 3 #reduceActionForExpression4:) 
	#(201 3 #reduceActionForExpression11:) 
	#(178 3 #reduceActionForSimpleDefinedType8:) 
	#(172 1 #reduceActionForStatements1:) 
	#(149 4 #reduceActionForLibraryLine1:) 
	#(147 4 #reduceActionForLibraryLine1:) 
	#(159 3 #reduceActionForFullModuleName2:) 
	#(154 4 #reduceActionForLibraryLine1:) 
	#(157 3 #reduceActionForUsesModuleList2:) 
	#(158 3 #reduceActionForLabeledStatement1:) 
	#(146 4 #reduceActionForProgramFile1:) 
	#(150 2 #reduceActionForMethodVariables1:) 
	#(155 3 #reduceActionForInterfaceSection2:) 
	#(281 0 #reduceActionForMethodVariables2:) 
	#(365 0 #nil) 
	#(252 0 #reduceActionForOptionalRaiseAt1:) 
	#(162 2 #reduceActionForConstantValueList1:) 
	#(163 1 #reduceActionForConstantValues1:) 
	#(276 1 #reduceActionForStatements1:) 
	#(314 2 #reduceActionForVarsVars2:) 
	#(315 1 #reduceActionForConstantValues1:) 
	#(168 2 #reduceActionForDefinedTypeList1:) 
	#(169 1 #reduceActionForConstantValues1:) 
	#(290 2 #reduceActionForProcedureDefinition1:) 
	#(267 0 #reduceActionForMethodVariables2:) 
	#(298 2 #reduceActionForFunctionDefinition1:) 
	#(309 3 #reduceActionForMethodComponents1:) 
	#(317 3 #reduceActionForStatements2:) 
	#(338 1 #reduceActionForBaseCaseLabel1:) 
	#(339 0 #reduceActionForElseCase1:) 
	#(334 1 #reduceActionForStatements1:) 
	#(337 1 #reduceActionForStatements1:) 
	#(336 1 #liftFirstValue:) 
	#(322 4 #reduceActionForIfStatement1:) 
	#(359 4 #reduceActionForInheritedFunctionCall2:) 
	#(341 2 #reduceActionForGotoStatement1:) 
	#(321 4 #reduceActionForRepeatStatement1:) 
	#(329 0 #nil) 
	#(327 1 #reduceActionForConstantValues1:) 
	#(345 4 #reduceActionForLibraryLine1:) 
	#(324 3 #reduceActionForStatements2:) 
	#(323 4 #reduceActionForRepeatStatement1:) 
	#(355 3 #reduceActionForSetValue2:) 
	#(354 3 #reduceActionForStatements2:) 
	#(179 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(349 4 #reduceActionForExpression5:) 
	#(356 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(207 3 #reduceActionForConstantRecordField1:) 
	#(204 3 #reduceActionForLabeledStatement1:) 
	#(203 3 #reduceActionForUsesModuleList2:) 
	#(201 4 #reduceActionForConstantExpression10:) 
	#(206 3 #reduceActionForStatements2:) 
	#(185 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(275 2 #reduceActionForArgument2:) 
	#(248 2 #reduceActionForGotoStatement1:) 
	#(236 1 #liftFirstValue:) 
	#(235 1 #reduceActionForStatements1:) 
	#(190 4 #reduceActionForRecordType1:) 
	#(191 2 #reduceActionForRecordFieldList1:) 
	#(226 1 #liftFirstValue:) 
	#(225 2 #reduceActionForMethodVariables1:) 
	#(227 1 #liftFirstValue:) 
	#(243 1 #liftFirstValue:) 
	#(242 1 #liftFirstValue:) 
	#(253 1 #reduceActionForPropertyHeader1:) 
	#(244 1 #liftFirstValue:) 
	#(245 1 #liftFirstValue:) 
	#(246 1 #liftFirstValue:) 
	#(247 1 #liftFirstValue:) 
	#(249 1 #liftFirstValue:) 
	#(250 1 #liftFirstValue:) 
	#(251 1 #liftFirstValue:) 
	#(201 4 #reduceActionForExpression5:) 
	#(178 4 #reduceActionForSimpleDefinedType6:) 
	#(171 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(211 0 #reduceActionForMethodVariables2:) 
	#(238 1 #liftFirstValue:) 
	#(222 0 #reduceActionForOptionalArguments1:) 
	#(170 4 #reduceActionForNamedDefinedType1:) 
	#(173 1 #reduceActionForUsesModule1:) 
	#(177 1 #liftFirstValue:) 
	#(237 1 #reduceActionForInterfaceType2:) 
	#(148 5 #reduceActionForLibraryFile1:) 
	#(160 2 #reduceActionForMethodVariables1:) 
	#(161 1 #liftFirstValue:) 
	#(280 0 #nil) 
	#(364 2 #reduceActionForInitializationSection2:) 
	#(163 2 #reduceActionForMethodVariables1:) 
	#(312 3 #reduceActionForLabels1:) 
	#(315 2 #reduceActionForMethodVariables1:) 
	#(169 2 #reduceActionForMethodVariables1:) 
	#(271 2 #reduceActionForExternalMethodModifier1:) 
	#(271 2 #reduceActionForExternalMethodModifier6:) 
	#(292 3 #reduceActionForExternalProcedureHeaderVars1:) 
	#(300 3 #reduceActionForExternalFunctionHeaderVars1:) 
	#(333 2 #reduceActionForCaseOptionList1:) 
	#(344 1 #liftFirstValue:) 
	#(359 5 #reduceActionForInheritedFunctionCall1:) 
	#(326 3 #reduceActionForExcept3:) 
	#(327 2 #reduceActionForMethodVariables1:) 
	#(326 3 #reduceActionForExcept2:) 
	#(330 2 #reduceActionForFinally2:) 
	#(325 5 #reduceActionForTryStatement1:) 
	#(180 3 #reduceActionForStatements2:) 
	#(360 3 #reduceActionForStatements2:) 
	#(361 3 #reduceActionForMethodArgument2:) 
	#(357 3 #reduceActionForStatements2:) 
	#(274 3 #reduceActionForStatements2:) 
	#(183 5 #reduceActionForAnonymousProcedureType1:) 
	#(186 5 #reduceActionForSetType3:) 
	#(224 4 #reduceActionForQualifiedName2:) 
	#(234 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(233 5 #reduceActionForArrayType2:) 
	#(233 5 #reduceActionForArrayType1:) 
	#(191 3 #reduceActionForRecordFieldList2:) 
	#(216 2 #reduceActionForMethodVariables1:) 
	#(217 1 #liftFirstValue:) 
	#(255 2 #reduceActionForClassPropertyHeader1:) 
	#(296 2 #reduceActionForExternalClassProcedureHeader1:) 
	#(297 2 #reduceActionForExternalClassProcedureHeader1:) 
	#(304 2 #reduceActionForExternalClassFunctionHeader1:) 
	#(305 2 #reduceActionForExternalClassFunctionHeader1:) 
	#(226 2 #reduceActionForNewClassComponent2:) 
	#(289 0 #reduceActionForOptionalRaiseAt1:) 
	#(257 0 #nil) 
	#(226 2 #reduceActionForNewClassComponent5:) 
	#(227 2 #reduceActionForNewClassComponent5:) 
	#(208 3 #reduceActionForStatements2:) 
	#(172 3 #reduceActionForStatements2:) 
	#(176 1 #reduceActionForEnumName1:) 
	#(175 1 #reduceActionForStatements1:) 
	#(173 2 #reduceActionForDefinedType2:) 
	#(239 0 #nil) 
	#(151 3 #reduceActionForLibraryExport1:) 
	#(165 2 #reduceActionForResourceStringList1:) 
	#(166 1 #reduceActionForConstantValues1:) 
	#(282 1 #liftFirstValue:) 
	#(279 4 #reduceActionForImplementationSection2:) 
	#(281 2 #reduceActionForMethodVariables1:) 
	#(283 1 #reduceActionForConstructorDefinition2:) 
	#(286 1 #reduceActionForDestructorDefinition2:) 
	#(295 1 #reduceActionForClassProcedureDefinition2:) 
	#(303 1 #reduceActionForClassFunctionDefinition2:) 
	#(306 1 #reduceActionForClassOperatorDefinition2:) 
	#(365 2 #reduceActionForFinalizationSection2:) 
	#(153 6 #reduceActionForUnitFile1:) 
	#(252 2 #reduceActionForGotoStatement1:) 
	#(276 3 #reduceActionForStatements2:) 
	#(268 0 #reduceActionForMethodVariables2:) 
	#(271 3 #reduceActionForExternalMethodModifier4:) 
	#(272 1 #liftFirstValue:) 
	#(267 2 #reduceActionForMethodVariables1:) 
	#(269 1 #liftFirstValue:) 
	#(338 3 #reduceActionForBaseCaseLabel2:) 
	#(339 2 #reduceActionForElseCase2:) 
	#(331 6 #reduceActionForCaseStatement1:) 
	#(334 3 #reduceActionForStatements2:) 
	#(335 3 #reduceActionForCaseOption1:) 
	#(337 3 #reduceActionForStatements2:) 
	#(336 3 #reduceActionForCaseLabel2:) 
	#(343 6 #reduceActionForForInStatement1:) 
	#(322 6 #reduceActionForForInStatement1:) 
	#(350 6 #reduceActionForMemExpression1:) 
	#(329 2 #reduceActionForPossibleExceptElse2:) 
	#(277 0 #reduceActionForOptionalRaiseAt1:) 
	#(188 1 #reduceActionForStatements1:) 
	#(187 3 #reduceActionForTwoItemSetNameList1:) 
	#(235 3 #reduceActionForStatements2:) 
	#(218 2 #reduceActionForPrivateClassSection2:) 
	#(219 2 #reduceActionForProtectedClassSection2:) 
	#(220 2 #reduceActionForPublicClassSection1:) 
	#(221 2 #reduceActionForPublishedClassSection1:) 
	#(228 3 #reduceActionForMethodAttribute1:) 
	#(284 3 #reduceActionForExternalConstructorHeader1:) 
	#(287 3 #reduceActionForExternalConstructorHeader1:) 
	#(307 3 #reduceActionForExternalConstructorHeader1:) 
	#(174 3 #reduceActionForEnumType1:) 
	#(189 3 #reduceActionForMetaclassType1:) 
	#(212 1 #liftFirstValue:) 
	#(211 2 #reduceActionForMethodVariables1:) 
	#(209 3 #reduceActionForNewClassType2:) 
	#(223 1 #reduceActionForStatements1:) 
	#(173 3 #reduceActionForLabeledStatement1:) 
	#(240 0 #reduceActionForMethodVariables2:) 
	#(166 2 #reduceActionForMethodVariables1:) 
	#(280 2 #reduceActionForImplementationCode2:) 
	#(283 2 #reduceActionForConstructorDefinition1:) 
	#(286 2 #reduceActionForDestructorDefinition1:) 
	#(295 2 #reduceActionForClassProcedureDefinition1:) 
	#(303 2 #reduceActionForClassFunctionDefinition1:) 
	#(306 2 #reduceActionForClassOperatorDefinition1:) 
	#(366 2 #reduceActionForGotoStatement1:) 
	#(294 5 #reduceActionForNonExternalProcedureHeaderVars1:) 
	#(270 2 #reduceActionForExternalMethodModifier6:) 
	#(275 5 #reduceActionForArgument1:) 
	#(184 7 #reduceActionForAnonymousFunctionType1:) 
	#(218 3 #reduceActionForPrivateClassSection1:) 
	#(219 3 #reduceActionForProtectedClassSection1:) 
	#(289 2 #reduceActionForGotoStatement1:) 
	#(256 0 #reduceActionForPropertyValues1:) 
	#(176 3 #reduceActionForEnumName2:) 
	#(175 3 #reduceActionForStatements2:) 
	#(222 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(214 0 #nil) 
	#(302 6 #reduceActionForNonExternalFunctionHeaderVars1:) 
	#(268 2 #reduceActionForMethodVariables1:) 
	#(271 5 #reduceActionForExternalMethodModifier5:) 
	#(270 3 #reduceActionForNonExternalMethodModifier3:) 
	#(342 8 #reduceActionForForStatement1:) 
	#(328 5 #reduceActionForOnDo1:) 
	#(277 2 #reduceActionForGotoStatement1:) 
	#(188 3 #reduceActionForStatements2:) 
	#(285 5 #reduceActionForNonExternalConstructorHeader1:) 
	#(288 5 #reduceActionForNonExternalDestructorHeader1:) 
	#(229 5 #reduceActionForInterfaceFunctionAssignment1:) 
	#(230 5 #reduceActionForInterfaceProcedureAssignment1:) 
	#(257 3 #reduceActionForPropertyArrayAccessors2:) 
	#(226 5 #reduceActionForNewClassComponent1:) 
	#(223 3 #reduceActionForStatements2:) 
	#(213 5 #reduceActionForOldClassType1:) 
	#(239 3 #reduceActionForGuid2:) 
	#(237 5 #reduceActionForInterfaceType1:) 
	#(240 2 #reduceActionForMethodVariables1:) 
	#(241 1 #liftFirstValue:) 
	#(214 1 #liftFirstValue:) 
	#(316 6 #reduceActionForVariable1:) 
	#(194 1 #reduceActionForStatements1:) 
	#(196 1 #reduceActionForStatements1:) 
	#(197 1 #liftFirstValue:) 
	#(262 1 #reduceActionForPropertyDefault2:) 
	#(262 1 #reduceActionForPropertyDefault3:) 
	#(266 0 #nil) 
	#(256 2 #reduceActionForPropertyValues2:) 
	#(256 2 #reduceActionForCaseOptionList1:) 
	#(256 2 #reduceActionForPropertyValues4:) 
	#(256 2 #reduceActionForPropertyValues8:) 
	#(256 2 #reduceActionForPropertyValues5:) 
	#(256 2 #reduceActionForPropertyValues7:) 
	#(256 2 #reduceActionForPropertyValues6:) 
	#(210 6 #reduceActionForClassHelperType2:) 
	#(209 6 #reduceActionForNewClassType1:) 
	#(167 5 #reduceActionForResource1:) 
	#(164 7 #reduceActionForConstantValue1:) 
	#(193 6 #reduceActionForVariantRecordPart1:) 
	#(308 7 #reduceActionForNonExternalClassOperatorHeader1:) 
	#(262 2 #reduceActionForPropertyDefault1:) 
	#(261 2 #reduceActionForPropertyDispid1:) 
	#(264 1 #reduceActionForStatements1:) 
	#(263 2 #reduceActionForPropertyImplements1:) 
	#(258 2 #reduceActionForPropertyIndex1:) 
	#(259 2 #reduceActionForPropertyReader1:) 
	#(265 2 #reduceActionForPropertyStored1:) 
	#(260 2 #reduceActionForPropertyWriter1:) 
	#(254 7 #reduceActionForPropertyHeaderVars1:) 
	#(194 3 #reduceActionForStatements2:) 
	#(196 3 #reduceActionForStatements2:) 
	#(261 3 #reduceActionForPropertyDispid2:) 
	#(261 3 #reduceActionForPropertyDispid3:) 
	#(266 2 #reduceActionForPropertyModifiers2:) 
	#(264 3 #reduceActionForStatements2:) 
	#(210 9 #reduceActionForClassHelperType1:) 
	#(195 5 #reduceActionForVariantType1:)
	).
]

{ #category : #generated }
DelphiParser >> symbolNames [
	^ #('"&OPERATOR"' '"("' '")"' '"*"' '","' '"."' '".."' '"/"' '":"' '":="' '"<"' '"<="' '"<>"' '"="' '">"' '">="' '"@"' '"ABSOLUTE"' '"ABSTRACT"' '"AND"' '"ARRAY"' '"AS"' '"ASM"' '"ASSEMBLER"' '"BEGIN"' '"CASE"' '"CDECL"' '"CLASS"' '"CONST"' '"CONSTRUCTOR"' '"DEFAULT"' '"DEPRECATED"' '"DESTRUCTOR"' '"DISPID"' '"DISPINTERFACE"' '"DIV"' '"DO"' '"DOWNTO"' '"DYNAMIC"' '"ELSE"' '"END"' '"EXCEPT"' '"EXPORT"' '"EXPORTS"' '"EXTERNAL"' '"FAR"' '"FILE"' '"FINAL"' '"FINALIZATION"' '"FINALLY"' '"FOR"' '"FORWARD"' '"FUNCTION"' '"GOTO"' '"HELPER"' '"IF"' '"IMPLEMENTATION"' '"IMPLEMENTS"' '"IN"' '"INDEX"' '"INHERITED"' '"INITIALIZATION"' '"INLINE"' '"INTERFACE"' '"IS"' '"LABEL"' '"LIBRARY"' '"LOCAL"' '"MEM"' '"MEMW"' '"MESSAGE"' '"MOD"' '"NAME"' '"NEAR"' '"NODEFAULT"' '"NOT"' '"OBJECT"' '"OF"' '"ON"' '"OPERATOR"' '"OR"' '"OUT"' '"OVERLOAD"' '"OVERRIDE"' '"PACKED"' '"PASCAL"' '"PLATFORM"' '"PRIVATE"' '"PROCEDURE"' '"PROGRAM"' '"PROPERTY"' '"PROTECTED"' '"PUBLIC"' '"PUBLISHED"' '"RAISE"' '"READ"' '"READONLY"' '"RECORD"' '"REGISTER"' '"REINTRODUCE"' '"REPEAT"' '"RESOURCESTRING"' '"SAFECALL"' '"SEALED"' '"SET"' '"SHL"' '"SHR"' '"STATIC"' '"STDCALL"' '"STORED"' '"STRICT"' '"THEN"' '"THREADVAR"' '"TO"' '"TRY"' '"TYPE"' '"UNIT"' '"UNSAFE"' '"UNTIL"' '"USES"' '"VAR"' '"VIRTUAL"' '"WHILE"' '"WITH"' '"WRITE"' '"WRITEONLY"' '"XOR"' '"["' '"]"' '<at>' '<minus>' '<plus>' '<semicolon>' '<upArrow>' '<identifier>' '<constantIdentifier>' '<number>' '<integerWithRange>' '<string>' '<comment>' '<whitespace>' '<patternToken>' '<multiple_control_chars>' 'B e g i n' 'File' 'ProgramFile' 'ProgramLine' 'LibraryFile' 'LibraryLine' 'Exports' 'LibraryExport' 'MainMethod' 'UnitFile' 'UnitLine' 'InterfaceSection' 'UsesList' 'UsesModuleList' 'UsesModule' 'FullModuleName' 'InterfaceSectionValueList' 'InterfaceSectionValue' 'ConstantValueList' 'ConstantValues' 'ConstantValue' 'ResourceStringList' 'Resources' 'Resource' 'DefinedTypeList' 'NamedDefinedTypes' 'NamedDefinedType' 'OptionalGenericTypeArguments' 'GenericTypeArgumentList' 'DefinedType' 'EnumType' 'EnumList' 'EnumName' 'ClassOrInterfaceType' 'SimpleDefinedType' 'InstantiatedGenericTypeArguments' 'InstantiatedGenericTypeArgumentList' 'NamedType' 'OptionalPlatform' 'AnonymousProcedureType' 'AnonymousFunctionType' 'OptionalArguments' 'SetType' 'TwoItemSetNameList' 'SetNameList' 'MetaclassType' 'RecordType' 'RecordFieldList' 'OptionalPacked' 'VariantRecordPart' 'VariantTypes' 'VariantType' 'VariantNames' 'VariantName' 'RangeType' 'RangeValue' 'Number' 'ConstantExpression' 'ConstantArray' 'ConstantExpressionList' 'EnumExpression' 'ConstantRecord' 'ConstantRecordFields' 'ConstantRecordField' 'ConstantArguments' 'NewClassType' 'ClassHelperType' 'ClassAttributes' 'ClassAttribute' 'OldClassType' 'OptionalDeprecated' 'ImplicitClassSection' 'ClassSections' 'ClassSection' 'PrivateClassSection' 'ProtectedClassSection' 'PublicClassSection' 'PublishedClassSection' 'Superclass' 'SuperclassList' 'QualifiedName' 'NewClassComponents' 'NewClassComponent' 'NewClassMethodComponent' 'MethodAttribute' 'InterfaceFunctionAssignment' 'InterfaceProcedureAssignment' 'Type' 'FileType' 'ArrayType' 'ArrayBounds' 'ArrayBoundsIndices' 'ArrayBoundsIndex' 'InterfaceType' 'InterfaceKeyword' 'Guid' 'NewInterfaceComponents' 'NewInterfaceComponent' 'InterfacePropertyComponent' 'InterfaceMethodComponent' 'ConstructorHeader' 'DestructorHeader' 'ProcedureHeader' 'ClassProcedureHeader' 'OptionalOfObject' 'FunctionHeader' 'ClassFunctionHeader' 'ClassOperatorHeader' 'OptionalType' 'PropertyHeader' 'PropertyHeaderVars' 'ClassPropertyHeader' 'PropertyValues' 'PropertyArrayAccessors' 'PropertyIndex' 'PropertyReader' 'PropertyWriter' 'PropertyDispid' 'PropertyDefault' 'PropertyImplements' 'PropertyImplementsList' 'PropertyStored' 'PropertyModifiers' 'MethodModifiers' 'NonExternalMethodModifiers' 'MethodModifier' 'NonExternalMethodModifier' 'ExternalMethodModifier' 'ModifierKeyword' 'ArgumentList' 'Arguments' 'Argument' 'VariableNames' 'OptionalValue' 'ArgumentType' 'ImplementationSection' 'ImplementationCode' 'Definitions' 'Definition' 'ConstructorDefinition' 'ExternalConstructorHeader' 'NonExternalConstructorHeader' 'DestructorDefinition' 'ExternalDestructorHeader' 'NonExternalDestructorHeader' 'OptionalParens' 'ProcedureDefinition' 'ExternalProcedureHeader' 'ExternalProcedureHeaderVars' 'NonExternalProcedureHeader' 'NonExternalProcedureHeaderVars' 'ClassProcedureDefinition' 'ExternalClassProcedureHeader' 'NonExternalClassProcedureHeader' 'FunctionDefinition' 'ExternalFunctionHeader' 'ExternalFunctionHeaderVars' 'NonExternalFunctionHeader' 'NonExternalFunctionHeaderVars' 'ClassFunctionDefinition' 'ExternalClassFunctionHeader' 'NonExternalClassFunctionHeader' 'ClassOperatorDefinition' 'ExternalClassOperatorHeader' 'NonExternalClassOperatorHeader' 'MethodComponents' 'MethodVariables' 'MethodVariable' 'Labels' 'Vars' 'VarsVars' 'VariablesList' 'Variable' 'Statements' 'Statement' 'LabeledStatement' 'GotoStatement' 'RepeatStatement' 'IfStatement' 'WithStatement' 'WithExpressions' 'TryStatement' 'Except' 'OnDos' 'OnDo' 'PossibleExceptElse' 'Finally' 'CaseStatement' 'OptionalSemicolon' 'CaseOptionList' 'CaseOptions' 'CaseOption' 'CaseLabel' 'CaseLabels' 'BaseCaseLabel' 'ElseCase' 'RaiseStatement' 'OptionalRaiseAt' 'ForStatement' 'ForInStatement' 'ToDownTo' 'WhileStatement' 'StatementBlock' 'AsmBlock' 'BeforeAsm' 'Expression' 'MemExpression' 'VariableExpression' 'InstantiatedGenericVariableExpression' 'SetConstructor' 'SetConstructorValues' 'SetValue' 'ArrayIndex' 'ArrayIndices' 'String' 'InheritedFunctionCall' 'MethodArguments' 'MethodArgument' 'Operator' 'ConstantOperator' 'InitializationSection' 'FinalizationSection' 'EndFile' '<controlCharacter>' 'E O F' 'error')
]

{ #category : #generated }
DelphiParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #DelphiProgramNode #DelphiProgramNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiLibraryExportNode #DelphiMainMethodDefinitionNode #OrderedCollection #OrderedCollection #DelphiInterfaceSectionNode #OrderedCollection #OrderedCollection #OrderedCollection #DelphiModuleNameNode #OrderedCollection #DelphiProgramNode #DelphiConstantListNode #OrderedCollection #DelphiConstantDefinitionNode #DelphiResourceStringListNode #OrderedCollection #DelphiResourceStringDefinitionNode #DelphiDefinedTypeListNode #OrderedCollection #DelphiNamedDefinedTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #DelphiEnumTypeNode #OrderedCollection #DelphiEnumNameNode #DelphiTypeNode #DelphiProgramNode #OrderedCollection #OrderedCollection #DelphiExpressionNode #SmaCCToken #DelphiAnonymousProcedureTypeNode #DelphiAnonymousFunctionTypeNode #OrderedCollection #DelphiSetTypeNode #OrderedCollection #OrderedCollection #DelphiMetaclassTypeNode #DelphiRecordTypeNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #DelphiVariantTypeNode #OrderedCollection #DelphiExpressionNode #DelphiRangeTypeNode #DelphiExpressionNode #SmaCCToken #DelphiExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiConstantRecordFieldNode #OrderedCollection #DelphiNewClassTypeNode #DelphiClassHelperTypeNode #OrderedCollection #SmaCCToken #DelphiOldClassTypeNode #SmaCCToken #DelphiImplicitClassSectionNode #OrderedCollection #DelphiClassSectionNode #DelphiPrivateClassSectionNode #DelphiProtectedClassSectionNode #DelphiPublicClassSectionNode #DelphiPublishedClassSectionNode #OrderedCollection #OrderedCollection #DelphiQualifiedNameNode #OrderedCollection #DelphiProgramNode #DelphiMethodHeaderNode #DelphiMethodAttributeNode #DelphiInterfaceFunctionAssignmentNode #DelphiInterfaceProcedureAssignmentNode #DelphiProgramNode #DelphiFileTypeNode #DelphiArrayTypeNode #OrderedCollection #OrderedCollection #DelphiProgramNode #DelphiInterfaceTypeNode #SmaCCToken #DelphiGuidNode #OrderedCollection #DelphiProgramNode #DelphiPropertyHeaderNode #DelphiMethodHeaderNode #DelphiConstructorHeaderNode #DelphiDestructorHeaderNode #DelphiProcedureHeaderNode #DelphiClassProcedureHeaderNode #OrderedCollection #DelphiFunctionHeaderNode #DelphiClassFunctionHeaderNode #DelphiClassOperatorHeaderNode #OrderedCollection #DelphiPropertyHeaderNode #OrderedCollection #DelphiClassPropertyHeaderNode #OrderedCollection #DelphiPropertyArrayAccessorsNode #DelphiPropertyIndexNode #DelphiPropertyReaderNode #DelphiPropertyWriterNode #DelphiPropertyDispidNode #DelphiPropertyDefaultNode #DelphiPropertyImplementsNode #OrderedCollection #DelphiPropertyStoredNode #DelphiPropertyModifierNode #OrderedCollection #OrderedCollection #DelphiMethodModifierNode #DelphiMethodModifierNode #DelphiMethodModifierNode #SmaCCToken #OrderedCollection #OrderedCollection #DelphiArgumentNode #OrderedCollection #OrderedCollection #SmaCCToken #DelphiImplementationSectionNode #DelphiImplementationCodeNode #OrderedCollection #DelphiProgramNode #DelphiConstructorDefinitionNode #DelphiConstructorHeaderNode #DelphiConstructorHeaderNode #DelphiDestructorDefinitionNode #DelphiDestructorHeaderNode #DelphiDestructorHeaderNode #OrderedCollection #DelphiProcedureDefinitionNode #DelphiProcedureHeaderNode #OrderedCollection #DelphiProcedureHeaderNode #OrderedCollection #DelphiClassProcedureDefinitionNode #DelphiClassProcedureHeaderNode #DelphiClassProcedureHeaderNode #DelphiFunctionDefinitionNode #DelphiFunctionHeaderNode #OrderedCollection #DelphiFunctionHeaderNode #OrderedCollection #DelphiClassFunctionDefinitionNode #DelphiClassFunctionHeaderNode #DelphiClassFunctionHeaderNode #DelphiClassOperatorDefinitionNode #DelphiClassOperatorHeaderNode #DelphiClassOperatorHeaderNode #OrderedCollection #OrderedCollection #DelphiProgramNode #DelphiLabelVariableNode #DelphiVarsNode #OrderedCollection #OrderedCollection #DelphiVariableNode #OrderedCollection #DelphiStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiExceptNode #OrderedCollection #DelphiOnDoNode #DelphiExceptElseNode #DelphiFinallyNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #DelphiCaseOptionNode #DelphiProgramNode #OrderedCollection #DelphiProgramNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #DelphiStatementNode #DelphiAsmBlockNode nil #DelphiExpressionNode #DelphiMemExpressionNode #DelphiVariableExpressionNode #DelphiInstantiatedGenericVariableExpressionNode #DelphiSetExpressionNode #OrderedCollection #DelphiSetValueNode #OrderedCollection #OrderedCollection #SmaCCToken #DelphiInheritedFunctionCallNode #OrderedCollection #DelphiProgramNode #SmaCCToken #SmaCCToken #DelphiInitializationSectionNode #DelphiFinalizationSectionNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
DelphiParser >> transitionTable [
^#(
#[1 0 6 0 23 0 6 0 25 0 6 0 29 0 6 0 53 0 6 0 66 0 21 0 67 0 6 0 89 0 25 0 90 0 6 0 113 0 6 0 116 0 29 0 117 0 33 0 120 0 6 0 121 0 37 0 145 0 41 0 146 0 45 0 147 0 49 0 148 0 53 0 149 0 57 0 153 0 61 0 154 0 65 0 156] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 0 165 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 0 165 1 90 0 165 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 1 1 0 2 0 18 0 6 0 18 0 11 1 5 0 17 0 18 0 18 0 22 0 21 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 61 0 178 1 65 0 181 1 105 0 183 1 105 0 184 1 61 0 186 1 61 0 190 1 85 0 192 1 61 0 198 1 93 0 199 1 97 0 200 1 101 0 201 1 105 0 231 1 61 0 232 1 61 0 233 1 101 1 97 1 121 1 102 1 125 1 111 0 18 1 112] 
#[1 1 129 0 135 1 133 0 170] 
#[0 1 137 0 135] 
#[0 1 141 0 135] 
#[1 1 145 0 135 1 149 0 159] 
#[1 1 145 0 135 1 153 0 157 1 157 0 158 1 161 0 159] 
#[0 0 0 1 112] 
#[0 0 26 1 112] 
#[1 0 6 0 23 0 6 0 25 0 6 0 29 0 6 0 53 0 6 0 66 0 6 0 89 0 6 0 113 0 6 0 116 0 33 0 120 0 6 0 121 1 165 0 156] 
#[0 0 30 1 112] 
#[1 0 6 0 23 0 6 0 25 0 6 0 29 0 6 0 44 0 6 0 53 0 6 0 66 0 6 0 89 0 6 0 113 0 6 0 116 0 33 0 120 0 6 0 121 1 169 0 156] 
#[0 0 34 1 112] 
#[1 0 38 0 41 0 38 0 49 0 38 0 57 0 38 0 62 1 173 0 64 1 177 0 155 0 42 1 112] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 1 181 0 152 1 185 1 53 1 189 1 54] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 197 1 93 1 197 1 94 1 197 1 95 1 197 1 96 1 197 1 97 0 245 1 102 1 197 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 201 1 93 1 201 1 94 1 201 1 95 1 201 1 96 1 201 1 97 0 245 1 102 1 201 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 205 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 213 1 93 1 213 1 94 1 213 1 95 1 213 1 96 1 213 1 97 0 245 1 102 1 213 1 103 0 253 1 111] 
#[1 1 217 0 135 1 221 1 95] 
#[1 1 225 0 135 1 229 0 137] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 233 1 93 1 233 1 94 1 233 1 95 1 233 1 96 1 233 1 97 0 245 1 102 1 233 1 103 0 253 1 111] 
#[1 0 50 0 2 0 50 0 3 0 50 0 4 0 50 0 5 0 50 0 6 0 50 0 7 0 50 0 8 0 50 0 9 0 50 0 10 0 50 0 11 0 50 0 12 0 50 0 13 0 50 0 14 0 50 0 15 0 50 0 16 0 50 0 20 0 50 0 22 0 50 0 31 0 50 0 34 0 50 0 36 0 50 0 37 0 50 0 38 0 50 0 40 0 50 0 41 0 50 0 42 0 50 0 49 0 50 0 50 0 50 0 58 0 50 0 59 0 50 0 60 0 50 0 62 0 50 0 65 0 50 0 72 0 50 0 75 0 50 0 78 0 50 0 79 0 50 0 81 0 50 0 96 0 50 0 97 0 50 0 106 0 50 0 107 0 50 0 110 0 50 0 112 0 50 0 114 0 50 0 119 0 50 0 125 0 50 0 126 0 50 0 127 0 50 0 128 0 50 0 129 0 50 0 130 0 50 0 131 0 50 0 132 0 50 0 133 0 50 0 134 1 237 0 135 0 50 1 112] 
#[0 1 241 0 128] 
#[0 1 245 0 128] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 249 1 93 1 249 1 94 1 249 1 95 1 249 1 96 1 249 1 97 0 245 1 102 1 249 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 54 0 40 0 54 0 41 0 54 0 42 0 54 0 49 0 54 0 50 0 97 0 61 0 54 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 54 0 79 0 54 0 119 0 133 0 128 0 137 0 131 0 141 0 132 0 54 0 133 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 1 253 1 93 1 253 1 94 1 253 1 95 1 253 1 96 1 253 1 97 0 245 1 102 1 253 1 103 0 253 1 111 0 54 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 1 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 14 0 42 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 5 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 9 1 93 2 9 1 94 2 9 1 95 2 9 1 96 2 9 1 97 0 245 1 102 2 9 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 13 1 68 2 17 1 93 2 17 1 94 2 17 1 95 2 17 1 96 2 17 1 97 0 245 1 102 2 17 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 2 21 0 129 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 25 1 93 2 25 1 94 2 25 1 95 2 25 1 96 2 25 1 97 2 29 1 98 2 33 1 99 0 245 1 102 2 25 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 37 1 93 2 37 1 94 2 37 1 95 2 37 1 96 2 37 1 97 0 245 1 102 2 37 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 41 1 93 2 41 1 94 2 41 1 95 2 41 1 96 2 41 1 97 0 245 1 102 2 41 1 103 0 253 1 111] 
#[1 0 58 0 2 0 58 0 4 0 58 0 6 0 58 0 8 2 45 0 9 0 58 0 10 0 7 0 11 0 58 0 12 0 58 0 13 0 58 0 14 0 58 0 15 0 58 0 16 0 58 0 20 0 58 0 22 0 58 0 36 0 58 0 40 0 58 0 41 0 58 0 42 0 58 0 49 0 58 0 50 0 58 0 59 0 58 0 62 0 58 0 65 0 58 0 72 0 58 0 79 0 58 0 81 0 58 0 106 0 58 0 107 0 58 0 119 0 58 0 127 0 58 0 128 0 58 0 131 0 58 0 132 0 58 0 133 0 58 0 134 2 53 0 179 0 58 1 112] 
#[1 0 62 0 2 0 62 0 4 0 62 0 6 0 62 0 8 2 57 0 9 0 62 0 10 0 62 0 11 0 62 0 12 0 62 0 13 0 62 0 14 0 62 0 15 0 62 0 16 0 62 0 20 0 62 0 22 0 62 0 36 0 62 0 40 0 62 0 41 0 62 0 42 0 62 0 49 0 62 0 50 0 62 0 59 0 62 0 62 0 62 0 65 0 62 0 72 0 62 0 79 0 62 0 81 0 62 0 106 0 62 0 107 0 62 0 119 0 62 0 127 0 62 0 128 0 62 0 131 0 62 0 132 0 62 0 133 0 62 0 134 0 62 1 112] 
#[0 0 66 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 0 1 112] 
#[0 0 74 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 78 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 82 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 86 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 90 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 94 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 98 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 102 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 106 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 110 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 114 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 118 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 122 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 2 61 0 23] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 0 118 0 40 0 118 0 41 0 118 0 42 0 118 0 49 0 118 0 50 2 169 0 59 0 118 0 62 2 169 0 65 2 169 0 72 0 118 0 79 2 169 0 81 2 169 0 106 2 169 0 107 0 118 0 119 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 0 118 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 0 118 1 112] 
#[0 0 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 1 1 0 2 0 130 0 3 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 177 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 181 0 201 2 185 0 202 2 189 0 203 2 193 0 204 2 197 0 205 2 201 0 206 2 205 0 207 2 181 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 213 0 201 2 213 1 97 1 121 1 102 1 125 1 111] 
#[1 0 134 0 3 0 134 0 5 0 134 0 11 0 134 0 14 0 134 0 15 0 134 0 18 0 134 0 31 0 134 0 32 0 134 0 34 0 134 0 37 0 134 0 58 0 134 0 60 0 134 0 75 2 217 0 78 0 134 0 87 0 134 0 96 0 134 0 97 0 134 0 110 0 134 0 125 0 134 0 126 0 134 0 128 0 134 0 129 0 134 0 133 0 134 1 112] 
#[1 2 221 0 2 0 138 0 9 2 225 0 185] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 229 0 201 2 229 1 97 1 121 1 102 1 125 1 111] 
#[0 0 142 0 21 0 98] 
#[1 2 221 0 2 0 138 0 78 0 138 0 133 2 233 0 185] 
#[0 2 237 0 78] 
#[1 2 241 0 135 2 245 0 224] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 249 0 201 2 249 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 253 0 201 2 253 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 14 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 31 0 18 0 32 0 18 0 34 0 18 0 37 1 9 0 47 1 13 0 53 0 18 0 58 0 18 0 60 0 18 0 75 1 17 0 76 0 18 0 78 1 85 0 85 0 18 0 87 1 25 0 89 0 18 0 96 0 18 0 97 0 22 0 98 1 29 0 105 0 18 0 110 1 33 0 116 0 18 0 125 0 18 0 126 0 133 0 128 0 18 0 129 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 3 5 0 178 1 65 0 181 3 5 0 183 3 5 0 184 3 5 0 186 3 5 0 190 1 85 0 192 3 5 0 198 1 93 0 199 1 97 0 200 1 101 0 201 3 5 0 231 3 5 0 232 3 5 0 233 1 101 1 97 1 121 1 102 1 125 1 111 0 18 1 112] 
#[1 0 146 0 2 0 150 0 3 0 146 0 4 0 150 0 5 0 11 0 6 0 146 0 7 0 146 0 8 0 11 0 11 0 146 0 12 0 146 0 13 0 150 0 14 0 11 0 15 0 146 0 16 0 150 0 18 0 146 0 20 0 146 0 22 0 150 0 31 0 150 0 32 0 150 0 34 0 146 0 36 0 150 0 37 0 150 0 58 0 146 0 59 0 150 0 60 0 146 0 65 0 146 0 72 0 150 0 75 0 150 0 78 0 146 0 81 0 150 0 87 0 150 0 96 0 150 0 97 0 146 0 106 0 146 0 107 0 150 0 110 0 150 0 125 0 150 0 126 0 146 0 127 0 150 0 128 0 150 0 129 0 146 0 131 0 146 0 132 0 150 0 133 0 150 1 112] 
#[0 0 62 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 0 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 0 158 0 11 0 158 0 18 0 158 0 128 0 0 1 112] 
#[1 0 162 0 3 0 162 0 5 3 9 0 6 0 162 0 11 0 162 0 14 0 162 0 15 0 162 0 18 0 162 0 31 0 162 0 32 0 162 0 34 0 162 0 37 0 162 0 58 0 162 0 60 0 162 0 75 0 162 0 78 0 162 0 87 0 162 0 96 0 162 0 97 0 162 0 110 0 162 0 125 0 162 0 126 0 162 0 128 0 162 0 129 0 162 0 133 0 162 1 112] 
#[0 0 158 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 0 158 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 0 166 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 0 166 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 3 13 0 21 3 17 0 98] 
#[0 0 166 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 3 21 0 7] 
#[0 0 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 3 25 0 2 0 170 0 3 3 33 0 4 0 170 0 5 3 29 0 6 0 170 0 7 3 33 0 8 0 15 0 11 3 33 0 12 3 33 0 13 0 170 0 14 0 19 0 15 3 33 0 16 0 170 0 18 3 33 0 20 3 33 0 22 0 170 0 31 0 170 0 32 0 170 0 34 3 33 0 36 0 170 0 37 0 170 0 58 3 33 0 59 0 170 0 60 3 33 0 65 3 33 0 72 0 170 0 75 0 170 0 78 3 33 0 81 0 170 0 87 0 170 0 96 0 170 0 97 3 33 0 106 3 33 0 107 0 170 0 110 0 170 0 125 0 170 0 126 3 33 0 127 0 170 0 128 0 170 0 129 3 33 0 131 3 33 0 132 0 170 0 133 3 33 1 107 0 170 1 112] 
#[1 2 49 0 11 3 37 0 18 3 41 0 128 3 45 0 179] 
#[0 0 166 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 0 166 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 0 174 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[0 0 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[0 0 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 3 49 0 11 0 178 0 14 3 53 0 171] 
#[0 0 0 1 112] 
#[1 3 65 0 32 3 65 0 87 0 182 0 133 3 65 0 182] 
#[1 3 69 0 32 3 69 0 87 0 182 0 133 3 69 0 182] 
#[0 0 186 0 5 0 6 0 32 0 59 0 87 0 133] 
#[1 3 73 0 6 3 77 0 32 3 77 0 87 0 182 0 133 3 77 0 182] 
#[1 3 81 0 5 3 85 0 133] 
#[0 0 190 0 5 0 133] 
#[1 0 194 0 5 3 73 0 6 3 89 0 59 0 194 0 133] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 3 93 0 152 1 185 1 53 1 189 1 54] 
#[1 0 198 0 23 0 198 0 25 0 198 0 29 0 198 0 44 0 198 0 53 0 198 0 66 0 198 0 89 0 198 0 113 0 198 0 116 0 198 0 121 3 97 0 150] 
#[1 0 6 0 29 0 6 0 41 0 6 0 49 0 6 0 53 0 6 0 57 0 6 0 62 0 6 0 89 0 6 0 102 0 6 0 113 0 6 0 116 0 33 0 120 0 6 0 121 3 101 0 156] 
#[1 0 202 0 41 0 202 0 49 3 105 0 57 0 202 0 62 3 109 1 23] 
#[0 3 113 0 6] 
#[0 0 206 0 6] 
#[1 0 10 0 23 0 77 0 25 3 117 0 29 3 121 0 53 3 125 0 66 3 129 0 89 3 133 0 113 3 137 0 116 3 141 0 121 3 193 0 162 3 193 0 168 3 193 1 34 3 157 1 35 3 161 1 36 3 165 1 37 3 169 1 38 3 193 1 42 3 177 1 43 3 181 1 44 3 185 1 45 3 189 1 46 3 193 1 55 3 193 1 56 3 193 1 57 3 205 1 58 3 209 1 90 3 209 1 91 0 221 1 92] 
#[1 0 58 0 2 0 58 0 3 0 58 0 4 0 58 0 5 0 58 0 6 0 58 0 7 0 58 0 8 0 58 0 9 0 58 0 10 0 7 0 11 0 58 0 12 0 58 0 13 0 58 0 14 0 58 0 15 0 58 0 16 0 58 0 20 0 58 0 22 0 58 0 31 0 58 0 34 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 40 0 58 0 41 0 58 0 42 0 58 0 49 0 58 0 50 0 58 0 58 0 58 0 59 0 58 0 60 0 58 0 62 0 58 0 65 0 58 0 72 0 58 0 75 0 58 0 78 0 58 0 79 0 58 0 81 0 58 0 96 0 58 0 97 0 58 0 106 0 58 0 107 0 58 0 110 0 58 0 112 0 58 0 114 0 58 0 119 0 58 0 125 0 58 0 126 0 58 0 127 0 58 0 128 0 58 0 129 0 58 0 130 0 58 0 131 0 58 0 132 0 58 0 133 0 58 0 134 2 53 0 179 0 58 1 112] 
#[1 2 65 0 2 3 213 0 3 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 65 0 2 0 210 0 3 0 210 0 4 0 210 0 5 2 73 0 6 0 210 0 7 0 210 0 8 0 210 0 9 0 210 0 10 0 23 0 11 0 27 0 12 0 31 0 13 0 35 0 14 0 39 0 15 0 43 0 16 0 210 0 20 0 210 0 22 0 210 0 31 0 210 0 34 0 210 0 36 0 210 0 37 0 210 0 38 0 210 0 40 0 210 0 41 0 210 0 42 0 210 0 49 0 210 0 50 0 210 0 58 0 47 0 59 0 210 0 60 0 210 0 62 0 210 0 65 0 210 0 72 0 210 0 75 0 210 0 78 0 210 0 79 0 210 0 81 0 210 0 96 0 210 0 97 0 210 0 106 0 210 0 107 0 210 0 110 0 210 0 112 0 210 0 114 0 210 0 119 0 210 0 125 0 210 0 126 0 210 0 127 2 149 0 128 0 210 0 129 0 210 0 130 0 210 0 131 0 210 0 132 0 210 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 0 210 1 112] 
#[1 3 217 0 41 3 221 0 133] 
#[0 0 214 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 3 225 0 78 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 0 58 0 10 0 59] 
#[1 3 229 0 10 3 233 0 59] 
#[0 0 218 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 0 218 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 3 237 0 112 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 3 241 0 2 0 222 0 3 0 222 0 4 0 222 0 5 0 222 0 6 0 222 0 7 0 222 0 8 0 222 0 9 0 222 0 10 0 222 0 11 0 222 0 12 0 222 0 13 0 222 0 14 0 222 0 15 0 222 0 16 0 222 0 20 0 222 0 22 0 222 0 31 0 222 0 34 0 222 0 36 0 222 0 37 0 222 0 38 0 222 0 40 0 222 0 41 0 222 0 42 0 222 0 49 0 222 0 50 0 222 0 58 0 222 0 59 0 222 0 60 0 222 0 62 0 222 0 65 0 222 0 72 0 222 0 75 0 222 0 78 0 222 0 79 0 222 0 81 0 222 0 96 0 222 0 97 0 222 0 106 0 222 0 107 0 222 0 110 0 222 0 112 0 222 0 114 0 222 0 119 0 222 0 125 0 222 0 126 0 222 0 127 0 222 0 128 0 222 0 129 0 222 0 130 0 222 0 131 0 222 0 132 0 222 0 133 0 222 0 134 0 222 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 3 245 1 93 3 245 1 94 3 245 1 95 3 245 1 96 3 245 1 97 0 245 1 102 3 245 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 3 249 1 93 3 249 1 94 3 249 1 95 3 249 1 96 3 249 1 97 0 245 1 102 3 249 1 103 0 253 1 111] 
#[1 2 65 0 2 0 226 0 3 2 169 0 4 0 226 0 5 2 73 0 6 0 226 0 7 2 169 0 8 0 226 0 9 2 81 0 10 0 51 0 11 0 55 0 12 0 59 0 13 0 63 0 14 0 67 0 15 0 71 0 16 2 169 0 20 2 169 0 22 0 226 0 31 0 226 0 34 2 169 0 36 0 226 0 37 0 226 0 38 0 226 0 40 0 226 0 41 0 226 0 42 0 226 0 49 0 226 0 50 0 226 0 58 0 75 0 59 0 226 0 60 0 226 0 62 2 169 0 65 2 169 0 72 0 226 0 75 0 226 0 78 0 226 0 79 2 169 0 81 0 226 0 96 0 226 0 97 2 169 0 106 2 169 0 107 0 226 0 110 0 226 0 112 0 226 0 114 0 226 0 119 0 226 0 125 0 226 0 126 2 169 0 127 2 149 0 128 0 226 0 129 0 226 0 130 2 169 0 131 2 169 0 132 0 226 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 0 226 1 112] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 0 230 0 40 0 230 0 41 0 230 0 42 0 230 0 49 0 230 0 50 2 169 0 59 0 230 0 62 2 169 0 65 2 169 0 72 0 230 0 79 2 169 0 81 2 169 0 106 2 169 0 107 0 230 0 119 2 169 0 127 2 149 0 128 3 253 0 130 2 169 0 131 2 169 0 132 0 230 0 133 2 161 0 134 4 1 1 85 2 165 1 100 2 169 1 106 2 169 1 107 0 230 1 112] 
#[1 4 5 0 119 3 221 0 133] 
#[1 0 234 0 41 4 9 0 42 0 234 0 50 3 221 0 133 4 13 1 70] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 4 17 0 37 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 4 21 0 5 4 25 0 37] 
#[1 2 65 0 2 2 169 0 4 0 238 0 5 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 0 238 0 37 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 0 242 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 2 65 0 2 2 169 0 4 0 246 0 5 2 73 0 6 4 29 0 7 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 0 246 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 4 33 0 5 4 37 0 129] 
#[0 0 250 0 5 0 129] 
#[1 2 65 0 2 0 254 0 3 2 169 0 4 0 254 0 5 2 73 0 6 0 254 0 7 2 169 0 8 0 254 0 9 0 254 0 10 0 79 0 11 0 83 0 12 0 87 0 13 0 91 0 14 0 95 0 15 0 99 0 16 0 254 0 20 0 254 0 22 0 254 0 31 0 254 0 34 2 169 0 36 0 254 0 37 0 254 0 38 0 254 0 40 0 254 0 41 0 254 0 42 0 254 0 49 0 254 0 50 0 254 0 58 0 103 0 59 0 254 0 60 0 254 0 62 0 254 0 65 2 169 0 72 0 254 0 75 0 254 0 78 0 254 0 79 0 254 0 81 0 254 0 96 0 254 0 97 2 169 0 106 2 169 0 107 0 254 0 110 0 254 0 112 0 254 0 114 0 254 0 119 0 254 0 125 0 254 0 126 0 254 0 127 2 149 0 128 0 254 0 129 0 254 0 130 0 254 0 131 0 254 0 132 0 254 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 0 254 1 112] 
#[1 2 65 0 2 1 2 0 3 2 169 0 4 1 2 0 5 2 73 0 6 1 2 0 7 2 169 0 8 1 2 0 9 1 2 0 10 0 107 0 11 0 111 0 12 0 115 0 13 0 119 0 14 0 123 0 15 0 127 0 16 1 2 0 20 1 2 0 22 1 2 0 31 1 2 0 34 2 169 0 36 1 2 0 37 1 2 0 38 1 2 0 40 1 2 0 41 1 2 0 42 1 2 0 49 1 2 0 50 1 2 0 58 0 131 0 59 1 2 0 60 1 2 0 62 1 2 0 65 2 169 0 72 1 2 0 75 1 2 0 78 1 2 0 79 1 2 0 81 1 2 0 96 1 2 0 97 2 169 0 106 2 169 0 107 1 2 0 110 1 2 0 112 1 2 0 114 1 2 0 119 1 2 0 125 1 2 0 126 1 2 0 127 2 149 0 128 1 2 0 129 1 2 0 130 1 2 0 131 1 2 0 132 1 2 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 1 2 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 41 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 4 41 1 90 4 41 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 1 1 0 2 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 4 45 0 178 4 49 0 180 1 65 0 181 1 105 0 183 1 105 0 184 4 45 0 186 4 45 0 190 1 85 0 192 4 45 0 198 1 93 0 199 1 97 0 200 1 101 0 201 1 105 0 231 4 45 0 232 4 45 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 1 6 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 53 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 4 53 1 90 4 53 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[0 4 57 0 41] 
#[1 0 69 0 2 4 61 0 3 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 65 1 93 4 65 1 94 4 65 1 95 4 65 1 96 4 65 1 97 0 245 1 102 4 65 1 103 4 69 1 104 4 73 1 105 0 253 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[1 4 77 0 1 4 81 0 135] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 85 1 93 4 85 1 94 4 85 1 95 4 85 1 96 4 85 1 97 0 245 1 102 4 85 1 103 0 253 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 14 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 89 1 93 4 89 1 94 4 89 1 95 4 89 1 96 4 89 1 97 4 93 1 101 0 245 1 102 4 89 1 103 0 253 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 18 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 1 22 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 97 1 93 4 97 1 94 4 97 1 95 4 97 1 96 4 97 1 97 0 245 1 102 4 97 1 103 0 253 1 111] 
#[0 1 14 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[1 0 146 0 2 0 146 0 3 0 146 0 4 0 146 0 5 0 146 0 6 0 146 0 8 4 101 0 9 0 146 0 11 0 146 0 12 0 146 0 13 0 146 0 14 0 146 0 15 0 146 0 16 0 146 0 20 0 146 0 22 0 146 0 36 0 146 0 59 0 146 0 65 0 146 0 72 0 146 0 81 0 146 0 106 0 146 0 107 0 146 0 127 0 146 0 131 0 146 0 132] 
#[1 3 25 0 2 1 26 0 3 3 33 0 4 1 26 0 5 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 4 105 0 14 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[0 4 109 0 3] 
#[1 1 30 0 3 4 113 0 5] 
#[0 1 34 0 3 0 5] 
#[1 1 38 0 3 4 121 0 133 4 121 1 76] 
#[1 1 42 0 3 0 135 0 133] 
#[0 1 46 0 3 0 133] 
#[0 0 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 3 25 0 2 1 50 0 3 1 50 0 4 1 50 0 5 3 29 0 6 1 50 0 7 1 50 0 8 1 50 0 9 0 139 0 11 0 143 0 12 0 147 0 13 1 50 0 14 0 151 0 15 0 155 0 16 1 50 0 18 1 50 0 20 1 50 0 22 1 50 0 31 1 50 0 32 1 50 0 34 1 50 0 36 1 50 0 37 1 50 0 58 0 159 0 59 1 50 0 60 1 50 0 65 1 50 0 72 1 50 0 75 1 50 0 78 1 50 0 81 1 50 0 87 1 50 0 96 1 50 0 97 1 50 0 106 1 50 0 107 1 50 0 110 1 50 0 125 1 50 0 126 1 50 0 127 1 50 0 128 1 50 0 129 1 50 0 131 1 50 0 132 1 50 0 133 3 33 1 107 1 50 1 112] 
#[1 1 1 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 14 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 31 0 18 0 32 0 18 0 34 0 18 0 37 1 9 0 47 1 13 0 53 0 18 0 58 0 18 0 60 0 18 0 75 1 17 0 76 0 18 0 78 1 85 0 85 0 18 0 87 1 25 0 89 0 18 0 96 0 18 0 97 0 22 0 98 1 29 0 105 0 18 0 110 1 33 0 116 0 18 0 125 0 18 0 126 0 133 0 128 0 18 0 129 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 4 129 0 178 1 65 0 181 4 129 0 183 4 129 0 184 4 129 0 186 4 129 0 190 1 85 0 192 4 129 0 198 1 93 0 199 1 97 0 200 1 101 0 201 4 129 0 231 4 129 0 232 4 129 0 233 1 101 1 97 1 121 1 102 1 125 1 111 0 18 1 112] 
#[1 1 54 0 3 4 157 0 29 4 157 0 82 4 157 0 121 1 58 0 135 4 145 1 17 4 149 1 18 4 153 1 19 4 157 1 22] 
#[0 4 161 0 9] 
#[1 3 25 0 2 1 62 0 3 3 33 0 4 1 62 0 5 3 29 0 6 1 62 0 7 3 33 0 8 1 62 0 9 0 163 0 11 0 167 0 12 0 171 0 13 1 62 0 14 0 175 0 15 0 179 0 16 1 62 0 18 3 33 0 20 3 33 0 22 1 62 0 31 1 62 0 32 1 62 0 34 3 33 0 36 1 62 0 37 1 62 0 58 0 183 0 59 1 62 0 60 3 33 0 65 3 33 0 72 1 62 0 75 1 62 0 78 3 33 0 81 1 62 0 87 1 62 0 96 1 62 0 97 3 33 0 106 3 33 0 107 1 62 0 110 1 62 0 125 1 62 0 126 3 33 0 127 1 62 0 128 1 62 0 129 3 33 0 131 3 33 0 132 1 62 0 133 3 33 1 107 1 62 1 112] 
#[1 4 165 0 78 1 66 0 133 4 169 0 248] 
#[1 4 173 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 4 177 0 198 1 93 0 199 1 97 0 200 4 181 0 201 4 181 1 97 1 121 1 102 1 125 1 111] 
#[1 0 178 0 2 0 178 0 3 0 178 0 5 0 178 0 6 0 178 0 9 0 187 0 11 0 178 0 14 0 178 0 15 0 178 0 18 0 178 0 28 0 178 0 29 0 178 0 30 0 178 0 31 0 178 0 32 0 178 0 33 0 178 0 34 0 178 0 37 0 178 0 40 0 178 0 41 0 178 0 42 0 178 0 49 0 178 0 50 0 178 0 53 0 178 0 58 0 178 0 60 0 178 0 62 0 178 0 75 0 178 0 78 0 178 0 79 0 178 0 87 0 178 0 88 0 178 0 89 0 178 0 91 0 178 0 92 0 178 0 93 0 178 0 94 0 178 0 96 0 178 0 97 0 178 0 110 0 178 0 111 0 178 0 113 0 178 0 119 0 178 0 121 0 178 0 125 0 178 0 126 0 178 0 128 0 178 0 129 0 178 0 133 0 178 0 135 4 185 0 171 0 178 1 112] 
#[0 1 70 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 3 25 0 2 1 74 0 3 3 33 0 4 1 74 0 5 3 29 0 6 1 74 0 7 3 33 0 8 1 74 0 9 0 191 0 11 0 195 0 12 0 199 0 13 1 74 0 14 0 203 0 15 0 207 0 16 1 74 0 18 1 74 0 20 1 74 0 22 1 74 0 31 1 74 0 32 1 74 0 34 3 33 0 36 1 74 0 37 1 74 0 58 0 211 0 59 1 74 0 60 1 74 0 65 3 33 0 72 1 74 0 75 1 74 0 78 1 74 0 81 1 74 0 87 1 74 0 96 1 74 0 97 3 33 0 106 3 33 0 107 1 74 0 110 1 74 0 125 1 74 0 126 1 74 0 127 1 74 0 128 1 74 0 129 1 74 0 131 1 74 0 132 1 74 0 133 3 33 1 107 1 74 1 112] 
#[1 3 25 0 2 1 78 0 3 3 33 0 4 1 78 0 5 3 29 0 6 1 78 0 7 3 33 0 8 1 78 0 9 0 215 0 11 0 219 0 12 0 223 0 13 1 78 0 14 0 227 0 15 0 231 0 16 1 78 0 18 1 78 0 20 1 78 0 22 1 78 0 31 1 78 0 32 1 78 0 34 3 33 0 36 1 78 0 37 1 78 0 58 0 235 0 59 1 78 0 60 1 78 0 65 3 33 0 72 1 78 0 75 1 78 0 78 1 78 0 81 1 78 0 87 1 78 0 96 1 78 0 97 3 33 0 106 3 33 0 107 1 78 0 110 1 78 0 125 1 78 0 126 1 78 0 127 1 78 0 128 1 78 0 129 1 78 0 131 1 78 0 132 1 78 0 133 3 33 1 107 1 78 1 112] 
#[0 0 158 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 1 82 0 3 1 82 0 5 0 239 0 11 1 82 0 14 1 82 0 15 1 82 0 18 1 82 0 31 1 82 0 32 1 82 0 34 1 82 0 37 1 82 0 58 1 82 0 60 1 82 0 75 1 82 0 78 1 82 0 87 1 82 0 96 1 82 0 97 1 82 0 110 1 82 0 125 1 82 0 126 3 41 0 128 1 82 0 129 1 82 0 133 3 45 0 179 1 82 1 112] 
#[0 4 189 0 136] 
#[1 1 86 0 78 4 193 0 128 4 197 0 234] 
#[1 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 4 201 0 191 4 205 0 215 4 209 0 225] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 4 213 0 199 1 97 0 200 1 101 0 201 1 101 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 4 217 0 201 4 221 0 208 4 217 1 97 1 121 1 102 1 125 1 111] 
#[0 4 225 0 136] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 4 229 0 201 4 229 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 14 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 31 0 18 0 32 0 18 0 34 0 18 0 37 1 9 0 47 1 13 0 53 0 18 0 58 0 18 0 60 0 18 0 75 1 17 0 76 0 18 0 78 1 85 0 85 0 18 0 87 1 25 0 89 0 18 0 96 0 18 0 97 0 22 0 98 1 29 0 105 0 18 0 110 1 33 0 116 0 18 0 125 0 18 0 126 0 133 0 128 0 18 0 129 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 4 233 0 178 1 65 0 181 4 233 0 183 4 233 0 184 4 233 0 186 4 233 0 190 1 85 0 192 4 233 0 198 1 93 0 199 1 97 0 200 1 101 0 201 4 233 0 231 4 233 0 232 4 233 0 233 1 101 1 97 1 121 1 102 1 125 1 111 0 18 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 4 237 0 201 4 237 1 97 1 121 1 102 1 125 1 111] 
#[0 1 94 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 4 241 0 135 4 245 0 172] 
#[0 4 249 0 14] 
#[0 1 98 0 14 0 32 0 133] 
#[0 1 98 0 14 0 32 0 133] 
#[0 4 253 0 133] 
#[0 5 1 0 133] 
#[0 5 5 0 135] 
#[0 5 9 0 133] 
#[1 1 145 0 135 5 13 0 158 1 161 0 159] 
#[0 1 102 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 44 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[0 5 17 0 139] 
#[0 5 21 0 6] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 5 25 0 44 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 5 29 0 151 5 33 0 152 1 185 1 53 1 189 1 54] 
#[1 1 106 0 29 1 106 0 41 1 106 0 49 1 106 0 53 1 106 0 57 1 106 0 62 1 106 0 89 1 106 0 102 1 106 0 113 1 106 0 116 1 106 0 121 5 37 0 160] 
#[1 0 6 0 25 0 6 0 28 0 6 0 29 0 6 0 30 0 6 0 33 0 6 0 41 0 6 0 49 0 6 0 53 0 6 0 62 0 6 0 89 0 6 0 102 0 6 0 113 0 6 0 116 0 33 0 120 0 6 0 121 5 41 0 156] 
#[1 1 110 0 41 1 110 0 49 5 45 0 62 5 49 1 108] 
#[0 1 114 1 112] 
#[1 5 53 0 135 5 57 0 163 5 61 0 164] 
#[1 2 241 0 135 5 65 0 224] 
#[1 5 69 0 135 5 73 1 20] 
#[1 2 241 0 135 5 77 0 224] 
#[1 5 69 0 135 5 81 1 20 5 85 1 59 5 89 1 60] 
#[1 1 129 0 135 5 93 0 169 5 97 0 170] 
#[1 5 69 0 135 5 81 1 20 5 101 1 59 5 89 1 60] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 122 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[0 1 126 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 5 105 1 53 1 189 1 54] 
#[1 1 130 0 3 1 130 0 23 1 130 0 25 1 130 0 26 1 130 0 28 1 130 0 29 1 130 0 30 1 130 0 33 1 130 0 41 5 109 0 45 1 130 0 49 5 113 0 52 1 130 0 53 1 130 0 57 1 130 0 62 1 130 0 66 1 130 0 88 1 130 0 89 1 130 0 91 1 130 0 92 1 130 0 93 1 130 0 94 1 130 0 102 1 130 0 111 1 130 0 113 1 130 0 116 1 130 0 121 1 130 0 128 1 130 0 135 5 117 1 15] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 134 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[0 1 138 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 5 121 1 53 1 189 1 54] 
#[1 1 142 0 3 1 142 0 23 1 142 0 25 1 142 0 26 1 142 0 28 1 142 0 29 1 142 0 30 1 142 0 33 1 142 0 41 5 109 0 45 1 142 0 49 5 113 0 52 1 142 0 53 1 142 0 57 1 142 0 62 1 142 0 66 1 142 0 88 1 142 0 89 1 142 0 91 1 142 0 92 1 142 0 93 1 142 0 94 1 142 0 102 1 142 0 111 1 142 0 113 1 142 0 116 1 142 0 121 1 142 0 128 1 142 0 135 5 125 1 15] 
#[0 1 146 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 118 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 1 150 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 5 129 0 133] 
#[0 1 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 1 158 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 133 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 5 133 1 90 5 133 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 5 137 0 201 5 141 1 77 5 145 1 78 5 149 1 79 5 153 1 80 5 157 1 81 5 161 1 82 5 137 1 97 1 121 1 102 1 125 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 165 1 93 5 165 1 94 5 165 1 95 5 165 1 96 5 165 1 97 0 245 1 102 5 165 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 169 1 93 5 169 1 94 5 169 1 95 5 169 1 96 5 169 1 97 0 245 1 102 5 169 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 173 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 5 173 1 90 5 173 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 0 69 0 2 5 177 0 3 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 65 1 93 4 65 1 94 4 65 1 95 4 65 1 96 4 65 1 97 0 245 1 102 4 65 1 103 5 181 1 104 4 73 1 105 0 253 1 111] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 5 185 0 9 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 5 189 0 9 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 241 0 135 5 193 0 224] 
#[0 1 162 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 197 1 93 5 197 1 94 5 197 1 95 5 197 1 96 5 197 1 97 0 245 1 102 5 197 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 5 201 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 205 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 5 209 1 71 5 213 1 72 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 1 166 0 41 5 217 0 50 5 221 1 74] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 225 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 5 225 1 90 5 225 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 229 1 93 5 229 1 94 5 229 1 95 5 229 1 96 5 229 1 97 0 245 1 102 5 229 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 233 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 5 233 1 90 5 233 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 5 237 1 93 5 237 1 94 5 237 1 95 5 237 1 96 5 237 1 97 0 245 1 102 5 237 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 2 25 1 93 2 25 1 94 2 25 1 95 2 25 1 96 2 25 1 97 5 241 1 99 0 245 1 102 2 25 1 103 0 253 1 111] 
#[0 1 170 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 1 174 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 1 178 0 5 0 158 0 11 1 178 0 15 0 158 0 18 0 158 0 128] 
#[1 5 245 0 5 5 249 0 15] 
#[0 1 174 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 1 182 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 1 186 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 2 65 0 2 1 190 0 3 2 169 0 4 1 190 0 5 2 73 0 6 2 169 0 8 1 190 0 9 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 5 253 0 3 6 1 0 5] 
#[1 1 194 0 3 1 194 0 5 6 5 0 9] 
#[0 1 198 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 1 198 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 2 65 0 2 1 202 0 3 2 169 0 4 1 202 0 5 2 73 0 6 1 202 0 7 2 169 0 8 1 202 0 9 2 81 0 10 0 243 0 11 0 247 0 12 0 251 0 13 0 255 0 14 1 3 0 15 1 7 0 16 2 169 0 20 2 169 0 22 1 202 0 31 1 202 0 34 2 169 0 36 1 202 0 37 1 202 0 38 1 202 0 40 1 202 0 41 1 202 0 42 1 202 0 49 1 202 0 50 1 202 0 58 1 11 0 59 1 202 0 60 1 202 0 62 2 169 0 65 2 169 0 72 1 202 0 75 1 202 0 78 1 202 0 79 2 169 0 81 1 202 0 96 1 202 0 97 2 169 0 106 2 169 0 107 1 202 0 110 1 202 0 112 1 202 0 114 1 202 0 119 1 202 0 125 1 202 0 126 2 169 0 127 2 149 0 128 1 202 0 129 1 202 0 130 2 169 0 131 2 169 0 132 1 202 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 1 202 1 112] 
#[1 2 65 0 2 2 169 0 4 1 206 0 5 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 1 206 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 6 9 0 5 6 13 0 129] 
#[1 2 65 0 2 1 210 0 3 2 169 0 4 1 210 0 5 2 73 0 6 1 210 0 7 2 169 0 8 1 210 0 9 2 81 0 10 1 15 0 11 1 19 0 12 1 23 0 13 1 27 0 14 1 31 0 15 1 35 0 16 2 169 0 20 2 169 0 22 1 210 0 31 1 210 0 34 2 169 0 36 1 210 0 37 1 210 0 38 1 210 0 40 1 210 0 41 1 210 0 42 1 210 0 49 1 210 0 50 1 210 0 58 1 39 0 59 1 210 0 60 1 210 0 62 2 169 0 65 2 169 0 72 1 210 0 75 1 210 0 78 1 210 0 79 2 169 0 81 1 210 0 96 1 210 0 97 2 169 0 106 2 169 0 107 1 210 0 110 1 210 0 112 1 210 0 114 1 210 0 119 1 210 0 125 1 210 0 126 2 169 0 127 2 149 0 128 1 210 0 129 1 210 0 130 2 169 0 131 2 169 0 132 1 210 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 1 210 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 6 17 0 201 6 17 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 6 21 0 201 6 21 1 97 1 121 1 102 1 125 1 111] 
#[0 1 214 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 2 181 0 201 6 25 0 204 2 181 1 97 1 121 1 102 1 125 1 111] 
#[0 1 218 0 3] 
#[0 6 29 0 3] 
#[1 6 33 0 136 6 37 0 207] 
#[1 1 222 0 3 1 222 0 5 1 43 0 11 1 222 0 14 1 222 0 15 3 37 0 18 1 222 0 31 1 222 0 32 1 222 0 34 1 222 0 37 1 222 0 58 1 222 0 60 1 222 0 75 1 222 0 78 1 222 0 87 1 222 0 96 1 222 0 97 1 222 0 110 1 222 0 125 1 222 0 126 3 41 0 128 1 222 0 129 1 222 0 133 3 45 0 179 1 222 1 112] 
#[0 1 226 0 135] 
#[0 1 226 0 135] 
#[0 1 226 0 135] 
#[0 6 41 0 3] 
#[1 1 230 0 3 1 230 0 129 6 45 0 133] 
#[0 1 234 0 3 0 129 0 133] 
#[1 5 69 0 135 6 49 1 20] 
#[1 1 1 0 2 0 18 0 6 0 18 0 11 1 5 0 17 0 18 0 18 0 22 0 21 1 9 0 47 1 13 0 53 1 17 0 76 0 18 0 78 1 85 0 85 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 6 53 0 178 1 65 0 181 6 53 0 183 6 53 0 184 6 53 0 186 6 53 0 190 1 85 0 192 6 53 0 198 1 93 0 199 1 97 0 200 1 101 0 201 6 53 0 231 6 53 0 232 6 53 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 6 57 0 77] 
#[0 6 61 0 133] 
#[1 1 1 0 2 0 130 0 3 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 6 65 0 136 1 97 0 137 1 121 0 139 1 57 0 143 6 69 0 187 1 97 0 200 2 181 0 201 2 185 0 202 2 189 0 203 2 193 0 204 2 197 0 205 2 201 0 206 2 205 0 207 2 181 1 97 1 121 1 102 1 125 1 111] 
#[0 1 238 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 3 25 0 2 1 242 0 3 3 33 0 4 1 242 0 5 3 29 0 6 0 170 0 7 3 33 0 8 1 47 0 11 3 33 0 12 3 33 0 13 1 242 0 14 1 51 0 15 3 33 0 16 1 242 0 18 3 33 0 20 3 33 0 22 1 242 0 31 1 242 0 32 1 242 0 34 3 33 0 36 1 242 0 37 1 242 0 58 3 33 0 59 1 242 0 60 3 33 0 65 3 33 0 72 1 242 0 75 1 242 0 78 3 33 0 81 1 242 0 87 1 242 0 96 1 242 0 97 3 33 0 106 3 33 0 107 1 242 0 110 1 242 0 125 1 242 0 126 3 33 0 127 1 242 0 128 1 242 0 129 3 33 0 131 3 33 0 132 1 242 0 133 3 33 1 107 1 242 1 112] 
#[1 1 246 0 2 1 246 0 3 1 246 0 5 6 73 0 6 1 246 0 9 1 246 0 11 1 246 0 14 1 246 0 15 1 246 0 18 1 246 0 28 1 246 0 29 1 246 0 30 1 246 0 31 1 246 0 32 1 246 0 33 1 246 0 34 1 246 0 37 1 246 0 40 1 246 0 41 1 246 0 42 1 246 0 49 1 246 0 50 1 246 0 53 1 246 0 58 1 246 0 60 1 246 0 62 1 246 0 75 1 246 0 78 1 246 0 79 1 246 0 87 1 246 0 88 1 246 0 89 1 246 0 91 1 246 0 92 1 246 0 93 1 246 0 94 1 246 0 96 1 246 0 97 1 246 0 110 1 246 0 111 1 246 0 113 1 246 0 119 1 246 0 121 1 246 0 125 1 246 0 126 1 246 0 128 1 246 0 129 1 246 0 133 1 246 0 135 1 246 1 112] 
#[0 1 250 0 3 0 5 0 6 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 6 89 0 198 1 93 0 199 1 97 0 200 6 81 0 201 6 85 0 235 6 89 0 236 6 81 1 97 1 121 1 102 1 125 1 111] 
#[0 6 93 0 78] 
#[0 6 97 0 41] 
#[1 1 254 0 3 1 254 0 26 1 254 0 41 1 254 0 88 1 254 0 92 1 254 0 93 1 254 0 94 1 254 0 111 6 101 0 216] 
#[1 2 2 0 3 2 2 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 2 2 0 41 6 117 0 53 2 2 0 88 6 121 0 89 6 125 0 91 2 2 0 92 2 2 0 93 2 2 0 94 2 2 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[0 2 6 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 3 25 0 2 2 10 0 3 3 33 0 4 2 10 0 5 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 7 13 0 3 7 17 0 5] 
#[0 2 14 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 3 25 0 2 2 18 0 3 3 33 0 4 2 18 0 5 3 29 0 6 2 18 0 7 3 33 0 8 2 18 0 9 1 55 0 11 1 59 0 12 1 63 0 13 2 18 0 14 1 67 0 15 1 71 0 16 2 18 0 18 3 33 0 20 3 33 0 22 2 18 0 31 2 18 0 32 2 18 0 34 3 33 0 36 2 18 0 37 2 18 0 58 1 75 0 59 2 18 0 60 3 33 0 65 3 33 0 72 2 18 0 75 2 18 0 78 3 33 0 81 2 18 0 87 2 18 0 96 2 18 0 97 3 33 0 106 3 33 0 107 2 18 0 110 2 18 0 125 2 18 0 126 3 33 0 127 2 18 0 128 2 18 0 129 3 33 0 131 3 33 0 132 2 18 0 133 3 33 1 107 2 18 1 112] 
#[1 2 22 0 3 2 22 0 5 1 79 0 11 2 22 0 14 2 22 0 15 2 22 0 31 2 22 0 32 2 22 0 34 2 22 0 37 2 22 0 58 2 22 0 60 2 22 0 75 2 22 0 78 2 22 0 87 2 22 0 96 2 22 0 97 2 22 0 110 2 22 0 125 2 22 0 126 3 41 0 128 2 22 0 129 2 22 0 133 3 45 0 179 2 22 1 112] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 7 21 0 129 3 33 0 131 3 33 0 132 3 33 1 107] 
#[0 2 26 0 5 0 15] 
#[1 7 25 0 5 7 29 0 15] 
#[1 7 33 0 2 0 18 0 6 0 18 0 11 1 5 0 17 0 18 0 18 0 22 0 21 7 37 0 28 0 18 0 32 7 97 0 35 1 9 0 47 1 13 0 53 7 97 0 64 1 17 0 76 7 49 0 77 1 85 0 85 0 18 0 87 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 7 53 0 173 7 57 0 174 7 61 0 177 7 65 0 178 1 65 0 181 7 69 0 183 7 73 0 184 7 65 0 186 7 61 0 189 7 65 0 190 1 85 0 192 7 65 0 198 1 93 0 199 1 97 0 200 1 101 0 201 7 61 0 209 7 61 0 210 7 61 0 213 1 105 0 231 7 65 0 232 7 65 0 233 7 61 0 237 7 97 0 238 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 2 30 0 23 0 25 0 29 0 44 0 53 0 66 0 89 0 113 0 116 0 120 0 121] 
#[0 2 34 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 120 0 121] 
#[0 2 38 0 5 0 6 0 32 0 59 0 87 0 133] 
#[0 2 42 0 41 0 49 0 57 0 62 0 64 1 112] 
#[0 2 46 0 5 0 133] 
#[0 2 50 0 5 0 133] 
#[0 2 54 1 112] 
#[0 7 101 0 135] 
#[0 2 58 0 23 0 25 0 29 0 44 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 7 105 0 6] 
#[1 3 117 0 29 2 62 0 41 2 62 0 49 3 121 0 53 2 62 0 57 2 62 0 62 3 129 0 89 7 109 0 102 3 133 0 113 3 137 0 116 3 141 0 121 7 113 0 161 7 113 0 162 7 113 0 165 7 113 0 168 7 113 0 246 7 113 0 249 7 113 1 35 3 161 1 36 7 113 1 37 3 169 1 38 7 113 1 43 3 181 1 44 7 113 1 45 3 189 1 46 7 113 1 57 3 205 1 58] 
#[1 2 66 0 25 2 66 0 28 2 66 0 29 2 66 0 30 2 66 0 33 2 66 0 41 2 66 0 49 2 66 0 53 2 66 0 62 2 66 0 89 2 66 0 102 2 66 0 113 2 66 0 116 2 66 0 121 7 141 1 25] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 14 0 49 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 7 145 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 2 70 0 41 7 149 0 49 7 153 1 109] 
#[1 7 157 0 9 2 74 0 14 7 161 0 252] 
#[1 2 78 0 3 2 78 0 23 2 78 0 25 2 78 0 26 2 78 0 28 2 78 0 29 2 78 0 30 2 78 0 33 2 78 0 41 2 78 0 49 2 78 0 53 2 78 0 57 2 78 0 62 2 78 0 66 2 78 0 88 2 78 0 89 2 78 0 91 2 78 0 92 2 78 0 93 2 78 0 94 2 78 0 102 2 78 0 111 2 78 0 113 2 78 0 116 2 78 0 121 2 78 0 128 5 53 0 135 7 165 0 164] 
#[0 2 82 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 2 221 0 2 0 138 0 9 0 138 0 133 7 169 0 185] 
#[0 2 86 0 3 0 5 0 9 0 129 0 133] 
#[1 7 173 0 5 7 177 0 133] 
#[1 2 221 0 2 0 138 0 133 7 181 0 185] 
#[1 7 173 0 5 7 185 0 9] 
#[1 2 90 0 3 2 90 0 23 2 90 0 25 2 90 0 26 2 90 0 28 2 90 0 29 2 90 0 30 2 90 0 33 2 90 0 41 2 90 0 49 2 90 0 53 2 90 0 57 2 90 0 62 2 90 0 66 2 90 0 88 2 90 0 89 2 90 0 91 2 90 0 92 2 90 0 93 2 90 0 94 2 90 0 102 2 90 0 111 2 90 0 113 2 90 0 116 2 90 0 121 2 90 0 128 5 69 0 135 5 81 1 20 7 189 1 60] 
#[0 2 94 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 2 98 0 23 2 98 0 25 2 98 0 28 2 98 0 29 2 98 0 30 2 98 0 33 2 98 0 41 2 98 0 49 2 98 0 53 2 98 0 57 2 98 0 62 2 98 0 66 2 98 0 89 2 98 0 102 2 98 0 113 2 98 0 116 2 98 0 121 1 129 0 135 7 193 0 170] 
#[0 2 102 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135] 
#[1 2 90 0 3 2 90 0 23 2 90 0 25 2 90 0 26 2 90 0 28 2 90 0 29 2 90 0 30 2 90 0 33 2 90 0 41 2 90 0 49 2 90 0 53 2 90 0 57 2 90 0 62 2 90 0 66 2 90 0 88 2 90 0 89 2 90 0 91 2 90 0 92 2 90 0 93 2 90 0 94 2 90 0 102 2 90 0 111 2 90 0 113 2 90 0 116 2 90 0 121 2 90 0 128 5 69 0 135 5 81 1 20 7 189 1 60] 
#[0 2 106 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[1 7 197 0 133 7 201 0 135 7 205 0 139] 
#[0 7 209 0 133] 
#[1 2 110 0 3 2 110 0 19 2 110 0 23 2 110 0 24 2 110 0 25 2 110 0 26 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 57 2 110 0 62 2 110 0 63 2 110 0 66 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 88 2 110 0 89 2 110 0 91 2 110 0 92 2 110 0 93 2 110 0 94 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 111 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 128 2 110 0 135 7 213 1 11] 
#[0 2 114 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[1 2 110 0 3 2 110 0 19 2 110 0 23 2 110 0 24 2 110 0 25 2 110 0 26 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 57 2 110 0 62 2 110 0 63 2 110 0 66 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 88 2 110 0 89 2 110 0 91 2 110 0 92 2 110 0 93 2 110 0 94 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 111 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 128 2 110 0 135 7 217 1 11] 
#[0 2 118 0 6 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 66 0 89 0 102 0 113 0 116 0 121] 
#[0 2 122 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133] 
#[1 3 25 0 2 3 33 0 4 2 126 0 5 3 29 0 6 7 221 0 7 3 33 0 8 2 126 0 9 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 7 225 0 40 2 130 0 41 7 229 1 83] 
#[1 1 38 0 40 1 38 0 41 7 233 0 133 7 237 1 76] 
#[0 2 134 0 40 0 41 0 133] 
#[0 7 241 0 9] 
#[0 7 245 0 5] 
#[1 2 138 0 5 2 142 0 9] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 8 1 0 38 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 8 1 0 114 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 8 1 1 88 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 8 5 0 37 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 8 9 0 40 2 146 0 41 2 146 0 42 2 146 0 49 2 146 0 50 2 146 0 62 2 146 0 79 2 146 0 119 2 146 0 133 2 146 1 112] 
#[0 2 150 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 8 13 0 3 6 1 0 5] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 8 17 1 93 8 17 1 94 8 17 1 95 8 17 1 96 8 17 1 97 0 245 1 102 8 17 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 8 21 1 93 8 21 1 94 8 21 1 95 8 21 1 96 8 21 1 97 0 245 1 102 8 21 1 103 0 253 1 111] 
#[0 2 154 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 158 0 40 2 158 0 41 2 158 0 42 2 158 0 49 2 158 0 50 2 169 0 59 2 158 0 62 2 169 0 65 2 169 0 72 2 158 0 79 2 169 0 81 2 169 0 106 2 169 0 107 2 158 0 119 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 158 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107 2 158 1 112] 
#[1 2 241 0 135 8 25 0 224] 
#[1 8 29 0 40 2 162 0 41 2 162 0 50 3 221 0 133 8 33 1 73] 
#[1 8 29 0 40 2 162 0 41 2 162 0 50 5 201 0 79 8 37 1 72 8 41 1 73] 
#[0 2 166 0 40 0 41 0 50 0 79] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 8 45 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[0 8 49 0 41] 
#[0 2 170 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 2 65 0 2 2 169 0 4 2 174 0 5 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 174 0 37 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 2 178 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 2 65 0 2 2 169 0 4 2 182 0 5 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 182 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 2 186 0 5 0 129] 
#[1 1 1 0 2 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 8 53 0 178 1 65 0 181 1 105 0 183 1 105 0 184 8 53 0 186 8 53 0 190 1 85 0 192 8 53 0 198 1 93 0 199 1 97 0 200 1 101 0 201 1 105 0 231 8 53 0 232 8 53 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 2 190 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 2 194 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 4 65 1 93 4 65 1 94 4 65 1 95 4 65 1 96 4 65 1 97 0 245 1 102 4 65 1 103 8 57 1 105 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 8 61 1 93 8 61 1 94 8 61 1 95 8 61 1 96 8 61 1 97 0 245 1 102 8 61 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 8 65 1 93 8 65 1 94 8 65 1 95 8 65 1 96 8 65 1 97 0 245 1 102 8 65 1 103 0 253 1 111] 
#[0 2 198 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 3 25 0 2 2 202 0 3 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 2 202 0 133 3 33 1 107] 
#[1 3 25 0 2 2 206 0 3 3 33 0 4 2 206 0 5 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[0 2 210 0 3 0 5] 
#[0 2 214 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[0 4 101 0 9] 
#[0 2 218 0 3 0 133] 
#[0 2 222 0 9 0 78 0 133] 
#[1 4 157 0 29 4 157 0 82 4 157 0 121 1 58 0 135 8 69 1 19 4 157 1 22] 
#[1 2 226 0 3 7 173 0 5 8 73 0 9 2 226 0 129 2 226 0 133] 
#[1 2 49 0 11 3 37 0 18 4 165 0 78 3 41 0 128 1 66 0 133 3 45 0 179 8 77 0 248] 
#[0 2 230 0 133] 
#[1 2 110 0 3 2 110 0 5 2 110 0 11 2 110 0 14 2 110 0 15 2 110 0 18 2 110 0 19 2 110 0 23 2 110 0 24 2 110 0 25 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 31 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 37 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 57 2 110 0 58 2 110 0 60 2 110 0 62 2 110 0 63 2 110 0 66 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 75 2 110 0 78 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 89 2 110 0 96 2 110 0 97 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 110 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 125 2 110 0 126 2 110 0 128 2 110 0 129 2 110 0 133 2 110 0 135 8 81 1 11 2 110 1 112] 
#[1 0 146 0 2 0 146 0 3 0 146 0 4 1 83 0 5 0 146 0 6 0 146 0 8 4 101 0 9 0 146 0 11 0 146 0 12 0 146 0 13 0 146 0 14 0 146 0 15 0 146 0 16 0 146 0 20 0 146 0 22 0 146 0 36 0 146 0 59 0 146 0 65 0 146 0 72 0 146 0 81 0 146 0 106 0 146 0 107 0 146 0 127 0 146 0 131 0 146 0 132] 
#[0 8 89 0 3] 
#[0 8 93 0 135] 
#[0 2 234 0 5 0 129] 
#[1 3 25 0 2 3 33 0 4 2 234 0 5 3 29 0 6 0 170 0 7 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 2 234 0 129 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 8 97 0 5 8 101 0 129] 
#[0 2 238 0 5 0 129] 
#[1 1 1 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 11 0 18 0 14 0 18 0 15 1 5 0 17 0 18 0 18 0 22 0 21 8 105 0 29 0 18 0 31 0 18 0 32 0 18 0 34 0 18 0 37 1 9 0 47 1 13 0 53 0 18 0 58 0 18 0 60 0 18 0 75 1 17 0 76 0 18 0 78 1 85 0 85 0 18 0 87 1 25 0 89 0 18 0 96 0 18 0 97 0 22 0 98 1 29 0 105 0 18 0 110 1 33 0 116 0 18 0 125 0 18 0 126 0 133 0 128 0 18 0 129 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 8 109 0 178 1 65 0 181 8 109 0 183 8 109 0 184 8 109 0 186 8 109 0 190 1 85 0 192 8 109 0 198 1 93 0 199 1 97 0 200 1 101 0 201 8 109 0 231 8 109 0 232 8 109 0 233 1 101 1 97 1 121 1 102 1 125 1 111 0 18 1 112] 
#[0 2 242 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 2 246 0 3 8 113 0 26 2 246 0 41 8 117 0 88 8 121 0 92 8 125 0 93 8 129 0 94 8 133 0 111 8 137 0 193 8 141 0 217 8 141 0 218 8 141 0 219 8 141 0 220 8 141 0 221] 
#[1 3 121 0 53 8 161 0 80 3 129 0 89 6 125 0 91 3 133 0 113 3 141 0 121 8 165 0 254 8 169 1 36 8 173 1 38 8 177 1 44 8 181 1 46 8 185 1 58] 
#[1 2 241 0 135 8 189 0 224] 
#[1 2 241 0 135 8 193 0 224] 
#[1 2 241 0 135 8 197 0 224] 
#[1 2 241 0 135 8 201 0 224] 
#[0 8 205 0 135] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 8 209 0 201 8 209 1 97 1 121 1 102 1 125 1 111] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 254 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 8 213 0 28 6 109 0 30 6 113 0 33 3 121 0 53 3 129 0 89 8 217 0 244 8 221 0 245 8 225 0 246 8 229 0 247 8 233 0 249 8 237 0 250 8 241 0 251 8 217 1 28 6 213 1 29 8 221 1 31 6 221 1 32 8 225 1 35 3 161 1 36 8 225 1 37 3 169 1 38 8 229 1 40 8 229 1 41 8 233 1 43 3 181 1 44 8 233 1 45 3 189 1 46 8 237 1 48 8 237 1 49 8 241 1 51 7 5 1 52] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 2 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 10 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 14 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 10 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 7 173 0 5 8 245 0 9] 
#[0 3 18 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 3 18 0 3 3 18 0 26 3 18 0 28 3 18 0 29 3 18 0 30 3 18 0 33 3 18 0 41 5 109 0 45 5 113 0 52 3 18 0 53 3 18 0 88 3 18 0 89 3 18 0 91 3 18 0 92 3 18 0 93 3 18 0 94 3 18 0 111 3 18 0 113 3 18 0 121 3 18 0 128 3 18 0 135 8 249 1 15] 
#[0 3 22 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 3 22 0 3 3 22 0 26 3 22 0 28 3 22 0 29 3 22 0 30 3 22 0 33 3 22 0 41 5 109 0 45 5 113 0 52 3 22 0 53 3 22 0 88 3 22 0 89 3 22 0 91 3 22 0 92 3 22 0 93 3 22 0 94 3 22 0 111 3 22 0 113 3 22 0 121 3 22 0 128 3 22 0 135 8 253 1 15] 
#[0 3 26 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 3 26 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 3 30 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 30 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 34 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 3 34 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 3 38 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 38 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 42 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 3 42 0 3 3 42 0 26 3 42 0 28 3 42 0 29 3 42 0 30 3 42 0 33 3 42 0 41 5 109 0 45 5 113 0 52 3 42 0 53 3 42 0 88 3 42 0 89 3 42 0 91 3 42 0 92 3 42 0 93 3 42 0 94 3 42 0 111 3 42 0 113 3 42 0 121 3 42 0 128 3 42 0 135 9 1 1 15] 
#[0 2 250 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 46 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 11 0 12 0 13 0 14 0 15 0 16 0 18 0 20 0 22 0 31 0 32 0 34 0 36 0 37 0 58 0 59 0 60 0 65 0 72 0 75 0 78 0 81 0 87 0 96 0 97 0 106 0 107 0 110 0 125 0 126 0 127 0 128 0 129 0 131 0 132 0 133 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 9 5 0 201 9 5 1 97 1 121 1 102 1 125 1 111] 
#[0 3 50 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 9 9 0 135] 
#[0 3 54 0 2 0 3 0 5 0 6 0 9 0 11 0 14 0 15 0 18 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 40 0 41 0 42 0 49 0 50 0 53 0 58 0 60 0 62 0 75 0 78 0 79 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 110 0 111 0 113 0 119 0 121 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[1 1 1 0 2 0 130 0 3 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 9 13 0 135 2 177 0 136 1 97 0 137 1 121 0 139 1 57 0 143 9 17 0 175 9 21 0 176 1 97 0 200 2 181 0 201 2 185 0 202 2 189 0 203 2 193 0 204 2 197 0 205 2 201 0 206 2 205 0 207 2 181 1 97 1 121 1 102 1 125 1 111] 
#[1 3 58 0 2 3 58 0 19 3 58 0 28 3 58 0 29 3 58 0 30 3 58 0 32 3 58 0 33 3 58 0 41 3 58 0 53 3 58 0 55 9 25 0 78 3 58 0 87 3 58 0 88 3 58 0 89 3 58 0 91 3 58 0 92 3 58 0 93 3 58 0 94 3 58 0 104 3 58 0 111 3 58 0 113 3 58 0 121 3 58 0 128 3 58 0 133 3 58 0 135 9 29 0 211] 
#[0 3 62 0 2 0 28 0 32 0 41 0 53 0 87 0 89 0 91 0 128 0 133] 
#[0 3 62 0 2 0 28 0 32 0 41 0 53 0 87 0 89 0 91 0 128 0 133] 
#[1 9 33 0 2 3 66 0 28 3 66 0 29 3 66 0 30 3 66 0 33 3 66 0 41 3 66 0 53 3 66 0 88 3 66 0 89 3 66 0 91 3 66 0 92 3 66 0 93 3 66 0 94 3 66 0 111 3 66 0 113 3 66 0 121 3 66 0 128 3 66 0 135 9 37 0 222] 
#[0 3 70 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135 1 112] 
#[0 9 41 0 133] 
#[1 9 45 0 32 9 45 0 87 0 182 0 133 9 45 0 182] 
#[1 0 158 0 11 0 158 0 18 9 49 0 32 9 49 0 87 0 158 0 128 0 182 0 133 9 49 0 182] 
#[1 0 158 0 11 0 158 0 18 3 74 0 23 3 74 0 25 3 74 0 28 3 74 0 29 3 74 0 30 3 74 0 33 3 74 0 41 3 74 0 49 3 74 0 53 3 74 0 57 3 74 0 62 3 74 0 66 3 74 0 89 3 74 0 102 3 74 0 113 3 74 0 116 3 74 0 121 0 158 0 128 3 74 0 135 3 74 1 112] 
#[1 0 158 0 11 0 158 0 18 3 74 0 23 3 74 0 25 3 74 0 28 3 74 0 29 3 74 0 30 3 74 0 33 3 74 0 41 3 74 0 49 3 74 0 53 3 74 0 57 3 74 0 62 3 74 0 66 3 74 0 89 3 74 0 102 3 74 0 113 3 74 0 116 3 74 0 121 0 158 0 128 3 74 0 135 3 74 1 112] 
#[0 3 78 0 32 0 87 0 133] 
#[0 3 78 0 32 0 87 0 133] 
#[0 3 78 0 32 0 87 0 133] 
#[0 3 78 0 32 0 87 0 133] 
#[0 3 78 0 32 0 87 0 133] 
#[1 9 33 0 2 3 66 0 28 3 82 0 32 3 66 0 41 3 66 0 53 3 82 0 87 3 66 0 89 3 66 0 91 3 66 0 128 3 82 0 133 9 53 0 222] 
#[0 9 57 0 133] 
#[0 3 86 1 112] 
#[1 9 61 0 135 9 65 0 166 9 69 0 167] 
#[0 3 90 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 3 94 0 29 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 9 73 0 25 8 213 0 28 3 117 0 29 6 109 0 30 6 113 0 33 3 98 0 41 3 98 0 49 3 121 0 53 3 98 0 62 3 129 0 89 7 109 0 102 3 133 0 113 3 137 0 116 3 141 0 121 9 93 0 162 9 93 0 165 9 93 0 168 9 89 1 24 9 93 1 26 9 93 1 27 9 101 1 28 9 105 1 29 9 93 1 30 9 113 1 31 9 117 1 32 9 93 1 34 3 157 1 35 3 161 1 36 3 165 1 37 3 169 1 38 9 93 1 39 9 129 1 40 9 133 1 41 9 93 1 42 3 177 1 43 3 181 1 44 3 185 1 45 3 189 1 46 9 93 1 47 9 145 1 48 9 149 1 49 9 93 1 50 9 157 1 51 9 161 1 52 9 93 1 57 3 205 1 58] 
#[1 3 102 0 41 3 102 0 49 3 221 0 133] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 9 169 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 9 173 0 41 9 177 1 110] 
#[1 1 1 0 2 0 18 0 6 0 18 0 11 0 18 0 14 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 31 0 18 0 34 0 18 0 37 1 9 0 47 1 13 0 53 0 18 0 58 0 18 0 60 0 18 0 75 1 17 0 76 0 18 0 78 1 85 0 85 1 25 0 89 0 18 0 96 0 18 0 97 0 22 0 98 1 29 0 105 0 18 0 110 1 33 0 116 0 18 0 125 0 18 0 126 0 133 0 128 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 9 181 0 178 1 65 0 181 9 181 0 183 9 181 0 184 9 181 0 186 9 181 0 190 1 85 0 192 9 181 0 198 1 93 0 199 1 97 0 200 1 101 0 201 9 181 0 231 9 181 0 232 9 181 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 9 185 0 14] 
#[0 3 106 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 7 157 0 9 2 74 0 133 9 189 0 252] 
#[0 9 193 0 135] 
#[0 3 110 0 23 0 25 0 29 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 9 197 0 133] 
#[1 1 1 0 2 0 18 0 6 0 18 0 11 0 18 0 14 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 32 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 0 18 0 87 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 9 201 0 178 1 65 0 181 9 201 0 183 9 201 0 184 9 201 0 186 9 201 0 190 1 85 0 192 9 201 0 198 1 93 0 199 1 97 0 200 1 101 0 201 9 201 0 231 9 201 0 232 9 201 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 3 114 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[0 3 118 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135] 
#[0 3 122 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[1 9 205 0 73 9 209 0 133] 
#[1 9 213 0 73 9 217 0 133] 
#[0 3 126 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[1 3 130 0 3 10 73 0 19 3 130 0 23 10 73 0 24 3 130 0 25 3 130 0 26 10 73 0 27 3 130 0 28 3 130 0 29 3 130 0 30 10 73 0 32 3 130 0 33 9 237 0 34 10 73 0 39 3 130 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 3 130 0 49 5 113 0 52 3 130 0 53 3 130 0 57 3 130 0 62 10 73 0 63 3 130 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 3 130 0 88 3 130 0 89 3 130 0 91 3 130 0 92 3 130 0 93 3 130 0 94 10 73 0 99 10 73 0 100 3 130 0 102 10 73 0 103 10 73 0 108 10 73 0 109 3 130 0 111 3 130 0 113 3 130 0 116 10 73 0 118 3 130 0 121 10 73 0 122 3 130 0 128 3 130 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16] 
#[1 3 134 0 3 10 73 0 19 3 134 0 23 10 73 0 24 3 134 0 25 3 134 0 26 10 73 0 27 3 134 0 28 3 134 0 29 3 134 0 30 10 73 0 32 3 134 0 33 9 237 0 34 10 73 0 39 3 134 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 3 134 0 49 5 113 0 52 3 134 0 53 3 134 0 57 3 134 0 62 10 73 0 63 3 134 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 3 134 0 88 3 134 0 89 3 134 0 91 3 134 0 92 3 134 0 93 3 134 0 94 10 73 0 99 10 73 0 100 3 134 0 102 10 73 0 103 10 73 0 108 10 73 0 109 3 134 0 111 3 134 0 113 3 134 0 116 10 73 0 118 3 134 0 121 10 73 0 122 3 134 0 128 3 134 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 10 77 0 201 10 77 1 97 1 121 1 102 1 125 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 81 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[0 10 85 0 41] 
#[1 1 1 0 2 1 5 0 17 1 218 0 40 1 218 0 41 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 5 137 0 201 10 89 1 79 5 153 1 80 5 157 1 81 5 161 1 82 5 137 1 97 1 121 1 102 1 125 1 111] 
#[0 3 138 0 40 0 41] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 93 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 10 93 1 90 10 93 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 5 137 0 201 10 97 1 82 5 137 1 97 1 121 1 102 1 125 1 111] 
#[0 3 142 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[0 3 142 0 2 0 17 0 61 0 69 0 70 0 76 0 128 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 101 1 93 10 101 1 94 10 101 1 95 10 101 1 96 10 101 1 97 0 245 1 102 10 101 1 103 0 253 1 111] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 105 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 10 105 1 90 10 105 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 109 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 10 109 1 90 10 109 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[0 3 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 10 113 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 10 117 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 7 157 0 9 2 74 0 37 10 121 0 252] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 10 125 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[0 3 150 0 41 0 50] 
#[0 3 154 0 40 0 41 0 50 0 79] 
#[0 3 158 0 41 0 50] 
#[1 3 162 0 41 3 221 0 133] 
#[0 3 166 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 3 170 0 5 0 158 0 11 3 170 0 15 0 158 0 18 0 158 0 128] 
#[1 3 174 0 3 3 174 0 5 6 5 0 9] 
#[1 2 65 0 2 3 178 0 3 2 169 0 4 3 178 0 5 2 73 0 6 2 169 0 8 3 178 0 9 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 2 65 0 2 2 169 0 4 3 182 0 5 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 3 182 0 129 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 3 186 0 3 0 129 0 133] 
#[1 1 1 0 2 0 18 0 3 0 18 0 6 0 18 0 11 0 18 0 14 1 5 0 17 0 18 0 18 0 22 0 21 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 0 18 0 129 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 10 129 0 178 1 65 0 181 10 129 0 183 10 129 0 184 10 129 0 186 10 129 0 190 1 85 0 192 10 129 0 198 1 93 0 199 1 97 0 200 1 101 0 201 10 129 0 231 10 129 0 232 10 129 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[0 10 133 0 133] 
#[1 3 190 0 3 3 190 0 5 3 190 0 11 3 190 0 14 3 190 0 15 3 190 0 18 10 73 0 19 3 190 0 23 10 73 0 24 3 190 0 25 10 73 0 27 3 190 0 28 3 190 0 29 3 190 0 30 3 190 0 31 1 87 0 32 3 190 0 33 1 91 0 34 3 190 0 37 10 73 0 39 3 190 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 3 190 0 49 5 113 0 52 3 190 0 53 3 190 0 57 3 190 0 58 3 190 0 60 3 190 0 62 10 73 0 63 3 190 0 66 10 73 0 68 10 9 0 71 10 73 0 74 3 190 0 75 3 190 0 78 10 73 0 83 10 73 0 84 10 73 0 86 1 95 0 87 3 190 0 89 3 190 0 96 3 190 0 97 10 73 0 99 10 73 0 100 3 190 0 102 10 73 0 103 10 73 0 108 10 73 0 109 3 190 0 110 3 190 0 113 3 190 0 116 10 73 0 118 3 190 0 121 10 73 0 122 3 190 0 125 3 190 0 126 3 190 0 128 3 190 0 129 3 190 0 133 3 190 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16 3 190 1 112] 
#[1 10 137 0 136 10 141 0 188] 
#[0 3 194 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[0 3 198 0 2 0 3 0 5 0 9 0 11 0 14 0 15 0 18 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 40 0 41 0 42 0 49 0 50 0 53 0 58 0 60 0 62 0 75 0 78 0 79 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 110 0 111 0 113 0 119 0 121 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 10 145 0 198 1 93 0 199 1 97 0 200 6 81 0 201 10 145 0 236 6 81 1 97 1 121 1 102 1 125 1 111] 
#[0 3 202 0 78] 
#[0 3 206 0 3 0 5 0 11 0 14 0 15 0 18 0 31 0 32 0 34 0 37 0 58 0 60 0 75 0 78 0 87 0 96 0 97 0 110 0 125 0 126 0 128 0 129 0 133 1 112] 
#[1 3 210 0 3 3 210 0 5 1 99 0 11 3 210 0 14 3 210 0 15 3 37 0 18 3 210 0 31 3 210 0 32 3 210 0 34 3 210 0 37 3 210 0 58 3 210 0 60 3 210 0 75 3 210 0 78 3 210 0 87 3 210 0 96 3 210 0 97 3 210 0 110 3 210 0 125 3 210 0 126 3 41 0 128 3 210 0 129 3 210 0 133 3 45 0 179 3 210 1 112] 
#[0 10 149 0 135] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 10 153 0 225] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 10 157 0 225] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 10 161 0 225] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 10 165 0 225] 
#[1 10 169 0 88 10 173 0 92] 
#[0 3 214 0 3 0 41] 
#[0 3 218 0 3 0 26 0 41 0 88 0 92 0 93 0 94 0 111] 
#[0 3 222 0 3 0 26 0 41 0 88 0 92 0 93 0 94 0 111] 
#[0 3 222 0 3 0 26 0 41 0 88 0 92 0 93 0 94 0 111] 
#[0 3 222 0 3 0 26 0 41 0 88 0 92 0 93 0 94 0 111] 
#[0 3 222 0 3 0 26 0 41 0 88 0 92 0 93 0 94 0 111] 
#[1 2 241 0 135 10 177 0 224] 
#[0 3 226 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 3 230 0 3 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 3 234 0 3 3 234 0 23 3 234 0 25 3 234 0 26 3 234 0 28 3 234 0 29 3 234 0 30 3 234 0 33 3 234 0 41 5 109 0 45 5 113 0 52 3 234 0 53 3 234 0 66 3 234 0 88 3 234 0 89 3 234 0 91 3 234 0 92 3 234 0 93 3 234 0 94 3 234 0 111 3 234 0 113 3 234 0 116 3 234 0 121 3 234 0 128 3 234 0 135 5 117 1 15] 
#[0 3 238 0 3 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 3 242 0 3 3 242 0 23 3 242 0 25 3 242 0 26 3 242 0 28 3 242 0 29 3 242 0 30 3 242 0 33 3 242 0 41 5 109 0 45 5 113 0 52 3 242 0 53 3 242 0 66 3 242 0 88 3 242 0 89 3 242 0 91 3 242 0 92 3 242 0 93 3 242 0 94 3 242 0 111 3 242 0 113 3 242 0 116 3 242 0 121 3 242 0 128 3 242 0 135 5 125 1 15] 
#[0 3 246 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 2 221 0 2 0 138 0 133 10 181 0 185] 
#[1 10 185 0 2 3 250 0 133 10 189 1 33] 
#[1 2 221 0 2 0 138 0 9 10 193 0 14 0 138 0 133 7 169 0 185] 
#[1 2 221 0 2 10 197 0 14 0 138 0 133 7 181 0 185] 
#[1 3 254 0 9 3 254 0 31 3 254 0 34 3 254 0 58 3 254 0 60 3 254 0 75 3 254 0 96 3 254 0 97 3 254 0 110 3 254 0 125 3 254 0 126 10 201 0 128 3 254 0 133 10 205 1 1] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 10 209 0 129 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 3 121 0 53 8 161 0 80 3 129 0 89 8 169 1 36 8 173 1 38 8 177 1 44 8 181 1 46] 
#[0 4 2 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 2 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 4 6 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 1 1 0 2 0 18 0 6 0 18 0 11 1 5 0 17 0 18 0 18 0 22 0 21 0 18 0 32 1 9 0 47 1 13 0 53 1 17 0 76 1 85 0 85 0 18 0 87 1 25 0 89 0 22 0 98 1 29 0 105 1 33 0 116 0 133 0 128 1 37 0 131 1 41 0 132 0 18 0 133 1 45 0 134 1 49 0 136 1 97 0 137 1 121 0 139 1 57 0 143 10 213 0 178 1 65 0 181 10 213 0 183 10 213 0 184 10 213 0 186 10 213 0 190 1 85 0 192 10 213 0 198 1 93 0 199 1 97 0 200 1 101 0 201 10 213 0 231 10 213 0 232 10 213 0 233 1 101 1 97 1 121 1 102 1 125 1 111] 
#[1 2 110 0 3 2 110 0 19 2 110 0 24 2 110 0 25 2 110 0 26 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 62 2 110 0 63 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 88 2 110 0 89 2 110 0 91 2 110 0 92 2 110 0 93 2 110 0 94 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 111 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 128 2 110 0 135 10 217 1 11] 
#[1 2 110 0 3 2 110 0 19 2 110 0 24 2 110 0 25 2 110 0 26 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 62 2 110 0 63 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 88 2 110 0 89 2 110 0 91 2 110 0 92 2 110 0 93 2 110 0 94 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 111 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 128 2 110 0 135 10 221 1 11] 
#[1 2 110 0 3 2 110 0 19 2 110 0 24 2 110 0 25 2 110 0 26 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 62 2 110 0 63 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 88 2 110 0 89 2 110 0 91 2 110 0 92 2 110 0 93 2 110 0 94 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 111 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 128 2 110 0 135 10 225 1 11] 
#[1 3 25 0 2 4 10 0 3 3 33 0 4 4 10 0 5 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[0 4 14 0 5 0 15] 
#[1 4 18 0 3 4 18 0 5 10 229 0 14] 
#[1 10 233 0 3 10 237 0 5] 
#[0 4 22 0 3 0 5] 
#[0 10 241 0 135] 
#[1 9 33 0 2 11 1 0 19 3 66 0 28 3 66 0 29 3 66 0 30 3 66 0 32 3 66 0 33 3 66 0 41 3 66 0 53 10 249 0 55 3 66 0 87 3 66 0 88 3 66 0 89 3 66 0 91 3 66 0 92 3 66 0 93 3 66 0 94 11 1 0 104 3 66 0 111 3 66 0 113 3 66 0 121 3 66 0 128 3 66 0 133 3 66 0 135 11 1 0 212 11 5 0 222] 
#[1 0 18 0 3 0 18 0 5 0 18 0 6 11 9 0 136 11 13 0 181 11 17 0 223] 
#[1 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 11 21 0 215 4 209 0 225] 
#[0 4 26 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135 1 112] 
#[0 11 25 0 133] 
#[0 11 29 0 133] 
#[1 4 30 0 28 4 30 0 41 4 30 0 53 4 30 0 89 4 30 0 91 11 33 0 128 11 37 0 239] 
#[0 4 34 0 23 0 25 0 29 0 44 0 53 0 66 0 89 0 113 0 116 0 121] 
#[0 11 41 0 14] 
#[1 4 38 0 25 4 38 0 28 4 38 0 29 4 38 0 30 4 38 0 33 4 38 0 41 4 38 0 49 4 38 0 53 4 38 0 57 4 38 0 62 4 38 0 89 4 38 0 102 4 38 0 113 4 38 0 116 4 38 0 121 9 61 0 135 11 45 0 167] 
#[0 4 42 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121 0 135] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 41 0 14 0 49 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 11 49 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 50 0 41 0 49 0 62] 
#[0 4 54 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 58 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 5 109 0 45 5 113 0 52 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 8 249 1 15 11 53 1 53 1 189 1 54] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 62 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 5 109 0 45 5 113 0 52 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 8 253 1 15 11 57 1 53 1 189 1 54] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 66 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 11 61 1 53 1 189 1 54] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 70 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 11 65 1 53 1 189 1 54] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 74 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 0 46 0 23 0 46 0 25 0 46 0 29 5 109 0 45 5 113 0 52 0 46 0 53 0 46 0 66 0 46 0 89 0 46 0 113 0 46 0 116 0 46 0 121 9 1 1 15 11 69 1 53 1 189 1 54] 
#[0 4 46 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[1 4 78 0 41 3 221 0 133] 
#[0 11 73 0 6] 
#[0 4 82 1 112] 
#[1 2 49 0 11 4 86 0 14 3 37 0 18 4 86 0 31 4 86 0 34 4 86 0 37 4 86 0 58 4 86 0 60 4 86 0 75 4 86 0 78 4 86 0 96 4 86 0 97 4 86 0 110 4 86 0 125 4 86 0 126 3 41 0 128 4 86 0 133 3 45 0 179] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 77 0 201 11 77 1 97 1 121 1 102 1 125 1 111] 
#[0 11 81 0 133] 
#[0 4 90 0 3 0 5 0 9 0 129 0 133] 
#[1 4 94 0 3 4 94 0 19 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 28 4 94 0 29 4 94 0 30 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 39 4 94 0 41 4 94 0 43 4 94 0 45 4 94 0 46 4 94 0 48 4 94 0 49 4 94 0 52 4 94 0 53 4 94 0 57 4 94 0 62 4 94 0 63 4 94 0 66 4 94 0 68 4 94 0 71 4 94 0 74 4 94 0 83 4 94 0 84 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 91 4 94 0 92 4 94 0 93 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 102 4 94 0 103 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 113 4 94 0 116 4 94 0 118 4 94 0 121 4 94 0 122 4 94 0 128 4 94 0 135 11 85 1 12] 
#[1 2 49 0 11 0 182 0 14 3 37 0 18 11 89 0 32 11 89 0 87 3 41 0 128 0 182 0 133 3 45 0 179 11 89 0 182] 
#[0 11 93 0 139] 
#[0 4 98 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 11 97 0 139] 
#[0 4 98 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 101 0 201 11 101 1 97 1 121 1 102 1 125 1 111] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 105 0 201 11 105 1 97 1 121 1 102 1 125 1 111] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 102 0 133] 
#[0 4 106 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 4 110 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 4 110 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 11 109 0 133] 
#[1 3 25 0 2 3 33 0 4 4 114 0 5 3 29 0 6 3 33 0 8 4 114 0 9 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 4 118 0 41 3 221 0 133] 
#[0 4 122 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 4 126 0 40 0 41 0 133] 
#[0 4 130 0 40 0 41 0 133] 
#[1 4 134 0 5 4 138 0 9] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 2 169 0 36 11 113 0 37 2 169 0 59 2 169 0 65 2 169 0 72 2 169 0 81 2 169 0 106 2 169 0 107 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[0 4 142 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 4 146 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[0 4 150 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 4 150 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 20 0 22 0 31 0 34 0 36 0 37 0 38 0 40 0 41 0 42 0 49 0 50 0 58 0 59 0 60 0 62 0 65 0 72 0 75 0 78 0 79 0 81 0 96 0 97 0 106 0 107 0 110 0 112 0 114 0 119 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 1 112] 
#[0 11 117 0 37] 
#[1 4 154 0 41 4 154 0 50 3 221 0 133] 
#[1 4 158 0 3 2 49 0 11 11 121 0 14 3 37 0 18 3 41 0 128 4 158 0 129 4 158 0 133 3 45 0 179 11 125 1 21] 
#[1 2 110 0 3 2 110 0 5 2 110 0 11 2 110 0 14 2 110 0 15 2 110 0 18 2 110 0 19 2 110 0 23 2 110 0 24 2 110 0 25 2 110 0 27 2 110 0 28 2 110 0 29 2 110 0 30 2 110 0 31 2 110 0 32 2 110 0 33 2 110 0 34 2 110 0 37 2 110 0 39 2 110 0 41 2 110 0 43 2 110 0 45 2 110 0 46 2 110 0 48 2 110 0 49 2 110 0 52 2 110 0 53 2 110 0 57 2 110 0 58 2 110 0 60 2 110 0 62 2 110 0 63 2 110 0 66 2 110 0 68 2 110 0 71 2 110 0 74 2 110 0 75 2 110 0 78 2 110 0 83 2 110 0 84 2 110 0 86 2 110 0 87 2 110 0 89 2 110 0 96 2 110 0 97 2 110 0 99 2 110 0 100 2 110 0 102 2 110 0 103 2 110 0 108 2 110 0 109 2 110 0 110 2 110 0 113 2 110 0 116 2 110 0 118 2 110 0 121 2 110 0 122 2 110 0 125 2 110 0 126 2 110 0 128 2 110 0 129 2 110 0 133 2 110 0 135 11 129 1 11 2 110 1 112] 
#[0 4 162 0 3 0 5] 
#[1 4 166 0 3 11 133 0 5] 
#[0 4 170 0 5 0 129] 
#[1 7 157 0 9 2 74 0 78 11 137 0 252] 
#[1 4 174 0 3 4 174 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 4 174 0 41 6 117 0 53 4 174 0 88 6 121 0 89 6 125 0 91 4 174 0 92 4 174 0 93 4 174 0 94 4 174 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 4 178 0 3 4 178 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 4 178 0 41 6 117 0 53 4 178 0 88 6 121 0 89 6 125 0 91 4 178 0 92 4 178 0 93 4 178 0 94 4 178 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 4 182 0 3 4 182 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 4 182 0 41 6 117 0 53 4 182 0 88 6 121 0 89 6 125 0 91 4 182 0 92 4 182 0 93 4 182 0 94 4 182 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 4 186 0 3 4 186 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 4 186 0 41 6 117 0 53 4 186 0 88 6 121 0 89 6 125 0 91 4 186 0 92 4 186 0 93 4 186 0 94 4 186 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 11 141 0 225] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 41 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 11 145 0 225] 
#[1 2 221 0 2 0 138 0 9 0 138 0 133 11 149 0 185] 
#[0 11 153 0 133] 
#[0 11 157 0 3] 
#[0 11 161 0 133] 
#[0 11 165 0 135] 
#[0 11 169 0 135] 
#[1 4 157 0 29 4 157 0 82 4 157 0 121 1 54 0 129 1 58 0 135 11 173 1 17 4 149 1 18 4 153 1 19 4 157 1 22] 
#[1 7 157 0 9 2 74 0 31 2 74 0 34 2 74 0 58 2 74 0 60 2 74 0 75 2 74 0 96 2 74 0 97 2 74 0 110 2 74 0 125 2 74 0 126 2 74 0 133 11 177 0 252] 
#[0 4 190 0 28 0 30 0 33 0 53 0 89] 
#[1 2 49 0 11 3 37 0 18 11 181 0 32 11 181 0 87 3 41 0 128 0 182 0 133 3 45 0 179 11 181 0 182] 
#[1 4 194 0 3 10 73 0 19 10 73 0 24 4 194 0 25 4 194 0 26 10 73 0 27 4 194 0 28 4 194 0 29 4 194 0 30 10 73 0 32 4 194 0 33 9 237 0 34 10 73 0 39 4 194 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 4 194 0 49 5 113 0 52 4 194 0 53 4 194 0 62 10 73 0 63 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 4 194 0 88 4 194 0 89 4 194 0 91 4 194 0 92 4 194 0 93 4 194 0 94 10 73 0 99 10 73 0 100 4 194 0 102 10 73 0 103 10 73 0 108 10 73 0 109 4 194 0 111 4 194 0 113 4 194 0 116 10 73 0 118 4 194 0 121 10 73 0 122 4 194 0 128 4 194 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16] 
#[1 4 198 0 3 10 73 0 19 10 73 0 24 4 198 0 25 4 198 0 26 10 73 0 27 4 198 0 28 4 198 0 29 4 198 0 30 10 73 0 32 4 198 0 33 9 237 0 34 10 73 0 39 4 198 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 4 198 0 49 5 113 0 52 4 198 0 53 4 198 0 62 10 73 0 63 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 4 198 0 88 4 198 0 89 4 198 0 91 4 198 0 92 4 198 0 93 4 198 0 94 10 73 0 99 10 73 0 100 4 198 0 102 10 73 0 103 10 73 0 108 10 73 0 109 4 198 0 111 4 198 0 113 4 198 0 116 10 73 0 118 4 198 0 121 10 73 0 122 4 198 0 128 4 198 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16] 
#[1 4 202 0 3 10 73 0 19 10 73 0 24 4 202 0 25 4 202 0 26 10 73 0 27 4 202 0 28 4 202 0 29 4 202 0 30 10 73 0 32 4 202 0 33 9 237 0 34 10 73 0 39 4 202 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 4 202 0 49 5 113 0 52 4 202 0 53 4 202 0 62 10 73 0 63 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 4 202 0 88 4 202 0 89 4 202 0 91 4 202 0 92 4 202 0 93 4 202 0 94 10 73 0 99 10 73 0 100 4 202 0 102 10 73 0 103 10 73 0 108 10 73 0 109 4 202 0 111 4 202 0 113 4 202 0 116 10 73 0 118 4 202 0 121 10 73 0 122 4 202 0 128 4 202 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 185 0 201 11 185 1 97 1 121 1 102 1 125 1 111] 
#[0 4 206 0 133] 
#[1 9 13 0 135 11 189 0 176] 
#[0 4 210 0 32 0 87 0 133] 
#[0 4 214 0 2 0 19 0 28 0 29 0 30 0 32 0 33 0 41 0 53 0 55 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 104 0 111 0 113 0 121 0 128 0 133 0 135] 
#[0 11 193 0 51] 
#[0 4 214 0 2 0 19 0 28 0 29 0 30 0 32 0 33 0 41 0 53 0 55 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 104 0 111 0 113 0 121 0 128 0 133 0 135] 
#[0 4 218 0 2 0 19 0 28 0 29 0 30 0 32 0 33 0 41 0 53 0 55 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 104 0 111 0 113 0 121 0 128 0 133 0 135] 
#[1 1 90 0 28 1 90 0 29 1 90 0 30 4 222 0 32 1 90 0 33 1 90 0 41 1 90 0 53 4 222 0 87 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 4 222 0 133 1 90 0 135 11 197 0 215 4 209 0 225] 
#[0 0 150 0 3 0 5 0 6] 
#[1 4 226 0 3 4 226 0 5 3 9 0 6] 
#[1 11 201 0 3 11 205 0 5] 
#[1 1 254 0 41 1 254 0 88 1 254 0 92 1 254 0 93 1 254 0 94 1 254 0 111 11 209 0 216] 
#[0 4 230 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135 1 112] 
#[0 4 230 0 23 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 89 0 102 0 113 0 116 0 121 0 135 1 112] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 213 0 201 11 213 1 97 1 121 1 102 1 125 1 111] 
#[1 4 234 0 28 4 234 0 41 4 234 0 53 4 234 0 89 4 234 0 91 11 217 0 240] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 11 221 0 201 11 221 1 97 1 121 1 102 1 125 1 111] 
#[0 4 238 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121 0 135] 
#[1 4 242 0 41 4 242 0 49 4 242 0 62 3 221 0 133] 
#[0 4 246 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 250 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 4 254 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 5 2 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 5 6 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 62 0 89 0 102 0 113 0 116 0 121] 
#[0 5 10 1 112] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 1 103 0 32 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 11 225 0 87 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 0 182 0 133 11 225 0 182 3 33 1 107] 
#[1 4 94 0 3 4 94 0 19 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 28 4 94 0 29 4 94 0 30 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 39 4 94 0 41 4 94 0 43 4 94 0 45 4 94 0 46 4 94 0 48 4 94 0 49 4 94 0 52 4 94 0 53 4 94 0 57 4 94 0 62 4 94 0 63 4 94 0 66 4 94 0 68 4 94 0 71 4 94 0 74 4 94 0 83 4 94 0 84 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 91 4 94 0 92 4 94 0 93 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 102 4 94 0 103 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 113 4 94 0 116 4 94 0 118 4 94 0 121 4 94 0 122 4 94 0 128 4 94 0 135 11 229 1 12] 
#[1 5 14 0 3 10 73 0 19 5 14 0 23 10 73 0 24 5 14 0 25 5 14 0 26 10 73 0 27 5 14 0 28 5 14 0 29 5 14 0 30 10 73 0 32 5 14 0 33 9 237 0 34 10 73 0 39 5 14 0 41 10 73 0 43 5 14 0 45 10 73 0 46 10 73 0 48 5 14 0 49 5 14 0 52 5 14 0 53 5 14 0 57 5 14 0 62 10 73 0 63 5 14 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 5 14 0 88 5 14 0 89 5 14 0 91 5 14 0 92 5 14 0 93 5 14 0 94 10 73 0 99 10 73 0 100 5 14 0 102 10 73 0 103 10 73 0 108 10 73 0 109 5 14 0 111 5 14 0 113 5 14 0 116 10 73 0 118 5 14 0 121 10 73 0 122 5 14 0 128 5 14 0 135 11 233 1 14 10 73 1 16] 
#[1 11 121 0 14 4 158 0 133 11 237 1 21] 
#[0 11 241 0 133] 
#[0 11 245 0 133] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 11 249 0 133 3 33 1 107] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 11 253 0 133 3 33 1 107] 
#[0 5 18 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 42 0 14 0 49 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 14 0 62 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 14 0 119 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 12 1 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 12 1 1 90 12 1 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111 0 14 1 112] 
#[1 0 69 0 2 0 73 0 17 0 10 0 23 0 77 0 25 0 81 0 26 0 14 0 40 0 14 0 41 0 14 0 50 0 85 0 51 0 89 0 54 0 93 0 56 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 14 0 79 0 113 0 95 0 117 0 101 0 121 0 115 0 125 0 123 0 129 0 124 0 133 0 128 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 245 0 139 0 157 0 143 0 161 0 200 12 5 1 61 1 209 1 62 0 169 1 63 0 173 1 64 0 177 1 65 0 181 1 66 0 185 1 67 0 189 1 69 0 193 1 75 0 197 1 84 0 201 1 86 0 205 1 87 0 209 1 89 1 209 1 90 1 209 1 91 0 221 1 92 0 225 1 93 0 225 1 94 0 225 1 95 0 225 1 96 0 225 1 97 0 245 1 102 0 225 1 103 0 253 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 12 9 0 201 12 9 1 97 1 121 1 102 1 125 1 111] 
#[0 5 22 0 3 0 129 0 133] 
#[1 5 26 0 3 5 26 0 5 5 26 0 11 5 26 0 14 5 26 0 15 5 26 0 18 10 73 0 19 5 26 0 23 10 73 0 24 5 26 0 25 10 73 0 27 5 26 0 28 5 26 0 29 5 26 0 30 5 26 0 31 1 107 0 32 5 26 0 33 1 111 0 34 5 26 0 37 10 73 0 39 5 26 0 41 10 73 0 43 5 109 0 45 10 73 0 46 10 73 0 48 5 26 0 49 5 113 0 52 5 26 0 53 5 26 0 57 5 26 0 58 5 26 0 60 5 26 0 62 10 73 0 63 5 26 0 66 10 73 0 68 10 9 0 71 10 73 0 74 5 26 0 75 5 26 0 78 10 73 0 83 10 73 0 84 10 73 0 86 1 115 0 87 5 26 0 89 5 26 0 96 5 26 0 97 10 73 0 99 10 73 0 100 5 26 0 102 10 73 0 103 10 73 0 108 10 73 0 109 5 26 0 110 5 26 0 113 5 26 0 116 10 73 0 118 5 26 0 121 10 73 0 122 5 26 0 125 5 26 0 126 5 26 0 128 5 26 0 129 5 26 0 133 5 26 0 135 10 61 1 13 10 61 1 14 10 61 1 15 10 73 1 16 5 26 1 112] 
#[0 12 13 0 136] 
#[0 12 17 0 78] 
#[1 5 30 0 3 5 30 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 5 30 0 41 6 117 0 53 5 30 0 88 6 121 0 89 6 125 0 91 5 30 0 92 5 30 0 93 5 30 0 94 5 30 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 5 34 0 3 5 34 0 26 6 105 0 28 3 117 0 29 6 109 0 30 6 113 0 33 5 34 0 41 6 117 0 53 5 34 0 88 6 121 0 89 6 125 0 91 5 34 0 92 5 34 0 93 5 34 0 94 5 34 0 111 3 133 0 113 3 141 0 121 6 129 0 128 5 69 0 135 6 137 0 162 6 137 0 226 6 137 0 227 6 145 0 228 6 137 0 229 6 137 0 230 6 137 0 242 6 137 0 243 6 137 0 244 6 137 0 245 6 137 0 246 6 137 0 247 6 137 0 249 6 137 0 250 6 137 0 251 6 137 0 253 6 197 0 254 6 137 0 255 6 205 1 20 6 137 1 28 6 213 1 29 6 137 1 31 6 221 1 32 6 137 1 35 3 161 1 36 6 137 1 37 3 169 1 38 6 137 1 40 6 137 1 41 6 137 1 43 3 181 1 44 6 137 1 45 3 189 1 46 6 137 1 48 6 137 1 49 6 137 1 51 7 5 1 52 6 137 1 57 3 205 1 58] 
#[1 7 157 0 9 2 74 0 133 12 21 0 252] 
#[1 4 94 0 3 4 94 0 19 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 28 4 94 0 29 4 94 0 30 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 39 4 94 0 41 4 94 0 43 4 94 0 45 4 94 0 46 4 94 0 48 4 94 0 52 4 94 0 53 4 94 0 63 4 94 0 66 4 94 0 68 4 94 0 71 4 94 0 74 4 94 0 83 4 94 0 84 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 91 4 94 0 92 4 94 0 93 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 103 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 113 4 94 0 116 4 94 0 118 4 94 0 121 4 94 0 122 4 94 0 128 4 94 0 135 12 25 1 12] 
#[0 5 38 0 133] 
#[1 4 94 0 3 4 94 0 19 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 28 4 94 0 29 4 94 0 30 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 39 4 94 0 41 4 94 0 43 4 94 0 45 4 94 0 46 4 94 0 48 4 94 0 52 4 94 0 53 4 94 0 63 4 94 0 66 4 94 0 68 4 94 0 71 4 94 0 74 4 94 0 83 4 94 0 84 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 91 4 94 0 92 4 94 0 93 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 103 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 113 4 94 0 116 4 94 0 118 4 94 0 121 4 94 0 122 4 94 0 128 4 94 0 135 12 29 1 12] 
#[0 12 33 0 133] 
#[0 12 37 0 133] 
#[0 12 41 0 129] 
#[1 5 42 0 31 5 42 0 34 5 42 0 58 5 42 0 60 5 42 0 75 5 42 0 96 5 42 0 97 5 42 0 110 5 42 0 125 5 42 0 126 5 42 0 133 12 45 1 0] 
#[0 12 49 0 133] 
#[1 3 25 0 2 5 46 0 3 3 33 0 4 5 46 0 5 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[0 5 50 0 3 0 5] 
#[1 2 241 0 135 12 53 0 224] 
#[1 1 254 0 41 1 254 0 88 1 254 0 92 1 254 0 93 1 254 0 94 1 254 0 111 12 57 0 216] 
#[0 5 54 0 28 0 29 0 30 0 32 0 33 0 41 0 53 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 133 0 135] 
#[1 0 18 0 3 0 18 0 5 0 18 0 6 11 9 0 136 12 61 0 181] 
#[1 12 65 0 41 8 117 0 88 8 121 0 92 8 125 0 93 8 129 0 94 8 133 0 111 8 141 0 217 8 141 0 218 8 141 0 219 8 141 0 220 8 141 0 221] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 12 69 0 129 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 12 73 0 28 12 77 0 41 3 121 0 53 3 129 0 89 6 125 0 91 12 81 0 241 12 81 0 242 12 81 0 243 12 81 0 246 12 81 0 247 12 81 0 249 12 81 0 250 12 81 0 251 12 81 0 253 6 197 0 254 12 81 0 255 12 81 1 35 3 161 1 36 12 81 1 37 3 169 1 38 12 81 1 40 12 81 1 41 12 81 1 43 3 181 1 44 12 81 1 45 3 189 1 46 12 81 1 48 12 81 1 49 12 81 1 51 7 5 1 52] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 12 97 0 32 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 5 58 0 133 12 97 0 214 3 33 1 107] 
#[1 12 101 0 32 5 58 0 133 12 101 0 214] 
#[1 5 62 0 3 10 73 0 19 5 62 0 23 10 73 0 24 5 62 0 25 5 62 0 26 10 73 0 27 5 62 0 28 5 62 0 29 5 62 0 30 10 73 0 32 5 62 0 33 9 237 0 34 10 73 0 39 5 62 0 41 10 73 0 43 5 62 0 45 10 73 0 46 10 73 0 48 5 62 0 49 5 62 0 52 5 62 0 53 5 62 0 57 5 62 0 62 10 73 0 63 5 62 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 5 62 0 88 5 62 0 89 5 62 0 91 5 62 0 92 5 62 0 93 5 62 0 94 10 73 0 99 10 73 0 100 5 62 0 102 10 73 0 103 10 73 0 108 10 73 0 109 5 62 0 111 5 62 0 113 5 62 0 116 10 73 0 118 5 62 0 121 10 73 0 122 5 62 0 128 5 62 0 135 11 233 1 14 10 73 1 16] 
#[0 5 66 0 3 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 62 0 63 0 66 0 68 0 71 0 74 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 99 0 100 0 102 0 103 0 108 0 109 0 111 0 113 0 116 0 118 0 121 0 122 0 128 0 135] 
#[0 12 105 0 133] 
#[0 5 70 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 5 70 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 5 74 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 5 74 0 3 0 5 0 11 0 14 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 37 0 39 0 41 0 43 0 45 0 46 0 48 0 49 0 52 0 53 0 57 0 58 0 60 0 62 0 63 0 66 0 68 0 71 0 74 0 75 0 78 0 83 0 84 0 86 0 87 0 88 0 89 0 91 0 92 0 93 0 94 0 96 0 97 0 99 0 100 0 102 0 103 0 108 0 109 0 110 0 111 0 113 0 116 0 118 0 121 0 122 0 125 0 126 0 128 0 129 0 133 0 135 1 112] 
#[0 5 78 0 40 0 41 0 42 0 49 0 50 0 62 0 79 0 119 0 133 1 112] 
#[1 5 82 0 40 5 82 0 41 5 82 0 50 5 82 0 79 3 221 0 133] 
#[1 3 25 0 2 5 86 0 3 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 5 86 0 129 3 33 0 131 3 33 0 132 5 86 0 133 3 33 1 107] 
#[0 5 90 0 3 0 5] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 12 109 0 194 12 113 0 195 12 117 0 196 12 121 0 197 1 97 0 200 12 125 0 201 12 125 1 97 1 121 1 102 1 125 1 111] 
#[0 12 129 0 133] 
#[1 5 94 0 3 10 73 0 19 5 94 0 23 10 73 0 24 5 94 0 25 5 94 0 26 10 73 0 27 5 94 0 28 5 94 0 29 5 94 0 30 10 73 0 32 5 94 0 33 9 237 0 34 10 73 0 39 5 94 0 41 10 73 0 43 5 94 0 45 10 73 0 46 10 73 0 48 5 94 0 52 5 94 0 53 10 73 0 63 5 94 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 5 94 0 88 5 94 0 89 5 94 0 91 5 94 0 92 5 94 0 93 5 94 0 94 10 73 0 99 10 73 0 100 10 73 0 103 10 73 0 108 10 73 0 109 5 94 0 111 5 94 0 113 5 94 0 116 10 73 0 118 5 94 0 121 10 73 0 122 5 94 0 128 5 94 0 135 11 233 1 14 10 73 1 16] 
#[1 5 98 0 3 10 73 0 19 5 98 0 23 10 73 0 24 5 98 0 25 5 98 0 26 10 73 0 27 5 98 0 28 5 98 0 29 5 98 0 30 10 73 0 32 5 98 0 33 9 237 0 34 10 73 0 39 5 98 0 41 10 73 0 43 5 98 0 45 10 73 0 46 10 73 0 48 5 98 0 52 5 98 0 53 10 73 0 63 5 98 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 5 98 0 88 5 98 0 89 5 98 0 91 5 98 0 92 5 98 0 93 5 98 0 94 10 73 0 99 10 73 0 100 10 73 0 103 10 73 0 108 10 73 0 109 5 98 0 111 5 98 0 113 5 98 0 116 10 73 0 118 5 98 0 121 10 73 0 122 5 98 0 128 5 98 0 135 11 233 1 14 10 73 1 16] 
#[0 5 102 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 5 106 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[0 5 110 0 9 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[1 12 133 0 31 12 137 0 34 12 141 0 58 12 145 0 60 12 149 0 75 12 153 0 96 12 157 0 97 12 161 0 110 12 165 0 125 12 169 0 126 12 173 0 133 12 177 1 2 12 181 1 3 12 185 1 4 12 189 1 5 12 193 1 6 12 197 1 7 12 201 1 9] 
#[0 5 114 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 9 33 0 2 3 66 0 28 3 66 0 29 3 66 0 30 3 66 0 32 3 66 0 33 3 66 0 41 3 66 0 53 3 66 0 87 3 66 0 88 3 66 0 89 3 66 0 91 3 66 0 92 3 66 0 93 3 66 0 94 3 66 0 111 3 66 0 113 3 66 0 121 3 66 0 128 3 66 0 133 3 66 0 135 12 205 0 222] 
#[1 12 209 0 41 8 117 0 88 8 121 0 92 8 125 0 93 8 129 0 94 8 133 0 111 8 141 0 217 8 141 0 218 8 141 0 219 8 141 0 220 8 141 0 221] 
#[1 5 118 0 3 5 118 0 5 3 9 0 6] 
#[0 5 122 0 32 0 87 0 133] 
#[0 5 126 0 28 0 41 0 53 0 89 0 91] 
#[1 3 121 0 53 8 161 0 80 3 129 0 89 6 125 0 91 8 165 0 254 8 169 1 36 8 173 1 38 8 177 1 44 8 181 1 46] 
#[0 5 130 0 32 0 87 0 133] 
#[0 5 134 0 28 0 41 0 53 0 89 0 91] 
#[0 5 138 0 28 0 41 0 53 0 89 0 91] 
#[0 5 138 0 28 0 41 0 53 0 89 0 91] 
#[0 5 142 0 133] 
#[0 12 213 0 133] 
#[0 12 217 0 133] 
#[0 5 146 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 1 38 0 3 1 38 0 41 12 221 0 133 12 225 1 76] 
#[0 5 150 0 3 0 41 0 133] 
#[1 12 229 0 5 12 233 0 9] 
#[0 5 154 0 5 0 9] 
#[1 3 25 0 2 3 33 0 4 5 158 0 5 3 29 0 6 3 33 0 8 5 158 0 9 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 3 33 0 36 3 33 0 59 3 33 0 65 3 33 0 72 3 33 0 81 3 33 0 106 3 33 0 107 3 33 0 127 3 33 0 131 3 33 0 132 3 33 1 107] 
#[1 4 94 0 3 4 94 0 19 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 28 4 94 0 29 4 94 0 30 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 39 4 94 0 41 4 94 0 43 4 94 0 45 4 94 0 46 4 94 0 48 4 94 0 52 4 94 0 53 4 94 0 63 4 94 0 66 4 94 0 68 4 94 0 71 4 94 0 74 4 94 0 83 4 94 0 84 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 91 4 94 0 92 4 94 0 93 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 103 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 113 4 94 0 116 4 94 0 118 4 94 0 121 4 94 0 122 4 94 0 128 4 94 0 135 12 237 1 12] 
#[1 1 1 0 2 1 5 0 17 5 162 0 31 5 162 0 34 5 162 0 58 5 162 0 60 5 162 0 75 1 17 0 76 5 162 0 96 5 162 0 97 5 162 0 110 5 162 0 125 5 162 0 126 0 133 0 128 1 37 0 131 1 41 0 132 5 162 0 133 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 12 241 0 201 12 241 1 97 1 121 1 102 1 125 1 111] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 12 245 0 201 12 245 1 97 1 121 1 102 1 125 1 111] 
#[1 12 249 0 135 12 253 1 8] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 13 1 0 201 13 1 1 97 1 121 1 102 1 125 1 111] 
#[0 5 166 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 13 5 1 93 13 5 1 94 13 5 1 95 13 5 1 96 13 5 1 97 0 245 1 102 13 5 1 103 0 253 1 111] 
#[0 13 9 0 34] 
#[0 13 13 0 135] 
#[1 0 69 0 2 0 73 0 17 0 97 0 61 0 101 0 69 0 105 0 70 0 109 0 76 0 133 0 128 0 137 0 131 0 141 0 132 1 193 0 135 0 161 0 137 0 245 0 139 0 157 0 143 0 161 0 200 13 17 1 93 13 17 1 94 13 17 1 95 13 17 1 96 13 17 1 97 0 245 1 102 13 17 1 103 0 253 1 111] 
#[0 13 21 0 34] 
#[1 5 170 0 3 5 170 0 26 5 170 0 28 5 170 0 29 5 170 0 30 13 25 0 31 5 170 0 33 5 170 0 41 5 170 0 53 5 170 0 88 5 170 0 89 5 170 0 91 5 170 0 92 5 170 0 93 5 170 0 94 5 170 0 111 5 170 0 113 5 170 0 121 5 170 0 128 5 170 0 135 13 29 1 10] 
#[0 5 174 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 178 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 182 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 186 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 190 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 194 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 5 198 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[1 1 90 0 28 1 90 0 29 1 90 0 30 5 202 0 32 1 90 0 33 1 90 0 41 1 90 0 53 5 202 0 87 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 5 202 0 133 1 90 0 135 13 33 0 215 4 209 0 225] 
#[0 5 206 0 32 0 87 0 133] 
#[0 5 210 0 25 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 89 0 102 0 113 0 116 0 121 0 135] 
#[0 5 214 0 3 0 23 0 25 0 26 0 28 0 29 0 30 0 33 0 41 0 49 0 53 0 57 0 62 0 66 0 88 0 89 0 91 0 92 0 93 0 94 0 102 0 111 0 113 0 116 0 121 0 128 0 135] 
#[1 1 1 0 2 1 218 0 3 1 5 0 17 1 218 0 41 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 13 37 0 195 12 117 0 196 12 121 0 197 1 97 0 200 12 125 0 201 12 125 1 97 1 121 1 102 1 125 1 111] 
#[0 5 218 0 3 0 41] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 13 41 0 197 1 97 0 200 12 125 0 201 12 125 1 97 1 121 1 102 1 125 1 111] 
#[0 13 45 0 2] 
#[1 5 222 0 3 10 73 0 19 5 222 0 23 10 73 0 24 5 222 0 25 5 222 0 26 10 73 0 27 5 222 0 28 5 222 0 29 5 222 0 30 10 73 0 32 5 222 0 33 9 237 0 34 10 73 0 39 5 222 0 41 10 73 0 43 5 222 0 45 10 73 0 46 10 73 0 48 5 222 0 52 5 222 0 53 10 73 0 63 5 222 0 66 10 73 0 68 10 9 0 71 10 73 0 74 10 73 0 83 10 73 0 84 10 73 0 86 10 73 0 87 5 222 0 88 5 222 0 89 5 222 0 91 5 222 0 92 5 222 0 93 5 222 0 94 10 73 0 99 10 73 0 100 10 73 0 103 10 73 0 108 10 73 0 109 5 222 0 111 5 222 0 113 5 222 0 116 10 73 0 118 5 222 0 121 10 73 0 122 5 222 0 128 5 222 0 135 11 233 1 14 10 73 1 16] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 5 226 0 31 5 226 0 34 3 33 0 36 5 226 0 58 3 33 0 59 5 226 0 60 3 33 0 65 3 33 0 72 5 226 0 75 3 33 0 81 5 226 0 96 5 226 0 97 3 33 0 106 3 33 0 107 5 226 0 110 5 226 0 125 5 226 0 126 3 33 0 127 3 33 0 131 3 33 0 132 5 226 0 133 3 33 1 107] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 5 230 0 31 5 230 0 34 3 33 0 36 5 230 0 58 3 33 0 59 5 230 0 60 3 33 0 65 3 33 0 72 5 230 0 75 3 33 0 81 5 230 0 96 5 230 0 97 3 33 0 106 3 33 0 107 5 230 0 110 5 230 0 125 5 230 0 126 3 33 0 127 3 33 0 131 3 33 0 132 5 230 0 133 3 33 1 107] 
#[0 5 234 0 5 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[1 13 49 0 5 5 238 0 31 5 238 0 34 5 238 0 58 5 238 0 60 5 238 0 75 5 238 0 96 5 238 0 97 5 238 0 110 5 238 0 125 5 238 0 126 5 238 0 133] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 5 242 0 31 5 242 0 34 3 33 0 36 5 242 0 58 3 33 0 59 5 242 0 60 3 33 0 65 3 33 0 72 5 242 0 75 3 33 0 81 5 242 0 96 5 242 0 97 3 33 0 106 3 33 0 107 5 242 0 110 5 242 0 125 5 242 0 126 3 33 0 127 3 33 0 131 3 33 0 132 5 242 0 133 3 33 1 107] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 5 246 0 31 5 246 0 34 2 169 0 36 5 246 0 58 2 169 0 59 5 246 0 60 2 169 0 65 2 169 0 72 5 246 0 75 2 169 0 81 5 246 0 96 5 246 0 97 2 169 0 106 2 169 0 107 5 246 0 110 5 246 0 125 5 246 0 126 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 5 246 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 13 53 0 201 13 53 1 97 1 121 1 102 1 125 1 111] 
#[0 5 250 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[1 2 65 0 2 2 169 0 4 2 73 0 6 2 169 0 8 2 81 0 10 2 169 0 11 2 169 0 12 2 169 0 13 2 169 0 14 2 169 0 15 2 169 0 16 2 169 0 20 2 169 0 22 5 254 0 31 5 254 0 34 2 169 0 36 5 254 0 58 2 169 0 59 5 254 0 60 2 169 0 65 2 169 0 72 5 254 0 75 2 169 0 81 5 254 0 96 5 254 0 97 2 169 0 106 2 169 0 107 5 254 0 110 5 254 0 125 5 254 0 126 2 169 0 127 2 149 0 128 2 169 0 131 2 169 0 132 5 254 0 133 2 161 0 134 2 165 1 100 2 169 1 106 2 169 1 107] 
#[1 1 1 0 2 1 5 0 17 1 17 0 76 0 133 0 128 1 37 0 131 1 41 0 132 2 209 0 136 1 97 0 137 1 121 0 139 1 57 0 143 1 97 0 200 13 57 0 201 13 57 1 97 1 121 1 102 1 125 1 111] 
#[0 13 61 0 133] 
#[0 6 2 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 1 254 0 41 1 254 0 88 1 254 0 92 1 254 0 93 1 254 0 94 1 254 0 111 13 65 0 216] 
#[0 6 6 0 3 0 41 0 133] 
#[0 6 10 0 5 0 9] 
#[1 1 90 0 3 1 90 0 26 1 90 0 28 1 90 0 29 1 90 0 30 1 90 0 33 1 90 0 53 1 90 0 88 1 90 0 89 1 90 0 91 1 90 0 92 1 90 0 93 1 90 0 94 1 90 0 111 1 90 0 113 1 90 0 121 1 90 0 128 1 90 0 135 13 69 0 191 4 205 0 215 4 209 0 225] 
#[0 13 73 0 135] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 6 14 0 31 6 14 0 34 3 33 0 36 6 14 0 58 3 33 0 59 6 14 0 60 3 33 0 65 3 33 0 72 6 14 0 75 3 33 0 81 6 14 0 96 6 14 0 97 3 33 0 106 3 33 0 107 6 14 0 110 6 14 0 125 6 14 0 126 3 33 0 127 3 33 0 131 3 33 0 132 6 14 0 133 3 33 1 107] 
#[1 3 25 0 2 3 33 0 4 3 29 0 6 3 33 0 8 3 33 0 11 3 33 0 12 3 33 0 13 3 33 0 15 3 33 0 16 3 33 0 20 3 33 0 22 6 18 0 31 6 18 0 34 3 33 0 36 6 18 0 58 3 33 0 59 6 18 0 60 3 33 0 65 3 33 0 72 6 18 0 75 3 33 0 81 6 18 0 96 6 18 0 97 3 33 0 106 3 33 0 107 6 18 0 110 6 18 0 125 6 18 0 126 3 33 0 127 3 33 0 131 3 33 0 132 6 18 0 133 3 33 1 107] 
#[0 6 22 0 3 0 26 0 28 0 29 0 30 0 33 0 41 0 53 0 88 0 89 0 91 0 92 0 93 0 94 0 111 0 113 0 121 0 128 0 135] 
#[1 13 77 0 41 8 117 0 88 8 121 0 92 8 125 0 93 8 129 0 94 8 133 0 111 8 141 0 217 8 141 0 218 8 141 0 219 8 141 0 220 8 141 0 221] 
#[0 13 81 0 3] 
#[0 6 26 0 5 0 31 0 34 0 58 0 60 0 75 0 96 0 97 0 110 0 125 0 126 0 133] 
#[0 6 30 0 32 0 87 0 133] 
#[0 6 34 0 3 0 41 0 133]
	).
]
