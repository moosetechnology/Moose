Extension { #name : #PPSequenceParser }

{ #category : #'*petitgui-accessing' }
PPSequenceParser >> exampleOn: aStream [
	parsers do: [ :each | each exampleOn: aStream ]
]

{ #category : #'*petitgui-morphic' }
PPSequenceParser >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		self children
			inject: self newRowMorph
			into: [ :result :each | 
				result 
					addMorphBack: (cc value: each);
					yourself ] ]
]

{ #category : #'*petitgui-mondrian' }
PPSequenceParser >> visualizationGraphType [
	^ ','
]
