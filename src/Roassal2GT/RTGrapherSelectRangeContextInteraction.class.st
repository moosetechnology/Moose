Class {
	#name : #RTGrapherSelectRangeContextInteraction,
	#superclass : #RTAbstractContextInteraction,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #hooks }
RTGrapherSelectRangeContextInteraction >> initializeElement: aView [
	"This expression is executed after the GTInspector window is open. So, after the build has been done."
	self assert: [ self presentation notNil ] description: 'The presentation has to be set'.
	aView attributeAt: #presentation put: self presentation

]
