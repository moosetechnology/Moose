Extension { #name : #Object }

{ #category : #'*Roassal2GT-Spotter' }
Object >> spotterForRenderingShapesFor: aStep [
	<spotterOrder: 5>
	(aStep hasPreviousNavigationFromClass: RTView) ifTrue: [ 
		aStep listProcessor
			title: 'Shapes';
			candidatesLimit: 5;
			allCandidates: [ aStep previousStep origin elements select: [ :each | each model = self ] ];
			itemName: [ :each | each gtDisplayString, ' [', each shape class name, ']' ];
			filter: GTFilterSubstring;
			wantsToDisplayOnEmptyQuery: true ]
]
