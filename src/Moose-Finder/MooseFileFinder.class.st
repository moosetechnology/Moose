"
self openOn: FileSystem disk root
"
Class {
	#name : #MooseFileFinder,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MooseFileFinder >> buildBrowser [ 
	browser := GLMFinder new.
	browser show: [:a | 
		a list 
			display: [:each | each entries collect: #reference ];
			when: #isDirectory;
			icon: [:each | each isDirectory 
					ifTrue: [GLMUIThemeExtraIcons glamorousOpen ] 
					ifFalse: [GLMUIThemeExtraIcons glamorousBrowse]];
			format: #basename
		].
	^ browser 
]
