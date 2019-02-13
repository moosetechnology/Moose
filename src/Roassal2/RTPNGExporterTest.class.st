Class {
	#name : #RTPNGExporterTest,
	#superclass : #RTTest,
	#instVars : [
		'emptyExporter',
		'view',
		'exporter'
	],
	#category : #'Roassal2-Exporter-PNG'
}

{ #category : #running }
RTPNGExporterTest >> setUp [
	super setUp.
	emptyExporter := RTPNGExporter new.
	
	view := RTView new.
	exporter := RTPNGExporter new.
	exporter builder: view.
]

{ #category : #tests }
RTPNGExporterTest >> testBasic [

	emptyExporter builder: view.
	self assert: emptyExporter builder equals: view.
	"5 @ 5 is a delta we add to make sure we have no pb when exporting
	plus the delta from TRCanvas>>encompassingRectangle"
	self assert: (emptyExporter viewExtent closeTo: (6 @ 6)).
	self assert: (emptyExporter viewHalfExtent closeTo: (3 @ 3)).
]

{ #category : #tests }
RTPNGExporterTest >> testCameraPosition [

	self assert: exporter cameraPositionNegated equals: (0 @ 0)
]

{ #category : #tests }
RTPNGExporterTest >> testCameraPosition2 [

	view canvas camera translateTo: 6 @ 4.
	self assert: exporter cameraPositionNegated equals: (0 @ 0).
]

{ #category : #tests }
RTPNGExporterTest >> testCameraScale [

	self assert: exporter cameraScale equals: view canvas camera defaultCameraScale 
]

{ #category : #tests }
RTPNGExporterTest >> testCreateSurface [

	exporter createSurface.
	exporter createFormCanvas.
]

{ #category : #tests }
RTPNGExporterTest >> testDefault [

	self assert: emptyExporter fileName equals: 'roassal.png'.
	self assert: emptyExporter builder equals: nil
]

{ #category : #tests }
RTPNGExporterTest >> testExportWithScale [

	emptyExporter withScale.
	view canvas camera scale: 2.
	emptyExporter builder: view.
	
	self assert: emptyExporter viewExtent equals: (7 @ 7).
	self assert: emptyExporter viewHalfExtent equals: (3.5 @ 3.5).
	self assert: emptyExporter saveWithScale.
	
	emptyExporter withoutScale.
	self assert: (emptyExporter viewExtent closeTo: (6 @ 6)).
	self assert: (emptyExporter viewHalfExtent closeTo: (3 @ 3)).
	
]
