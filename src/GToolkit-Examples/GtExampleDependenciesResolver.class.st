"
I know how to extract the dependencies of a given example. The dependencies of a given example consists in message sends to other method constructing an example. 

To determine if a message send represents a dependency to a method containing an example, I use heuristic defined by subclasses of ==GtExampleDependencyResolver==. 

"
Class {
	#name : #GtExampleDependenciesResolver,
	#superclass : #Object,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #accessing }
GtExampleDependenciesResolver class >> default [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #cleanup }
GtExampleDependenciesResolver class >> reset [
	instance := nil
]

{ #category : #actions }
GtExampleDependenciesResolver class >> resolveDependenciesForExample: anExample [
	^ self default resolveDependenciesForExample: anExample
]

{ #category : #'system startup' }
GtExampleDependenciesResolver class >> startUp [

	self reset
]

{ #category : #accessing }
GtExampleDependenciesResolver >> dependencyResolvers [
	^ resolvers
]

{ #category : #initialization }
GtExampleDependenciesResolver >> initialize [
	super initialize.
	resolvers := { 
		GtExampleSelfDependencyResolver new .
		GtExampleSuperDependencyResolver new .
		GtExampleExternalDependencyResolver new }
]

{ #category : #actions }
GtExampleDependenciesResolver >> resolveDependenciesForExample: anExample [
	| exampleDependencies |
	
	exampleDependencies := OrderedCollection new.
	anExample method ast nodesDo: [ :aNode | 
		self withExampleFrom: aNode fromMethod: anExample method ifPresentDo: [ :possibleExampleDependency |
			exampleDependencies 
					detect: [ :anotherExample | anotherExample = possibleExampleDependency ]
					ifNone: [ exampleDependencies add: possibleExampleDependency ] ] ].
	^ exampleDependencies
]

{ #category : #'private - iterating' }
GtExampleDependenciesResolver >> withExampleFrom: anASTNode fromMethod: aCompiledMethod ifPresentDo: anActionBlock [
	self dependencyResolvers 
		detect: [ :aResolver | aResolver appliesTo: anASTNode ]
		ifFound: [ :aResolver | 
			(aResolver 
				posibleExampleForNode: anASTNode 
				fromMethod: aCompiledMethod) 
					ifNotNil: [ :anExample | anActionBlock value: anExample ]  ]
]
