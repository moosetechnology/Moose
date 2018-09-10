"
SmaCCCodeGenerator is an abstract class that is used to generate code. Subclasses are used to generate code for a particular language (e.g., Smalltalk, Java, etc.).

Subclasses must implement the following messages:
	code generation templates
		comment:
		method:type:
		method:type:argumentName:argumentType:
		method:type:argumentName:argumentType:argumentName:argumentType:
		reduceAction:
		send:to:with:
		send:to:with:with:
		send:to:with:with:with:
		superMessage:
		superMessage:argument:
		superMessage:argument:argument:
		variableReference:in:
	compiling
		compileChanges
		compileMethodWithoutFormattingIn:
		compileScannerClassIntoParser
		outputStreamClass
		removeOldMethods
	compiling-nodes
		compileInitializeMethod:
	compiling-scanner
		acceptStateEdge:
		closestIsExpressionsFor:seen:
		compileKeywordInitializerUsing:
		defineClass:asSubclassOf:
		outputInvertedMatchFor:on:
		outputIsSelector:on:
		outputMatchFor:on:without:
		scannerActionFor:
		scannerClass:
		selectorMap:
		writeMatchingCodeFor:
	private
		addVariable:forDefinition:
		defaultNodeReductionSource:
		removeOldMethodsFrom:
		send:to:
		writeTransitionTableEntry:on:firstIsType:
	reduction table
		basicCompileSourceFor:
		defaultReductionSource

Instance Variables
	ambiguousActions	<SequenceableCollection of: SequenceableCollection>	the ambiguous actions for the grammar
	codeStream	<Stream>	a stream for writing the code
	grammar	<SmaCCGrammar>	the grammar we are compiling
	model	<RBRootNamespace>	the model for the system that we are compiling
	parserClass	<RBClass>	the model's class for the parser
	reduceActionCache	<Dictionary key: SmaCCReduceAction value: String>	mapping from reduce actions to their code
	scannerClass	<RBClass>	the model's class for the scanner
"
Class {
	#name : #SmaCCCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'parserClass',
		'scannerClass',
		'model',
		'codeStream',
		'reduceActionCache',
		'ambiguousActions',
		'grammar',
		'defaultCategory'
	],
	#classInstVars : [
		'codeTemplates'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'code generation templates' }
