Class {
	#name : #MooseSmalltalkPackagesSelector,
	#superclass : #MiPresenter,
	#instVars : [
		'chosenPackages',
		'allPackages',
		'importer',
		'acceptButton',
		'cancelButton'
	],
	#category : #'Moose-Finder-Import'
}

{ #category : #accessing }
MooseSmalltalkPackagesSelector class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #allPackages;
		add: #chosenPackages;
		yourself
]

{ #category : #specs }
MooseSmalltalkPackagesSelector class >> title [
	^ 'Choose model packages'
]

{ #category : #initialization }
MooseSmalltalkPackagesSelector >> initializeDialogWindow: aDialog [
	aDialog
		closeOnBackdropClick: false;
		addButton: 'Accept'
			do: [ :presenter | 
			importer
				packages: chosenPackages items;
				updatePackagesButton.
			presenter close ];
		addButton: 'Cancel' do: [ :presenter | presenter close ]
]

{ #category : #initialization }
MooseSmalltalkPackagesSelector >> initializePresenters [
	super initializePresenters.
	allPackages := self newList
		beMultipleSelection;
		items: RPackage organizer packageNames;
		sortingBlock: #yourself ascending;
		selectItems: importer packages;
		whenSelectionChangedDo: [ chosenPackages items: allPackages selectedItems ];
		yourself.
	chosenPackages := self newList
		items: allPackages selectedItems;
		sortingBlock: #yourself ascending;
		yourself
]

{ #category : #'accessing model' }
MooseSmalltalkPackagesSelector >> setModelBeforeInitialization: anImportPresenter [
	importer := anImportPresenter
]
