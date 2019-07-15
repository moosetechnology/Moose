Class {
	#name : #DelphiProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAbsoluteType: anAbsoluteType [
	^ self visitType: anAbsoluteType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAddressExpression: anAddressExpression [
	^ self visitExpression: anAddressExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAnonymousFunctionType: anAnonymousFunctionType [
	^ self visitAnonymousMethodType: anAnonymousFunctionType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAnonymousMethodType: anAnonymousMethodType [
	^ self visitType: anAnonymousMethodType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAnonymousProcedureType: anAnonymousProcedureType [
	^ self visitAnonymousMethodType: anAnonymousProcedureType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitArgument: anArgument [
	^ self visitProgram: anArgument
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitArrayExpression: anArrayExpression [
	^ self visitExpression: anArrayExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitArrayType: anArrayType [
	^ self visitType: anArrayType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAsmBlock: anAsmBlock [
	^ self visitStatement: anAsmBlock
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitAssignmentExpression: anAssignmentExpression [
	^ self visitExpression: anAssignmentExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitCaseLabel: aCaseLabel [
	^ self visitProgram: aCaseLabel
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitCaseOption: aCaseOption [
	^ self visitProgram: aCaseOption
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitCaseStatement: aCaseStatement [
	^ self visitMultiStatement: aCaseStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassFunctionDefinition: aClassFunctionDefinition [
	^ self visitFunctionDefinition: aClassFunctionDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassFunctionHeader: aClassFunctionHeader [
	^ self visitFunctionHeader: aClassFunctionHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassHelperType: aClassHelperType [
	^ self visitClassType: aClassHelperType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassOperatorDefinition: aClassOperatorDefinition [
	^ self visitFunctionDefinition: aClassOperatorDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassOperatorHeader: aClassOperatorHeader [
	^ self visitMethodHeader: aClassOperatorHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassOrInterfaceType: aClassOrInterfaceType [
	^ self visitType: aClassOrInterfaceType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassProcedureDefinition: aClassProcedureDefinition [
	^ self visitProcedureDefinition: aClassProcedureDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassProcedureHeader: aClassProcedureHeader [
	^ self visitProcedureHeader: aClassProcedureHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassPropertyHeader: aClassPropertyHeader [
	^ self visitPropertyHeader: aClassPropertyHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassSection: aClassSection [
	^ self visitProgram: aClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassType: aClassType [
	^ self visitClassOrInterfaceType: aClassType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitClassVars: aClassVars [
	^ self visitVars: aClassVars
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitCodeSection: aCodeSection [
	^ self visitProgram: aCodeSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstantArrayExpression: aConstantArrayExpression [
	^ self visitExpression: aConstantArrayExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstantDefinition: aConstantDefinition [
	^ self visitProgram: aConstantDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstantList: aConstantList [
	^ self visitProgram: aConstantList
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstantRecordField: aConstantRecordField [
	^ self visitProgram: aConstantRecordField
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstructorDefinition: aConstructorDefinition [
	^ self visitMethodDefinition: aConstructorDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitConstructorHeader: aConstructorHeader [
	^ self visitMethodHeader: aConstructorHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitDefinedTypeList: aDefinedTypeList [
	^ self visitProgram: aDefinedTypeList
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitDestructorDefinition: aDestructorDefinition [
	^ self visitMethodDefinition: aDestructorDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitDestructorHeader: aDestructorHeader [
	^ self visitMethodHeader: aDestructorHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitEmptyStatement: anEmptyStatement [
	^ self visitStatement: anEmptyStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitEnumName: anEnumName [
	^ self visitProgram: anEnumName
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitEnumType: anEnumType [
	^ self visitType: anEnumType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitExcept: anExcept [
	^ self visitProgram: anExcept
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitExceptElse: anExceptElse [
	^ self visitProgram: anExceptElse
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitExpression: anExpression [
	^ self visitStatement: anExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitExpressionSetType: anExpressionSetType [
	^ self visitSetType: anExpressionSetType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitExternalMethodModifier: anExternalMethodModifier [
	^ self visitMethodModifier: anExternalMethodModifier
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFileType: aFileType [
	^ self visitType: aFileType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFinalizationSection: aFinalizationSection [
	^ self visitCodeSection: aFinalizationSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFinally: aFinally [
	^ self visitProgram: aFinally
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitForInStatement: aForInStatement [
	^ self visitStatement: aForInStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitForStatement: aForStatement [
	^ self visitStatement: aForStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFormattedMethodArgument: aFormattedMethodArgument [
	^ self visitProgram: aFormattedMethodArgument
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFunctionDefinition: aFunctionDefinition [
	^ self visitMethodDefinition: aFunctionDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitFunctionHeader: aFunctionHeader [
	^ self visitMethodHeader: aFunctionHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitGotoStatement: aGotoStatement [
	^ self visitStatement: aGotoStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitGuid: aGuid [
	^ self visitProgram: aGuid
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitStatement: anIfStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitImplementationCode: anImplementationCode [
	^ self visitCodeSection: anImplementationCode
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitImplementationSection: anImplementationSection [
	^ self visitProgram: anImplementationSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitImplicitClassSection: anImplicitClassSection [
	^ self visitClassSection: anImplicitClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInheritedFunctionCall: anInheritedFunctionCall [
	^ self visitExpression: anInheritedFunctionCall
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInitializationSection: anInitializationSection [
	^ self visitCodeSection: anInitializationSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInstantiatedGenericType: anInstantiatedGenericType [
	^ self visitType: anInstantiatedGenericType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInstantiatedGenericVariableExpression: anInstantiatedGenericVariableExpression [
	^ self
		visitVariableExpression: anInstantiatedGenericVariableExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInterfaceFunctionAssignment: anInterfaceFunctionAssignment [
	^ self visitProgram: anInterfaceFunctionAssignment
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInterfaceProcedureAssignment: anInterfaceProcedureAssignment [
	^ self visitProgram: anInterfaceProcedureAssignment
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInterfaceSection: anInterfaceSection [
	^ self visitProgram: anInterfaceSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitInterfaceType: anInterfaceType [
	^ self visitClassOrInterfaceType: anInterfaceType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitLabelVariable: aLabelVariable [
	^ self visitProgram: aLabelVariable
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitLabeledStatement: aLabeledStatement [
	^ self visitStatement: aLabeledStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitLibraryExport: aLibraryExport [
	^ self visitProgram: aLibraryExport
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitLibraryFile: aLibraryFile [
	^ self visitProgram: aLibraryFile
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitLiteralExpression: aLiteralExpression [
	^ self visitExpression: aLiteralExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMainMethodDefinition: aMainMethodDefinition [
	^ self visitProgram: aMainMethodDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMemExpression: aMemExpression [
	^ self visitExpression: aMemExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMessageMethodModifier: aMessageMethodModifier [
	^ self visitMethodModifier: aMessageMethodModifier
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMetaclassType: aMetaclassType [
	^ self visitType: aMetaclassType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMethodAttribute: aMethodAttribute [
	^ self visitProgram: aMethodAttribute
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMethodCallExpression: aMethodCallExpression [
	^ self visitExpression: aMethodCallExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMethodDefinition: aMethodDefinition [
	^ self visitProgram: aMethodDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMethodHeader: aMethodHeader [
	^ self visitProgram: aMethodHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMethodModifier: aMethodModifier [
	^ self visitProgram: aMethodModifier
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMinusExpression: aMinusExpression [
	^ self visitExpression: aMinusExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitModuleName: aModuleName [
	^ self visitProgram: aModuleName
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMultiStatement: aMultiStatement [
	^ self visitStatement: aMultiStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitMultiValueCaseLabel: aMultiValueCaseLabel [
	^ self visitProgram: aMultiValueCaseLabel
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitNamedDefinedType: aNamedDefinedType [
	^ self visitProgram: aNamedDefinedType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitNamedType: aNamedType [
	^ self visitType: aNamedType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitNewClassType: aNewClassType [
	^ self visitClassType: aNewClassType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitNotExpression: aNotExpression [
	^ self visitExpression: aNotExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitOldClassType: anOldClassType [
	^ self visitClassType: anOldClassType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitOnDo: anOnDo [
	^ self visitProgram: anOnDo
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPlusExpression: aPlusExpression [
	^ self visitExpression: aPlusExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPointerExpression: aPointerExpression [
	^ self visitExpression: aPointerExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPointerType: aPointerType [
	^ self visitType: aPointerType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPrivateClassSection: aPrivateClassSection [
	^ self visitClassSection: aPrivateClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitProcedureDefinition: aProcedureDefinition [
	^ self visitMethodDefinition: aProcedureDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitProcedureHeader: aProcedureHeader [
	^ self visitMethodHeader: aProcedureHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitProgramFile: aProgramFile [
	^ self visitProgram: aProgramFile
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyArrayAccessors: aPropertyArrayAccessors [
	^ self visitProgram: aPropertyArrayAccessors
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyDefault: aPropertyDefault [
	^ self visitProgram: aPropertyDefault
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyDispid: aPropertyDispid [
	^ self visitProgram: aPropertyDispid
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyExpression: aPropertyExpression [
	^ self visitExpression: aPropertyExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyHeader: aPropertyHeader [
	^ self visitProgram: aPropertyHeader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyImplements: aPropertyImplements [
	^ self visitProgram: aPropertyImplements
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyIndex: aPropertyIndex [
	^ self visitProgram: aPropertyIndex
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyModifier: aPropertyModifier [
	^ self visitProgram: aPropertyModifier
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyReader: aPropertyReader [
	^ self visitProgram: aPropertyReader
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyStored: aPropertyStored [
	^ self visitProgram: aPropertyStored
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPropertyWriter: aPropertyWriter [
	^ self visitProgram: aPropertyWriter
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitProtectedClassSection: aProtectedClassSection [
	^ self visitClassSection: aProtectedClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPublicClassSection: aPublicClassSection [
	^ self visitClassSection: aPublicClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitPublishedClassSection: aPublishedClassSection [
	^ self visitClassSection: aPublishedClassSection
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitQualifiedName: aQualifiedName [
	^ self visitProgram: aQualifiedName
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRaiseStatement: aRaiseStatement [
	^ self visitStatement: aRaiseStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRangeCaseLabel: aRangeCaseLabel [
	^ self visitProgram: aRangeCaseLabel
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRangeSetType: aRangeSetType [
	^ self visitSetType: aRangeSetType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRangeSetValue: aRangeSetValue [
	^ self visitSetValue: aRangeSetValue
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRangeType: aRangeType [
	^ self visitType: aRangeType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRecordExpression: aRecordExpression [
	^ self visitExpression: aRecordExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRecordType: aRecordType [
	^ self visitType: aRecordType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitRepeatStatement: aRepeatStatement [
	^ self visitMultiStatement: aRepeatStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitResourceStringDefinition: aResourceStringDefinition [
	^ self visitProgram: aResourceStringDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitResourceStringList: aResourceStringList [
	^ self visitProgram: aResourceStringList
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitSetExpression: aSetExpression [
	^ self visitExpression: aSetExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitSetType: aSetType [
	^ self visitType: aSetType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitSetValue: aSetValue [
	^ self visitProgram: aSetValue
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitSimpleArrayType: aSimpleArrayType [
	^ self visitType: aSimpleArrayType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitSingleSetValue: aSingleSetValue [
	^ self visitSetValue: aSingleSetValue
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitStatementBlock: aStatementBlock [
	^ self visitMultiStatement: aStatementBlock
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitTryStatement: aTryStatement [
	^ self visitMultiStatement: aTryStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitType: aType [
	^ self visitProgram: aType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitTypeType: aTypeType [
	^ self visitProgram: aTypeType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitUnitFile: anUnitFile [
	^ self visitProgram: anUnitFile
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitValuesSetType: aValuesSetType [
	^ self visitSetType: aValuesSetType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitVariable: aVariable [
	^ self visitProgram: aVariable
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitVariableDefinition: aVariableDefinition [
	^ self visitProgram: aVariableDefinition
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitVariableExpression: aVariableExpression [
	^ self visitExpression: aVariableExpression
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitVariantType: aVariantType [
	^ self visitProgram: aVariantType
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitVars: aVars [
	^ self visitProgram: aVars
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitStatement: aWhileStatement
]

{ #category : #generated }
DelphiProgramNodeVisitor >> visitWithStatement: aWithStatement [
	^ self visitStatement: aWithStatement
]
