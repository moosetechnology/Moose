Class {
	#name : #MoosePlantUMLGizmoEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MoosePlantUMLGizmoEntry class >> menuPriority [

	^ 40
]

{ #category : #execution }
MoosePlantUMLGizmoEntry >> execute [
	Metacello new
		repository: 'github://fuhrmanator/PlantUMLPharoGizmo:' , self version, '/src';
		baseline: 'PUGizmo';
		load
]

{ #category : #accessing }
MoosePlantUMLGizmoEntry >> label [
	^ 'PlantUML Gizmo'
]

{ #category : #accessing }
MoosePlantUMLGizmoEntry >> version [
	^ 'master'
]
