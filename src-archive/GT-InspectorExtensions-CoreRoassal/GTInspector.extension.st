Extension { #name : #GTInspector }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GTInspector class >> gtInspectorExtensionsMapIn: composite [
	<gtInspectorPresentationOrder: 50>
	composite roassal2
		title: 'Extensions map';
		initializeView: [ RTCircularTreeMapBuilder new ];
		painting: [ :b |
			b
				color: [ : each | 
					each isClassOrTrait 
						ifTrue: [ 
							(each withAllSuperclasses \ { Object . ProtoObject } anySatisfy: [ :class |
							(Pragma allNamed: #gtInspectorPresentationOrder: in: class) notEmpty 
								or: [ (Pragma allNamed: #spotterOrder: in: class) notEmpty ] ]) 
								ifFalse: [ Color veryLightGray alpha: 0.5 ]
								ifTrue: [ Color red ] ]
						ifFalse: [ Color transparent ]];
				borderColor: Color veryLightGray; 
				baseradius: 500;
				leafWeight: [ :each | each methods size ].
			b 
				explore: RPackageOrganizer default packages
				nesting: [ :each | 
					(each isKindOf: Collection)
						ifTrue: [ each ]
						ifFalse: [
							(each isKindOf: RPackage)
								ifTrue: [ each classTags ]
								ifFalse: [ {  } ] ] ]
				leaves: [ :each |
					(each isKindOf: Collection)
						ifTrue: [ {  } ]
						ifFalse: [ (each isKindOf: RPackage)
							ifTrue: [ { } ]
							ifFalse: [ each classes ] ] ].
			b build view canvas camera focusOnCenterScaled.
			b ]
]
