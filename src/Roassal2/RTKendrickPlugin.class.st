Class {
	#name : #RTKendrickPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTKendrickPlugin >> description [
	^ 
'Kendrick is a modeling language and simulation platform, with an emphasis
on Epidemiological models. Kendrick has been used to model propagation of 
diseases, and in particular Ebola.

This plugin may cause problem when loaded directly in Pharo. 
We recommand to use the Moose distribution of Pharo.'
]

{ #category : #hooks }
RTKendrickPlugin >> execute [
	Metacello new
		repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
		configuration: 'Kendrick';
		version: '0.46';
		load
]

{ #category : #hooks }
RTKendrickPlugin >> label [
	^ 'Kendrick (epidemiological platform)'
]
