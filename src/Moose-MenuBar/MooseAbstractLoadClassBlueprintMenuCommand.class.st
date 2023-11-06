Class {
	#name : #MooseAbstractLoadClassBlueprintMenuCommand,
	#superclass : #MooseAbstractLoadToolMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseAbstractLoadClassBlueprintMenuCommand class >> label [

	^ 'Class Blueprint'
]

{ #category : #'world menu' }
MooseAbstractLoadClassBlueprintMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseAbstractLoadClassBlueprintMenuCommand class >> menuPriority [

	^ super menuPriority + 1
]

{ #category : #accessing }
MooseAbstractLoadClassBlueprintMenuCommand >> baselineName [

	^ 'ClassBlueprint'
]

{ #category : #accessing }
MooseAbstractLoadClassBlueprintMenuCommand >> repositoryURL [

	^ 'github://moosetechnology/ClassBlueprint:' , self version , '/src'
]

{ #category : #accessing }
MooseAbstractLoadClassBlueprintMenuCommand >> version [

	^ 'master'
]
