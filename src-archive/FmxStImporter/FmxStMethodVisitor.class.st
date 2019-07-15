Class {
	#name : #FmxStMethodVisitor,
	#superclass : #SmalltalkMethodVisitor,
	#category : #FmxStImporter
}

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> createAccessTo: aNamedEntity writing: isWriteAccess [
	| access |
	
	access := FmxStAccess new.
	access isWrite: isWriteAccess ; variable: aNamedEntity ; accessor: self methodEntity.
	^ access
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> createReferenceTo: aNamedEntity [
	| ref |
	
	ref := FmxStReference new.
	ref source: self methodEntity ; target: (self resolveInstanceSide: aNamedEntity).
	^ ref
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> extractCommentsFromNode: aSequenceNode [

	| comment |
	importer importingContext shouldImportComment
		ifTrue:
			[aSequenceNode comments
				do:
					[:eachComment | 
					comment := FmxStComment new.
					comment content: (aSequenceNode source 
										copyFrom: eachComment start
										to: eachComment stop) asString.
					comment container: self methodEntity.
					importer addEntity: comment]]
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> matchGetter: aMethodNode [ 
	 
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
													[attribute class = FmxStAttribute ifTrue: [famixMethod kind: #getter]]]]]]]
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> matchSetter: aMethodNode [ 
	 
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
											[attribute class = FmxStAttribute 
												ifTrue: 
													[assignment value isVariable 
														ifTrue: 
															[assignment value name = aMethodNode arguments first name 
																ifTrue: [famixMethod kind: #setter]]]]]]]]
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> resolveInstanceSide: aNamedEntity [
	"We ensure that a reference to a metaclass is considered as a reference to the class itself"

	((aNamedEntity isKindOf: FmxStClass) and: ['*_class' match: aNamedEntity name])
		ifTrue: [| className |
				className := aNamedEntity name removeSuffix: '_class'.
				^ importer ensureClass: (Smalltalk at: className asSymbol) ]
		ifFalse: [ ^ aNamedEntity ]
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> visitAssignmentNode: anAssignmentNode [ 
	 
	| access | 
	importer importingContext shouldImportAccess 
		ifTrue: 
			[access := FmxStAccess new. 
			access isWrite: true.
			access variable: (self resolve: anAssignmentNode variable name). 
			access accessor: self methodEntity.
			importer addEntity: access]. 
	self extractCommentsFromNode: anAssignmentNode. 
	self visitNode: anAssignmentNode value
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> visitBlockNode: aBlockNode [ 
	 
	| local | 
	importer importingContext shouldImportLocalVariable 
		ifTrue: 
			[aBlockNode arguments 
				do: 
					[:aVariableNode |  
					local := FmxStLocalVariable new. 
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
FmxStMethodVisitor >> visitMessageNode: aMessageNode [ 
	 
	| invocation | 
	importer importingContext shouldImportInvocation 
		ifTrue: 
			[invocation := FmxStInvocation new. 
			invocation sender: self methodEntity. 
			
			invocation signature: (FAMIXNameResolver signatureFromSmalltalkSelectorOn: aMessageNode selector).
			"invocation  
				setInvokes: 
					(FAMIXNameResolver signatureFromSmalltalkSelector: aMessageNode selector)." 
			aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						receiver: (self resolve: aMessageNode receiver name)]. 
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
FmxStMethodVisitor >> visitMethodNode: aMethodNode [ 
	 
	importer importingContext shouldImportArgument 
		ifTrue: 
			[aMethodNode arguments 
				do: 
					[:aVariableNode | | argument | 
					argument := FmxStParameter new. 
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

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> visitPragmaNode: aPragmaNode [

	<todo>

	| annotationInstance annotationType |
	annotationType := self importer ensureAnnotationType: aPragmaNode.
	annotationInstance := FmxStAnnotationInstance new.
	"annotationInstance annotationType: annotationType."
	self importer addEntity: annotationInstance.
	annotationInstance annotatedEntity: self methodEntity.
	aPragmaNode arguments doWithIndex: [:each :i |
		| attribute |
		attribute := FmxStAnnotationInstanceAttribute new.
		attribute value: each value.
		attribute parentAnnotationInstance: annotationInstance.
		"attribute annotationTypeAttribute: (annotationInstance annotationType attributes at: i)."
		self importer addEntity: attribute ]
]

{ #category : #'visitor-double dispatching' }
FmxStMethodVisitor >> visitSequenceNode: aSequenceNode [ 
	"self visitArguments: aSequenceNode temporaries." 
	 
	| local | 
	importer importingContext shouldImportLocalVariable 
		ifTrue: 
			[aSequenceNode temporaries 
				do: 
					[:aVariableNode |  
					local := FmxStLocalVariable new. 
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
FmxStMethodVisitor >> visitVariableNode: aVariableNode [ 
	| access namedEntity global |
		
	importer importingContext shouldImportAccess ifTrue: 
		[ 
		"Warning! Smalltalk is both a Namespace and a GlobalVariable.
		By default the importer resolves Smalltalk to the namespace (for class and namespace creation).
		When we access Smalltalk as a variable, we create an access to the SmalltalkGlobalVariable instead"
		aVariableNode name = 'Smalltalk'
			ifTrue: [ 
				global := importer ensureGlobalVariable: #SmalltalkGlobalVariable value: Smalltalk.
				access := self createAccessTo: global writing: false]
			ifFalse: [
				namedEntity := self resolve: aVariableNode name.
				access := (namedEntity isKindOf: FmxStBehavior)
					ifTrue: [ self createReferenceTo: namedEntity ]
					ifFalse: [ self createAccessTo: namedEntity writing: false ] ].
		importer addEntity: access ].
	self extractCommentsFromNode: aVariableNode
]
