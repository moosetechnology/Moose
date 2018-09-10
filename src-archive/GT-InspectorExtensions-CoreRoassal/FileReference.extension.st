Extension { #name : #FileReference }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
FileReference >> gtInspectorGroupedFilesIn: composite [
	<gtInspectorPresentationOrder: 40>
	^ composite roassal2
		title: 'Grouped files';
		initializeView: [ RTDoubleBarBuilder new ];
		painting: [ :builder :presentation |
			| metric all grouped |
			metric := #size.
			all := self allFiles.
			grouped := (all groupedBy: [ :each | each extension ]) 
								associations sorted: [:a :b | 
											(a value sumNumbers: metric) > 
											(b value sumNumbers: metric) ].
			grouped := (grouped first: (20 min: grouped size)) select: [:each | 
					(each value sumNumbers: metric) > 0].
			builder pointName: [ :each | each key ].
			builder points: grouped.
			builder bottomValue: [ :each | each value size ] titled: 'Number of files'.
			builder 
				topValue: [ :each | (each value sumNumbers: metric) / 1000000 ] 
				titled: 'Total size in MB'];
		send: #value;
		when: [self isDirectory and: [self hasChildren]]
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
FileReference >> gtInspectorNestingIn: composite [
	<gtInspectorPresentationOrder: 41>
	^ composite roassal2
		title: 'Nesting';
		initializeView: [ RTCircularTreeMapBuilder new ];
		painting: [ :b :presentation |
			b shape
				color: Color transparent;
				borderColor: Color lightGray;
				if: [ :f | f isFile ] color: (RTNIdentityNormalizer withCommand: [:f | f extension]).
			b
				leafWeight: [:f | f size sqrt ]; 
				explore: self
				nesting: #directories
				leaves: #files. ];
		send: #value;
		when: [self isDirectory and: [self hasChildren]]
]
