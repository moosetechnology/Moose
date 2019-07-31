Class {
	#name : #MoosePlantUMLGizmoEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

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
