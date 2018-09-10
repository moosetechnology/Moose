"
""This class provides a browser for exploring MSE files from a local folder""

self openOn: FSDiskStore currentFilesystem workingDirectory / 'metamodels'.
"
Class {
	#name : #MooseMSEFilesExplorer,
	#superclass : #GLMBrowserTemplate,
	#category : #'FamixCompatibility-PPExtensions'
}

{ #category : #'instance creation' }
MooseMSEFilesExplorer class >> open [ 
	self openOn: FileLocator imageDirectory
]

{ #category : #building }
MooseMSEFilesExplorer >> browserActions [
	browser
		populate: #entity
		icon: MooseIcons mooseAdd 
		entitled: 'Open'
		with: [ 
			| directory |
			directory := UITheme builder chooseDirectory: 'Import file structure from folder'.
			DiskStore currentFileSystem / directory fullName ]
]

{ #category : #building }
MooseMSEFilesExplorer >> buildBrowser [
	browser := GLMTabulator new.
	browser title: 'MSE metamodels explorer'.
	browser
		column: #metamodels;
		column: #details span: 4.
	self browserActions.
	browser transmit
		to: #metamodels;
		andShow: [ :a | self metamodelsOn: a ].
	browser transmit
		from: #metamodels;
		to: #details;
		andShow: [ :a | self detailsOn: a ].
	^ browser
]

{ #category : #building }
MooseMSEFilesExplorer >> detailsOn: a [
	a dynamic 
		display: [:file |  | repo string importer stacker |
			repo := [
				string := file readStream contents asString.
				importer := FMImporter new repository: (FMMetaRepository with: FMMetaRepository fm3).
				importer fromString: string.
				importer run.
				importer repository asMetarepository ] on: Error do: [:err | nil ].			
			stacker := GLMStacker new.
			repo notNil ifTrue: [
				stacker aPane: #metaBrowser.
				stacker transmit to: #metaBrowser; andShow: [:some | 
					some title: 'Explorer'.
					some custom: (MooseMetaBrowser new computeChildrenHierarchy: repo; browser)] ].
			stacker aPane: #mse.
			stacker transmit to: #mse; andShow: [:some |
				some title: file path basename"(file path printWithDelimiter: $/)".
				some text 
					display: [:x | self highlight: string ]].
			repo notNil ifTrue: [stacker startOn: repo] ifFalse: [stacker startOn: file]
	].
	
]

{ #category : #building }
MooseMSEFilesExplorer >> highlight: text [ 
	^ PPTextHighlighter new
		parser: PPMSEGrammar new;
		color: 'elementName' with: Color blue muchDarker;
		bold: 'elementName';
		color: 'simpleName' with: Color blue muchDarker;
		color: 'string' with: Color gray muchDarker;
		color: 'number' with: Color gray muchDarker;
		color: 'boolean' with: Color gray muchDarker;
		highlight: text asText
]

{ #category : #building }
MooseMSEFilesExplorer >> metamodelsOn: a [
	^ (a list)
		title: 'Meta-models';
		display: [ :folder | (folder entries select: [ :file | '*.mse' match: file basename ]) collect: #reference ];
		format: #basename
]
