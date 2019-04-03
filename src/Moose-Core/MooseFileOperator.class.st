"
MooseOperator is a task that will act on a model. Additionally to the MooseOperator, a directory, from where data can be imported, can be set. 
See class side for the API. 
rootFolder has to be used to access the file during the basicRun execution.

The method the subclasses should implement is basicRun.
"
Class {
	#name : #MooseFileOperator,
	#superclass : #MooseOperator,
	#instVars : [
		'rootFolder'
	],
	#category : #'Moose-Core'
}

{ #category : #running }
MooseFileOperator class >> runOn: aMooseModel [
	^ self shouldNotImplement
]

{ #category : #running }
MooseFileOperator class >> runOn: aMooseModel directory: aFolder [
	^ self new
		rootFolder: aFolder;
		model: aMooseModel;
		run
]

{ #category : #running }
MooseFileOperator class >> runWithProgressOn: aMooseModel directory: aFolder [
	^ self new
		rootFolder: aFolder;
		model: aMooseModel;
		runWithProgress
]

{ #category : #accessing }
MooseFileOperator >> rootFolder [
	^ rootFolder
]

{ #category : #accessing }
MooseFileOperator >> rootFolder: aString [
	rootFolder := aString
]
