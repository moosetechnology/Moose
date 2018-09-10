Class {
	#name : #MooseHismoAllStrategy,
	#superclass : #MooseHismoImportingStrategy,
	#instVars : [
		'days'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #hook }
MooseHismoAllStrategy >> selectVersion: aVersion [

	^ true
]
