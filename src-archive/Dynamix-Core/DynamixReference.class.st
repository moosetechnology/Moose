"
DynamixReference is an abstract class that models a reference to some value in the system. In an object-oriented system, a typical reference is the instance of a class (see DynamixInstance).
"
Class {
	#name : #DynamixReference,
	#superclass : #DynamixEntity,
	#instVars : [
		'activationsWithArgument',
		'activationsWithReceiver',
		'activationsWithReturn'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixReference class >> annotation [
	<MSEClass: #Reference super: #DynamixEntity>
	<package: #Dynamix>
]

{ #category : #accessing }
DynamixReference >> activationsWithArgument [
	<MSEProperty: #activationsWithArgument type: #DynamixActivation opposite: #arguments> <multivalued> <derived>
	<MSEComment: 'Activations that have this reference as an argument'>
		
	^ activationsWithArgument
]

{ #category : #accessing }
DynamixReference >> activationsWithArgument: aCollection [
	activationsWithArgument value: aCollection
]

{ #category : #accessing }
DynamixReference >> activationsWithReceiver [
	<MSEProperty: #activationsWithReceiver type: #DynamixActivation opposite: #receiver> <multivalued> <derived>
	<MSEComment: 'Activations that have this reference as the receiver'>
	^ activationsWithReceiver
]

{ #category : #accessing }
DynamixReference >> activationsWithReceiver: aCollection [
	activationsWithReceiver value: aCollection
]

{ #category : #accessing }
DynamixReference >> activationsWithReturn [
	<MSEProperty: #activationsWithReturn type: #DynamixActivation opposite: #return> <multivalued> <derived>
	<MSEComment: 'Activations that have this reference as the return value'>
	^ activationsWithReturn
]

{ #category : #accessing }
DynamixReference >> activationsWithReturn: aCollection [
	activationsWithReturn value: aCollection
]

{ #category : #'initialize-release' }
DynamixReference >> initialize [ 
	super initialize.
	activationsWithReceiver := FMMultivalueLink on: self opposite: #receiver:.
	activationsWithReturn := FMMultivalueLink on: self opposite: #return:.
	activationsWithArgument := FMMultiMultivalueLink on: self opposite: #arguments
]
