Class {
	#name : #SmaCCStepRuleDebugAction,
	#superclass : #SmaCCTransformationToolkitDebugAction,
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #registration }
SmaCCStepRuleDebugAction class >> gtActionFor: aDebugger [
	<gtSmaCCTransformationStack>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousOver
]

{ #category : #accessing }
SmaCCStepRuleDebugAction >> defaultKeymap [
	^ $o meta
]

{ #category : #accessing }
SmaCCStepRuleDebugAction >> defaultLabel [
	^ 'Over'
]

{ #category : #accessing }
SmaCCStepRuleDebugAction >> defaultOrder [
	^ 100
]

{ #category : #accessing }
SmaCCStepRuleDebugAction >> executeAction [
	self session stepOver: self currentContext
]

{ #category : #accessing }
SmaCCStepRuleDebugAction >> help [
	^ 'Step over message'
]
