"
I describe all objects which satisfy particular predicate.

	10 should satisfy: [ :num | num > 2 ] 

My instances can be created by: 
	
	SpecOfObjectStateByPredicate from:  [ :num | num > 2 ] 
	 
Internal Representation and Key Implementation Points.

    Instance Variables
	predicate:		<BlockClosure>

"
Class {
	#name : #SpecOfObjectStateByPredicate,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'predicate'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfObjectStateByPredicate class >> from: valuablelWithOneArg [ 
	^self new predicate: valuablelWithOneArg
]

{ #category : #testing }
SpecOfObjectStateByPredicate >> basicMatches: anObject [ 
	^predicate value: anObject
]

{ #category : #accessing }
SpecOfObjectStateByPredicate >> debugValidationFailingOver: aSpecFailed [
	"
	[SpecDSLAcceptanceTests new customTestForArbitraryBlock] fork
	"
	| mainProcess |
	aSpecFailed allowExtraDebugging.
	UnhandledError signalForException: aSpecFailed.

	mainProcess := Processor activeProcess.
	[
	mainProcess 
		completeTo: aSpecFailed signalerContext sender; 
		restartTop;	
		stepToHome: predicate asContext;
		debug] forkAt: mainProcess priority.
	mainProcess suspend
]

{ #category : #displaying }
SpecOfObjectStateByPredicate >> defaultTitle [
	^'satisfy: ' , predicate stringForSpecTitle
]

{ #category : #accessing }
SpecOfObjectStateByPredicate >> predicate [
	^predicate
]

{ #category : #accessing }
SpecOfObjectStateByPredicate >> predicate: aBlockContext [ 
	predicate := aBlockContext
]
