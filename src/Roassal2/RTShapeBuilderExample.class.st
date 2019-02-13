Class {
	#name : #RTShapeBuilderExample,
	#superclass : #RTObject,
	#category : #'Roassal2-Builder-Common'
}

{ #category : #example }
RTShapeBuilderExample >> example01 [
	"
	self new example01
	"
	| builder v |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder circle 
				size: 20; 
				fillColor: (RTNColorLinearNormalizer new
									context: (Collection withAllSubclasses);
									command: #numberOfMethods;
									lowColor: Color green;
									highColor: Color red);
				withText.
				
	v addAll: (builder elementsOn: Collection withAllSubclasses).
	RTCellLayout new gapSize: 1; on: v elements.
	v build.
	^ v view
]

{ #category : #example }
RTShapeBuilderExample >> example02 [
	"
	self new example02
	"
	| builder v |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder rectangle 
				size: 50; 
				fillColor: (Color purple alpha: 0.3);
				withText.
	v addAll: (builder elementsOn: (1 to: 50)).
	RTCellLayout on: v elements.
	v build.
	^ v view
]

{ #category : #example }
RTShapeBuilderExample >> example03 [
	"
	self new example03
	"
	| builder v els |
	v := RTView new.
	builder := RTShapeBuilder new.
	builder rectangle 
				width: 50;
				fillColor: (Color purple alpha: 0.3);
				withText.
	els := builder elementsOn: (1 to: 50).
	els @ RTDraggable.
	v addAll: els.
	RTCellLayout on: v elements.
	v build.
	^ v view
]
