"
I generate zeroconf commandline scripts for loading Moose next to the current image.
"
Class {
	#name : #MooseZeroCommandLineHandler,
	#superclass : #ZeroConfCommandLineHandler,
	#instVars : [
		'imageName',
		'projectId'
	],
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseZeroCommandLineHandler class >> commandName [
	^ 'moosezeroconf'
]

{ #category : #accessing }
MooseZeroCommandLineHandler class >> description [
	^ 'Generate Moose zeroconf bash scripts'
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> defaultImage [
	^ MooseZeroConfCurrentImageScript mooseLatestImage
	
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> defaultScript [
	^ self defaultImage, self defaultVM
	
	
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> defaultVM [
	^ ZeroConfVMScript latestPharo combiningScript: MooseZeroConfCombinedScript 
	
	
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> imageScripts [
	^ { 
	 	MooseZeroConfCurrentImageScript mooseLatestImage.
		MooseZeroConfCurrentImageScript moose50Image.
		MooseZeroConfSuiteImageScript moose49Image 
		"MooseZeroConfImageScript glamour25Image. 
		MooseZeroConfImageScript petitparser16Image"
	}
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> indexScriptExamplesHtml [
	^ ''
]

{ #category : #'as yet unclassified' }
MooseZeroCommandLineHandler >> releaseScripts [

	^ { 
		MooseZeroConfSuiteScript moose43Suite.
		MooseZeroConfSuiteScript moose44Suite.
		MooseZeroConfSuiteScript moose45Suite.
		MooseZeroConfSuiteScript moose46Suite.
		MooseZeroConfSuiteScript moose47Suite.
		MooseZeroConfSuiteScript moose48Suite.
		MooseZeroConfSuiteScript moose49Suite }
]

{ #category : #'as yet unclassified' }
MooseZeroCommandLineHandler >> scripts [
	^ super scripts, self releaseScripts
]

{ #category : #accessing }
MooseZeroCommandLineHandler >> vmScripts [
	^ { 
		ZeroConfVMScript latestPharo combiningScript: MooseZeroConfCombinedScript.
		ZeroConfVMScript pharo combiningScript: MooseZeroConfCombinedScript 
	}
]
