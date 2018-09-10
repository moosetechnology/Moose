Class {
	#name : #MooseTaskTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #util }
MooseTaskTest >> getAllWindows [
	^ World submorphs select: #isSystemWindow

]

{ #category : #tests }
MooseTaskTest >> testRunWithProfiler [

	| task windows |
	task := (MooseCustomTask new) with: [ :v | true ] description: 'a description' length: 0.
	windows := self getAllWindows.
	task runWithProfiler.
	(self getAllWindows copyWithoutAll: windows ) do: #delete

]
