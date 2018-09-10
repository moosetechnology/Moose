Extension { #name : #MooseGroup }

{ #category : #'*Moose-RoassalPaintings' }
MooseGroup >> symbolsUsedInName [
	| symbols nospace |
	symbols := self asOrderedCollection
		flatCollect: [ :each | 
			nospace := (each name
				piecesCutWhere: [ :a :b | 
					{Character space.
					$_} includes: a ])
				collect: [ :token | (token replaceAll: $_ with: Character space) trimRight trimLeft ].
			nospace
				flatCollect: [ :x | x piecesCutWhereCamelCase collect: [ :y | each -> (MalStemmer English stem: y) ] ] ].
	^ (symbols reject: [ :each | MooseUtilities stopWordList includes: each value ])
		groupedBy: #value
		affect: [ :assocCol | assocCol collect: #key ]
]

{ #category : #'*Moose-RoassalPaintings' }
MooseGroup >> viewNameCloud [
	<menuItem: 'Name Cloud' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewNameCloudOn: view.
	^ view openWithToolbar title: 'Name Cloud'
]

{ #category : #'*Moose-RoassalPaintings' }
MooseGroup >> viewNameCloudOn: view [ 
	| symbols objects |
	symbols := self symbolsUsedInName.
	objects := (symbols associations asSortedCollection: [:a : b | a value size > b value size]) asOrderedCollection.
	view shape label
		text: [:each | each key];
		height: [ :e | ((RTNFontLinearNormalizer inContext: objects withCommand: [:each | each value size])) rtValue: e ]
		"linearFontSize: [:each | each value size] within: objects"
"		textColor: (MONColorLinearNormalizer inContext: objects withCommand: [:each | each value size] 
											   lowColor: Color white lowThreshold: 0.1 
											   highColor: Color black highThreshold: 0.9)".
	view interaction popupText: [:each | each value size asString ].
	view nodes: objects.
	view flowLayout maxWidth: 600
]
