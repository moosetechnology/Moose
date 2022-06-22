Class {
	#name : #MooseLoadPlantUMLMenuCommand,
	#superclass : #MooseAbstractLoadModuleMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand class >> help [

	^ 'Pharo support for PlantUML'
]

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand class >> label [

	^ 'PlantUML Gizmo'
]

{ #category : #'world menu' }
MooseLoadPlantUMLMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand class >> menuPriority [

	^ 40
]

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand >> baselineName [

	^ 'PUGizmo'
]

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand >> repositoryURL [

	^ 'github://fuhrmanator/PlantUMLPharoGizmo:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadPlantUMLMenuCommand >> version [

	^ 'master'
]
