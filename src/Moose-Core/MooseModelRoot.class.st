"
Moose model root is a simple singleton container. 

We use this third class for holding a MooseModel instance because we want **all** the instances (and subinstances) of MooseModel to be registered in there.
"
Class {
	#name : #MooseModelRoot,
	#superclass : #Object,
	#classInstVars : [
		'instance',
		'root'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
MooseModelRoot class >> installRoot: aRoot [
	root := aRoot
]

{ #category : #accessing }
MooseModelRoot class >> installedRoot [
	^ root
]

{ #category : #accessing }
MooseModelRoot class >> resetRoot [
	self installRoot: nil
]

{ #category : #accessing }
MooseModelRoot class >> root [
	^ self installedRoot
		ifNil: [ self
				installRoot:
					(MooseModel new
						name: 'Root';
						yourself).
			self installedRoot ]
]
