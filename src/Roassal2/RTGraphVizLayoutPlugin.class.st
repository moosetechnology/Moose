Class {
	#name : #RTGraphVizLayoutPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTGraphVizLayoutPlugin >> description [
	^ 'A GraphViz layout is a Roassal layout that utilizes algorithms in the GraphViz library to create better (orthogonal) layouts.'
]

{ #category : #hooks }
RTGraphVizLayoutPlugin >> execute [
	Metacello new
		baseline: 'GraphVizLayout';
		repository: 'github://peteruhnak/graphviz-layout:master/repository';
		load
]

{ #category : #hooks }
RTGraphVizLayoutPlugin >> label [
	^ 'GraphViz layout'
]
