Class {
	#name : #SmaCCStepToNextRewriteAction,
	#superclass : #SmaCCTransformationToolkitDebugAction,
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #registration }
SmaCCStepToNextRewriteAction class >> gtActionFor: aDebugger [
	<gtSmaCCTransformationStack>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousThrough
]

{ #category : #accessing }
SmaCCStepToNextRewriteAction >> defaultKeymap [
	^ $t meta
]

{ #category : #accessing }
SmaCCStepToNextRewriteAction >> defaultLabel [
	^ 'Run to Next Rewrite'
]

{ #category : #accessing }
SmaCCStepToNextRewriteAction >> defaultOrder [
	^ 120
]

{ #category : #accessing }
SmaCCStepToNextRewriteAction >> executeAction [
	| rewrites |
	rewrites := (self session transformationStack collect: [ :each | self session rewriteForContext: each last ]) asSet.
	self
		stepUntil: [ :context | 
			context isBlockContext not
				and: [ (self session isRewriteContext: context) and: [ (rewrites includes: (self session rewriteForContext: context)) not ] ] ]
]

{ #category : #accessing }
SmaCCStepToNextRewriteAction >> help [
	^ 'Step until we get to another rewrite'
]
