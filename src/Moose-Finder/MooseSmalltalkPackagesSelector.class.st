"
I am an small tool that allows to the user to select the packages that want to import. I am called in `MooseImportFromSmalltalkForm`.
My instance variable importer is an instance of `MooseImportFromSmalltalkForm`. It is set at the moment if my creation. See `MooseImportFromSmalltalkForm>>#initializePackagesButton`
"
Class {
	#name : #MooseSmalltalkPackagesSelector,
	#superclass : #MiPresenter,
	#instVars : [
		'importer',
		'chosenPackagesFilteringList',
		'allPackagesFilteringList'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #specs }
MooseSmalltalkPackagesSelector class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #allPackagesFilteringList;
		  add: #chosenPackagesFilteringList;
		  yourself
]

{ #category : #specs }
MooseSmalltalkPackagesSelector class >> title [
	^ 'Choose model packages'
]

{ #category : #initialization }
MooseSmalltalkPackagesSelector >> initializeDialogWindow: aDialog [

	aDialog
		addButton: 'Accept' do: [ :presenter | 
			importer
				packages: chosenPackagesFilteringList items;
				updatePackagesButton.
			presenter close ];
		addButton: 'Cancel' do: [ :presenter | presenter close ]
]

{ #category : #initialization }
MooseSmalltalkPackagesSelector >> initializePresenters [

	super initializePresenters.
	allPackagesFilteringList := self newFilteringList
		                            items: RPackage organizer packageNames;
		                            yourself.
	allPackagesFilteringList listPresenter
		beMultipleSelection;
		sortingBlock: #yourself ascending;
		selectItems: importer packages;
		whenSelectionChangedDo: [ 
			chosenPackagesFilteringList items:
					allPackagesFilteringList listPresenter selectedItems ].
	chosenPackagesFilteringList := self newFilteringList
		                               items:
			                               allPackagesFilteringList
				                               listPresenter selectedItems;
		                               yourself.
	chosenPackagesFilteringList listPresenter sortingBlock:
		#yourself ascending
]

{ #category : #initialization }
MooseSmalltalkPackagesSelector >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self class title;
		initialExtent: 450 @ 400
]

{ #category : #'accessing model' }
MooseSmalltalkPackagesSelector >> setModelBeforeInitialization: anImportPresenter [

	importer := anImportPresenter
]
