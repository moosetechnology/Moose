Class {
	#name : #RTViewFolder2Script,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTViewFolder2Script >> description [
	^ 
'Let you select a directory and see its content. 
A color is given to each file based on its extension.'
]

{ #category : #hooks }
RTViewFolder2Script >> execute [
	
	| fr allChildren b lb |
	fr := UIManager default chooseDirectory.
	fr ifNil: [ ^ self ].
	allChildren := fr allChildren.
	allChildren := allChildren copyWithout: fr.

	b := RTMondrian new.

	b shape box
		withTextAbove: #basename.
	b nodes: fr children forEach: [ :fileRef |
		b shape box 
			size: [ :f | (f size + 1) log * 3 ].
		b nodes: fileRef allChildren.
		b edges connectFrom: #parent.
		b layout cluster.

	].
	b layout grid.
	b normalizer
		objects: (allChildren reject: #isDirectory);
		distinctColorUsing: #extension.

	b build.
	
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Visualization of the folder named ', fr basename.
	lb addText: 'Root folder are indicated as large gray boxes.'.
	lb addText: 'Colored boxes are files.'.
	lb addText: 'Each color indicate a file extension'.
	lb build.
	
	b view inspect.
	
]

{ #category : #hooks }
RTViewFolder2Script >> label [
	^ 'Visualizing Folder using a Cluster layout'
]
