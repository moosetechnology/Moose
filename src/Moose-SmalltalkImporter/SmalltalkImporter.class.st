"
I'm responsible for creating Famix model out of Smalltalk code.
I'm mainly invoked by the MooseImportClassesTask
"
Class {
	#name : #SmalltalkImporter,
	#superclass : #MooseAbstractImporter,
	#instVars : [
		'methods',
		'classes',
		'namespaces',
		'packages',
		'globals',
		'scopes',
		'others',
		'implicitVariables',
		'annotationTypes',
		'factory'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #constant }
SmalltalkImporter class >> CIVString [

	^ 'CIV#'
]

{ #category : #'private accessing' }
SmalltalkImporter >> CIVString [

	^ self class CIVString
]

{ #category : #'private accessing' }
SmalltalkImporter >> addEntity: value [ 
	 
	^others add: value
]

{ #category : #enumerating }
SmalltalkImporter >> allElements [ 
	 
	| stream | 
	stream := (OrderedCollection new: self size) writeStream. 
	stream nextPutAll: others. 
	stream nextPutAll: methods values. 
	stream nextPutAll: self famixClasses. 
	stream nextPutAll: namespaces values. 
	stream nextPutAll: packages values. 
	stream nextPutAll: globals values. 
	scopes do: [:each | stream nextPutAll: each values]. 
	^stream contents
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> basicClassCreation: aClass [
	| class anchor |
	class := classes at: aClass put: self factory classEntity new.
	class name: (aClass name replaceAll: Character space with: $_).
	class stub: true.
	importingContext shouldImportNamespace
		ifTrue: [ class typeContainer: (self ensureNamespace: aClass environment) ].
	anchor := self factory anchor new
		element: class;
		pharoEntity: aClass;
		yourself.
	class sourceAnchor: anchor.
	self addEntity: anchor.
	^ class
]

{ #category : #'private utils' }
SmalltalkImporter >> checkAbstractClass: class [ 
	(class methods contains: [ :each | each isAbstract ]) ifTrue: [ class isAbstract: true ]
]

{ #category : #'private accessing' }
SmalltalkImporter >> classes [
	
	^ classes
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createAnnotationType: aPragmaNode [ 
	| pragmaAnnotationType |
	pragmaAnnotationType := annotationTypes
		at: aPragmaNode selector
		put: self factory annotationType new.
	pragmaAnnotationType name: aPragmaNode selector.
	aPragmaNode selector isUnary ifFalse: [
		(aPragmaNode selector piecesCutWhere: [:a :b | a = $: ]) do: [ :each | 
			| attribute |
			attribute := self factory annotationTypeAttribute new.
			attribute name: (each removeSuffix: ':').
			attribute parentAnnotationType: pragmaAnnotationType.
			self addEntity: attribute
			] ].
	^ pragmaAnnotationType
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createAttribute: name for: aClass [
	| attribute realName possibleTypes |
	realName := self nameForInstanceVariable: name class: aClass.
	attribute := (self scopeOfClass: aClass)
		at: realName
		bind: self factory attribute new.
	attribute stub: true.
	attribute name: realName asSymbol.
	importingContext shouldMergeClassAndMetaclass
		ifTrue: [ attribute parentType: (self ensureClass: aClass instanceSide) ]
		ifFalse: [ attribute parentType: (self ensureClass: aClass) ].
	attribute hasClassScope: aClass isMeta.
	attribute beProtected.
	"now we use RoelTyper to see a unique type can be retrieve for this attribute: "
	importingContext shouldComputeTypeOfAttributes
		ifTrue: [ possibleTypes := (TypeCollector
				typeInstvar: name asSymbol
				ofClassWithLookup: aClass) types.
			possibleTypes size = 1
				ifTrue: [ attribute
						declaredType: (self ensureClass: possibleTypes first instanceSide) ] ].
	^ attribute
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createClass: aClass [ 
	| class inheritance |
	
	importingContext shouldMergeClassAndMetaclass 
		ifFalse: [ class := self basicClassCreation: aClass ]
		ifTrue: 
			[ aClass isMeta 
				ifTrue: [ class := self ensureClass: aClass soleInstance. classes at: aClass put: class ]
				ifFalse: [ class := self basicClassCreation: aClass ] ].
	importingContext shouldImportPackage ifTrue: 
		[ class parentPackage: (self ensurePackage: (aClass package)) ].
	importingContext shouldImportInheritance ifTrue: 
		[ (aClass superclass ~~ nil and: 
			[ importingContext shouldMergeClassAndMetaclass 
				ifFalse: [ true ]
				ifTrue: [ aClass isMeta not ] ]) 
					ifTrue: [ inheritance := self addEntity: self factory inheritance new.
							inheritance superclass: (self ensureClass: aClass superclass).
							inheritance subclass: class ]
		].
	aClass isMeta ifFalse: [ self ensureClass: aClass class ].
	importingContext shouldImportAttribute
		ifTrue:
			[aClass instVarNames
				do: [:eachName | self ensureAttribute: eachName for: aClass].
			"since the classVar of a class are not the same as the classVar of the class class"
			
			"with latest pharo class classVar = class class classVar so we should not need that anymore"
			aClass isMeta 
				ifTrue: [aClass soleInstance classVarNames
							do: [:eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass soleInstance]]
				ifFalse: [ aClass classVarNames
							do: [:eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass]]].
	^ class
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createClassVarAttribute: name for: aClass [
	"a classVar always belongs to the base class"

	| attribute |
	attribute := self factory attribute new.
	(self scopeOfClass: aClass) at: name bind: attribute.
	(self scopeOfClass: aClass class) at: name bind: attribute.
	attribute stub: true.
	attribute name: name asSymbol.
	attribute parentType: (self ensureClass: aClass instanceSide).
	attribute hasClassScope: true.
	attribute beSharedVariable.
	attribute beProtected.
	^ attribute
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createGlobalVariable: name value: value [ 
	 
	| global | 
	global := globals 
		at: name 
		put: self factory globalVariable new. 
	global name: name. 
	global declaredType: (self ensureClass: value class ).
	^ global
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createMethod: aCompiledMethod [
	| method thisClass anchor |
	method := methods at: aCompiledMethod put: self factory method new.
	method name: aCompiledMethod selector.
	method isAbstract: false.
	thisClass := aCompiledMethod methodClass.
	method parentType: (self ensureClass: thisClass).
	method signature: aCompiledMethod signature.
	"here we have two possibilities for the parentPackage of the method: 
	=> the method belong to a package extension, we should refer to this extending packages 
	=> if not, we should not refer to package of the class"
	"parentPackage := aCompiledMethod methodClass package."
	aCompiledMethod methodClass extendingPackages
		do: [ :aRPackage | 
			(aCompiledMethod isExtensionInPackage: aRPackage)
				ifTrue: [ method parentPackage: (self ensurePackage: aRPackage) ] ].
	method isClassSide: aCompiledMethod methodClass isMeta.
	method
		category:
			(aCompiledMethod methodClass organization
				categoryOfElement: aCompiledMethod selector).
	method isPublic: true.
	method timeStamp: aCompiledMethod timeStamp.
	importingContext shouldImportMethodBody
		ifTrue: [ | visitor |
			visitor := SmalltalkMethodVisitor on: self.
			visitor runWith: aCompiledMethod and: method ].
	anchor := self factory anchor new
		element: method;
		pharoEntity: aCompiledMethod;
		yourself.
	method sourceAnchor: anchor.
	self addEntity: anchor.
	^ method
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createNamespace: aNamespace [ 
	
	| namespace |
	namespace := namespaces
		at: aNamespace asString asSymbol
		put: self factory namespace new.
	namespace name: 'Smalltalk'.
	^namespace
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createPackage: aPackageModel [
	
	| package |
	package := packages
		at: aPackageModel
		put: self factory package new.
	package name: aPackageModel name.
	package stub: true.
	^package
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createSpecialVariable: name forClass: aClass [

	| attribute |
	attribute := (self scopeOfClass: aClass) at: name bind: self factory implicitVariable new.
	attribute name: name.
	attribute container: (self ensureClass: aClass).	
	^attribute
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createSpecialVariable: name forFamixMethod: aFamixMethod [

	| attribute |
	attribute := "(self scopeOfClass: aClass) at: name bind:" self factory implicitVariable new.
	attribute name: name.
	attribute parentBehaviouralEntity: aFamixMethod.
	^attribute
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> createUnknownVariable: name [

	| unknown |
	unknown := globals
		at: name
		put: self factory unknownVariable new.
	unknown name: name.
	^unknown
]

{ #category : #enumerating }
SmalltalkImporter >> do: aBlock [ 
	 
	others do: aBlock. 
	methods do: aBlock. 
	self famixClasses do: aBlock. 
	namespaces do: aBlock. 
	packages do: aBlock. 
	globals do: aBlock. 
	annotationTypes do: aBlock. 
	implicitVariables values do: [:aDictionary | 
		aDictionary do: aBlock
		].
	"Shared variables are both in class and metaclass scopes.
	To avoid duplicate refs in the moose model, we reject them from metaclass
	before adding them to the model"
	scopes keysAndValuesDo: [:cl :scope | 
		cl isMeta
			ifTrue: [	(scope values reject: [:var | var isSharedVariable]) do: aBlock ]
			ifFalse: [ scope do: aBlock ]].

]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureAnnotationType: aPragmaNode [
	 
	^annotationTypes 
		at: aPragmaNode selector
		ifAbsent: [self createAnnotationType: aPragmaNode]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureAttribute: name for: aClass [ 
	 
	^(self scopeOfClass: aClass) 
		at: (self nameForInstanceVariable: name class: aClass) 
		ifAbsent: [self createAttribute: name for: aClass]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureClass: aClass [ 
	"aClass is aSmalltalk. This method returns a FAMIXClass" 
	 
	^classes 
		at: aClass 
		ifAbsent: [self createClass: aClass]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureClassVarAttribute: name for: aClass [


	^(self scopeOfClass: aClass)
			at: name
			ifAbsent:
				[self
					createClassVarAttribute: name
					for: aClass]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureGlobalVariable: name value: value [ 
	 
	^globals 
		at: name 
		ifAbsent: [self createGlobalVariable: name value: value]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureImplicitVariable: name inClass: aClass [
	
	^(self scopeOfClass: aClass)
		at: name
		ifAbsent:
			[self
				createSpecialVariable: name
				forClass: aClass]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureImplicitVariable: name inFamixMethod: aFAMIXMethod [
	
	"^ others detect: [:aFamixEntity |
		aFamixEntity mooseName = (aFAMIXMethod mooseName,'.',name) asSymbol
		] ifNone: [
			self createSpecialVariable: name forFamixMethod: aFAMIXMethod
		]."
	
	"I'm not sure using a dictionary of dictionaries is the best solution, But it is at least really better than the first solution above"
	^ (implicitVariables at: aFAMIXMethod ifAbsentPut: [Dictionary new])
		at: name ifAbsentPut: [self createSpecialVariable: name forFamixMethod: aFAMIXMethod].
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureMethod: aCompiledMethod [ 
	 
	^methods 
		at: aCompiledMethod 
		ifAbsent: [self createMethod: aCompiledMethod]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureNamespace: aNamespace [
	^ namespaces at: aNamespace asString asSymbol ifAbsent: [ self createNamespace: aNamespace ]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensurePackage: aPackageModel [ 
	 
	^packages 
		at: aPackageModel 
		ifAbsent: [self createPackage: aPackageModel]
]

{ #category : #'public-entity-creation' }
SmalltalkImporter >> ensureUnknownVariable: name [
	
	^globals
		at: name
		ifAbsent: [self createUnknownVariable: name]
]

{ #category : #accessing }
SmalltalkImporter >> factory [

	^ factory
]

{ #category : #accessing }
SmalltalkImporter >> factory: anObject [

	factory := anObject
]

{ #category : #accessing }
SmalltalkImporter >> famixClasses [
	"I return the Famix classes created by this importer. These classes might merge Smalltalk classes and metaclasses."
	
	^ classes values asSet
]

{ #category : #importing }
SmalltalkImporter >> importClass: aClass [ 
	 
	| class comment | 
	importingContext shouldImportClass 
		ifTrue: 
			[class := self ensureClass: aClass. 
			class stub: false.
			class attributes do: [ :each | each stub: false ].
			importingContext shouldImportPackage ifTrue: [
				class parentPackage stub: false ].
			importingContext shouldImportSubclasses ifTrue: [aClass subclasses do: [:each | self ensureClass: each]]. 
			importingContext shouldImportMethod 
				ifTrue: 
					[aClass methods do: [:each | self ensureMethod: each]. 
					self checkAbstractClass: class]. 
			importingContext shouldImportComment 
				ifTrue: 
					[aClass hasComment 
						ifTrue: 
							[comment := self addEntity: self factory comment new. 
							comment content: aClass comment asString. 
							comment container: class]]. 
			aClass isMeta ifFalse: [self importClass: aClass class]]
]

{ #category : #importing }
SmalltalkImporter >> importClassExtension: aClassExtension [ 
	 
	| method | 
	importingContext shouldImportClassExtension ifTrue: [
		method := self ensureMethod: aClassExtension.
		importingContext shouldImportPackage ifTrue: [
			method parentPackage isStub: false ].
 	]
]

{ #category : #'initialize-release' }
SmalltalkImporter >> initialize [ 
	super initialize. 
	methods := IdentityDictionary new. 
	classes := IdentityDictionary new. 
	namespaces := IdentityDictionary new. 
	packages := IdentityDictionary new. 
	globals := Dictionary new. 
	others := OrderedCollection new. 
	scopes := IdentityDictionary new.
	implicitVariables := IdentityDictionary new.
	annotationTypes := IdentityDictionary new.
]

{ #category : #'private accessing' }
SmalltalkImporter >> methods [
	
	^ methods
]

{ #category : #'private utils' }
SmalltalkImporter >> nameForInstanceVariable: name class: aClass [
	
    (importingContext shouldMergeClassAndMetaclass) 
		and: [aClass isMeta ifTrue: [ ^ self CIVString, name]].
	^ name
					
	
]

{ #category : #'private-entity-creation' }
SmalltalkImporter >> scopeOfClass: aClass [
	aClass ifNil: [ ^ nil ].
	^ scopes at: aClass ifAbsentPut: [ SmalltalkScope extend: (self scopeOfClass: aClass superclass) ]
]

{ #category : #accessing }
SmalltalkImporter >> size [ 
	 
	^(scopes sumNumbers: #size) + others size + methods size + self famixClasses size 
		+ packages size + namespaces size + globals size
]
