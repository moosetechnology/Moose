Class {
	#name : #MoosePlantUMLGizmoEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> help [

	^ 'Pharo support for PlantUML'
]

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> label [

	^ 'PlantUML Gizmo'
]

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> menuPriority [

	^ 40
]

{ #category : #accessing }
MoosePlantUMLGizmoEntry >> baselineName [

	^ 'PUGizmo'
]

{ #category : #accessing }
MoosePlantUMLGizmoEntry >> repositoryURL [

	^ 'github://fuhrmanator/PlantUMLPharoGizmo:' , self version , '/src'
]

{ #category : #accessing }
MoosePlantUMLGizmoEntry >> version [

	^ 'master'
]
