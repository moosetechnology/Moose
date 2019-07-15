Class {
	#name : #Jdt2FamixSettings,
	#superclass : #Object,
	#classInstVars : [
		'jdt2famixPath'
	],
	#category : #'Moose-Settings'
}

{ #category : #'accessing settings' }
Jdt2FamixSettings class >> defaultJdt2FamixPath [ 
	^ 'jdt2famix'
]

{ #category : #'accessing settings' }
Jdt2FamixSettings class >> jdt2famixPath [

	^ jdt2famixPath ifNil: [jdt2famixPath := 'jdt2famix']
	
]

{ #category : #'accessing settings' }
Jdt2FamixSettings class >> jdt2famixPath: aString [

	jdt2famixPath := aString
	
]

{ #category : #verveinej }
Jdt2FamixSettings class >> settingsOn: aBuilder [
	<moosesettings>

	(aBuilder group: #jdt2famix)
		label: 'jdt2famix' translated;
		description: 'Path of folder where to look for jdt2famix.sh ' translated;
		parent: #moose;
		with: [
			(aBuilder setting: #jdt2famixPath)
				label: 'jdt2famix.sh path' translated;
				target: self;
				default: Jdt2FamixSettings defaultJdt2FamixPath.
			 ].	 
]
