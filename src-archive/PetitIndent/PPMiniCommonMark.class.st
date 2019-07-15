Class {
	#name : #PPMiniCommonMark,
	#superclass : #PPCompositeParser,
	#instVars : [
		'linePrefix',
		'space',
		'prefix',
		'quote',
		'quoteIndent',
		'quoteDedent',
		'newline',
		'line',
		'emptyLine',
		'lineEnd',
		'paragraph',
		'lazyParagraphPrefix',
		'document',
		'contentElement',
		'quoteBlock',
		'ATXHeader',
		'codePrefix',
		'code',
		'orderedListMarker',
		'bulletListMarker',
		'listMarker',
		'listContent',
		'listBullet',
		'listItem',
		'content',
		'listItemEnd',
		'list',
		'listDoubleBlanks'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #headers }
PPMiniCommonMark >> ATXHeader [
	^ linePrefix, (($# asParser plus) setMax: 6), space, line, lineEnd
	
	map: [ :_lp :level :sep :_title :end |
		| size |
		size := level size asString. 
		'<h', size, '>', _title trim, '</h', size, '>'
	]
]

{ #category : #lists }
PPMiniCommonMark >> bulletListMarker [
	^ 
	  ($- asParser /
		$* asParser /
		$+ asParser) 
		
	==> [ :e | 'ul' ]
]

{ #category : #code }
PPMiniCommonMark >> code [
	^ codePrefix, emptyLine not, line, lineEnd,
	(
		((prefix, codePrefix, line, lineEnd) ==> #third) /
		((prefix, emptyLine, lineEnd) nonEmpty ==> #second)
	) star
	
	map: [ :_cp :pred :first :le :rest |
		'<code>',
		(rest inject: first into: [ :string :elem | string, String cr, elem ]) trimRight,
		String cr, '</code>'
	] 
]

{ #category : #code }
PPMiniCommonMark >> codePrefix [
	^ '    ' asParser
]

{ #category : #document }
PPMiniCommonMark >> content [
	^ contentElement,
	((prefix, contentElement) nonEmpty ==> #second) star
	
	map: [ :first :rest |
		| retval |
		retval := OrderedCollection with: first.
		retval addAll: rest. 
		retval := retval reject: [ :e | e trim = '' ].
		retval joinUsing: String cr.
	] 
]

{ #category : #document }
PPMiniCommonMark >> contentElement [
	^ 	
		ATXHeader /
		code /
		quoteBlock /
		list /
		paragraph /
		((emptyLine, lineEnd) ==> #first)
]

{ #category : #document }
PPMiniCommonMark >> document [
	^ ((prefix, contentElement) nonEmpty ==> #second) star
	
	map: [ :elems |
		| cleanup |
		cleanup := elems reject: [ :e | e trim = '' ].
		cleanup joinUsing: String cr.
	]
]

{ #category : #lines }
PPMiniCommonMark >> emptyLine [
	^ space star, #endOfLine asParser ==> [ :e | '' ]
]

{ #category : #paragraphs }
PPMiniCommonMark >> lazyParagraphPrefix [
	^ (prefix, quoteIndent) not,
	(quote / space) star
]

{ #category : #lines }
PPMiniCommonMark >> line [
	^ newline negate star flatten
]

{ #category : #lines }
PPMiniCommonMark >> lineEnd [
	^ newline / #eof asParser
]

{ #category : #lines }
PPMiniCommonMark >> linePrefix [
	^ ((PPPossessiveRepeatingParser on: (#blank asParser ))
		setMax: 3;
		yourself),
	(#blank asParser not)
	==> #first
]

{ #category : #lists }
PPMiniCommonMark >> list [
	^ 
	listBullet and,
	listItem,
	(prefix, listItem ==> #second) star
	
	map: [ :_bullet :_first :_rest |
		| start |
		start := _bullet first.
		'<', start, '>', 
			String cr, _first,
			(String cr, (_rest joinUsing: String cr)) trimRight, String cr,
		'</', start, '>'
		
	]
]

{ #category : #lists }
PPMiniCommonMark >> listBullet [
	^ (
		 "get content"
		 (linePrefix, listMarker, space, linePrefix optional) flatten and,
		 "push content as spaces"
		 ((linePrefix, listMarker, space, linePrefix optional) flatten and ==> [:e | self spaces: (e size)]) pushAsParser,
	    "get type of bullet -> numbered or unnumbered"
	    ((linePrefix, listMarker, space) ==> #second)
	  
	map: [ :_content :_push :_type |
		{ _type . _content }
	])
]

{ #category : #lists }
PPMiniCommonMark >> listContent [
	^ 	
	contentElement,	
	(	
		((prefix, contentElement) nonEmpty 	==> #second) /
		((listDoubleBlanks not, quoteDedent not, (quote / space) star, lineEnd) nonEmpty 
														==> [ :e | '' ])
	) star
	
	map: [ :first :rest |
		| retval |
		retval := OrderedCollection with: first.
		retval addAll: rest. 
		retval := retval reject: [ :e | e trim = '' ].
		retval joinUsing: String cr.
	] 
]

{ #category : #lists }
PPMiniCommonMark >> listDoubleBlanks [
	^
		(
			((quoteDedent not, (quote / space) star, lineEnd) nonEmpty),
			((quoteDedent not, (quote / space) star, lineEnd) nonEmpty)
		)
]

{ #category : #lists }
PPMiniCommonMark >> listItem [
	^ listBullet, listContent , listItemEnd
	
	map: [ :_bullet :_content :_end |
		'<li>', (String cr, _content) trimRight, String cr, '</li>'
	]
	

]

{ #category : #lists }
PPMiniCommonMark >> listItemEnd [
	^ [ :context | context indentStack pop ] asParser
]

{ #category : #lists }
PPMiniCommonMark >> listMarker [
	^ orderedListMarker / bulletListMarker
]

{ #category : #lines }
PPMiniCommonMark >> newline [
	^ #newline asParser
]

{ #category : #lists }
PPMiniCommonMark >> orderedListMarker [
	^ #digit asParser plus, ($. asParser / $) asParser) 
	
	==> [ :e | 'ol' ]

]

{ #category : #paragraphs }
PPMiniCommonMark >> paragraph [
	^ linePrefix, (emptyLine) not, line trimBlanks, lineEnd,
	(
		lazyParagraphPrefix,
		(emptyLine / ATXHeader / listBullet) not,
		line trimBlanks,
		lineEnd ==> #third
	) star
	map: [ :_lp :_pred :_line :_end :_rest |
		'<p>', 
			(_rest inject: _line trim into: [ :total :elem  | total, String cr, elem ]),
		'</p>'
	]
]

{ #category : #'as yet unclassified' }
PPMiniCommonMark >> prefix [
	^ #prefix asParser
]

{ #category : #quotes }
PPMiniCommonMark >> quote [
	^ (linePrefix, $> asParser, space optional) flatten
]

{ #category : #quotes }
PPMiniCommonMark >> quoteBlock [
	^ quoteIndent,
		content,
	  quoteDedent
	
	map: [ :indent :_content :dedent |
		'<blockquote>', 
			(String cr, _content) trimRight, String cr,
		'</blockquote>'
	]
]

{ #category : #quotes }
PPMiniCommonMark >> quoteDedent [
	^ (prefix not, quote pop) flatten
]

{ #category : #quotes }
PPMiniCommonMark >> quoteIndent [
	^ (quote ==> [ :e | quote ]) pushAsParser
]

{ #category : #'as yet unclassified' }
PPMiniCommonMark >> space [
	^ Character space asParser
]

{ #category : #lists }
PPMiniCommonMark >> spaces: length [
	| retval |
	retval := ''.
	length timesRepeat: [ 
		retval := retval, ' '.
	].
	^ retval
]

{ #category : #'as yet unclassified' }
PPMiniCommonMark >> start [
	^ document
]

{ #category : #'as yet unclassified' }
PPMiniCommonMark >> whitespace [
	^ #space asParser
]
