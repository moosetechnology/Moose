Extension { #name : #PPCompositeParser }

{ #category : #'*petitgui-debug' }
PPCompositeParser class >> debug: anObject [
	^ self debug: anObject startingAt: self startSymbol
]

{ #category : #'*PetitGui' }
PPCompositeParser >> spotterForProductionsFor: aStep [
	<spotterOrder: 10>
	
	aStep listProcessor
		title: 'Productions';
		allCandidates: [ (self productionNames collect: #value) asOrderedCollection ];
		candidatesLimit: 5;
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
