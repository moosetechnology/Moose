Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> dependencies [
	^ FamixContainerGroupDependencies forContainerGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> systemComplexity [
	| canvas |
	canvas := RSCanvas new.
	canvas
		addAll:
			(self
				collect: [ :package | 
					package classes
						ifNotEmpty: [ :classes | 
							classes asMooseSpecializedGroup systemComplexity asShape
								model: package;
								padding: 10;
								color: Color lightGray;
								popup;
								@ RSDraggable;
								yourself ] ]).
	RSEdgeBuilder orthoVertical
		shapes: canvas nodes;
		color: Color veryLightGray;
		withVerticalAttachPoint;
		connectToAll:
				[ :package | package queryIncomingInheritances atScope: FamixTPackage ].
	RSTreeLayout new on: canvas nodes edges: canvas edges.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> viewPackageInternal [
	<menuItem: 'Package internals' category: 'Visualize'> 

	self viewPackageInternalOn: RTView new
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> viewPackageInternalOn: view [
	| allClasses b lb |
	allClasses := self flatCollect: #allClasses.
	b := RTMondrian new.
	b view: view.
	b shape box
		fillColor: Color veryLightGray;
		withTextAbove: #name.
	b
		nodes: self
		forEach: [ :pkg | 
			b shape box
				width: [ :c | c numberOfAttributes * 3 ];
				height: #numberOfMethods;
				if: #isStub fillColor: Color lightGray.
			b interaction showEdge connectTo: [ :c | c queryAllOutgoingInvocations atScope: FAMIXType ].
			b nodes: pkg allClasses.
			b edges connectFrom: #superclass.
			b layout tree ].
	b layout flow.
	allClasses
		ifNotEmpty: [ b normalizer
				objects: allClasses;
				normalizeColor: [ :c | (c queryAllOutgoingInvocations atScope: FAMIXType) size ] ].
	b build.
	lb := RTLegendBuilder new.
	lb onDemand.
	lb view: b view.
	lb addText: 'Visualization of packages'.
	lb addRectanglePolymetricWidth: 'Number of Variables' height: 'Number of methods' box: 'Class'.
	lb build.
	^ view
]
