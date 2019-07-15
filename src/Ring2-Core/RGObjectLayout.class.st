Class {
	#name : #RGObjectLayout,
	#superclass : #RGLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGObjectLayout >> isObjectLayout [

	^ true
]

{ #category : #accessing }
RGObjectLayout >> layoutName [

	^ #ObjectLayout
]

{ #category : #accessing }
RGObjectLayout >> slots [ 

	"only for API compatibility purposes"
	^ Array new
]
