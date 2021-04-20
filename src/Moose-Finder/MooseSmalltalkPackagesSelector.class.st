Class {
	#name : #MooseSmalltalkPackagesSelector,
	#superclass : #MiPresenter,
	#instVars : [
		'importer',
		'acceptButton',
		'cancelButton',
		'chosenPackagesFilteringList',
		'allPackagesFilteringList'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #accessing }
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
			chosenPackagesFilteringList items: allPackagesFilteringList listPresenter selectedItems ].
	chosenPackagesFilteringList := self newFilteringList
		                  items: allPackagesFilteringList listPresenter selectedItems;
		                  yourself.
	chosenPackagesFilteringList listPresenter sortingBlock: #yourself ascending
]

{ #category : #'accessing model' }
MooseSmalltalkPackagesSelector >> setModelBeforeInitialization: anImportPresenter [
	importer := anImportPresenter
]
