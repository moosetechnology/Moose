Class {
	#name : #FAMIXMetaModelClassesNotDeclaredInFameRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
FAMIXMetaModelClassesNotDeclaredInFameRule class >> uniqueIdentifierName [
	^ 'MetaModelClassesNotDeclaredInFame'
]

{ #category : #running }
FAMIXMetaModelClassesNotDeclaredInFameRule >> checkClass: aContext [
	|class  pragmas |
	class := aContext.

	(self metaModelClasses includes: class instanceSide)
		ifTrue: [
			pragmas := class metamodelDefinitionPragmas.
			pragmas ifEmpty: [
				class isMeta ifTrue: [ result addClass: class ].
			^ self ].
		pragmas size > 1 ifTrue: [ result addClass: class. ^ self ].
	]
]

{ #category : #accessing }
FAMIXMetaModelClassesNotDeclaredInFameRule >> group [
	^ 'FAMIX'
]

{ #category : #accessing }
FAMIXMetaModelClassesNotDeclaredInFameRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity withAllSubclasses].
]

{ #category : #accessing }
FAMIXMetaModelClassesNotDeclaredInFameRule >> name [

	^ 'A metamodel class is not properly Fame-described by a <MSEClass:super:> pragma'
]

{ #category : #accessing }
FAMIXMetaModelClassesNotDeclaredInFameRule >> rationale [

	^ 'check if a metamodel class is properly declared using a <MSEClass:super:> pragma. Additionally, this pragma should be in a #annotation class-side method, although this is not enforced. Default Moose tools are resilient with respect to metamodel descriptions, and accept as metamodel classes any subclass of MooseEntity. This rule enforces that all such classes are properly described in Fame, ensuring proper use by strict tools.'
]

{ #category : #running }
FAMIXMetaModelClassesNotDeclaredInFameRule >> resultClass [

	^ RBClassEnvironment 
]
