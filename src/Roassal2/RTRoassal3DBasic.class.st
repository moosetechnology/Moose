Class {
	#name : #RTRoassal3DBasic,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTRoassal3DBasic >> description [
	^ 'Load: a basic 3D system based on athens and roassal pretty useful for small applications!'
]

{ #category : #hooks }
RTRoassal3DBasic >> execute [
	Gofer new
		smalltalkhubUser: 'azazael' project: 'roassal3dbasic';
		package: 'Roassal2Basic3D';
		load
]

{ #category : #hooks }
RTRoassal3DBasic >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'Roassal2Basic3D'
]

{ #category : #hooks }
RTRoassal3DBasic >> label [
	^ 'Basic Roassal3D'
]
