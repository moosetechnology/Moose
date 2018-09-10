Class {
	#name : #SmaCCTransformationToolkit,
	#superclass : #GLMCompositePresentation,
	#instVars : [
		'filename',
		'resultsList',
		'previewResult'
	],
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #'world menu' }
SmaCCTransformationToolkit class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'SmaCC Transformation Toolkit')
		parent: #Tools;
		order: 0.56;
		action: [ self open ].
	aBuilder withSeparatorAfter
]

{ #category : #opening }
SmaCCTransformationToolkit class >> open [
	^ self new open
]

{ #category : #actions }
SmaCCTransformationToolkit >> addDirectory [
	| dir names match stream todo |
	dir := UITheme builder chooseDirectory: 'Add all files in directory' path: nil.
	dir isNil
		ifTrue: [ ^ self ].
	names := Set new.
	stream := WriteStream on: String new.
	(self model inputParserClass ifNil: [ SmaCCParser ]) fileExtensions
		do: [ :each | 
			stream
				nextPut: $*;
				nextPutAll: each ]
		separatedBy: [ stream nextPut: $; ].
	match := stream contents.
	todo := OrderedCollection with: dir.
	[ todo notEmpty ]
		whileTrue: [ ((dir := todo removeFirst) filesMatching: match) do: [ :each | names add: each fullName ].
			todo addAll: dir directories ].
	self addFiles: names
]

{ #category : #actions }
SmaCCTransformationToolkit >> addFiles [
	| name |
	name := self
		promptForFile: 'Add file'
		extensions:
			((self model inputParserClass ifNil: [ SmaCCParser ]) fileExtensions
				collect: [ :each | 
					each first = $.
						ifTrue: [ each copyFrom: 2 to: each size ]
						ifFalse: [ each ] ]).
	name isNil
		ifTrue: [ ^ self ].
	self addFiles: (Array with: name)
]

{ #category : #actions }
SmaCCTransformationToolkit >> addFiles: aCollection [
	| files |
	files := Set withAll: self model files.
	files addAll: aCollection.
	self model files: files asSortedCollection asArray.
	self updateModel
]

{ #category : #private }
SmaCCTransformationToolkit >> addResult: aResult [
	self fileResults add: aResult
]

{ #category : #building }
SmaCCTransformationToolkit >> buildConfigurationTab [
	| browser |
	(browser := self tabulator)
		title: 'Configuration';
		act: [ self loadConfiguration ] icon: GLMUIThemeExtraIcons glamorousOpen entitled: 'Load';
		act: [ self saveConfiguration ] icon: GLMUIThemeExtraIcons glamorousSave entitled: 'Save';
		act: [ self runAll ] icon: GLMUIThemeExtraIcons glamorousPlay entitled: 'Transform All';
		act: [ self selectInputParser ] entitled: 'Set Input Parser Class...';
		act: [ self selectValidationParser ] entitled: 'Set Validation Parser Class...';
		act: [ self setOutputDirectory ] entitled: 'Set output directory...';
		act: [ self setCreateSubdirectories ] entitled: 'Create subdirectories...';
		act: [ self setServer ] entitled: 'Set Server...';
		act: [ self setRunOnServer ] entitled: 'Run On Server...';
		act: [ self class new openOn: self entity ] entitled: 'Open another window';
		row: [ :row | 
			row
				column: #filesLabel size: 100;
				column: #files;
				column: #buttons size: 102 ];
		row: #results.
	browser transmit
		to: #filesLabel;
		andShow: [ :presentation | presentation label display: 'Files:' ].
	browser transmit
		to: #files;
		andShow: [ :presentation | 
			presentation fastList
				updateOn: #files from: [ self entity ifNotNil: [ self entity announcer ] ];
				beMultiple;
				display: [ :toolkit | toolkit files ];
				initialize: [ :list | list selection: self selectedFile ];
				selection: self selectedFile;
				enableFilter ].
	browser transmit
		from: #files port: #selection;
		to: #buttons port: #selection.
	browser transmit
		from: #files port: #selection;
		toOutsidePort: #selection.
	browser transmit
		to: #buttons;
		andShow: [ :presentation | 
			presentation actionList
				beVertical;
				act: [ self addDirectory ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add Dir';
				act: [ self addFiles ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add';
				act: [ :list | self removeFiles: (self fixSelection: list selection) ] icon: GLMUIThemeExtraIcons glamorousRemove entitled: 'Remove';
				act: [ :list | 
					list selection notEmpty
						ifTrue: [ self openResultFor: (self fixSelection: list selection) first ] ]
					icon: GLMUIThemeExtraIcons glamorousPlay
					entitled: 'Preview';
				act: [ :list | self runOn: (self fixSelection: list selection) ] icon: GLMUIThemeExtraIcons glamorousPlay entitled: 'Run' ].
	browser transmit
		to: #results;
		andShow: [ :presentation | 
			presentation fastTable
				display: [ self fileResults ];
				updateOn: ValueAdded from: [ self fileResults instVarNamed: 'announcer' ];
				updateOn: ValueRemoved from: [ self fileResults instVarNamed: 'announcer' ];
				column: 'File' evaluated: [ :each | each filename ];
				column: 'Error' evaluated: [ :each | each errorString ifNil: [ '' ] ];
				column: 'Transformation' evaluated: [ :each | each transformation ifNil: [ '' ] ifNotNil: [ :t | t displayString ] ];
				column: 'Line' evaluated: [ :each | each startLine ifNil: [ '' ] ];
				column: 'Column' evaluated: [ :each | each startColumn ifNil: [ '' ] ] ]
]

{ #category : #building }
SmaCCTransformationToolkit >> buildPreviewList: list in: presenter [
	presenter table
		display: [ list ];
		column: 'Rewrite' evaluated: [ :each | each rewrite displayString ];
		column: 'Node' evaluated: [ :each | each nodeClass ];
		column: 'Location' evaluated: [ :each | each nodeInterval ];
		morphicSelectionAct: [ :table | self debugRewriteForNode: table selection ]
			icon: GLMUIThemeExtraIcons glamorousBug
			on: $d
			entitled: 'Debug';
		morphicSelectionAct: [ :table | self gotoRewrite: table selection rewrite ] entitled: 'Goto Rewrite'
]

{ #category : #building }
SmaCCTransformationToolkit >> buildPreviewTab [
	| resultPresenter sourcePresentation targetPresentation |
	self dynamic
		title: 'Preview';
		updateOn: ValueChanged from: [ self previewResultHolder instVarNamed: 'announcer' ];
		display: [ | presentation |
			presentation := GLMCompositePresentation new.
			(resultPresenter := presentation tabulator)
				row: [ :row | 
					row
						column: #input;
						column: #output ]
					span: 2;
				row: #rewrites;
				row: #rewriteSelection span: 0.
			resultPresenter transmit
				to: #input;
				transformed: [ :each | each value ];
				andShow: [ :presenter | 
					(presenter custom: (sourcePresentation := SmaCCTextPresentation new))
						title: [ :result | result filename ifNil: [ 'Input' ] ifNotNil: [ :name | name asFileReference basename ] ];
						wrapped: false;
						withLineNumbers: true;
						display: [ :result | result inputSource ifNil: [ '' ] ] ].
			resultPresenter transmit
				to: #output;
				transformed: [ :each | each value ];
				andShow: [ :presenter | 
					presenter dynamic
						presentation: [ :dynamic :each | 
							(dynamic custom: (targetPresentation := SmaCCTextPresentation new))
								wrapped: false;
								withLineNumbers: true;
								initialize: [ :text | 
									(each interval notNil and: [ each outputSource notNil ])
										ifTrue: [ text selectionInterval: each interval ] ];
								title: [ :result | result outputFilename ifNil: [ 'Output' ] ifNotNil: [ :name | name asFileReference basename ] ];
								display: [ :result | 
									| text |
									text := (result outputSource ifNil: [ '' ]) asText.
									text size > 0
										ifTrue: [ result interval
												ifNotNil: [ :interval | 
													text makeColor: Color red from: interval first to: interval last.
													text makeBoldFrom: interval first to: interval last ] ].
									text ].
							each additionalFiles keys asSortedCollection
								do: [ :key | 
									dynamic text
										title: key asFileReference basename;
										wrapped: false;
										withLineNumbers: true;
										display: (each additionalFiles at: key) asString ] ] ].
			resultPresenter transmit
				to: #rewrites;
				andShow: [ :presenter | self buildPreviewList: #() in: presenter ].
			resultPresenter transmit
				from: #input port: #selectionInterval;
				to: #rewrites;
				andShow: [ :presenter :interval | 
					self
						buildPreviewList:
							(interval isNil
								ifTrue: [ #() ]
								ifFalse: [ self result transformedString annotationsInOriginalRange: interval ])
						in: presenter ].
			resultPresenter transmit
				from: #output port: #selectionInterval;
				to: #rewrites;
				andShow: [ :presenter :interval | 
					self
						buildPreviewList:
							(interval isNil
								ifTrue: [ #() ]
								ifFalse: [ self result transformedString annotationsInNewRange: interval ])
						in: presenter ].
			resultPresenter transmit
				from: #rewrites port: #selection;
				to: #rewriteSelection;
				transformed: [ :sel | self updateInput: sourcePresentation target: targetPresentation using: sel ].
			presentation startOn: self previewResultHolder.
			presentation ]
]

{ #category : #building }
SmaCCTransformationToolkit >> buildTransformationTab [
	self dynamic
		title: 'Transformations';
		act: [ :p | self loadRewrites ] icon: GLMUIThemeExtraIcons glamorousOpen entitled: 'Load';
		act: [ :p | self saveRewrites ] icon: GLMUIThemeExtraIcons glamorousSave entitled: 'Save';
		presentation: [ :presentation :each | 
			presentation
				custom:
					(SmaCCRewriteEditor new
						treeInitializer: [ :tree | 
							tree
								morphicSelectionAct: [ :presenter | self debugRewrite: presenter selection ]
								icon: GLMUIThemeExtraIcons glamorousBug
								on: $d
								entitled: 'Debug' ];
						transformation: [ :e | self model rewrites ];
						entity: self model rewrites;
						yourself) ]
]

{ #category : #building }
SmaCCTransformationToolkit >> compose [
	self title: 'SmaCC Transformation Toolkit'.
	self buildConfigurationTab.
	self buildTransformationTab.
	self buildPreviewTab
]

{ #category : #actions }
SmaCCTransformationToolkit >> debugRewrite: aSmaCCRewrite [
	| block |
	aSmaCCRewrite isNil
		ifTrue: [ ^ self ].
	block := [ :rewrite :node | rewrite == aSmaCCRewrite ].
	self debugUsingSeachBlock: block andTransformationBlock: block
]

{ #category : #actions }
SmaCCTransformationToolkit >> debugRewriteForNode: selection [
	self
		debugUsingSeachBlock: nil
		andTransformationBlock: [ :rewrite :node | 
			rewrite == selection rewrite
				and: [ node class == selection nodeClass
						and: [ node startPosition = selection nodeInterval first
								and: [ node stopPosition = selection nodeInterval last ] ] ] ]
]

{ #category : #actions }
SmaCCTransformationToolkit >> debugUsingSeachBlock: searchBlock andTransformationBlock: transformationBlock [
	SmaCCRewriteMatch haltBlock: searchBlock.
	SmaCCRewriteTransformation haltBlock: transformationBlock.
	[ self openResultFor: self selectedFile ]
		ensure: [ SmaCCRewriteMatch haltBlock: nil.
			SmaCCRewriteTransformation haltBlock: nil ]
]

{ #category : #actions }
SmaCCTransformationToolkit >> ensureRewriteFilename [
	| name |
	self model rewrites filename isNil
		ifTrue: [ name := self
				promptForSaveFile: 'Save Rewrites To'
				extensions: #('rw').
			name isNil
				ifTrue: [ ^ self ].
			self model rewrites filename: name ]
]

{ #category : #accessing }
SmaCCTransformationToolkit >> fileResults [
	^ resultsList ifNil: [ resultsList := CollectionValueHolder value: OrderedCollection new ]
]

{ #category : #private }
SmaCCTransformationToolkit >> fixSelection: anArray [
	"Hack around the selection bug that may return an array or the single item"

	^ anArray isString
		ifTrue: [ Array with: anArray ]
		ifFalse: [ anArray ]
]

{ #category : #private }
SmaCCTransformationToolkit >> gotoPreviewTab [
	self pane lastActivePresentation: self previewPresentation
]

{ #category : #private }
SmaCCTransformationToolkit >> gotoRewrite: aRewrite [
	self gotoRewritesTab.
	(self rewritesPresentation pane port: #rewriteToSelect) value: aRewrite
]

{ #category : #private }
SmaCCTransformationToolkit >> gotoRewritesTab [
	self pane lastActivePresentation: self rewritesPresentation
]

{ #category : #'initialize-release' }
SmaCCTransformationToolkit >> initialize [
	super initialize.
	self model: SmaCCTransformationToolkitModel new
]

{ #category : #actions }
SmaCCTransformationToolkit >> loadConfiguration [
	| file |
	file := self promptForFile: 'Load Configuration File' extensions: #('rwc').
	file isNil
		ifTrue: [ ^ self ].
	self model: (SmaCCTransformationToolkitModel new loadFile: file).
	self fileResults removeAll.
	self result: SmaCCRewriteCompleteResult new
]

{ #category : #actions }
SmaCCTransformationToolkit >> loadRewrites [
	| file |
	file := self promptForFile: 'Load Transformation File' extensions: #('rw').
	file isNil
		ifTrue: [ ^ self ].
	self model loadRewriteFile: file.
	self updateModel
]

{ #category : #accessing }
SmaCCTransformationToolkit >> model [
	^ self entity
]

{ #category : #accessing }
SmaCCTransformationToolkit >> model: aToolkitModel [
	self model notNil
		ifTrue: [ self model removeDependent: self ].
	self entity: aToolkitModel.
	aToolkitModel addDependent: self
]

{ #category : #actions }
SmaCCTransformationToolkit >> openResultFor: aFilename [
	| result processor |
	aFilename isNil
		ifTrue: [ ^ self ].
	Cursor wait
		showWhile: [ result := SmaCCRewriteCompleteResult new.
			processor := SmaCCRewriteProcessor new.
			processor rules: self model rewrites.
			processor parserClass: self model inputParserClass.
			processor validationParserClass: self model validationParserClass.
			processor debug: true.
			[ processor processFile: aFilename usingResult: result ]
				ensure: [ processor debug: false ].
			self result: result.
			self gotoPreviewTab ]
]

{ #category : #private }
SmaCCTransformationToolkit >> outputPane [
	^ self previewPresentation first panes detect: [ :each | each name = #output ]
]

{ #category : #actions }
SmaCCTransformationToolkit >> parserClasses [
	^ SmaCCParser allSubclasses
		asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #private }
SmaCCTransformationToolkit >> previewPresentation [
	^ self presentations last
]

{ #category : #accessing }
SmaCCTransformationToolkit >> previewResultHolder [
	^ previewResult ifNil: [ previewResult := NewValueHolder value: SmaCCRewriteCompleteResult new ]
]

{ #category : #private }
SmaCCTransformationToolkit >> promptForFile: aTitle extensions: anArray [
	^ UITheme current
		chooseFullFileNameIn: UITheme builder
		title: aTitle
		extensions: anArray
		path: nil
		preview: nil
]

{ #category : #private }
SmaCCTransformationToolkit >> promptForSaveFile: aTitle extensions: anArray [
	^ UITheme current
		fileSaveIn: UITheme builder
		title: aTitle
		initialAnswer: ''
		extensions: anArray
		path: nil
]

{ #category : #actions }
SmaCCTransformationToolkit >> removeFiles: anArray [
	| files |
	anArray isEmpty
		ifTrue: [ ^ self ].
	(self confirm: 'Do you want to remove the files?')
		ifFalse: [ ^ self ].
	files := Set withAll: self model files.
	anArray do: [ :each | files remove: each ifAbsent: [  ] ].
	self model files: files asSortedCollection
]

{ #category : #accessing }
SmaCCTransformationToolkit >> result [
	^ self previewResultHolder value
]

{ #category : #accessing }
SmaCCTransformationToolkit >> result: aSmaCCRewriteResult [
	self previewResultHolder value: aSmaCCRewriteResult
]

{ #category : #private }
SmaCCTransformationToolkit >> rewritesPresentation [
	^ self presentations at: 2
]

{ #category : #actions }
SmaCCTransformationToolkit >> runAll [
	self runOn: self model files
]

{ #category : #actions }
SmaCCTransformationToolkit >> runOn: aCollection [
	(self model runOnServer and: [ self model areRewritesModified ])
		ifTrue: [ (self confirm: 'Do you want to save your transformations before running on the server?')
				ifTrue: [ self saveRewrites ] ].
	self fileResults removeAllSuchThat: [ :each | aCollection includes: each filename ].
	self model runOn: aCollection
]

{ #category : #actions }
SmaCCTransformationToolkit >> saveConfiguration [
	self ensureRewriteFilename.
	filename isNil
		ifTrue: [ filename := self promptForSaveFile: 'Save Configuration To' extensions: #('rwc').
			filename isNil
				ifTrue: [ ^ self ] ].
	self model saveTo: filename
]

{ #category : #actions }
SmaCCTransformationToolkit >> saveRewrites [
	self ensureRewriteFilename.
	self model saveRewrites
]

{ #category : #actions }
SmaCCTransformationToolkit >> selectInputParser [
	| class |
	class := UITheme builder chooseDropList: 'Select input parser class' list: self parserClasses.
	class isNil
		ifTrue: [ ^ self ].
	self model inputParserClass: class
]

{ #category : #private }
SmaCCTransformationToolkit >> selectPreviewOutputInterval: anInterval [
	(self outputPane port: #selectionInterval) value: anInterval
]

{ #category : #actions }
SmaCCTransformationToolkit >> selectValidationParser [
	| class |
	class := UITheme builder chooseDropList: 'Select validation parser class' list: self parserClasses.
	class isNil
		ifTrue: [ ^ self ].
	self model validationParserClass: class
]

{ #category : #accessing }
SmaCCTransformationToolkit >> selectedFile [
	^ ((self pane port: #selection) value
		ifNotNil: [ :selection | 
			"Hack to work around selection changing from value to array with value"
			selection isArray
				ifTrue: [ selection notEmpty
						ifTrue: [ selection first ] ]
				ifFalse: [ selection ] ]) ifNil: [ self result filename ]
]

{ #category : #actions }
SmaCCTransformationToolkit >> setCreateSubdirectories [
	| createSubdirectories |
	createSubdirectories := UITheme builder questionWithoutCancel: 'Create subdirectories'.
	self model createSubdirectories: createSubdirectories
]

{ #category : #actions }
SmaCCTransformationToolkit >> setOutputDirectory [
	| dir |
	dir := UITheme builder textEntry: 'Enter output directory name:' title: 'Directory' entryText: self model outputDirectory.
	dir isNil
		ifTrue: [ ^ self ].
	self model outputDirectory: dir
]

{ #category : #actions }
SmaCCTransformationToolkit >> setRunOnServer [
	| runOnServer |
	runOnServer := UITheme builder questionWithoutCancel: 'Run on server'.
	self model runOnServer: runOnServer
]

{ #category : #actions }
SmaCCTransformationToolkit >> setServer [
	| server |
	server := UITheme builder textEntry: 'Enter server name:' title: 'Server' entryText: self model server.
	server isNil
		ifTrue: [ ^ self ].
	self model server: server
]

{ #category : #updating }
SmaCCTransformationToolkit >> update: aSymbol with: aValue [
	super update: aSymbol with: aValue.
	aSymbol = #resultAdded
		ifTrue: [ self addResult: aValue ]
]

{ #category : #building }
SmaCCTransformationToolkit >> updateInput: sourcePresentation target: targetPresentation using: selection [
	sourcePresentation clearHighlights.
	targetPresentation clearHighlights.
	selection notNil
		ifTrue: [ sourcePresentation addHighlight: (Color red alpha: 0.2) from: selection nodeInterval first to: selection nodeInterval last.
			(self result transformedString annotationRangesFor: selection) do: [ :each | targetPresentation addHighlight: (Color red alpha: 0.2) from: each first to: each last ] ].
	sourcePresentation updateHighlightsAndScroll.
	targetPresentation updateHighlightsAndScroll
]

{ #category : #actions }
SmaCCTransformationToolkit >> updateModel [
	"Hack to get things to update"
	self model: self model
]
