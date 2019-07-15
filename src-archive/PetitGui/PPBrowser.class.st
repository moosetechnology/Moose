"
I provide the ability to browse composite parsers.

One can select a parser from a list and see all of the production rules of the grammar.

When a production rule is selected, on can test it by inputting a sample and clicking a ""play"" button to get results.

I also allow one to see the source of a production rule, see the graph or rules, a map of the ruleset, create examples of tokens for matching a given rule, see first and follow.

Based on the parsing of the content provided, there is some support for debugging.


self open
"
Class {
	#name : #PPBrowser,
	#superclass : #GLMCompositePresentation,
	#category : #'PetitGui-Core'
}

{ #category : #accessing }
PPBrowser class >> icon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1069534679 2139069360 2139069360 2139069360 2139069360 1551866800 1199545264 1451203504 2139069360 2139069360 2139069360 2139069360 2139069360 260021168 8362928 16777215 2139069360 14177 67123041 620771169 1224750945 1845507937 3372234593 3087021921 4278204257 4278204257 4278204257 4278204257 4278204257 3405789025 452999009 16777215 2139069360 14177 117454689 704657249 1325414241 1728067425 2197829473 3288348513 4278204257 4278204257 3758110561 3691001697 4278204257 4278204257 654325601 16777215 2139069360 14177 201340769 822097761 1409300321 1543518049 1811953505 3523229537 4278204257 4278204257 2231383905 3019913057 4278204257 4278204257 620771169 16777215 2139069360 14177 318781281 939538273 1509963617 1862285153 2717923169 3573561185 4278204257 4278204257 3238016865 3640670049 4278204257 4060100449 452999009 16777215 2139069360 1593849697 1862285153 2248161121 2281715553 2751477601 3003135841 3825219425 4278204257 4278204257 4278204257 4278204257 4278204257 1476409185 100677473 16777215 2139069360 33568609 536885089 1157642081 1644181345 1946171233 2214606689 4278204257 4278204257 3389011809 2281715553 2130720609 268449633 16791393 14177 16777215 2139069360 83900257 637548385 1258305377 1543518049 1543518049 1543518049 4278204257 4278204257 2466264929 201340769 14177 14177 14177 14177 16777215 2139069360 151009121 754988897 1375745889 1543518049 1543518049 1543518049 4278204257 4278204257 2298492769 125803440 16777215 16777215 16777215 16777215 16777215 2139069360 234895201 872429409 1426077537 1543518049 1543518049 2902472545 4278204257 4278204257 603993953 75471792 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{ #category : #accessing }
PPBrowser class >> label [
	^ 'PetitParser'
]

{ #category : #private }
PPBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: self label)
		parent: #Tools;
		icon: self icon;
		action: [ self open ]
]

{ #category : #'instance creation' }
PPBrowser class >> open [ 
	<script>
	^ self openOn: PPCompositeParser
]

{ #category : #'instance creation' }
PPBrowser class >> openOn: aClass [
	"Less glamorous versions of Glamour do not work with the new browser, fall back to the old one in this case."
	
	(self superclass canUnderstand: #compose)
		ifFalse: [ ^ PPDrabBrowser new openOn: aClass ].
	^ self new openOn: aClass
]

{ #category : #'private building' }
PPBrowser >> addNewSubParserOf: class in: list [
	| refactoring className |
	className := UIManager default request: 'Parser class name' initialAnswer: '' title: 'Add new parser'.
	^ className
		ifNotNil: [ 
			refactoring := PPAddParserRefactoring name: className asSymbol category: #ParserExample superclass: class.
			PPRefactoringUtils new performRefactoring: refactoring.
			list update ]
]

{ #category : #'private building' }
PPBrowser >> classesIn: composite [
	composite tree
		title: 'Parsers';
		format: [ :class | class name ];
		children: [ :class | class subclasses asSortedCollection: [ :a :b | a name < b name ] ];
		display: [ :class | class subclasses asSortedCollection: [ :a :b | a name < b name ] ];
		selectionAct: [ :list :class | Smalltalk tools browser openOnClass: list selection ] on: $b entitled: 'Browse (b)';
		selectionAct: [ :list :class | self addNewSubParserOf: list selection in: list ]
			entitled: 'Add new sub parser';
		act: [ :list :class | self addNewSubParserOf: class in: list ]
			icon: GLMUIThemeExtraIcons glamorousAdd
			on: $+
			entitled: 'Add new parser'
]

{ #category : #building }
PPBrowser >> compose [
	"self open"
	self title: self defaultTitle.
	self tabulator with: [ :tabulator | 
		tabulator 
			column: #classes;
			column: #parser span: 3.
		tabulator transmit to: #classes; andShow: [:a | 
			self classesIn: a ]. 
		tabulator transmit to: #parser; from: #classes; andShow: [:a | 
			a custom: PPParserBrowser new noTitle ]
	]
]

{ #category : #building }
PPBrowser >> defaultTitle [
	^ 'PetitParser Browser'
]
