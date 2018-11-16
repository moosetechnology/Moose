"
(TypeCollector typeTmpsIn: (ASampleClass>>#return) ofClass: ASampleClass)
"
Class {
	#name : #PharoTypeCollector,
	#superclass : #TypeCollector,
	#category : #'RoelTyper-Pharo'
}

{ #category : #heuristics }
PharoTypeCollector >> assignmentTypeOf: val [
	val isBehavior ifTrue: [^val].
	val isVariableBinding
		ifTrue:
			[val key == #instcreation
				ifTrue: [^val value]
				ifFalse: [^val value class]].
	^nil
]

{ #category : #heuristics }
PharoTypeCollector >> languageSpecificPushSendOf: selector to: rec args: args [
	(#(#// #quo: #rem: #\\ #ceiling #floor #rounded #roundTo: #truncated #truncateTo: #/ #+ #- #* #abs #negated #reciprocal)
		includes: selector)
		ifTrue:
			[^self
				tryUsing: rec
				for: selector
				ifNotUse: Number].
	(selector = #yourself) ifTrue: [^rec].
	(rec = #self and: [(theClass methodDict includesKey: selector)]) ifTrue: [^#return->selector].
	^#computed
]

{ #category : #private }
PharoTypeCollector >> newExtractor [
	^PharoInstvarInterfaceExtractor new
]
