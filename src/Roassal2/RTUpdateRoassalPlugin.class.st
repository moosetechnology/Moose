Class {
	#name : #RTUpdateRoassalPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTUpdateRoassalPlugin >> description [
	^ 'Load the last version of Roassal, Trachel, and Roassal2GT'
]

{ #category : #testing }
RTUpdateRoassalPlugin >> doesItLoadCode [
	^ false
]

{ #category : #hooks }
RTUpdateRoassalPlugin >> execute [
	Gofer it
		smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
		package: 'Roassal2';
		package: 'Roassal2GT';
		package: 'Trachel';
		load.
]

{ #category : #hooks }
RTUpdateRoassalPlugin >> label [
	^ 'Update Roassal'
]
