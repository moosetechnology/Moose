"
A MooseImportClassesTask is an elementary importing action which is called by the MooseCompositeImporterTask.
Normally you should not call it directly. The results of MooseImportClassesTask is a list of entitie which are not yet installed in a model.

MooseImportClassesTask pays attention to import classes and their extensions nicely.

A MooseImportClassesTask does not deal directly with a model. It just creates entities that will be installed in a model. The installation 
is trigged by the MooseCompositeImporterTask and implemented by InstallElementsOperator.


"
Class {
	#name : #MooseImportClassesTask,
	#superclass : #MooseImportingTask,
	#instVars : [
		'classes',
		'classExtensions'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #adding }
MooseImportClassesTask >> addAll: classCollection [ 
	 
	^classCollection do: [:each | self addClass: each]
]

{ #category : #adding }
MooseImportClassesTask >> addAllExtensions: extCollection [ 
	 
	^extCollection do: [:each | self addClassExtension: each]
]

{ #category : #adding }
MooseImportClassesTask >> addClass: aClass [ 
	 
	^classes add: aClass
]

{ #category : #adding }
MooseImportClassesTask >> addClassExtension: aClassExtension [ 
	 
	^classExtensions add: aClassExtension 
]

{ #category : #running }
MooseImportClassesTask >> basicRun [ 
	 
	| importer | 
	importer := importerClass new importingContext: importingContext. 
	self classes 
		do: 
			[:class |  
			importer importClass: class. 
			self increment].
	self classExtensions 
		do: 
			[:ext |  
			importer importClassExtension: ext].  
	^importer
]

{ #category : #accessing }
MooseImportClassesTask >> classExtensions [ 
	 
	^classExtensions 
]

{ #category : #accessing }
MooseImportClassesTask >> classes [ 
	 
	^classes
]

{ #category : #accessing }
MooseImportClassesTask >> description [ 
	 
	^'Importing <1p> classes from Smalltalk' 
		expandMacrosWith: self classes size
]

{ #category : #'initialize-release' }
MooseImportClassesTask >> initialize [
	super initialize. 
	classes := IdentitySet new. 
	classExtensions := IdentitySet new.
]

{ #category : #accessing }
MooseImportClassesTask >> length [ 
	 
	^self classes size
]
