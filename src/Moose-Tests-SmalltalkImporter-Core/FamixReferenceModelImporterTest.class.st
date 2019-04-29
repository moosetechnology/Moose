Class {
	#name : #FamixReferenceModelImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'referenceModelTheRootName',
		'testCaseName',
		'referenceModelSubRootLevelOneName',
		'testRunnerName'
	],
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #resources }
FamixReferenceModelImporterTest class >> resources [
	^ Array with: FamixReferenceModelNamespaceTestResource
]

{ #category : #private }
FamixReferenceModelImporterTest >> model [
	^self class resources first current model
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> privateTestAccessingVar: aVarName from: aMethodName shouldBeRead: aBoolean hasAccessesSize: anInteger [
	| methodName var access |
	methodName := self model allMethods entityNamed: aMethodName.
	var := (self model allWithSubTypesOf: FamixTAccessible) entityNamed: aVarName.
	self assert: (var incomingAccesses select: [ :each | each accessor = methodName ]) size equals: anInteger.
	access := (var incomingAccesses select: [ :each | each accessor = methodName ]) first.
	self assert: access isRead == aBoolean.
	self assert: access isWrite ~~ aBoolean
]

{ #category : #running }
FamixReferenceModelImporterTest >> setUp [
	super setUp.
	referenceModelSubRootLevelOneName := SubRootLevelOne mooseName.
	referenceModelTheRootName := TheRoot  mooseName.
	testCaseName := TestCase mooseName.
	testRunnerName := TestRunner mooseName.
]

{ #category : #classes }
FamixReferenceModelImporterTest >> testAbstractMethodAnnotation [
	| definingClassName method methodName fmClass |
	definingClassName := TheRoot mooseName.
	methodName := (TheRoot >> #sendingSubclassResponsibility) mooseName.
	method := self model entityNamed: methodName.
	self assert: method isNil not.
	self assert: method belongsTo equals: (self model entityNamed: TheRoot mooseName).
	self assert: method isClassSide not.
	self
		assert: method signature
		equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: #sendingSubclassResponsibility).
	self assert: method isPublic.
	self assert: method isAbstract.
	fmClass := self model entityNamed: definingClassName.
	self assert: fmClass isAbstract
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessReadOnly [
	"self debug: #testAccessReadOnly"
	
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot.x'
		from: #'Smalltalk::TheRoot.x()'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessWriteOnly [
	"self debug: #testAccessWriteOnly"
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot.x'
		from: #'Smalltalk::TheRoot.x:(Object)'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingFormalParameter [
	"self debug: #testAccessingFormalParameter"
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot.accessingArgument:(Object).anArgument'
		from: #'Smalltalk::TheRoot.accessingArgument:(Object)'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingGlobalVariableFromInstanceSide [
	| declaredType |
	self
		privateTestAccessingVar: #Transcript
		from: #'Smalltalk::TheRoot.accessingGlobalVariableFromInstanceSide()'
		shouldBeRead: true
		hasAccessesSize: 1.
	declaredType := (self model allGlobalVariables entityNamed: #Transcript) declaredType.
	self assert: declaredType mooseName equals: Transcript class mooseName.
	self assert: (declaredType usesTrait: FamixTType)
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingGlobalVariableHavingNamespaceNameFromInstanceSide [
	"self debug: #testAccessingGlobalVariableFromInstanceSide"

	| definingClassName accessDefinition methodUniqueName methodName |
	definingClassName := TheRoot mooseName.
	methodName := #accessingGlobalVariableHavingNamespaceName.
	methodUniqueName := (TheRoot >> methodName) mooseName.
	accessDefinition := (self model entityNamed: methodUniqueName) accesses
		select: [ :acc | acc to mooseName = #SmalltalkGlobalVariable ].
	self assert: accessDefinition size equals: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingImportedClassWithinReturnVariable [
	"self debug: #testAccessingImportedClassWithinReturnVariable"

	| methodName var accesses |
	methodName := self model entityNamed: #'Smalltalk::TheRoot.returningImportedClass()'.
	var := self model entityNamed: #Smalltalk::TheRoot.
	accesses := self model allReferences select: [ :each | each from = methodName and: [ each to = var ] ].
	self assert: accesses size equals: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingLocalVariable [
	"self debug: #testAccessingLocalVariable"
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot.assigningLocalVariable().tmp'
		from: #'Smalltalk::TheRoot.assigningLocalVariable()'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingNamespace2 [
	"self debug: #testAccessingNamespace2"

	| definingClassName accessDefinition methodUniqueName methodName |
	definingClassName := 'Smalltalk::TheRoot' mooseName.
	methodName := #accessingGlobalVariableHavingNamespaceName.
	methodUniqueName := FamixSmalltalkNameResolver
		uniqueNameForMethodWithSmalltalkSelector: methodName
		hasClassScope: false
		class: definingClassName.
	accessDefinition := (self model entityNamed: methodUniqueName) accesses
		select: [ :acc | acc to mooseName = #SmalltalkGlobalVariable ].
	self assert: accessDefinition size equals: 1
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testAccessingNamespaceAsGlobalVariable [
	"self debug: #testAccessingNamespaceAsGlobalVariable"

	| accessDefinition method globalVariable |
	"TheRoot>>accessingNamespace
		Smalltalk"
	globalVariable := self model entityNamed: #SmalltalkGlobalVariable.
	method := self model entityNamed: (TheRoot >> #accessingNamespace) mooseName.	"since we have two methods accessing to Smalltalk 
	we have two accesses"
	self assert: (self model allAccesses select: [ :acc | acc to name = #SmalltalkGlobalVariable ]) size equals: 2.
	self assert: (self model allAccesses select: [ :ref | ref to = globalVariable ]) size equals: 2.
	accessDefinition := self model allAccesses select: [ :ref | ref to = globalVariable and: [ ref from == method ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testAccessingStubClassWithinReturnVariable [
	"self debug: #testAccessingStubClassWithinReturnVariable"

	| classNameWhereAccess accessDefinition methodUniqueName methodName classUniqueName |
	classUniqueName := String mooseName.
	classNameWhereAccess := TheRoot mooseName.
	methodName := #returningStubClass.
	methodUniqueName := (TheRoot >> methodName) mooseName.
	accessDefinition := self model allReferences
		select: [ :acc | acc to mooseName = classUniqueName and: [ acc from mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationInstanceAttributes [
	| unaryAnnType withParameterAnnType |
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	self assert: unaryAnnType instances first attributes isEmpty.
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: withParameterAnnType instances first attributes size equals: 2.
	self assert: withParameterAnnType instances last attributes size equals: 2.
	self assert: withParameterAnnType instances first attributes first annotationTypeAttribute name equals: #aPragma.
	self assert: withParameterAnnType instances first attributes last annotationTypeAttribute name equals: #parameter
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationInstanceAttributesInModel [
	self model allAnnotationInstances do: [:each | 
		each attributes do: [:attr | 
			self assert: attr mooseModel equals: self model ]]
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationInstances [
	| unaryAnnType withParameterAnnType |
	self assert: self model allAnnotationInstances size equals: 4.
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: unaryAnnType instances size equals: 1.
	self assert: withParameterAnnType instances size equals: 2
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationInstancesConnectedToMethods [
	| method |
	method := self model allMethods entityNamed: (TheRoot >> #pragmaWithUnaryName) mooseName.
	self assert: method annotationInstances size equals: 1.
	self assert: method annotationInstances first annotatedEntity equals: method.
	method := self model allMethods entityNamed: (TheRoot >> #pragmaWithParameters) mooseName.
	self assert: method annotationInstances size equals: 1.
	self assert: method annotationInstances first annotatedEntity equals: method.
	method := self model allMethods entityNamed: (TheRoot >> #multiplePragmas) mooseName.
	self assert: method annotationInstances size equals: 2.
	self assert: method annotationInstances first annotatedEntity equals: method.
	self assert: method annotationInstances last annotatedEntity equals: method
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationTypeAttributes [
	| unaryAnnType withParameterAnnType |
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	self assert: unaryAnnType attributes isEmpty.
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: withParameterAnnType attributes size equals: 2
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationTypeAttributesInModel [
	self model allAnnotationTypes do: [:each | 
		each attributes do: [:attr | 
			self assert: attr mooseModel equals: self model ]]
]

{ #category : #annotations }
FamixReferenceModelImporterTest >> testAnnotationTypes [
	self assert: self model allAnnotationTypes size equals: 3.
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #aPragma ]).
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #anotherPragma ]).
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #aPragma:parameter: ])
]

{ #category : #'reference model annotation' }
FamixReferenceModelImporterTest >> testClassAnnotation [
	"self debug: #testClassAnnotation"

	| definingClassName famixClass |
	definingClassName := #Smalltalk::SubRootLevelOne mooseName.
	famixClass := self model entityNamed: definingClassName.
	self assert: famixClass parentPackage name equals: #'Moose-TestResources-Reference-Core'
]

{ #category : #'reference model annotation' }
FamixReferenceModelImporterTest >> testClassClassAnnotation [
	"Should work for metaclasse too"

	"self debug: #testClassAnnotation"

	| definingClassName famixClass |
	definingClassName := SubRootLevelOne class mooseName.
	famixClass := self model entityNamed: definingClassName.
	self assert: famixClass parentPackage name equals: #'Moose-TestResources-Reference-Core'
]

{ #category : #'new tests' }
FamixReferenceModelImporterTest >> testClassMetaclassInstanceVariableAndShared [
	"self debug: #testClassMetaclassInstanceVariableAndShared"

	| insVar theRoot insMetaclassVar shared theRootMeta |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.z'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot_class.mz'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	theRootMeta := self model entityNamed: #Smalltalk::TheRoot_class.
	self deny: insVar hasClassScope.
	self assert: insMetaclassVar hasClassScope.
	self assert: shared hasClassScope.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRootMeta.
	self assert: shared belongsTo equals: theRoot.
	self assert: shared isSharedVariable.
	self deny: insVar isSharedVariable.
	self deny: insMetaclassVar isSharedVariable
]

{ #category : #'reference model annotation' }
FamixReferenceModelImporterTest >> testClassMethodAnnotation [
	"self debug: #testClassMethodAnnotation"

	| definingClassName methodUniqueName method methodName |
	definingClassName := SubRootLevelOne class mooseName.
	methodName := #accessSharedVariableOfSuperClassClassSide.
	methodUniqueName := FamixSmalltalkNameResolver
		uniqueNameForMethodWithSmalltalkSelector: methodName
		hasClassScope: false
		class: definingClassName.
	method := self model entityNamed: methodUniqueName.
	self assert: method category equals: #'accessing superclassinstance on class side'
]

{ #category : #'new tests' }
FamixReferenceModelImporterTest >> testClassReferenceFromTheInstanceSide [
	"self debug: #testClassReferenceFromTheInstanceSide"

	"TheRoot>>accessingClass

		Object new"

	| definingClassName methodName className refs |
	className := Object mooseName.
	definingClassName := TheRoot mooseName.
	methodName := (TheRoot >> #accessingClass) mooseName.
	refs := self model allReferences
		select: [ :acc | acc from mooseName = methodName and: [ acc to mooseName = className ] ].
	self assert: refs size equals: 1
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testClassReferencesByFullNameReified [
	"self debug: #testClassReferencesByFullNameReified"
	
	self assert: (self model entityNamed: TestCase class mooseName) notNil
]

{ #category : #'reference model invocations' }
FamixReferenceModelImporterTest >> testClassSelfSend [
	"self debug: #testClassSelfSend"

	| invocations calleeMethodName callingMethodUniqueName referenceModelTheRootMetaclassName |
	"We want to represent
	TheRoot class>>classSend

			Object new
	"
	calleeMethodName := #new mooseName.
	referenceModelTheRootMetaclassName := TheRoot class mooseName.
	callingMethodUniqueName := (TheRoot class >> #classSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1.
	self assert: invocations first receiver mooseName equals: #Smalltalk::Object_class
]

{ #category : #'new tests' }
FamixReferenceModelImporterTest >> testConflictingInstanceVarNames [
	"self debug: #testConflictingInstanceVarNames"

	| insVar theRoot insMetaclassVar shared theRootMeta |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.instanceAndClassPotentiallyConflictingName'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot_class.instanceAndClassPotentiallyConflictingName'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	theRootMeta := self model entityNamed: #Smalltalk::TheRoot_class.
	self deny: insVar hasClassScope.
	self assert: insMetaclassVar hasClassScope.
	self assert: shared hasClassScope.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRootMeta.
	self assert: shared belongsTo equals: theRoot
]

{ #category : #classes }
FamixReferenceModelImporterTest >> testConstantMethodAnnotation [
	| methodUniqueName method methodName |
	methodName := #constantReturningMethod.
	methodUniqueName := (TheRoot >> methodName) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNil not.
	self assert: method belongsTo equals: (self model entityNamed: TheRoot mooseName).
	self assert: method isClassSide not.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: methodName).
	self assert: method isPublic.
	self assert: method isConstant
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtendedClasses [
	"self debug: #testExtendedClasses"

	| subRootModelTwo p1 p2 subRootModelThree extensionMethod |
	p1 := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	subRootModelTwo := self model entityNamed: SubRootModelTwo mooseName.
	subRootModelThree := self model entityNamed: SubRootModelThree mooseName.
	extensionMethod := self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName.
	self assert: subRootModelTwo packageScope equals: p1.
	self assert: subRootModelTwo isExtended.
	self assert: (subRootModelTwo extendedInPackages includes: p2).
	self assert: (subRootModelTwo extendedMethods includes: extensionMethod).
	self deny: subRootModelThree isExtended
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtendedPackage [
	"self debug: #testExtendedPackage"

	| extendedClass extendedPackage |
	extendedPackage := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	self assert: (extendedPackage localClasses includes: extendedClass).
	self assert: (extendedPackage extendedClasses includes: extendedClass).
	self assert: extendedPackage extensionClasses isEmpty.
	self assert: extendedPackage methods size equals: 2.
	self assert: extendedPackage localMethods size equals: 2
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtensionClasses [
	"self debug: #testExtensionClasses"

	| p1 p2 extensionClasses c3 c2 |
	p1 := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extensionClasses := p2 extensionClasses.
	c3 := self model entityNamed: SubRootModelThree mooseName.
	c2 := self model entityNamed: SubRootModelTwo mooseName.
	self assert: (p2 localClasses includes: c3).
	self assert: (p1 localClasses includes: c2).
	self assert: p1 localClasses size equals: 2.	"class and metaclass"
	self deny: (extensionClasses includes: c3).
	self assert: (extensionClasses includes: c2)
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtensionMethod [
	"self debug: #testExtendedMethod"

	| p2 extensionMethod |
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extensionMethod := self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName.
	self assert: extensionMethod isExtension.
	self assert: extensionMethod packageScope equals: p2.
	self assert: extensionMethod packageScope ~~ extensionMethod belongsTo packageScope
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtensionPackage [
	"self debug: #testExtensionPackage"

	| normalClass extendedClass extensionPackage externalExtendedClass |
	extensionPackage := self model allPackages entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	externalExtendedClass := self model entityNamed: ExternalReferenceClass mooseName.
	normalClass := self model entityNamed: SubRootModelThree mooseName.
	self assert: (extensionPackage classes includes: normalClass).
	self deny: (extensionPackage classes includes: extendedClass).
	self deny: (extensionPackage classes includes: externalExtendedClass).
	self assert: (extensionPackage localClasses includes: normalClass).
	self deny: (extensionPackage extensionClasses includes: normalClass).
	self assert: (extensionPackage extensionClasses includes: extendedClass).
	self assert: (extensionPackage extensionClasses includes: externalExtendedClass).
	self assert: extensionPackage extendedClasses isEmpty.
	self assert: extensionPackage methods size equals: 3.
	self assert: extensionPackage localMethods size equals: 1.
	self assert: extensionPackage extensionMethods size equals: 2.
	self
		assert:
			(extensionPackage extensionMethods
				includes:
					(self model entityNamed: (ExternalReferenceClass >> #externalClassExtensionForTest) mooseName)).
	self
		assert:
			(extensionPackage extensionMethods includes: (self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName))
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExtensions [
	"self debug: #testExtensions"

	| normalClass extendedClass |
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	normalClass := self model entityNamed: SubRootModelThree mooseName.
	self assert: extendedClass isExtended.
	self assert: extendedClass packageScope name equals: #'Moose-TestResources-Reference-PackageOne'.
	self assert: (extendedClass methods collect: #packageScope) asSet size equals: 2.
	self
		assert:
			((extendedClass methods collect: #packageScope) asSet
				anySatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageOne' ]).
	self
		assert:
			((extendedClass methods collect: #packageScope) asSet
				anySatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageTwo' ]).
	self deny: normalClass isExtended.
	self assert: normalClass packageScope name equals: #'Moose-TestResources-Reference-PackageTwo'.
	self assert: (normalClass methods collect: #packageScope) asSet size equals: 1.
	self
		assert:
			((normalClass methods collect: #packageScope)
				allSatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageTwo' ])
]

{ #category : #'package and extensions' }
FamixReferenceModelImporterTest >> testExternalExtension [
	"self debug: #testExternalExtension"
	| extensionPackage externalExtendedClass |
	
	extensionPackage := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	externalExtendedClass := self model entityNamed: ExternalReferenceClass mooseName.

	self assert: (externalExtendedClass isStub).
	self deny: (extensionPackage classes includes: externalExtendedClass).
	self assert: (extensionPackage extensionMethods includes:
		(self model entityNamed: (ExternalReferenceClass>>#externalClassExtensionForTest) mooseName)).

]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testFormalParameterReified [
	"self debug: #testFormalParameterReified"
	
	| formalParameterName |
	formalParameterName := #'Smalltalk::TheRoot.accessingArgument:(Object).anArgument'.
	self assert: (self model entityNamed: formalParameterName) notNil
]

{ #category : #classes }
FamixReferenceModelImporterTest >> testGetterMethod [
	| methodUniqueName method methodName |
	methodName := #x.
	methodUniqueName := (TheRoot >> methodName) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNil not.
	self assert: method isClassSide not.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: methodName).
	self assert: method isPublic.
	self assert: method isPureAccessor.
	self assert: method isGetter
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testGlobalVariableReified [
	"self debug: #testGlobalVariableReified"
	
	| globalVariable |
	globalVariable := self model entityNamed: #Transcript.
	self assert: globalVariable isNil not
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testImplicitVariableReified [
	"self run: #testImplicitVariableReified"

	"self debug: #testImplicitVariableReified"

	| implicitVariableName implicitVariable |
	implicitVariableName := 'self'.
	implicitVariableName := FamixSmalltalkNameResolver 
				uniqueNameForImplicitVariableNamed: implicitVariableName
				scope: referenceModelTheRootName,'.singleSelfSend()' .
	implicitVariable := self model entityNamed: implicitVariableName.
	self assert: implicitVariable isNil not
]

{ #category : #'reference model accesed' }
FamixReferenceModelImporterTest >> testInstVariableAccessInDefiningClass [
	"self debug: #testInstVariableAccessInDefiningClass"
	
	self 
		privateTestAccessingVar: #'Smalltalk::SubRootLevelOne.k'
		from: #'Smalltalk::SubRootLevelOne.accessSuperclassInstVar()'
		shouldBeRead: false
		hasAccessesSize: 1.
]

{ #category : #'reference model accesed' }
FamixReferenceModelImporterTest >> testInstVariableAccessInDefiningMetaclass [
	"self debug: #testInstVariableAccessInDefiningMetaclass"
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot_class.mx'
		from: #'Smalltalk::TheRoot_class.accessInstanceVariable()'
		shouldBeRead: false
		hasAccessesSize: 1.
]

{ #category : #'reference model accesed' }
FamixReferenceModelImporterTest >> testInstVariableAccessInSuperClass [
	self 
		privateTestAccessingVar: (TheRoot mooseNameOf: #x)
		from: #'Smalltalk::SubRootLevelOne.accessSuperclassInstVar()'
		shouldBeRead: true
		hasAccessesSize: 1.

	self 
		privateTestAccessingVar: (TheRoot mooseNameOf: #y)
		from: (SubRootLevelOne>>#accessSuperclassInstVar) mooseName
		shouldBeRead: true
		hasAccessesSize: 1.
]

{ #category : #'reference model accesed' }
FamixReferenceModelImporterTest >> testInstVariableAccessTwiceTheSameVariable [
	self 
		privateTestAccessingVar: SubRootLevelOne@#k
		from: (SubRootLevelOne>>#accessTwiceTheSameVariable) mooseName
		shouldBeRead: true
		hasAccessesSize: 2.
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testInstanceVariableReified [
	| instVarName instVarUniqueName instVar |
	instVarName := 'k'.
	instVarUniqueName := FamixSmalltalkNameResolver 
				mooseNameForAttributeNamed: instVarName
				class: referenceModelSubRootLevelOneName
				classSide: false.
	instVar := self model entityNamed: instVarUniqueName.
	self assert: instVar hasClassScope not.
	self assert: instVar isProtected
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testLocalVariableReified [
	"self run: #testLocalVariableReified"

	"self debug: #testLocalVariableReified"

	| methodName localVariableName localVariable |
	methodName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: 'assigningLocalVariable'
				hasClassScope: false
				class: referenceModelTheRootName.
	localVariableName := 'tmp'.
	localVariableName := FamixSmalltalkNameResolver 
				uniqueNameForLocalVariableNamed: localVariableName
				belongsTo: methodName.
	localVariable := self model entityNamed: localVariableName.
	self assert: localVariable isNil not
]

{ #category : #'new tests' }
FamixReferenceModelImporterTest >> testMetaclassAttributeHasClassScope [
	"self debug: #testMetaclassAttributeHasClassScope"

	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk::TheRoot_class.mz'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot_class.
	self assert: attribute hasClassScope.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #'reference model annotation' }
FamixReferenceModelImporterTest >> testMethodAnnotation [
	"self run: #testMethodAnnotation"

	"self debug: #testMethodAnnotation"

	| definingClassName methodUniqueName method methodName |
	definingClassName := #Smalltalk::SubRootLevelOne.
	methodName := #accessSuperclassInstVar.
	methodUniqueName := FamixSmalltalkNameResolver
		uniqueNameForMethodWithSmalltalkSelector: methodName
		hasClassScope: false
		class: definingClassName.
	method := self model entityNamed: methodUniqueName ifAbsent: [ nil ].
	self assert: method name equals: #accessSuperclassInstVar.
	self assert: method category equals: #accessingSuperclassInstVar
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testMethodReification [
	"self run: #testMethodReification"

	"self debug: #testMethodReification"

	| methodUniqueName method methodName |
	methodName := #accessSuperclassInstVar.
	methodUniqueName := FamixSmalltalkNameResolver
		uniqueNameForMethodWithSmalltalkSelector: methodName
		hasClassScope: false
		class: referenceModelSubRootLevelOneName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNil not.
	self assert: method belongsTo equals: (self model entityNamed: referenceModelSubRootLevelOneName).
	self assert: method isClassSide not.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: #accessSuperclassInstVar).
	self assert: method isPublic
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testNameResolverNamespaceName [
	"self debug: #testNameResolverNamespaceName"
	self assert: ((FamixSmalltalkNameResolver uniqueNameForNamespaceNamed: #ReferenceModel scope: #'SCG::Moose') == #'SCG::Moose::ReferenceModel').
	self assert: ((FamixSmalltalkNameResolver uniqueNameForNamespaceNamed: #Moose scope: #SCG) ==  #'SCG::Moose')
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testOutOfModelInheritedInstanceVariableReified [
	"test wether the instance variable and the stub class are well reified"

	"self debug: #testOutOfModelInheritedInstanceVariableReified"

	| instVarName instVarUniqueName instVar |
	instVarName := 'dependents'.
	instVarUniqueName := FamixSmalltalkNameResolver mooseNameForAttributeNamed: instVarName class: Model mooseName classSide: false.
	instVar := self model entityNamed: instVarUniqueName.
	self assert: instVar hasClassScope not.
	self assert: instVar isProtected.
	self assert: instVar belongsTo mooseName equals: Model mooseName
]

{ #category : #'reference model accesed' }
FamixReferenceModelImporterTest >> testReadAndWrite [
	| attributeName definingClassName instVarUniqueName accessDefinition methodUniqueName methodName |
	attributeName := 'k'.
	definingClassName := SubRootLevelOne mooseName.
	methodName := #accessTwiceTheSameVariableReadAndWrite.
	methodUniqueName := (SubRootLevelOne >> methodName) mooseName.
	instVarUniqueName := FamixSmalltalkNameResolver
		mooseNameForAttributeNamed: attributeName
		class: definingClassName
		classSide: false.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 2.
	self assert: (accessDefinition at: 1) isRead | (accessDefinition at: 1) isWrite.
	self assert: (accessDefinition at: 2) isRead | (accessDefinition at: 2) isWrite
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testReferenceBindingReified [
	"self debug: #testReferenceBindingReified"
	
	| famixClass |
	famixClass := self model entityNamed: TestRunner class mooseName.
	self assert: famixClass isNil not
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testSelfAccessInDefiningClass [
	"self debug: #testSelfAccessInDefiningClass"
	
	"TheRoot>>singleSelfSend
		self accessSharedVariableFromTheInstanceSide"
	
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot.singleSelfSend().self'
		from: #'Smalltalk::TheRoot.singleSelfSend()'
		shouldBeRead: true
		hasAccessesSize: 1.
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testSelfAccessInDefiningClassOnClassSide [
	"self debug: #testSelfAccessInDefiningClassOnClassSide"
	self 
		privateTestAccessingVar: #'Smalltalk::TheRoot_class.singleSelfSendOnClassSide().self'
		from: #'Smalltalk::TheRoot_class.singleSelfSendOnClassSide()'
		shouldBeRead: true
		hasAccessesSize: 1.
]

{ #category : #classes }
FamixReferenceModelImporterTest >> testSetterMethod [
	| methodUniqueName method methodName |
	methodName := #x:.
	methodUniqueName := (TheRoot >> methodName) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNil not.
	self assert: method belongsTo equals: (self model entityNamed: TheRoot mooseName).
	self assert: method isClassSide not.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: methodName).
	self assert: method isPublic.
	self assert: method isPureAccessor.
	self assert: method isSetter
]

{ #category : #'new tests' }
FamixReferenceModelImporterTest >> testSharedVariableReification [
	"self debug: #testSharedVariableReification"

	| shared |
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	self assert: shared hasClassScope.
	self assert: shared isSharedVariable.
	self assert: shared isProtected.
	self assert: shared belongsTo equals: (self model entityNamed: TheRoot mooseName)
]

{ #category : #'reference model invocations' }
FamixReferenceModelImporterTest >> testSingleSelfSend [
	"self run: #testSingleSelfSend"

	"self debug: #testSingleSelfSend"

	| invocations calleeMethodName callingMethodUniqueName |
	"We want to make sure that we represent well that 
	TheRoot>>singleSelfSend

			self accessSharedVariableFromTheInstanceSide"
	calleeMethodName := #accessSharedVariableFromTheInstanceSide.
	callingMethodUniqueName := (TheRoot >> #singleSelfSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1
]

{ #category : #'reference model invocations' }
FamixReferenceModelImporterTest >> testSingleSelfSendOnClassSide [
	"self debug: #testSingleSelfSendOnClassSide"

	| definingClassName invocations calleeMethodName callingMethodUniqueName |
	"Want to represent
	TheRoot class>>accessSharedVariableFromTheClassSide
			TheRootSharedVariable := 4"
	calleeMethodName := #accessSharedVariableFromTheClassSide.
	definingClassName := TheRoot class mooseName.
	callingMethodUniqueName := (TheRoot class >> #singleSelfSendOnClassSide) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1.
	self assert: invocations first receiver mooseName equals: #'Smalltalk::TheRoot_class.singleSelfSendOnClassSide().self'
]

{ #category : #'reference model invocations' }
FamixReferenceModelImporterTest >> testSingleSelfSendWithReturn [
	"self debug: #testSingleSelfSendWithReturn"

	| definingClassName invocations calleeMethodName callingMethodUniqueName |
	"We want to make sure that we represent well
	TheRoot>>returningSingleSelfSend

		^self accessSharedVariableFromTheInstanceSide"
	calleeMethodName := #accessSharedVariableFromTheInstanceSide.
	definingClassName := TheRoot mooseName.
	callingMethodUniqueName := (TheRoot >> #returningSingleSelfSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testStubInstanceVariableReified [
	"self debug: #testStubInstanceVariableReified"
	
	| instVarName instVarUniqueName instVar |
	instVarName := #dependents.
	instVarUniqueName := FamixSmalltalkNameResolver 
				mooseNameForAttributeNamed: instVarName
				class: Model mooseName
				classSide: false.
	instVar := self model entityNamed: instVarUniqueName.
	self deny: instVar isNil.
	self assert: instVar isStub
]

{ #category : #stubs }
FamixReferenceModelImporterTest >> testStubSharedVariableAccessShortName [
	"We want to test that
	TheRoot>>accessingStubSharedVariableShortName

			^ DependentsFields"

	| methodName classVarUniqueName accessDefinition |
	methodName := (TheRoot >> #accessingStubSharedVariableShortName) mooseName.
	classVarUniqueName := Object @ #DependentsFields.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = classVarUniqueName and: [ acc accessor mooseName = methodName ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #stubs }
FamixReferenceModelImporterTest >> testStubSharedVariableReified [
	"self debug: #testStubSharedVariableReified"

	| definingClassName classVarName classVarUniqueName classVar |
	definingClassName := Object mooseName.
	classVarName := #DependentsFields.
	classVarUniqueName := FamixSmalltalkNameResolver
		mooseNameForAttributeNamed: classVarName
		class: definingClassName
		classSide: false.
	classVar := self model entityNamed: classVarUniqueName.
	self deny: classVar isNil.
	self assert: classVar isStub.
	self assert: classVar isSharedVariable.
	self assert: classVar belongsTo equals: (self model entityNamed: definingClassName)	
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testSubRootLevelOneInheritsFromTheRoot [
	"self debug: #testSubRootLevelOneInheritsFromTheRoot"

	| referenceModelSubRootLevelOne |
	referenceModelSubRootLevelOne := self model entityNamed: referenceModelSubRootLevelOneName.
	self assert: referenceModelSubRootLevelOne superInheritances size equals: 1.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) superclass name equals: TheRoot name.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) subclass name equals: SubRootLevelOne name.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) superclass name equals: TheRoot name.
	self assert: referenceModelSubRootLevelOne subInheritances isEmpty
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testTheRootInheritsFromUIModel [
	"self debug: #testTheRootInheritsFromUIModel"

	| referenceModelTheRoot |
	referenceModelTheRoot := self model entityNamed: referenceModelTheRootName.
	self assert: (referenceModelTheRoot superInheritances at: 1) superclass name equals: Model name.
	self assert: referenceModelTheRoot subInheritances size equals: 3.
	self assert: (referenceModelTheRoot subInheritances at: 1) superclass name equals: TheRoot name.
	self
		assert:
			((referenceModelTheRoot subInheritances collect: [ :each | each subclass name ]) includes: SubRootLevelOne name)
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> testUnknownVariableAccess [
	"self debug: #testUnknownVariableAccess"
	self 
		privateTestAccessingVar: #'undeclaredStubInstVar'
		from: #'Smalltalk::TheRoot.accessingUnknowVariable()'
		shouldBeRead: true
		hasAccessesSize: 1.
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testUnknownVariableReified [
	"self debug: #testUnknownVariableReified"
	self deny: (self model entityNamed: #undeclaredStubInstVar) isNil
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testUsedClassReified [
	"self debug: #testUsedClassReified"
	| className famixClass |
	className := Object mooseName.
	famixClass := self model entityNamed: className ifAbsent: [nil].
	self assert: famixClass isNil not.
	self assert: famixClass isStub.
]

{ #category : #'reference model reification' }
FamixReferenceModelImporterTest >> testUsedClassReifiedWithinReturn [
	"self debug: #testUsedClassReifiedWithinReturn"
	
	| className famixClass |
	className := String class mooseName.
	famixClass := self model entityNamed: className.
	self assert: famixClass isNil not.
	self assert: famixClass isStub.
]

{ #category : #'shared variables' }
FamixReferenceModelImporterTest >> testaccessSharedVariableFromTheClassSide [
	"self debug: #testaccessSharedVariableFromTheClassSide"

	| attributeName definingClassName classVarUniqueName accessDefinition methodUniqueName methodName methodClassName |
	attributeName := #TheRootSharedVariable.
	definingClassName := TheRoot mooseName.
	methodClassName := TheRoot class mooseName.
	methodName := #accessSharedVariableFromTheClassSide.
	methodUniqueName := (TheRoot class >> #accessSharedVariableFromTheClassSide) mooseName.
	classVarUniqueName := TheRoot @ #TheRootSharedVariable.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = classVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #'shared variables' }
FamixReferenceModelImporterTest >> testaccessSharedVariableFromTheInstanceSide [
	"self debug: #testaccessSharedVariableFromTheInstanceSide"

	| attributeName definingClassName classNameWhereAccess classVarUniqueName accessDefinition methodName |
	"TheRoot>>accessSharedVariableFromTheInstanceSide
		TheRootSharedVariable := 3"
	attributeName := 'TheRootSharedVariable'.
	definingClassName := TheRoot mooseName.
	classNameWhereAccess := TheRoot mooseName.
	methodName := (TheRoot >> #accessSharedVariableFromTheInstanceSide) mooseName.
	classVarUniqueName := FamixSmalltalkNameResolver mooseNameForSharedAttributeNamed: attributeName class: definingClassName.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = classVarUniqueName and: [ acc accessor mooseName = methodName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #'shared variables' }
FamixReferenceModelImporterTest >> testaccessSharedVariableOfSuperclassClassSide [
	"self debug: #testaccessSharedVariableOfSuperclassClassSide"

	| attributeName definingClassName classNameWhereAccess instVarUniqueName accessDefinition methodUniqueName methodName |
	attributeName := #TheRootSharedVariable.
	definingClassName := TheRoot mooseName.
	classNameWhereAccess := SubRootLevelOne class mooseName.
	methodName := #accessSharedVariableOfSuperClassClassSide.
	methodUniqueName := (SubRootLevelOne class >> methodName) mooseName.
	instVarUniqueName := TheRoot @ #TheRootSharedVariable.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #'shared variables' }
FamixReferenceModelImporterTest >> testaccessSharedVariableOfSuperclassClassSide2 [
	"self debug: #testaccessSharedVariableOfSuperclassClassSide"

	| attributeName definingClassName classNameWhereAccess instVarUniqueName accessDefinition methodUniqueName methodName |
	"we test
		SubRootLevelOne class>>accessSharedVariableOfSuperSuperClassClassSide

			DependentsFields := 6"
	attributeName := #DependentsFields.
	definingClassName := TheRoot mooseName.
	classNameWhereAccess := SubRootLevelOne class mooseName.
	methodName := #accessSharedVariableOfSuperSuperClassClassSide.
	methodUniqueName := (SubRootLevelOne class >> methodName) mooseName.
	instVarUniqueName := Object @ #DependentsFields.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #'shared variables' }
FamixReferenceModelImporterTest >> testaccessSharedVariableOfSuperclassInstanceSide [
	"self debug: #testaccessSharedVariableOfSuperclassInstanceSide"

	| attributeName definingClassName classNameWhereAccess instVarUniqueName accessDefinition methodUniqueName methodName |
	attributeName := #TheRootSharedVariable.
	definingClassName := TheRoot mooseName.
	classNameWhereAccess := SubRootLevelOne mooseName.
	methodName := #accessSharedVariableOfSuperclassInstanceSide.
	methodUniqueName := (SubRootLevelOne >> methodName) mooseName.
	instVarUniqueName := FamixSmalltalkNameResolver
		mooseNameForAttributeNamed: attributeName
		class: definingClassName
		classSide: false.
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]
