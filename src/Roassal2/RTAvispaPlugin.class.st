Class {
	#name : #RTAvispaPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTAvispaPlugin >> description [
	^ 'Avispa is a tool to analyze Software Process Models, written with EPF Composer. 
You need run the Moose platform in order to use this pluggin.'
]

{ #category : #hooks }
RTAvispaPlugin >> execute [
	"Make sure the problem with the font is solved."
	RTFixFontProblemPlugin new execute.
	
	"Load Avispa"
	Gofer new
		smalltalkhubUser: 'abergel' project: 'Avispa';
		package: 'ProcessModel';
		load.

]

{ #category : #testing }
RTAvispaPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'ProcessModel'
 
]

{ #category : #hooks }
RTAvispaPlugin >> label [
	^ 'Avispa (Software Process EPF Visualization)'
]
