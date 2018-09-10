"
TRTranslationCallback is triggered when the shape gets translated. 

Consider the following example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
c := TRCanvas new.
b := TRBoxShape new size: 40.
c addShape: b.
callback := TRTranslationCallback new.
callback block: [ :aShape :step | step inspect ].
b addCallback: callback.
b translateBy: 5 @ 10.
c.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
It opens an inspector because the block is triggered.
"
Class {
	#name : #TRTranslationCallback,
	#superclass : #TRCallback,
	#category : #'Trachel-Callbacks'
}

{ #category : #testing }
TRTranslationCallback >> isTranslationCallback [
	^ true
]

{ #category : #actions }
TRTranslationCallback >> shape: aTRShape step: aStep [ 
	"aStep is a point that represents a translation step"
	^ block cull: aTRShape cull: aStep
]
