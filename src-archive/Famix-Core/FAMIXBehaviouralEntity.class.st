"
FAMIXBehaviouralEntity is an abstract superclass for any kind of behavior. For example, functions and methods. It has a name because it is a named entity but it also has a signature in the format: methodName(paramType1, paramType2). The signature property is necessary for a behavioral entity. An external parser should provide a few metrics that cannot be derived from the model such as cyclomatic complexity, numberOfStatements and numberOfConditionals. Other metrics can be computed from the model if enough information is provided such as numberOfLinesOfCode (from source anchor) and numberOfComments (from FAMIXComment).

It provides properties to manage:
(i)  parameters
(ii) local variables
(iii) accesses to variables, and
(iv) invocations to and from other behavioural entities.

Optionally, it can also specify a declaredType (e.g. return types for functions). This is useful for modeling behaviours from statically typed languages.
"
Class {
	#name : #FAMIXBehaviouralEntity,
	#superclass : #FAMIXContainerEntity,
	#instVars : [
		'outgoingReferences',
		'outgoingInvocations',
		'incomingInvocations',
		'localVariables',
		'implicitVariables',
		'parameters',
		'signature',
		'accesses',
		'declaredType'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXBehaviouralEntity class >> annotation [
	<MSEClass: #BehaviouralEntity super: #FAMIXContainerEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> accesses [
	<MSEProperty: #accesses type: #FAMIXAccess opposite: #accessor>	<multivalued>	<derived>
	<MSEComment: 'Accesses to variables made by this behaviour.'>
	
	^ accesses
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> accesses: anAccess [ 
	accesses value: anAccess
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addAccess: anAccess [ 
	accesses add: anAccess
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addImplicitVariable: anImplicitVariable [
	implicitVariables add: anImplicitVariable
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addIncomingInvocation: anInvocation [
	incomingInvocations add: anInvocation
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addOutgoingInvocation: anInvocation [
	outgoingInvocations add: anInvocation
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addOutgoingReference: aReference [ 
	outgoingReferences add: aReference
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> addParameter: aParameter [ 
	parameters add: aParameter
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> declaredType [
	<MSEProperty: #declaredType type: #FAMIXType opposite: #behavioursWithDeclaredType>
	<MSEComment: 'Type of the behavioral entity, if any'>
	^ declaredType
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> declaredType: aType [
	declaredType :=  FMMultivalueLink on: self
					update: #behavioursWithDeclaredType 
					from: self declaredType
					to: aType
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> implicitVariables [
	<MSEProperty: #implicitVariables type: #FAMIXImplicitVariable opposite: #parentBehaviouralEntity> <multivalued> <derived>
	<MSEComment: 'Implicit variables used locally by this behaviour.'>
	
	^ implicitVariables
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> implicitVariables: aCollectionOfImplicitVariables [
	implicitVariables value: aCollectionOfImplicitVariables
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> incomingInvocations [
	<MSEProperty: #incomingInvocations type: #FAMIXInvocation opposite: #candidates> <multivalued> <derived>
	<MSEComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	
	^incomingInvocations
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> incomingInvocations: anInvocation [
	incomingInvocations value: anInvocation
]

{ #category : #'moosequery-queries-incoming' }
FAMIXBehaviouralEntity >> incomingTypeDeclarations [
	^ {}
]

{ #category : #'initialize-release' }
FAMIXBehaviouralEntity >> initialize [
	super initialize.
	outgoingInvocations := FMNullMultivalueLink on: self opposite: #sender: selector: #outgoingInvocations.
	incomingInvocations := FMMultiMultivalueLink on: self opposite: #candidates.
	localVariables := FMNullMultivalueLink on: self opposite: #parentBehaviouralEntity: selector: #localVariables.
	implicitVariables := FMNullMultivalueLink on: self opposite: #parentBehaviouralEntity: selector: #implicitVariables.
	parameters := FMNullMultivalueLink on: self opposite: #parentBehaviouralEntity: selector: #parameters.
	accesses := FMNullMultivalueLink on: self opposite: #accessor: selector: #accesses.
	outgoingReferences := FMNullMultivalueLink on: self opposite: #source: selector: #outgoingReferences
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> localVariables [
	<MSEProperty: #localVariables type: #FAMIXLocalVariable opposite: #parentBehaviouralEntity> <multivalued> <derived>
	<MSEComment: 'Variables locally defined by this behaviour.'>
	
	^localVariables
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> localVariables: aLocalVariable [
	localVariables value: aLocalVariable
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> outgoingInvocations [
	<MSEProperty: #outgoingInvocations type: #FAMIXInvocation opposite: #sender> <multivalued> <derived>
	<MSEComment: 'Outgoing invocations sent by this behaviour.'>
	
	^outgoingInvocations
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> outgoingInvocations: outgoing [
	outgoingInvocations value: outgoing
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> outgoingReferences [
	<MSEProperty: #outgoingReferences type: #FAMIXReference opposite: #source> <multivalued> <derived>
	<MSEComment: 'References from this entity to other entities.'>
	
	^outgoingReferences
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> outgoingReferences: aReference [
	outgoingReferences value: aReference
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXBehaviouralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseChefTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> parameters [
	<MSEProperty: #parameters type: #FAMIXParameter opposite: #parentBehaviouralEntity> <multivalued> <derived>
	<MSEComment: 'List of formal parameters declared by this behaviour.'>
	
	^parameters
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> parameters: param [
	parameters value: param
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> signature [
	<MSEProperty: #signature type: #String>
	<MSEComment: 'Signature characterizing this behaviour.'>
	
	^signature
]

{ #category : #accessing }
FAMIXBehaviouralEntity >> signature: aString [

	signature := aString.
	self resetMooseName
]
