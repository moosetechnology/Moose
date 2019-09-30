Class {
	#name : #MooseFameViewTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-RoassalPaintings-FameView'
}

{ #category : #ui }
MooseFameViewTest >> testOpenOn [
	self shouldnt: [ (MooseFameView new openOn: FamixGenerator metamodel) delete ] raise: Error
]

{ #category : #ui }
MooseFameViewTest >> testViewFamixCore [

	self shouldnt: [ MooseFameView new viewFamixCore delete ] raise: Error
]
