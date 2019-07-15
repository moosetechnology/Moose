"
self openOn: FileSystem disk root
"
Class {
	#name : #MooseFileExplorer,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MooseFileExplorer >> buildBrowser [
	browser := GLMTabulator new.
	browser
		column: #folders;
		column: #files.
	browser transmit
		to: #folders;
		andShow: [ :a | 
					a tree
						display: [ :each | each directories reject: [ :x | x basename beginsWith: '.' ] ];
						children: #directories;
						icon: GLMUIThemeExtraIcons glamorousOpen;
						format: #basename ].
	browser transmit
		from: #folders;
		to: #files;
		andShow: [ :a | 
					a list
						display: #files;
						format: #basename ].
	^ browser
]
