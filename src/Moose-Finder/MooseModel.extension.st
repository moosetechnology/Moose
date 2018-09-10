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
MooseModel class >> browseMeta [
	"
	self browseMeta
	"
	^ MooseMetaBrowser new openOn: MooseModel meta
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
MooseModel >> exportToMSE [
	<menuItem: 'Export model to MSE' category: 'Import / Export'>
	| fileReference |
	fileReference := UITheme builder fileSave: 'Your title here' extensions: #('mse') path: nil.
	fileReference
		ifNotNil: [ 
			fileReference
				writeStreamDo: [ :stream | 
					self exportToMSEStream: stream.
					Notification signal: 'Save successful!' ] ]
]

{ #category : #'*Moose-Finder' }
MooseModel class >> gtExampleEmptyModel [
	<gtExample>
	<label: 'Empty Moose model'>
	
	^ self new
]

{ #category : #'*Moose-Finder' }
MooseModel class >> gtExampleGTModel [
	"<gtExample: 'GT-* model'> => tests run super slow "
	| model importer |
	model := self new.
	model name: 'GT-*'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model.
	RPackageOrganizer default packages 
		select: [ :each | each packageName beginsWith: 'GT-' ] 
		thenDo: [ :package | importer addFromPackage: package ].
	importer runWithProgress.
	model install.
	^ model
]

{ #category : #'*Moose-Finder' }
MooseModel class >> gtExampleMorphModel [
	"<gtExample: 'Morph model'> => tests run super slow "
	^ MooseScripts createModelForMorphic
]

{ #category : #'*Moose-Finder' }
MooseModel class >> gtExampleNetworkModel [
	"<gtExample: 'Network model'> => tests run super slow "
	^ MooseScripts createModelForNetwork
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
MooseModel >> importFromMSE [
	| stream |
	stream := UITheme builder fileOpen: 'Import model from MSE file' extensions: #('mse').
	stream
		ifNotNil: [ 
			self name: (stream localName copyUpToLast: Path extensionDelimiter).	"name without extension"
			self importFromMSEStream: stream.
			stream close ]
]

{ #category : #'*Moose-Finder' }
MooseModel class >> menuBrowseMetaOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'MetaBrowser')
		order: 100; 
		parent: #Moose;
		label: 'Meta Browser';
		help: 'Famix compatiblity meta-model browser';
		action:[MooseModel browseMeta]
]

{ #category : #'*Moose-Finder' }
MooseModel class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Moose)
		order: 6.0; 
		withSeparatorAfter;
		icon: MooseIcons mooseIcon
]

{ #category : #'*Moose-Finder' }
MooseModel >> mooseFinderRootFolderIn: composite [
	<moosePresentationOrder: 30>
	self rootFolder asFileReference exists ifTrue: [ 
		(self rootFolder asFileReference gtInspectorItemsIn: composite)
			titleIcon: MooseIcons mooseFolder ]
]

{ #category : #'*Moose-Finder' }
MooseModel >> mooseInterestingEntity [ 
	"For a group with one element,  it returns that element, instead of the group, useful in the finder to remove extra step when navigating"
	
	"-- interestingEntity is called before UI actions, hence we optimize for runtime --" 
	
	self flag: 'The entity storage should not be changed here, but in the loader or somewhere else'.
	self entityStorage forRuntime. 
	^ self
]

{ #category : #'*Moose-Finder' }
MooseModel >> rename [
	<menuItem: 'Rename' category: 'Utilities'>

	| newName |
	newName := UITheme builder
		textEntry: 'Set new name for MooseModel ', self name.
	(newName notNil and: [newName notEmpty])
		ifTrue: [ self name: newName ]

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
	aCandidatesBlock value isEmpty ifTrue: [ ^ self ].
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
