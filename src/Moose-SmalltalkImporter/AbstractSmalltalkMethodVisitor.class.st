Class {
	#name : #AbstractSmalltalkMethodVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'methodScope',
		'importer',
		'famixMethod',
		'theClass'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'instance creation' }
AbstractSmalltalkMethodVisitor class >> on: importer [ 
	 
	^(self new) 
		importer: importer; 
		yourself
]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> classifyMethodNode: aMethodNode [ 
	 
	self matchGetter: aMethodNode. 
	self matchSetter: aMethodNode. 
	self matchConstructor: aMethodNode. 
	self matchConstant: aMethodNode
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> createAccessTo: aNamedEntity writing: isWriteAccess [
	| access |
	
	access := self importer factory access new.
	access isWrite: isWriteAccess ; variable: aNamedEntity ; accessor: self methodEntity.
	^ access
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> createReferenceTo: aNamedEntity [

	| referenceClass |
	
	referenceClass := self importer factory reference.
	
	^ referenceClass source: self methodEntity target: (self resolveInstanceSide: aNamedEntity)

	
]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> extractCommentsFromNode: aSequenceNode [

	| comment |
	importer importingContext shouldImportComment
		ifTrue:
			[aSequenceNode comments
				do:
					[:eachComment | 
					comment := self importer factory comment new.
					comment content: (aSequenceNode source 
										copyFrom: eachComment start
										to: eachComment stop) asString.
					comment container: self methodEntity.
					importer addEntity: comment]]
]

{ #category : #accessing }
AbstractSmalltalkMethodVisitor >> importer [ 
	 
	^importer
]

{ #category : #accessing }
AbstractSmalltalkMethodVisitor >> importer: anObject [ 
	 
	importer := anObject
]

{ #category : #initialization }
AbstractSmalltalkMethodVisitor >> initializeForMethod: aMethod inClass: aClass [
	theClass := aClass.
	famixMethod := aMethod.
	methodScope := SmalltalkScope extend: (importer scopeOfClass: aClass).

]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> matchConstant: aMethodNode [ 
	aMethodNode body isSequence 
		ifTrue: 
			[aMethodNode body statements isEmpty 
				ifFalse: 
					[aMethodNode body statements last isReturn 
						ifTrue: 
							[aMethodNode body statements last value isLiteralNode
								ifTrue: [famixMethod kind: #constant]]]]
]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> matchConstructor: aMethodNode [ 
	 
	famixMethod protocol notNil 
		ifTrue: 
			[('*instance*creation*' match: famixMethod protocol asLowercase) 
				ifTrue: [famixMethod kind: #constructor]]
]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> matchGetter: aMethodNode [ 
	 
	| return attribute | 
	aMethodNode arguments isEmpty 
		ifTrue: 
			[aMethodNode body isSequence 
				ifTrue: 
					[aMethodNode body statements size = 1 
						ifTrue: 
							[return := aMethodNode body statements first. 
							return isReturn 
								ifTrue: 
									[return value isVariable 
										ifTrue: 
											[attribute := methodScope 
												resolve: return value name 
												ifAbsent: nil. 
											attribute notNil 
												ifTrue: 
													[attribute class = self importer factory attribute ifTrue: [famixMethod kind: #getter]]]]]]]
]

{ #category : #'method-classifying' }
AbstractSmalltalkMethodVisitor >> matchSetter: aMethodNode [ 
	 
	| assignment attribute | 
	aMethodNode arguments size = 1 
		ifTrue: 
			[aMethodNode body isSequence 
				ifTrue: 
					[aMethodNode body statements size = 1 
						ifTrue: 
							[assignment := aMethodNode body statements first. 
							assignment isReturn ifTrue: [assignment := assignment value]. 
							assignment isAssignment 
								ifTrue: 
									[attribute := methodScope 
										resolve: assignment variable name 
										ifAbsent: nil. 
									attribute notNil 
										ifTrue: 
											[attribute class = self importer factory attribute 
												ifTrue: 
													[assignment value isVariable 
														ifTrue: 
															[assignment value name = aMethodNode arguments first name 
																ifTrue: [famixMethod kind: #setter]]]]]]]]
]

{ #category : #accessing }
AbstractSmalltalkMethodVisitor >> methodEntity [ 
	 
	^famixMethod
]

{ #category : #private }
AbstractSmalltalkMethodVisitor >> parseTreeForSource: methodSourceString [
	^ RBParser parseMethod: methodSourceString
		onError: [:aString :pos | ^nil]
]

{ #category : #private }
AbstractSmalltalkMethodVisitor >> resolve: name [ 
	"Return a famix entity that correspond to the reference 'name' contained in a source code. It does the lookup according to the Smalltalk semantics"

	self subclassResponsibility 
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> resolveInstanceSide: aNamedEntity [
	"We ensure that a reference to a metaclass is considered as a reference to the class itself"

	((aNamedEntity isKindOf: self importer factory classEntity) and: ['*_class' match: aNamedEntity name])
		ifTrue: [| className |
				className := aNamedEntity name removeSuffix: '_class'.
				^ importer ensureClass: (Smalltalk at: className asSymbol) ]
		ifFalse: [ ^ aNamedEntity ]
]

{ #category : #accessing }
AbstractSmalltalkMethodVisitor >> runWith: aCompiledMethod and: anEntity [ 
	| parseTree |
	self initializeForMethod: anEntity inClass: aCompiledMethod methodClass.

	parseTree := theClass parseTreeFor: aCompiledMethod selector.
	parseTree ifNotNil: [ self visitMethodNode: parseTree	"sourceCodeAt:" ]
]

{ #category : #accessing }
AbstractSmalltalkMethodVisitor >> runWithSource: sourceAsString and: aFamixMethod [
	| parseTree |
	self initializeForMethod: aFamixMethod inClass: aFamixMethod parentType.

	parseTree := self parseTreeForSource: sourceAsString. 
	parseTree ifNotNil: [self visitMethodNode: parseTree]	"sourceCodeAt:"
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitArgument: each [ 
	"Here to allow subclasses to detect arguments or temporaries." 
	 
	^self visitNode: each
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitAssignmentNode: anAssignmentNode [ 
	 
	| access | 
	importer importingContext shouldImportAccess 
		ifTrue: 
			[access := self importer factory access new. 
			access isWrite: true.
			access variable: (self resolve: anAssignmentNode variable name). 
			access accessor: self methodEntity.
			importer addEntity: access]. 
	self extractCommentsFromNode: anAssignmentNode. 
	self visitNode: anAssignmentNode value
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitBlockNode: aBlockNode [ 
	 
	| local | 
	importer importingContext shouldImportLocalVariable 
		ifTrue: 
			[aBlockNode arguments 
				do: 
					[:aVariableNode |  
					local := self importer factory localVariable new. 
					local name: aVariableNode name asSymbol. 
					local parentBehaviouralEntity: self methodEntity. 
					importer addEntity: local. 
					methodScope 
						at: aVariableNode name 
						bind: local]]. 
	self extractCommentsFromNode: aBlockNode.	"self visitArguments: aBlockNode arguments." 
	self visitNode: aBlockNode body
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitCascadeNode: aCascadeNode [ 
	 
	aCascadeNode messages isEmpty 
		ifFalse: 
			[aCascadeNode messages yourself do: [:each | self visitNode: each]]. 
	self extractCommentsFromNode: aCascadeNode
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitMessageNode: aMessageNode [ 
	 
	| invocation | 
	importer importingContext shouldImportInvocation 
		ifTrue: 
			[invocation := self importer factory invocation new. 
			invocation sender: self methodEntity. 
			
			invocation signature: (self importer factory nameResolver signatureFromSmalltalkSelectorOn: aMessageNode selector).
			"invocation  
				setInvokes: 
					(FAMIXNameResolver signatureFromSmalltalkSelector: aMessageNode selector)." 
			aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						receiver: (self resolve: aMessageNode receiver name asString)]. 
			"aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						setReceivingVariable: (self resolve: aMessageNode receiver name)]. "
			aMessageNode selector == #subclassResponsibility 
				ifTrue: [self methodEntity isAbstract: true]. 
			importer addEntity: invocation]. 
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded]) 
		ifTrue: [self visitNode: aMessageNode receiver]. 
	importer importingContext shouldImportArgument 
		ifTrue: [aMessageNode arguments do: [:each | self visitNode: each]]. 
	self extractCommentsFromNode: aMessageNode
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitMethodNode: aMethodNode [ 
	 
	importer importingContext shouldImportArgument 
		ifTrue: 
			[aMethodNode arguments 
				do: 
					[:aVariableNode | | argument | 
					argument := self importer factory parameter new. 
					argument name: aVariableNode name asSymbol. 
					argument parentBehaviouralEntity: self methodEntity. 
					importer addEntity: argument. 
					methodScope 
						at: aVariableNode name 
						bind: argument]]. 
	self extractCommentsFromNode: aMethodNode.
	self visitNode: aMethodNode body. 
	aMethodNode pragmas
		do: [ :each | self visitNode: each ].
		
	"recognize getters/setters/constructors/..."
	self classifyMethodNode: aMethodNode
]

{ #category : #visiting }
AbstractSmalltalkMethodVisitor >> visitNode: aNode [ 
	"	aNode comments do: [ :comment | 
		comment halt ]." 
	 
	^aNode acceptVisitor: self
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitPragmaNode: aPragmaNode [
	| annotationInstance annotationType |
	annotationType := self importer ensureAnnotationType: aPragmaNode.
	annotationInstance := self importer factory annotationInstance new.
	annotationInstance annotationType: annotationType.
	self importer addEntity: annotationInstance.
	annotationInstance annotatedEntity: self methodEntity.
	aPragmaNode arguments doWithIndex: [:each :i |
		| attribute |
		attribute := self importer factory annotationInstanceAttribute new.
		attribute value: each value.
		attribute parentAnnotationInstance: annotationInstance.
		attribute annotationTypeAttribute: (annotationInstance annotationType attributes at: i).
		self importer addEntity: attribute ]
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitReturnNode: aReturnNode [ 
	 
	self visitNode: aReturnNode value. 
	self extractCommentsFromNode: aReturnNode
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitSequenceNode: aSequenceNode [ 
	"self visitArguments: aSequenceNode temporaries." 
	 
	| local | 
	importer importingContext shouldImportLocalVariable 
		ifTrue: 
			[aSequenceNode temporaries 
				do: 
					[:aVariableNode |  
					local := self importer factory localVariable new. 
					local name: aVariableNode name asSymbol. 
					local parentBehaviouralEntity: self methodEntity. 
					importer addEntity: local. 
					methodScope 
						at: aVariableNode name 
						bind: local]]. 
	self extractCommentsFromNode: aSequenceNode. 
	aSequenceNode statements do: [:each | self visitNode: each]
]

{ #category : #'visitor-double dispatching' }
AbstractSmalltalkMethodVisitor >> visitVariableNode: aVariableNode [
	importer importingContext shouldImportAccess
		ifTrue: [ | access namedEntity global |
			"Warning! Smalltalk is both a Namespace and a GlobalVariable.
		By default the importer resolves Smalltalk to the namespace (for class and namespace creation).
		When we access Smalltalk as a variable, we create an access to the SmalltalkGlobalVariable instead"
		aVariableNode name = 'Smalltalk'
			ifTrue: [ 
				global := importer ensureGlobalVariable: #SmalltalkGlobalVariable value: Smalltalk.
				access := self createAccessTo: global writing: false]
			ifFalse: [
				namedEntity := self resolve: aVariableNode name.
				access := (namedEntity isKindOf: self importer factory classEntity)
					ifTrue: [ self createReferenceTo: namedEntity ]
					ifFalse: [ self createAccessTo: namedEntity writing: false ] ].
		importer addEntity: access ].
	self extractCommentsFromNode: aVariableNode
]
