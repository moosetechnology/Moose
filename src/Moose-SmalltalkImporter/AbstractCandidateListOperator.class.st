Class {
	#name : #AbstractCandidateListOperator,
	#superclass : #MooseOperator,
	#instVars : [
		'groups',
		'importer'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'as yet unclassified' }
AbstractCandidateListOperator class >> runOn: aMooseModel importer: anImporter [
	 
	^(self on: aMooseModel) 
		importer: anImporter;
		run
]

{ #category : #running }
AbstractCandidateListOperator >> allCandidatesFor: invocation [ 
	 
	^Array 
		withAll: 
			(groups 
				at: invocation signature 
				ifAbsent: #())
]

{ #category : #running }
AbstractCandidateListOperator >> basicRun [ 
	 
	model allInvocations 
		do: 
			[:invocation |  
			self computeCandidateListFor: invocation. 
			"self reifyIncomingInvocationsFor: invocation. "
			self increment]
]

{ #category : #running }
AbstractCandidateListOperator >> computeCandidateListFor: anInvocation [ 
	"this method will dispatch the work according anInvogroups  reveiver type. Each subclass implements a different strategy according what you want to import: maybe you don't want to import any candidates, maybe only for receivers enough simple to compute easily the list ('self', 'super', a Class) , ..."
	^ self subclassResponsibility 
]

{ #category : #running }
AbstractCandidateListOperator >> computeCandidateListFor: anInvocation withBaseClass: aClass [ 
	 
	aClass ~~ nil 
		ifTrue: 
			[| candidate | 
			candidate := aClass implementationOf: anInvocation signature. 
			(candidate ~~ nil and: [candidate isAbstract not]) 
				ifTrue: [anInvocation candidates: (Array with: candidate)]]
]

{ #category : #running }
AbstractCandidateListOperator >> computeCandidateListFor: anInvocation withReceivingClass: aClass [ 
	 
	| candidate candidates | 
	aClass ~~ nil 
		ifTrue: 
			[candidates := self allCandidatesFor: anInvocation. 
			candidates := candidates 
				select: [:each | each belongsTo inheritsFrom: aClass]. 
			candidate := aClass implementationOf: anInvocation signature. 
			(candidate ~~ nil and: [candidate isAbstract not]) 
				ifTrue: [candidates := candidates copyWith: candidate]. 
			anInvocation candidates: candidates]
]

{ #category : #running }
AbstractCandidateListOperator >> computeInstanceVariableCandidateListFor: anInvocation [

	| roelTyperResult allCandidates classContainingInvocation instVarSymbol |
	classContainingInvocation := Smalltalk at: (anInvocation receiver belongsTo name).
	instVarSymbol := anInvocation receiver name.
	roelTyperResult := (TypeCollector typeInstvar: instVarSymbol ofClassWithLookup: classContainingInvocation) types.
	"roelTyperResult := (TypeCollector typeInstvar: instVarSymbol ofClass: (self containerOf: instVarSymbol asString startingAt: classContainingInvocation )) assignments. "
	
	allCandidates := self allCandidatesFor: anInvocation .
	
	roelTyperResult isEmpty
	 	ifTrue: [
			anInvocation candidates: (self allCandidatesFor: anInvocation ).				
		]
		ifFalse: [
			allCandidates := allCandidates select: [:each | roelTyperResult includes: each belongsTo name].
			anInvocation candidates: allCandidates .
		].
	
	
	^ roelTyperResult 
]

{ #category : #running }
AbstractCandidateListOperator >> computeTemporaryVariableCandidateListFor: anInvocation [ 
	 "For now, I am call by noone because I am a work in progress."
	| roelTyperResult allCandidates classContainingInvocation tmpVarSymbol methodSelector compiledMethod key types |
	classContainingInvocation := Smalltalk at: (anInvocation receiver belongsTo belongsTo  name).
	tmpVarSymbol := anInvocation receiver name.
	methodSelector := anInvocation receiver belongsTo name.
	compiledMethod := classContainingInvocation methodDict at: methodSelector.
	roelTyperResult := (TypeCollector typeTmpsIn: compiledMethod  ofClass:  classContainingInvocation ) . 
	key := roelTyperResult keys detect: [:each | each = tmpVarSymbol asString].
	types := (roelTyperResult at: key) types.
	
	allCandidates := self allCandidatesFor: anInvocation .
	
	types isEmpty
	 	ifTrue: [
			anInvocation candidates: (self allCandidatesFor: anInvocation ).				
		]
		ifFalse: [
			allCandidates := allCandidates select: [:each | types includes: each belongsTo name].
			anInvocation candidates: allCandidates .
		].
	
	
	^ types 
]

{ #category : #accessing }
AbstractCandidateListOperator >> description [ 
	 
	^'Computing candidate list for <1p> invocations'
		expandMacrosWith: model allInvocations size
]

{ #category : #accessing }
AbstractCandidateListOperator >> importer [
	^ importer
]

{ #category : #accessing }
AbstractCandidateListOperator >> importer: anObject [
	importer := anObject
]

{ #category : #accessing }
AbstractCandidateListOperator >> length [ 
	 
	^model allInvocations size
]

{ #category : #running }
AbstractCandidateListOperator >> setUp [ 
	
	"dont call 'model allMethods' here because it sorts the group and we dont care at this level"
	groups := ((model allWithType: self importer factory method) reject: #isAbstract) groupedBy: #signature
]
