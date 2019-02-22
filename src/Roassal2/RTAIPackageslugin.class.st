Class {
	#name : #RTAIPackageslugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTAIPackageslugin >> description [
	^ 'Support for Neural networks and genetic algorithm.'
]

{ #category : #hooks }
RTAIPackageslugin >> execute [
	"Code to be executed"

	Gofer it
	    smalltalkhubUser: 'abergel' project: 'NeuralNetworks';
	    configurationOf: 'NeuralNetworks';
	    loadDevelopment.

	Gofer it
	    smalltalkhubUser: 'abergel' project: 'GeneticAlgo';
	    configurationOf: 'GeneticAlgo';
	    loadDevelopment.
	
	Gofer it
	    smalltalkhubUser: 'abergel' project: 'GeneticAlgo';
	    package: 'GeneticAlgoAndNeuralNetwork';
	    load

]

{ #category : #hooks }
RTAIPackageslugin >> isLoaded [
	^ (RPackageOrganizer default includesPackageNamed: 'NeuralWorks') and: [ (RPackageOrganizer default includesPackageNamed: 'GeneticAlgo') ]
 
]

{ #category : #hooks }
RTAIPackageslugin >> label [
	^ 'Artificial Intelligence support (NN & GA)'
]
