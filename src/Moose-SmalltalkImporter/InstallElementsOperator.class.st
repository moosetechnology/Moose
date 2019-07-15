"
InstallElementsOperator's' responsibility is to add famix entities (probably collected by other tasks such MooseCompositeImporterTask) into a model.

InstallElementsOperator>>with: runOn: populates a Moose model with elements.

Instance Variables
	container:		<Object>

container
	- contains (MOOSE model -) elements

"
Class {
	#name : #InstallElementsOperator,
	#superclass : #MooseOperator,
	#instVars : [
		'container'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #running }
InstallElementsOperator class >> with: elements on: aMooseModel [ 
	 
	^ (self on: aMooseModel) 
		container: elements;
		yourself

]

{ #category : #running }
InstallElementsOperator class >> with: elements runOn: aMooseModel [ 
	 
	^(self on: aMooseModel) 
		container: elements; 
		run
]

{ #category : #running }
InstallElementsOperator >> basicRun [ 
	 
	model entityStorage forSetup. 
	self container 
		do: 
			[:each |  
			model add: each. 
			self increment]. 
	model entityStorage forRuntime
]

{ #category : #accessing }
InstallElementsOperator >> container [ 
	 
	^container
]

{ #category : #accessing }
InstallElementsOperator >> container: anObject [ 
	 
	container := anObject
]

{ #category : #accessing }
InstallElementsOperator >> description [ 
	 
	^'Installing <1p> entities in Moose model' 
		expandMacrosWith: self container size
]

{ #category : #accessing }
InstallElementsOperator >> length [ 
	 
	^self container size
]
