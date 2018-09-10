Class {
	#name : #TypeMergerTestsRoot,
	#superclass : #RoelTypingTestRoot,
	#instVars : [
		'mergeResult'
	],
	#category : #'RoelTyper-Tests'
}

{ #category : #auxiliary }
TypeMergerTestsRoot >> mergeClass [
	^self subclassResponsibility
]

{ #category : #auxiliary }
TypeMergerTestsRoot >> mergeInterfaceTypes: interfaceTypes assignmentTypes: assignmentTypes [
	mergeResult := self mergeClass
		interfaceTypes: interfaceTypes
		assignmentTypes: assignmentTypes
]
