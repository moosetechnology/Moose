Class {
	#name : #RTMoreColorPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTMoreColorPlugin >> description [
	^ 'Extend the Color class with many predefined colors.'
]

{ #category : #hooks }
RTMoreColorPlugin >> execute [
	"Code to be executed"

	Gofer new 
		smalltalkhubUser: 'StephaneDucasse' project: 'Colors';
		package: 'MoreColors'; 
		load.
]

{ #category : #testing }
RTMoreColorPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'MoreColors'
 
]

{ #category : #hooks }
RTMoreColorPlugin >> label [
	^ 'More Colors'
]
