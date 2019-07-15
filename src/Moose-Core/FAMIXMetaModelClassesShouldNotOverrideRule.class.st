Class {
	#name : #FAMIXMetaModelClassesShouldNotOverrideRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule class >> uniqueIdentifierName [
	^ 'MetaModelClassShouldNotOverride'
]

{ #category : #running }
FAMIXMetaModelClassesShouldNotOverrideRule >> checkClass: aContext [
	|class  |
	class := aContext.
	
	(self metaModelClasses includes: class) 
		ifTrue: [
			self selectorsThatShouldNotBeOverriden do: [:each |
				(class includesSelector: each)
					ifTrue: [
						result addClass: class  selector: each
						].
			].
		].
]

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule >> group [
	^ 'FAMIX'
]

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity allSubclasses].
]

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule >> name [

	^ 'A metamodel class override a method that it should not override'
]

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule >> rationale [

	^ 'check if a metamodel class (FAMIXEntity and all its subclasses) override some methods that it should not override. Those methods are specified by RBFAMIXMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverriden'
]

{ #category : #accessing }
FAMIXMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverriden [

	^ #(#mooseName #printString #gtDisplayString)
]
