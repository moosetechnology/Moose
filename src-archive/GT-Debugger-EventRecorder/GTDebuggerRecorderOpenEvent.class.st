"
I model the action of opening the debugger.
"
Class {
	#name : #GTDebuggerRecorderOpenEvent,
	#superclass : #GTDebuggerRecorderEvent,
	#category : #'GT-Debugger-EventRecorder-Events'
}

{ #category : #'instance creation' }
GTDebuggerRecorderOpenEvent class >> fromDebugger: aDebugger [

	^ self new fromDebugger: aDebugger
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> addSourceFor: aDebugger [
	(Privacy sendSourceCode and: [ self isTitleAKernelException: aDebugger title ]) ifTrue: [ self infoAt: #source put: aDebugger currentContext sourceCode ].
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> addTitleFor: aDebugger [
	(Privacy sendEntityNames or: [ self isTitleAKernelException: aDebugger title ]) ifTrue: [ self infoAt: #title put: aDebugger title ].
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> debuggerClass [
	^ self infoAt: #debuggerClass
]

{ #category : #initialization }
GTDebuggerRecorderOpenEvent >> fromDebugger: aDebugger [

	self infoAt: #debuggerClass put: aDebugger class name.
	self addWindowHashFor: aDebugger.
	self addTitleFor: aDebugger.
	self addSourceFor: aDebugger.
]

{ #category : #initialization }
GTDebuggerRecorderOpenEvent >> initialize [
	super initialize.
	self initializeObfuscated.
]

{ #category : #testing }
GTDebuggerRecorderOpenEvent >> isOpenDebugger [
	^ true
]

{ #category : #private }
GTDebuggerRecorderOpenEvent >> isTitleAKernelException: aString [
	^ (#Kernel asPackage classTagNamed: #Exceptions) classes anySatisfy: [ :e | e name == aString asSymbol ]
]

{ #category : #printing }
GTDebuggerRecorderOpenEvent >> printOn: stream [
	stream nextPutAll: 'Open debugger'
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> source [
	^ self infoAt: #source ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> title [
	^ self infoAt: #title ifAbsent: [ nil ]
]

{ #category : #accessing }
GTDebuggerRecorderOpenEvent >> windowHash [
	^ self infoAt: #windowHash ifAbsent: [ nil ]
]
