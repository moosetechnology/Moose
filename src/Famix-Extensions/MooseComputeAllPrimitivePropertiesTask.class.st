"
Compute all the metrics of each entity of a model.
This is interesting only for Smalltalk model.
Currently, the model may access the Smalltalk source code in order to compute metrics, since they are lazily computed. 

Example of usage: 
	ComputingAllMetricsTask runOnModel: model.
"
Class {
	#name : #MooseComputeAllPrimitivePropertiesTask,
	#superclass : #MooseOperator,
	#category : #'Famix-Extensions'
}

{ #category : #public }
MooseComputeAllPrimitivePropertiesTask class >> runOnModel: aModel [
	^ self new 
		model: aModel; 
		run
]

{ #category : #private }
MooseComputeAllPrimitivePropertiesTask >> basicRun [

	model ifNil: [ ^ self error: 'Cannot be run without a reference to a model' ].
	model entities do: [:eachEntity |
   		eachEntity mooseDescription allPrimitiveAttributes do: [:eachProperty |
     		      eachEntity mmGetProperty: eachProperty ].
		self increment ]
]

{ #category : #accessing }
MooseComputeAllPrimitivePropertiesTask >> description [ 

	 ^ 'Computing all the metrics for the entities. This is useful when the model has to be independent from the source code (e.g., in case you want to import multiple version of a same software in Moose)'
]

{ #category : #accessing }
MooseComputeAllPrimitivePropertiesTask >> length [ 
	 "Number of element to operate on. This is necessary for the progress bar"

	^ model entities size
]
