"
A RTPNGExporter export the view or builder provided as argument as a PNG file
"
Class {
	#name : #RTPNGExporter,
	#superclass : #RTObject,
	#instVars : [
		'view',
		'fileName',
		'saveWithScale'
	],
	#category : #'Roassal2-Exporter-PNG'
}

{ #category : #accessing }
RTPNGExporter >> builder [
	"Return a view or a builder that has been previous assigned"
	^ view
]

{ #category : #accessing }
RTPNGExporter >> builder: aViewOrABuilder [
	view := aViewOrABuilder
]

{ #category : #util }
RTPNGExporter >> cameraPositionNegated [
	^ self encompassingRectangle center negated
]

{ #category : #util }
RTPNGExporter >> cameraScale [
	| camera |
	camera := self trachelCanvas camera.
	^ self saveWithScale
		ifTrue: [ camera scale asFloat ]
		ifFalse: [ camera defaultCameraScale ]
]

{ #category : #util }
RTPNGExporter >> createFormCanvas [
	"Return a new form"
	| form |
	form := TRPlatform current formCanvasClass extent: self viewExtent.
	form fillRectangle: self encompassingRectangle color: self trachelCanvas color.
	^ form
]

{ #category : #util }
RTPNGExporter >> createSurface [
	^ TRPlatform current surfaceClass extent: self viewExtent
]

{ #category : #util }
RTPNGExporter >> encompassingRectangle [
	^ self trachelCanvas encompassingRectangle
]

{ #category : #public }
RTPNGExporter >> exportToFile [
	| trachelCanvas  surface viewExtent |
	trachelCanvas := self trachelCanvas.
	viewExtent := self viewExtent.
	surface := self createSurface.
	surface
		drawDuring: [ :cs | 
			"Probably not necessary since we have just created a surface"
			surface clear;
				fillRectangle: (0@0 corner: viewExtent) withSolidColor: view canvas color.
			cs pathTransform
				translateBy: self viewHalfExtent asFloatPoint;
				scaleBy: self cameraScale;
				translateBy: self cameraPositionNegated asFloatPoint.
			trachelCanvas shapes do: [ :trachelShape | trachelShape drawOn: cs ].
			cs pathTransform loadIdentity scaleBy: 1.001.
			"trachelCanvas fixedShapes do: [ :trachelShape | trachelShape drawOn: cs ]" ].
	
	surface writeToPng: self fileName
]

{ #category : #accessing }
RTPNGExporter >> fileName [
	^ fileName
]

{ #category : #accessing }
RTPNGExporter >> fileName: aFilenameAsString [
	fileName := aFilenameAsString
]

{ #category : #initialization }
RTPNGExporter >> getIFrameDefFromView: aView label: aLabelAsString directory: aDirectory [
	"This method is useful when invoked from within Pillar"
	
	| pngFileName writeStream |
	pngFileName := (aDirectory / aLabelAsString, 'png') pathString.
	writeStream := pngFileName asFileReference writeStream.
	RTPNGExporter new builder: aView; fileName: pngFileName; exportToFile.
	^ '<img src="', pngFileName, '" 
		name="', aLabelAsString, '" ></img>' 
]

{ #category : #initialization }
RTPNGExporter >> initialize [
	super initialize.
	self withoutScale.
	self setDefaultFileName
]

{ #category : #initialization }
RTPNGExporter >> insert: aView named: aName inPillarStream: aStream [
	self insert: aView named: aName inPillarStream: aStream directory: self defaultDirectory 
]

{ #category : #initialization }
RTPNGExporter >> insert: aView named: aName inPillarStream: aStream directory: aDirectory [
	| s |
	s := self getIFrameDefFromView: aView label: aName directory: aDirectory.
	aStream nextPutAll: '{{{ <BR>', s, ' }}}'
]

{ #category : #accessing }
RTPNGExporter >> saveWithScale [
	^ saveWithScale
]

{ #category : #initialization }
RTPNGExporter >> setDefaultFileName [
	self fileName: 'roassal.png'
]

{ #category : #util }
RTPNGExporter >> trachelCanvas [
	^ self builder view canvas
]

{ #category : #util }
RTPNGExporter >> viewExtent [
	^ self encompassingRectangle extent asIntegerPoint * self cameraScale + (5 @ 5)
]

{ #category : #util }
RTPNGExporter >> viewHalfExtent [
	^ (self viewExtent / 2) asFloatPoint
]

{ #category : #accessing }
RTPNGExporter >> withScale [
	saveWithScale := true.
]

{ #category : #accessing }
RTPNGExporter >> withoutScale [
	saveWithScale := false
]
