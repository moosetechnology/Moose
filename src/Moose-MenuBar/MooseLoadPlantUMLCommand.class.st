Class {
	#name : #MooseLoadPlantUMLCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadPlantUMLCommand class >> help [

	^ 'Pharo support for PlantUML'
]

{ #category : #'world menu' }
MooseLoadPlantUMLCommand class >> label [

	^ 'PlantUML Gizmo'
]

{ #category : #'world menu' }
MooseLoadPlantUMLCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseLoadPlantUMLCommand class >> menuPriority [

	^ 40
]

{ #category : #accessing }
MooseLoadPlantUMLCommand >> baselineName [

	^ 'PUGizmo'
]

{ #category : #accessing }
MooseLoadPlantUMLCommand >> repositoryURL [

	^ 'github://fuhrmanator/PlantUMLPharoGizmo:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadPlantUMLCommand >> version [

	^ 'master'
]