SmaCCCodeGenerator class >> codeTemplates [
	^ codeTemplates
		ifNil:
			[ codeTemplates := IdentityDictionary new.
			self codeTemplatesArray
				do: [ :each | codeTemplates at: each first put: each last ].
			codeTemplates ]
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator class >> codeTemplatesArray [
	^ #(#(#override '') #(#trueValue 'true'))
]

{ #category : #accessing }
SmaCCCodeGenerator class >> parseSourceSelector [
	self subclassResponsibility
]

{ #category : #'class initialization' }
SmaCCCodeGenerator class >> reset [
	"self reset"

	codeTemplates := nil.
	self allSubclassesDo: [ :each | each reset ]
]

{ #category : #accessing }
SmaCCCodeGenerator class >> typeName [
	^ nil
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> acceptCharacterEdge: aSmaCCCharacterEdge seen: aCollection [
	| stream |
	stream := WriteStream with: String new.
	aSmaCCCharacterEdge transitionObjects size + aCollection size
		> SmaCCGrammar maximumCharacterValue
		ifTrue: [ ^ self trueValue ].
	stream nextPut: $(.
	aSmaCCCharacterEdge transitionObjects size
		= SmaCCGrammar maximumCharacterValue
		ifTrue: [ self
				outputInvertedMatchFor: aSmaCCCharacterEdge
				on: stream ]
		ifFalse:
			[ self
				outputMatchFor: aSmaCCCharacterEdge
				seen: aCollection
				on: stream ].
	stream nextPut: $).
	^ stream contents
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> acceptStateEdge: aSmaCCStateEdge [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> addParentAssignmentFor: aSmaCCVariableDefinition to: valueString [
	aSmaCCVariableDefinition isBaseNodeType
		ifFalse: [ ^ self ].
	aSmaCCVariableDefinition isCollection
		ifTrue:
			[ self
				nextPutStatement:
					(self
						send: #setParents:to:
						to: self receiverName
						with:
							(self
								cast:
									(self
										variableReference: aSmaCCVariableDefinition
										in: self receiverName)
								to: self collectionType)
						with: valueString) ]
		ifFalse:
			[ self
				nextPutLine:
					(self
						notNilCheckFor:
							(self
								variableReference: aSmaCCVariableDefinition
								in: self receiverName)).
			self
				nextPutStatement:
					(self
						send: #parent:
						to:
							(self
								cast:
									(self
										variableReference: aSmaCCVariableDefinition
										in: self receiverName)
								to: 'ParseNode')
						with: valueString).
			self nextPutStatement: self endConditionalString ]
]

{ #category : #private }
SmaCCCodeGenerator >> addVariable: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> ambiguousTableEntryFor: aCollection [
	| entry |
	entry := aCollection asArray.
	^ ambiguousActions
		indexOf: entry
		ifAbsent: [ ambiguousActions add: entry.
			ambiguousActions size ]
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> argumentIndex: anInteger [
	^ self at: 'nodes' index: anInteger
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> argumentIndex: anInteger subIndex: subIndex [
	^ self
		at: (self cast: (self argumentIndex: anInteger) to: self collectionType)
		index: subIndex
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> asStatement: methodMap forNode: aSmaCCNode lastNeedsReturn: aBoolean [
	| transitions seen |
	aSmaCCNode hasSimpleLoop
		ifTrue: [ self nextPutLine: self startDoWhileLoop ].
	self writeMatchingCodeFor: aSmaCCNode.
	transitions := self sortedTransitionsForNode: aSmaCCNode.
	seen := (transitions notEmpty
		ifTrue: [ transitions first setClass ]
		ifFalse: [ Set ]) new.
	transitions
		do:
			[ :each | 
			each to = aSmaCCNode
				ifTrue:
					[ self
						nextPutStatement: (self endDoWhileLoopWithClause: (each dispatchTo: self seen: seen)) ]
				ifFalse:
					[ self
						nextPutLine: (self startIfWithClause: (each dispatchTo: self seen: seen)).
					(methodMap at: each to ifAbsent: [ nil ])
						ifNil:
							[ self
								asStatement: methodMap
								forNode: each to
								lastNeedsReturn: each ~= transitions last ]
						ifNotNil:
							[ :methodCall | 
							self
								nextPutStatement: (self return: (self send: methodCall to: self receiverName)) ].
					self nextPutStatement: self endConditionalString ].
			seen addAll: each transitionObjects ].
	(aBoolean
		and: [ aSmaCCNode transitions notEmpty or: [ aSmaCCNode action isNil ] ])
		ifTrue:
			[ self
				nextPutStatement: (self return: (self send: #reportLastMatch to: self receiverName)) ]
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> assignVariable: variableName in: aSmaCCRHS at: key first: aBoolean [
	| variableIndex value |
	variableIndex := aSmaCCRHS productionSymbol indexOfVariable: variableName.
	value := self argumentIndex: key.
	self
		nextPutStatement: ((aSmaCCRHS productionSymbol isCollection: variableName)
				ifTrue: 
					[self
						perform: (aBoolean
								ifTrue: [#addFirstSendTo:with:]
								ifFalse: [#addSendTo:with:])
						with: (self cast: (self at: 'result' index: variableIndex)
								to: self collectionType)
						with: value]
				ifFalse: [self assignArray: 'result' index: variableIndex to: value])
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> basicCompileSourceFor: aSmaCCReduceAction [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> closestIsExpressionsFor: aSmaCCCharacterEdge seen: anObject [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> codeStream [
	codeStream isNil
		ifTrue: [ codeStream := self outputStream ].
	^ codeStream
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> comment: aString [
	self subclassResponsibility
]

{ #category : #accessing }
SmaCCCodeGenerator >> commonSupertypeBetween: modelClass and: anotherModelClass [
	^ (anotherModelClass includesClass: modelClass)
		ifTrue: [ modelClass ]
		ifFalse:
			[ (modelClass includesClass: anotherModelClass)
				ifTrue: [ anotherModelClass ]
				ifFalse:
					[ self
						commonSupertypeBetween: modelClass superclass
						and: anotherModelClass ] ]
]

{ #category : #accessing }
SmaCCCodeGenerator >> commonSupertypeOf: aCollection [
	aCollection isEmpty
		ifTrue: [ ^ self objectClass ].
	^ aCollection
		inject: aCollection anyOne
		into: [ :sum :each | self commonSupertypeBetween: sum and: each ]
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileAcceptNodeMethodFor: aSmaCCVisitorClassDefinition rootNode: aSmaCCClassDefinition [
	"Only needed if we are using a brain dead type system"

	
]

{ #category : #private }
SmaCCCodeGenerator >> compileAcceptVisitorMethod: aSmaCCNodeClassDefinition visitor: aSmaCCVisitorClassDefinition [
	aSmaCCNodeClassDefinition isRoot
		ifTrue: [ self startPublicVirtualMethod ]
		ifFalse: [ self startPublicOverrideMethod ].
	self
		nextPutLine:
			(self
				method: #acceptVisitor:
				type: self objectType
				argumentName: aSmaCCNodeClassDefinition tempNodeName , 'Visitor'
				argumentType: aSmaCCVisitorClassDefinition fullName);
		nextPutStatement:
			(self
				return:
					(self
						send: 'visit' , aSmaCCNodeClassDefinition name , ':'
						to: aSmaCCNodeClassDefinition tempNodeName , 'Visitor'
						with: self receiverName));
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileAmbiguousTransitions [
	| stream |
	ambiguousActions isEmpty
		ifTrue: [ ^ self ].
	stream := self outputStream.
	stream nextPutAll: self newUnsignedShortArrayArray.
	ambiguousActions
		do:
			[ :each | self writeTransitionTableEntry: each on: stream firstIsType: false ]
		separatedBy: [ stream nextPutAll: self literalArraySeparator ].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startPublicOverrideMethod;
		nextPutLine:
			(self
				method: 'ambiguousTransitions'
				type: self unsignedShortArrayArray);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileCacheId [
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileChanges [
	self subclassResponsibility
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileChildrenMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileCopyInContextMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileDefinitionComment: aString [
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: #definitionComment type: self voidType);
		nextPutLine: (self comment: aString);
		endMethod.
	self compileMethodWithoutFormattingIn: parserClass theMetaClass
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileEmptySymbolTokenId: emptySymbolId [
	self
		compileTokenIdMethodNamed: 'emptySymbolToken'
		withId: emptySymbolId
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileEqualMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileErrorSymbolTokenId: errorTokenId [
	self compileTokenIdMethodNamed: 'errorToken' withId: errorTokenId
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileGetterAndSetter: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition [
	| type typeName variableName definer |
	variableName := self
		nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName.
	type := aSmaCCVariableDefinition type.
	self
		setGetterMethodNameTo: aSmaCCVariableDefinition
		withName: variableName.
	definer := aSmaCCNodeClassDefinition modelClass
		whoDefinesMethod: aSmaCCVariableDefinition getterMethodName asSymbol.
	(definer isNil or: [ definer = self objectClass ])
		ifTrue:
			[ self
				startPublicVirtualMethod;
				nextPutLine:
					(self
						method: aSmaCCVariableDefinition getterMethodName
						type: type name);
				nextPutStatement: (self return: (self variableReference: aSmaCCVariableDefinition));
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ].
	aSmaCCVariableDefinition setterMethodName: variableName , ':'.
	definer := aSmaCCNodeClassDefinition modelClass
		whoDefinesMethod: aSmaCCVariableDefinition setterMethodName asSymbol.
	(definer isNil or: [ definer = self objectClass ])
		ifFalse: [ ^ self ].
	typeName := aSmaCCNodeClassDefinition temporaryNameFor: type name.
	self
		startPublicVirtualMethod;
		nextPutLine:
			(self
				method: aSmaCCVariableDefinition setterMethodName
				type: self voidType
				argumentName: typeName
				argumentType: type name);
		addParentAssignmentFor: aSmaCCVariableDefinition
			to: self undefinedObject;
		nextPutStatement: (self assignmentTo: variableName from: typeName);
		addParentAssignmentFor: aSmaCCVariableDefinition
			to: self receiverName;
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileHashMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileIgnoreCaseMethods [
	self grammar ignoreCase
		ifFalse: [ ^ self ].
	self
		startPublicOverrideMethod;
		nextPutLine:
			(self
				method: #keywordFor:
				type: self stringType
				argumentName: 'aString'
				argumentType: self stringType);
		nextPutStatement: (self return: (self uppercaseString: 'aString'));
		endMethod;
		compileMethodIn: scannerClass
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileInitializeMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileKeywordInitializerUsing: keywordMapDictionary [
	self subclassResponsibility
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileMatchInContextMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileMethodIn: modelClass [
	self subclassResponsibility
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileMethodWithoutFormattingIn: modelClass [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileNode: aSmaCCNode [
	| methodNodes methodMap |
	methodNodes := self statesToMakeIntoMethodsFor: aSmaCCNode.
	methodMap := self methodNameMap: aSmaCCNode forMethods: methodNodes.
	methodNodes
		do:
			[ :each | 
			each = aSmaCCNode
				ifTrue: [ self startProtectedOverrideMethod ]
				ifFalse: [ self startProtectedVirtualMethod ].
			self
				nextPutLine:
					(self
						method: (methodMap at: each)
						type: (model classFor: SmaCCToken) name).
			self asStatement: methodMap forNode: each lastNeedsReturn: true.
			self endMethod.
			self compileOptimizedMethodIn: scannerClass ]
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileNodeClassDefinition: aSmaCCClassDefinition [
	| class |
	class := self
		defineClass: aSmaCCClassDefinition fullName
		asSubclassOf: (self model classNamed: aSmaCCClassDefinition superclassName asSymbol).
	aSmaCCClassDefinition modelClass: class.
	self removeOldMethodsFrom: class.
	self removeOldMethodsFrom: class theMetaClass
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileOptimizedMethodIn: modelClass [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compilePostCopyMethod: aSmaCCNodeClassDefinition [
	self subclassResponsibility
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileReductionActions [
	
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileReductionTable: reductionTable [
	| stream |
	stream := self outputStream.
	stream nextPutAll: self reduceActionLiteralStart.
	reductionTable
		do:
			[ :each | 
			stream
				cr;
				tab;
				nextPutAll: (self reduceAction: each) ]
		separatedBy: [ stream nextPutAll: self literalArraySeparator ].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startProtectedOverrideMethod;
		nextPutLine: (self method: 'reduceTable' type: self reduceActionArrayType);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass
]

{ #category : #compiling }
SmaCCCodeGenerator >> compileScannerClassIntoParser [
	self subclassResponsibility
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> compileSourceFor: aSmaCCReduceAction [
	^ reduceActionCache
		at: aSmaCCReduceAction
		ifAbsentPut: [ self basicCompileSourceFor: aSmaCCReduceAction ]
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileStartingStateIds: startingStates [
	startingStates
		keysAndValuesDo:
			[ :symbol :position | 
			self
				startStaticMethod;
				nextPutLine:
					(self
						method: 'startingStateFor' , symbol compileName
						type: self unsignedShort);
				nextPutStatement: (self return: position printString);
				endMethod;
				compileMethodIn: parserClass theMetaClass ]
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileSymbolNames [
	| names |
	names := grammar symbols collect: [ :each | each name ].
	self compileSymbolNames: names asArray
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileSymbolNames: anArray [
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: 'symbolNames' type: self arrayType);
		nextPutStatement: (self return: anArray storeString);
		endMethod;
		compileMethodIn: self parserClass
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileSymbolTypes [
	| names |
	names := grammar symbols
		collect:
			[ :each | 
			| types previousSize |
			types := each modelTypes.
			previousSize := types size.
			types remove: (self model classFor: nil class) ifAbsent: [  ].
			(types isEmpty and: [ previousSize = 1 ])
				ifTrue: [ nil ]
				ifFalse: [ (self commonSupertypeOf: types) name ] ].
	self compileSymbolTypes: names asArray
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileSymbolTypes: anArray [
	
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> compileTokenIdMethodNamed: aString withId: symbolId [
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: aString , 'Id' type: self unsignedShort);
		nextPutStatement: (self return: symbolId printString);
		endMethod;
		compileMethodIn: scannerClass
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> compileTransitionTable: transitionTable [
	| stream |
	stream := self outputStream.
	stream nextPutAll: self newUnsignedShortArrayArray.
	transitionTable
		do:
			[ :each | self writeTransitionTableEntry: each on: stream firstIsType: true ]
		separatedBy: [ stream nextPutAll: self literalArraySeparator ].
	stream
		cr;
		tab;
		nextPutAll: self endLiteralArray.
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'transitionTable' type: self unsignedShortArrayArray);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodWithoutFormattingIn: parserClass.
	self compileAmbiguousTransitions
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileVariablesMethods: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-nodes' }
SmaCCCodeGenerator >> compileVisitMethodFor: aSmaCCNodeClassDefinition visitor: aSmaCCVisitorClassDefinition [
	| tempName |
	self
		compileAcceptVisitorMethod: aSmaCCNodeClassDefinition
		visitor: aSmaCCVisitorClassDefinition.
	tempName := aSmaCCNodeClassDefinition temporaryVariableName.
	self
		startPublicVirtualMethod;
		nextPutLine:
			(self
				method: 'visit' , aSmaCCNodeClassDefinition name , ':'
				type: self objectType
				argumentName: tempName
				argumentType: aSmaCCNodeClassDefinition fullName).
	self
		nextPutStatement:
			(self
				return:
					(self
						send:
							(aSmaCCNodeClassDefinition superclass notNil
								ifTrue: [ 'visit' , aSmaCCNodeClassDefinition superclass name
										, ':' ]
								ifFalse: [ 'visitSmaCCParseNode:' ])
						to: self receiverName
						with: tempName));
		endMethod;
		compileMethodIn: aSmaCCVisitorClassDefinition modelClass
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> createNodeReduceAction: aSmaCCRHS [
	^ self createNodeReduceAction: aSmaCCRHS pullUpFrom: 0
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> createNodeReduceAction: aSmaCCRHS pullUpFrom: anInteger [
	self resetCodeStream.
	self
		nextPutLine: (self variableDeclaration: 'result' ofType: aSmaCCRHS modelType name).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from:
					(anInteger isZero
						ifTrue: [ self newObject: aSmaCCRHS modelType name ]
						ifFalse:
							[ self
								cast: (self argumentIndex: anInteger)
								to: aSmaCCRHS modelType name ])).
	SmaCCReduceActionGenerator
		generate: aSmaCCRHS
		pullUp: anInteger
		on: self.
	self nextPutStatement: (self return: 'result').
	^ self codeStream contents
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> createVariableArrayFor: aSmaCCRHS [
	self
		nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from: (self initializeResultForReduceAction: aSmaCCRHS)).
	self initializeArrayContentsToNull: aSmaCCRHS.
	aSmaCCRHS productionSymbol collectionVariableDefinitions
		do:
			[ :each | 
			self
				nextPutStatement:
					(self
						assignArray: 'result'
						index: each index
						to: (self newCollectionOfSize: 2)) ]
]

{ #category : #'initialize-release' }
SmaCCCodeGenerator >> defaultCategory: aSymbol [
	defaultCategory := aSymbol
]

{ #category : #private }
SmaCCCodeGenerator >> defaultNodeReductionSource: aReduction [
	self subclassResponsibility
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> defaultReductionSource [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> defineClass: aString asSubclassOf: aSmaCCClass [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> doesNotUnderstand: failedMessage [
	"Use the code templates to expand the string."

	^ (self class codeTemplates
		at: failedMessage selector
		ifAbsent: [ ^ super doesNotUnderstand: failedMessage ])
		expandMacrosWithArguments: failedMessage arguments
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> endIteratorString [
	^ self endConditionalString
]

{ #category : #private }
SmaCCCodeGenerator >> endMethod [
	self codeStream nextPutAll: self endMethodString
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> glrParserClass: aClassOrString [
	| name existingClass superclass |
	name := (aClassOrString isKindOf: Behavior)
		ifTrue: [ aClassOrString name ]
		ifFalse: [ aClassOrString ].
	superclass := SmaCCGLRParser.
	existingClass := Smalltalk at: name asSymbol ifAbsent: [ nil ].
	(existingClass notNil and: [ existingClass superclass includesBehavior: superclass ])
		ifTrue: [ superclass := existingClass superclass ].
	(existingClass notNil and: [ defaultCategory isNil ])
		ifTrue: [ defaultCategory := existingClass category ].
	parserClass := self defineClass: name asSubclassOf: superclass
]

{ #category : #accessing }
SmaCCCodeGenerator >> grammar [
	^ grammar
]

{ #category : #accessing }
SmaCCCodeGenerator >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> initialMethodStatesFor: aSmaCCNode [
	| allStates incoming |
	allStates := aSmaCCNode allStates.
	incoming := Dictionary new.
	allStates
		do:
			[ :each | 
			each transitions
				do:
					[ :edge | 
					each ~= edge to
						ifTrue: [ (incoming at: edge to ifAbsentPut: [ Set new ])
								add: each ] ] ].
	^ allStates
		select:
			[ :each | 
			aSmaCCNode = each
				or:
					[ each isTerminalNode not
						and: [ (incoming at: each ifAbsent: [ #() ]) size > 1 ] ] ]
]

{ #category : #'initialize-release' }
SmaCCCodeGenerator >> initialize [
	super initialize.
	reduceActionCache := Dictionary new.
	ambiguousActions := OrderedCollection new
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> initializeArrayContentsToNull: aSmaCCRHS [
	
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> initializeResultForReduceAction: aSmaCCRHS [
	^ self
		newArrayOfSize: aSmaCCRHS productionSymbol variableDefinitions size
]

{ #category : #private }
SmaCCCodeGenerator >> keywords [
	^ #()
]

{ #category : #private }
SmaCCCodeGenerator >> maxJumpSize [
	^ SmallInteger maxVal
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> method: aString type: typeString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> method: aString type: anObject argumentName: argumentNameString argumentType: argumentTypeString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> method: aString type: anObject argumentName: firstArgumentNameString argumentType: firstArgumentTypeString argumentName: secondArgumentNameString argumentType: secondArgumentTypeString [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> methodNameFor: aString [
	^ aString
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> methodNameMap: aSmaCCNode forMethods: methodNodes [
	| index methodMap |
	methodMap := Dictionary new.
	index := 0.
	methodNodes
		do:
			[ :value | 
			methodMap
				at: value
				put:
					(value = aSmaCCNode
						ifTrue: [ #scanForToken ]
						ifFalse: [ 'scan' , (index := index + 1) printString ]) ].
	^ methodMap
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> minMaxPairsFor: aSmaCCCharacterEdge without: isSelectors [
	| start last pairs charsLeft |
	charsLeft := aSmaCCCharacterEdge transitionObjects.
	isSelectors notEmpty
		ifTrue: [ charsLeft := charsLeft copy.
			isSelectors do: [ :each | charsLeft smaccRemoveAll: (SmaCCGrammar isExpressionMap at: each) ] ].
	pairs := OrderedCollection new.
	charsLeft isEmpty
		ifTrue: [ ^ pairs ].
	last := charsLeft first.
	start := nil.
	charsLeft
		do: [ :each | 
			last asInteger + 1 = each asInteger
				ifFalse: [ start notNil
						ifTrue: [ pairs add: (Array with: start with: last) ].
					start := each ].
			last := each ].
	pairs add: (Array with: start with: last).
	^ pairs
]

{ #category : #private }
SmaCCCodeGenerator >> model [
	^ model
]

{ #category : #accessing }
SmaCCCodeGenerator >> namespaceName [
	^ ''
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> nextPut: aCharacter [
	self codeStream nextPut: aCharacter
]

{ #category : #private }
SmaCCCodeGenerator >> nextPutLine: aString [
	self codeStream
		nextPutAll: aString;
		cr
]

{ #category : #private }
SmaCCCodeGenerator >> nextPutStatement: aString [
	self codeStream
		nextPutAll: aString;
		nextPutAll: self statementSeparator;
		cr
]

{ #category : #private }
SmaCCCodeGenerator >> nodeType [
	^ (model classFor: SmaCCParseNode) name
]

{ #category : #private }
SmaCCCodeGenerator >> nonKeywordNameFor: aString [
	| word |
	word := aString.
	[ self keywords includes: word ] whileTrue: [ word := '_' , word ].
	^ word
]

{ #category : #accessing }
SmaCCCodeGenerator >> objectClass [
	^ model classFor: Object
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> outputInvertedMatchFor: aSmaCCCharacterEdge on: stream [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> outputIsSelector: isSelector on: stream [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> outputMatchFor: aSmaCCCharacterEdge on: aStream without: aSelector [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> outputMatchFor: aSmaCCCharacterEdge seen: aCollection on: stream [
	| isSelectors |
	isSelectors := self
		closestIsExpressionsFor: aSmaCCCharacterEdge
		seen: aCollection.
	isSelectors
		do: [ :each | self outputIsSelector: each on: stream ]
		separatedBy: [ stream nextPutAll: ' or: [' ].
	self
		outputMatchFor: aSmaCCCharacterEdge
		on: stream
		without: isSelectors
]

{ #category : #private }
SmaCCCodeGenerator >> outputStream [
	^ self outputStreamClass with: String new
]

{ #category : #compiling }
SmaCCCodeGenerator >> outputStreamClass [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> parseSourceSelector [
	^ self class parseSourceSelector
]

{ #category : #compiling }
SmaCCCodeGenerator >> parserClass [
	^ parserClass
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> parserClass: aClassOrString [
	| name existingClass superclass |
	name := (aClassOrString isKindOf: Behavior)
		ifTrue: [ aClassOrString name ]
		ifFalse: [ aClassOrString ].
	superclass := SmaCCParser.
	existingClass := Smalltalk at: name asSymbol ifAbsent: [ nil ].
	(existingClass notNil
		and:
			[ (existingClass superclass includesBehavior: superclass)
				and: [ (existingClass includesBehavior: SmaCCGLRParser) not ] ])
		ifTrue: [ superclass := existingClass superclass ].
	(existingClass notNil and: [ defaultCategory isNil ])
		ifTrue: [ defaultCategory := existingClass category ].
	parserClass := self defineClass: name asSubclassOf: superclass
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> possiblyGuardNil: each around: aBlock [
	each isAlwaysAssigned
		ifTrue: [ aBlock value ]
		ifFalse:
			[ self
				nextPutLine:
					(self
						notNilCheckFor: (self variableReference: each in: self receiverName)).
			aBlock
				ensure: [ self nextPutStatement: self endConditionalString ] ]
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> processTransitionTable: transitionTable [
	| table |
	table := OrderedCollection new.
	transitionTable do: [ :each | table addLast: each ].
	^ table
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> pullUpVariableArrayFor: aSmaCCRHS index: recursionIndex [
	self nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self nextPutStatement: (self assignmentTo: 'result' from: (self cast: (self argumentIndex: recursionIndex) to: self collectionType))
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> pullUpVariableFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger first: aBoolean [
	| variableValue rhsIndex variable |
	variable := aSmaCCSymbol variableDefinitions first.
	variableValue := self argumentIndex: anInteger.
	rhsIndex := aSmaCCRHS productionSymbol
				indexOfVariable: variable variableName.
	self
		nextPutStatement: ((aSmaCCRHS productionSymbol
				isCollection: variable variableName)
					ifTrue: 
						[| collectionValue |
						collectionValue := self cast: (self at: 'result' index: rhsIndex)
									to: self collectionType.
						(aSmaCCSymbol isCollection: variable variableName)
							ifTrue: 
								[self
									perform: (aBoolean
											ifTrue: [#addAllFirstSendTo:with:]
											ifFalse: [#addAllSendTo:with:])
									with: collectionValue
									with: (self cast: variableValue to: self collectionType)]
							ifFalse: 
								[self
									perform: (aBoolean
											ifTrue: [#addFirstSendTo:with:]
											ifFalse: [#addSendTo:with:])
									with: collectionValue
									with: variableValue]]
					ifFalse: [self assignArray: 'result' index: rhsIndex to: variableValue])
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> pullUpVariablesFrom: aSmaCCSymbol into: aSmaCCRHS index: anInteger first: aBoolean [
	aSmaCCSymbol variableDefinitions do: 
			[:each |
			| variableValue rhsIndex |
			variableValue := self argumentIndex: anInteger
						subIndex: (aSmaCCSymbol indexOfVariable: each variableName).
			rhsIndex := aSmaCCRHS productionSymbol indexOfVariable: each variableName.
			self
				nextPutStatement: ((aSmaCCRHS productionSymbol
						isCollection: each variableName)
							ifTrue: 
								[| collectionValue |
								collectionValue := self cast: (self at: 'result' index: rhsIndex)
											to: self collectionType.
								(aSmaCCSymbol isCollection: each variableName)
									ifTrue: 
										[self
											perform: (aBoolean
													ifTrue: [#addAllFirstSendTo:with:]
													ifFalse: [#addAllSendTo:with:])
											with: collectionValue
											with: (self cast: variableValue to: self collectionType)]
									ifFalse: 
										[self
											perform: (aBoolean
													ifTrue: [#addFirstSendTo:with:]
													ifFalse: [#addSendTo:with:])
											with: collectionValue
											with: variableValue]]
							ifFalse: [self assignArray: 'result' index: rhsIndex to: variableValue])]
]

{ #category : #private }
SmaCCCodeGenerator >> recursionIndexFor: aSmaCCRHS [
	| vars index recursionIndex |
	index := 1.
	recursionIndex := 0.
	vars := aSmaCCRHS productionSymbol variableDefinitions.
	aSmaCCRHS do: 
			[:each |
			(each returnsVariableCollection and: 
					[| rhsVars |
					rhsVars := each variableDefinitions.
					rhsVars size = vars size and: 
							[(1 to: rhsVars size) allSatisfy: 
									[:i |
									| var otherVar |
									var := rhsVars at: i.
									otherVar := vars at: i.
									var variableName = otherVar variableName
										and: [var isCollection = otherVar isCollection]]]])
				ifTrue: [recursionIndex := index].
			index := index + 1].
	^recursionIndex
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> reduceAction: anArray [
	self subclassResponsibility
]

{ #category : #compiling }
SmaCCCodeGenerator >> removeOldMethods [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> removeOldMethodsFrom: aRBClass [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> resetCodeStream [
	codeStream := nil
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> scannerActionFor: aString [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> scannerClass: aString [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> selectorMap: aDictionary [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> send: selector to: aString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> send: selectorString to: receiverString with: argumentString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString with: thirdArgumentString [
	self subclassResponsibility
]

{ #category : #'compiling-parser' }
SmaCCCodeGenerator >> setGetterMethodNameTo: aSmaCCVariableDefinition withName: variableName [
	aSmaCCVariableDefinition
		getterMethodName: (self methodNameFor: variableName)
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> singleVariableCollectionFor: reduceCode [
	| variable recursionIndex |
	variable := reduceCode rhs productionSymbol variableDefinitions asArray first variableName.
	self resetCodeStream.
	recursionIndex := reduceCode indices
		detect:
			[:i | 
			| symbol |
			symbol := reduceCode rhs at: i.
			symbol isNode not and: [symbol isCollection: variable]]
		ifNone: [0].
	self nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from:
					(recursionIndex = 0
						ifTrue: [self newCollectionOfSize: 2]
						ifFalse: [self cast: (self argumentIndex: recursionIndex) to: self collectionType])).
	reduceCode indices
		do:
			[:i | 
			i = recursionIndex
				ifFalse:
					[| symbol |
					symbol := reduceCode rhs at: i.
					self
						nextPutStatement:
							((symbol isNode not and: [symbol isCollection: variable])
								ifTrue:
									[self
										perform: (recursionIndex > i ifTrue: [#addAllFirstSendTo:with:] ifFalse: [#addAllSendTo:with:])
										with: 'result'
										with: (self argumentIndex: i)]
								ifFalse:
									[self
										perform: (recursionIndex > i ifTrue: [#addFirstSendTo:with:] ifFalse: [#addSendTo:with:])
										with: 'result'
										with: (self argumentIndex: i)])]].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^self codeStream contents
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> sortedTransitionsForNode: aSmaCCNode [
	^ aSmaCCNode transitions
		asSortedCollection:
			[ :a :b | 
			a isCharacterTransition
				and:
					[ b isCharacterTransition not
						or:
							[ | aPairs bPairs |
							aPairs := self minMaxPairsFor: a without: #().
							bPairs := self minMaxPairsFor: b without: #().
							aPairs size < bPairs size
								or:
									[ aPairs size = bPairs size
										and:
											[ a transitionObjects size < b transitionObjects size
												or: [ a transitionObjects size = b transitionObjects size and: [ a <= b ] ] ] ] ] ] ]
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> splitLargeNodes: methodStates [
	"Split nodes that might generate long jumps that may not compile (longer than 16 bit offset)."

	| todo |
	todo := OrderedCollection withAll: methodStates.
	[ todo notEmpty ]
		whileTrue: [ | node |
			node := todo removeFirst.
			node transitions
				do: [ :edge | 
					((methodStates includes: edge to) not and: [ (edge to codeSizeEstimate: methodStates) > self maxJumpSize ])
						ifTrue: [ methodStates add: edge to.
							todo addLast: edge to ] ] ]
]

{ #category : #private }
SmaCCCodeGenerator >> startProtectedOverrideMethod [
	self resetCodeStream.
	self codeStream
		nextPutAll: self protected;
		nextPutAll: self override
]

{ #category : #private }
SmaCCCodeGenerator >> startProtectedVirtualMethod [
	self resetCodeStream.
	self codeStream
		nextPutAll: self protected;
		nextPutAll: self virtual
]

{ #category : #private }
SmaCCCodeGenerator >> startPublicOverrideMethod [
	self resetCodeStream.
	self codeStream
		nextPutAll: self public;
		nextPutAll: self override
]

{ #category : #private }
SmaCCCodeGenerator >> startPublicVirtualMethod [
	self resetCodeStream.
	self codeStream
		nextPutAll: self public;
		nextPutAll: self virtual
]

{ #category : #private }
SmaCCCodeGenerator >> startStaticMethod [
	self resetCodeStream.
	self codeStream nextPutAll: self static
]

{ #category : #private }
SmaCCCodeGenerator >> startStaticPrivateMethod [
	self resetCodeStream.
	self codeStream
		nextPutAll: self static;
		nextPutAll: self private
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> statesToMakeIntoMethodsFor: aSmaCCNode [
	| methodStates |
	methodStates := self initialMethodStatesFor: aSmaCCNode.
	self splitLargeNodes: methodStates.
	^ methodStates asSortedCollection: [ :a :b | a id < b id ]
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> superMessage: aString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> superMessage: aString argument: argumentString [
	self subclassResponsibility
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> superMessage: aString argument: firstArgumentString argument: secondArgumentString [
	self subclassResponsibility
]

{ #category : #'reduction table' }
SmaCCCodeGenerator >> variableArrayAction: aSmaCCRHS [
	| recursionIndex |
	self resetCodeStream.
	recursionIndex := self recursionIndexFor: aSmaCCRHS.
	recursionIndex = 0
		ifTrue: [self createVariableArrayFor: aSmaCCRHS]
		ifFalse: [self pullUpVariableArrayFor: aSmaCCRHS index: recursionIndex].
	aSmaCCRHS collection keysAndValuesDo: 
			[:key :value |
			key = recursionIndex
				ifFalse: 
					[| variableName |
					variableName := aSmaCCRHS variableNameForIndex: key.
					variableName isNil
						ifTrue: 
							[value returnsVariableCollection
								ifTrue: 
									[self
										pullUpVariablesFrom: value
										into: aSmaCCRHS
										index: key
										first: recursionIndex > key]
								ifFalse: 
									[value returnsSingleVariable
										ifTrue: 
											[self
												pullUpVariableFrom: value
												into: aSmaCCRHS
												index: key
												first: recursionIndex > key]
										ifFalse: 
											[value modelType = (self model classFor: nil class)
												ifFalse: [aSmaCCRHS generateUnnamedSymbolWarningFor: key]]]]
						ifFalse: 
							[value returnsVariableCollection
								ifTrue: [aSmaCCRHS generateNamedVariableCollectionWarningFor: key].
							self
								assignVariable: variableName
								in: aSmaCCRHS
								at: key
								first: recursionIndex > key]]].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^self codeStream contents
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> variableReference: aSmaCCVariableDefinition [
	^ self nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName
]

{ #category : #'code generation templates' }
SmaCCCodeGenerator >> variableReference: aSmaCCVariableDefinition in: aString [
	self subclassResponsibility
]

{ #category : #'compiling-scanner' }
SmaCCCodeGenerator >> writeMatchingCodeFor: aSmaCCNode [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> writeTransitionTableEntry: anArray on: aStream firstIsType: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
SmaCCCodeGenerator >> writeTransitionTableMethod: stream withIndex: index withArray: array [
	self
		startStaticPrivateMethod;
		nextPutLine:
			(self
				method: 'transitionTable' , index printString
				type: self voidType
				argumentName: array
				argumentType: self unsignedShortArrayArray);
		nextPutStatement: stream contents;
		endMethod;
		compileMethodWithoutFormattingIn: parserClass
]
