"
Edges will not be drawn if nodes are not initialized before the invocation of #edges message
"
Class {
	#name : #RTInvocationSequenceRule,
	#superclass : #ReInvocationSequenceRule,
	#category : #'Roassal2-Rules'
}

{ #category : #accessing }
RTInvocationSequenceRule >> group [
	^ 'Roassal'
]

{ #category : #'as yet unclassified' }
RTInvocationSequenceRule >> initialize [
	super initialize.
	
	self
		add: #edges requiresPreSend: #nodes:;
		add: #moveBehind requiresPostSend: #connectToAll:;
		add: #setAsFixed requiresPostSend: #add:;
		
		add: #(shape shapes)
		requiresPostSend: #(edges node: #nodes: #node:forIt: #nodes:forEach:)
]
