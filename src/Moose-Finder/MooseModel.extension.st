Extension { #name : #MooseModel }

{ #category : #'*Moose-Finder' }
MooseModel >> allBookmarkedGroups [
	<navigation: 'All bookmarked groups'>
	^ MooseGroup withAll: (self entityCache select: [ :group | group asMooseGroup propertyNamed: #bookmarked ifNil: [ false ] ]) withDescription: 'Bookmarked groups'
]

{ #category : #'*Moose-Finder' }
MooseModel >> browseCodeWithDependencies [
	<menuItem: 'Code with Dependencies' category: 'Browse'>
	^ MooseDependencyBrowser openOn: self	
]

{ #category : #'*Moose-Finder' }
MooseModel >> browseCodeWithNamespaces [
	<menuItem: 'Code with namespaces' category: 'Browse'>
	MooseNamespacesCodeBrowser new openOn: (
		(self allNamespaces select: #isRoot) asOrderedCollection asSortedCollection: [:a :b | 
			a name < b name ])
]

{ #category : #'*Moose-Finder' }
MooseModel >> browseCodeWithPackages [
	<menuItem: 'Code with packages' category: 'Browse'>
	MoosePackagesCodeBrowser new openOn: (
		self allPackages asOrderedCollection asSortedCollection: [:a :b | 
			a name < b name ])
]

{ #category : #'*Moose-Finder' }
MooseModel >> browseMeta [
	^ MooseMetaBrowser new openOn: self metamodel
]

{ #category : #'*Moose-Finder' }
MooseModel class >> browseMeta [
	^ MooseMetaBrowser new openOn: self metamodel
]

{ #category : #'*Moose-Finder' }
MooseModel >> delete [
	<menuItem: 'Delete' category: 'Utilities'>
	| wantsToDelete |
	wantsToDelete := UIManager default confirm: 'Are you sure to want to delete ', self mooseName printString, '?'.
	wantsToDelete ifFalse: [ ^ self ].
	
	self remove
]

{ #category : #'*Moose-Finder' }
MooseModel >> exportToJSON [
	<menuItem: 'Export model to JSON' category: 'Import / Export'>
	| fileReference |
	fileReference := UITheme builder
		                 chooseForSaveFileReference: 'Choose location'
		                 extensions: #( 'json' )
		                 path: ''.
	fileReference ifNotNil: [ 
		fileReference writeStreamDo: [ :stream | 
			self exportToJSONStream: stream.
			Notification signal: 'Save successful!' ] ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> exportToMSE [
	<menuItem: 'Export model to MSE' category: 'Import / Export'>
	| fileReference |
	fileReference := UITheme builder
		chooseForSaveFileReference: 'Your title here'
		extensions: #('mse')
		path: ''.
	fileReference
		ifNotNil: [ fileReference
				writeStreamDo: [ :stream | 
					self exportToMSEStream: stream.
					Notification signal: 'Save successful!' ] ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> importFileStructure [
	| directory |
	directory := UITheme builder chooseDirectory: 'Import file structure from folder'.
	directory
		ifNotNil: [ 
			self name: directory localName.
			MooseFileStructureImporter new
				mooseModel: self;
				completeImport: (OrderedCollection with: directory fullName) ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> mooseFinderRootFolderIn: composite [
	<moosePresentationOrder: 30>
	self rootFolder asFileReference exists ifTrue: [ 
		(self rootFolder asFileReference gtInspectorItemsIn: composite)
			titleIcon: MooseIcons mooseFolder ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> rename [
	<menuItem: 'Rename' category: 'Utilities'>
	| newName |
	newName := UITheme builder textEntry: 'Set new name for MooseModel ' , self name.
	(newName isNotNil and: [ newName isNotEmpty ]) ifTrue: [ self name: newName ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> setRootFolder [
	<menuItem: 'Set root folder' category: 'Utilities'>

	| folder |
	folder := UITheme builder chooseDirectory: 'Choose the root folder for the sources of ', self name.
	folder ifNotNil: [ self rootFolder: folder fullName ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> spotter: aStringTitle on: aCandidatesBlock for: aStep [
	aCandidatesBlock value ifEmpty: [ ^ self ].
	^ aStep listProcessor
		title: aStringTitle;
		candidatesLimit: 5;
		allCandidates: aCandidatesBlock;
		itemName: [ :each | each mooseName ];
		itemIcon: [ :each | each mooseIcon ];
		actLogic: [ :each :step | 
			step exit.
			each openInMoose ];
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #'*Moose-Finder' }
MooseModel >> spotterAnnotationTypesFor: aStep [
	<spotterOrder: 40>
	self spotter: 'All Annotation Types' on: [ self allAnnotationTypes ] for: aStep
]

{ #category : #'*Moose-Finder' }
MooseModel >> spotterClassesFor: aStep [
	<spotterOrder: 20>
	self spotter: 'All classes' on: [ self allClasses ] for: aStep
]

{ #category : #'*Moose-Finder' }
MooseModel >> spotterMethodsFor: aStep [
	<spotterOrder: 30>
	self spotter: 'All methods' on: [ self allMethods ] for: aStep
]

{ #category : #'*Moose-Finder' }
MooseModel >> spotterNamespacesFor: aStep [
	<spotterOrder: 10>
	self spotter: 'All namespaces' on: [ self allNamespaces ] for: aStep
]

{ #category : #'*Moose-Finder' }
MooseModel >> viewOverviewPyramid [
	<menuItem: 'Overview Pyramid' category: 'Visualize'>
	self overviewPyramid open
]
