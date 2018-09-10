"
I am a Spec model to embed Roassal2 visualizations. See the SpecEasel class for an example use.
"
Class {
	#name : #RoassalModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'script',
		'lastEvent'
	],
	#category : #'Roassal2Spec-Core'
}

{ #category : #specs }
RoassalModel class >> defaultSpec [
	<spec>
	
	^ #(MorphicRoassalAdapter
		adapt: #(model))
]

{ #category : #initialize }
RoassalModel >> initialize [

	super initialize.

	script := [ :v :canvas | ] asValueHolder.
	script whenChangedDo: [ :s | self refresh ].
	self flag: 'Remove lastEvent'.
	lastEvent := nil asValueHolder.
]

{ #category : #accessing }
RoassalModel >> lastEvent [
	self deprecated: 'This feature is no longer supported.'.
	^ lastEvent value
]

{ #category : #accessing }
RoassalModel >> lastEvent: aBlock [
	self deprecated: 'This feature is no longer supported.'.
	lastEvent value: aBlock
]

{ #category : #api }
RoassalModel >> refresh [
	"Rerun the script"
	self changed: #applyScript with: #()
]

{ #category : #api }
RoassalModel >> script [
	"Returns the block that draws the visualization."
	^ script value
]

{ #category : #api }
RoassalModel >> script: aBlock [
	"Set the block that draws the visualization.
	 It should take two arguments: the view and the canvas"
	script value: aBlock
]

{ #category : #'api-events' }
RoassalModel >> whenLastEventChangedDo: aBlock [

	lastEvent whenChangedDo: aBlock
]
