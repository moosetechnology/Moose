Class {
	#name : #RTBitmapExamples,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #examples }
RTBitmapExamples >> image01 [
	<gtExample>
	
	"
	self new image01
	"

	| v c s |
	v := RTView new.
	c := v canvas.
	s := TRBitmapShape new.
	s form: RTIcon roassal.
	c addShape: s.
	^ v

]

{ #category : #examples }
RTBitmapExamples >> image02 [
	<gtExample>
	
	"
	self new image02

	This example directly talk to Trachel
	"

	| v  s trachelShape |
	v := RTView new.

	s := RTBitmap element.
	v add: s.

	trachelShape := s trachelShape.
	trachelShape extent: 180 @ 100.
	trachelShape fillColor: Color blue.

	1 to: 80 do: [ :i |
		trachelShape at: i @ i put: Color green ].

	^ v
]

{ #category : #accessing }
RTBitmapExamples >> label [
	^ 'Bitmaps'
]
