"
This class is based on the SQLite grammar. Refer to http://www.sqlite.org/about.html for more information about the sintax. 

IMPORTANT: It can be that the implementation does not fit really all the parts of the SQLite grammar. So eventually extend this class to satisfy  your needed.

This class should be extended to define the behaviour of the production action to perform.

Instance Variables:
	whitespace	<ProtoObject | PseudoContext>
	identifier	<Heap | PPParser | RecordingControlsMorph>
	createDatabase	<PPParser>
	table	<Heap | PPParser | RecordingControlsMorph>
	database	<ProtoObject | PseudoContext>
	createTable	<PPParser>
	create	<Heap | PPParser | RecordingControlsMorph>
	creator	<BalloonBezierSimulation | BalloonLineSimulation | Character class | ECMenuMorph | FMSingleEdgeStrategy | GLMSelectedTextChanged | LineSegment | MABreadthFirstSearchPath | MADijkstra | PPParser | REPHudson | SHRange | Stopwatch | Timespan>
"
Class {
	#name : #PetitSQLiteGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'whitespace',
		'identifier',
		'createDatabase',
		'table',
		'database',
		'createTable',
		'create',
		'ifNotExists',
		'temp',
		'temporary',
		'columnDef',
		'tableConstraint',
		'as',
		'selectStatement',
		'typeName',
		'columnConstraint',
		'constraint',
		'primaryKey',
		'asc',
		'desc',
		'conflictClause',
		'autoincrement',
		'notNull',
		'unique',
		'check',
		'expression',
		'default',
		'signedNumber',
		'literalValue',
		'collate',
		'foreignKeyClause',
		'indexedColumn',
		'foreignKey',
		'onConflict',
		'rollback',
		'abort',
		'fail',
		'ignore',
		'replace',
		'integerLiteral',
		'floatingPointLiteral',
		'references',
		'notElem',
		'on',
		'update',
		'delete',
		'set',
		'null',
		'restrict',
		'cascade',
		'noAction',
		'match',
		'deferrable',
		'initially',
		'deferred',
		'immediate',
		'foreignKeyClauseOnPart',
		'foreignKeyClauseNotPart',
		'blobLiteral',
		'currentTime',
		'currentDate',
		'currentTimestamp',
		'tableConstraintPrimaryKeyPart',
		'tableConstraintForeignKeyPart',
		'tableConstraintCheckPart',
		'columnTypes',
		'explain',
		'queryPlan',
		'sqlStatement',
		'sqlStatementList',
		'tableColumnsDefinition',
		'columnConstraintPrimaryKey',
		'alter',
		'alterTable',
		'renameTo',
		'add',
		'column',
		'alterTableConstraintPKOracle',
		'alterTableConstraintFKOracle',
		'expressionTerm',
		'index',
		'createIndex',
		'select',
		'distinct',
		'all',
		'resultColumn',
		'selectCore',
		'from',
		'where',
		'groupBy',
		'joinSource',
		'singleSource',
		'joinOperator',
		'indexed',
		'by',
		'notIndexed',
		'joinConstraint',
		'orderingTerm',
		'compoundOperator',
		'alterTableConstraintUnique',
		'updateStatement',
		'keywords',
		'keyword',
		'qualifiedTableName',
		'deleteStatement',
		'insert',
		'or',
		'into',
		'values',
		'insertStatement',
		'complexIdentifier',
		'singleSourceJoinSourceInRBPart',
		'singleSourceSelectStmtInRBPart',
		'singleSourceIdentifierPart',
		'defaultConstraint',
		'notNullConstraint',
		'unsigned',
		'indexedColumnsInRoundParentheses',
		'expressionInRoundParentheses',
		'identifiersInRoundParentheses',
		'char',
		'byte',
		'timestamp',
		'date',
		'time',
		'view',
		'createView',
		'timestampOracleFormat',
		'timestampDB2Format',
		'comment',
		'label'
	],
	#category : #'PetitSQLite-Parser'
}

{ #category : #'as yet unclassified' }
PetitSQLiteGrammar class >> ignoredNames [
	
	^super ignoredNames , #('keywords' 'initializeKeywords')
]

{ #category : #tokens }
PetitSQLiteGrammar >> abort [
	^'ABORT' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> add [
	^'ADD' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> all [
	^'ALL' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> alter [
	^'ALTER' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTable [
	"http://www.sqlite.org/lang_altertable.html"
	"modified to add the oracle defintion of contraints on PK and FK"
	^alter , table , 
		complexIdentifier , 
		( (renameTo , identifier) / (add , ( alterTableConstraintPKOracle / alterTableConstraintFKOracle / alterTableConstraintUnique / ( column optional, columnDef trim) trim))).
	

]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintFKOracle [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of an oracle constraint"
	^(	(constraint , identifier) optional , 
		foreignKey , $( asPParser trim optional , (identifier separatedBy: $, asPParser trim) , $) asPParser trim optional , 
		foreignKeyClause).
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintPKOracle [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of an oracle constraint"
	^( (constraint , identifier) optional , 
	primaryKey , $( asPParser trim optional , (identifier separatedBy: $, asPParser trim) , $) asPParser trim optional , (('USING' asPParser caseInsensitive , index) / ('ENABLE' asPParser caseInsensitive , 'NOVALIDATE' asPParser caseInsensitive)) optional ) trim 
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintUnique [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of a unique constraint"
	^( (constraint , identifier) optional , 
	unique , $( asPParser trim optional , (identifier separatedBy: $, asPParser trim) , $) asPParser trim optional , (('USING' asPParser caseInsensitive , index) / ('ENABLE' asPParser caseInsensitive , 'NOVALIDATE' asPParser caseInsensitive)) optional ) trim 
]

{ #category : #tokens }
PetitSQLiteGrammar >> as [
	^'AS' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> asc [
	^'ASC' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> autoincrement [
	^'AUTOINCREMENT' asPParser caseInsensitive trim
]

{ #category : #clause }
PetitSQLiteGrammar >> blobLiteral [
	^'BLOB' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> by [
	^'BY' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> byte [
	^'BYTE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> cascade [
	^'CASCADE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> char [
	^'CHAR' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> check [
	^'CHECK' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> collate [
	^'COLLATE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> column [ 
	^'COLUMN' asPParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> columnConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^	(constraint , identifier) optional ,
	( columnConstraintPrimaryKey /
	notNullConstraint /
	null / "added MySQL specific Constraint"
	( unique , conflictClause ) /
	( check , expressionInRoundParentheses ) /
	defaultConstraint /
	( collate , identifier ) /
	unsigned / "MySQL specific constraint"
	foreignKeyClause ).
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> columnConstraintPrimaryKey [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	
	^primaryKey , (asc / desc) optional , conflictClause , autoincrement optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> columnDef [
	"http://www.sqlite.org/syntaxdiagrams.html#column-def"
	"constraint negate has been putted to mismatch the starting of a tableConstraint definition"
	"petit hint: negate consume one character instead not doesn't consume the input e.g tableConstraint negate -> $c 'onfig_key' instead with tableConstraint not -> nil 'config_key' "
	^tableConstraint not , identifier , typeName optional , columnConstraint star.
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> columnTypes [ 
	^
	'VARCHAR2' asPParser caseInsensitive trim /
	'VARCHAR' asPParser caseInsensitive trim / "MySQL specific type"
	'CLOB' asPParser caseInsensitive trim / 
	'timestamp' asPParser caseInsensitive trim /
	'NUMBER' asPParser caseInsensitive trim / 
	'DATE' asPParser caseInsensitive trim / 
	'integer' asPParser caseInsensitive trim / 
	'boolean' asPParser caseInsensitive trim / 
	'blob' asPParser caseInsensitive trim / 
	'CHARACTER' asPParser caseInsensitive trim / "postgress specfic type"
	'char' asPParser caseInsensitive trim / 
	'int' asPParser caseInsensitive trim /
	'NVARCHAR2' asPParser caseInsensitive trim /
	'FLOAT' asPParser caseInsensitive trim /
	'RAW' asPParser caseInsensitive trim /
	'longtext' asPParser caseInsensitive trim / "MySQL specific type"
	'LONG' asPParser caseInsensitive trim /
	'NUMERIC' asPParser caseInsensitive trim / "postgress specfic type"
	'bytea' asPParser caseInsensitive trim / "postgress specfic type"
	'text' asPParser caseInsensitive trim / "postgress specfic type"
	'name' asPParser caseInsensitive trim / "postgress specfic type"
	'bigint' asPParser caseInsensitive trim / "MySQL specific type"
	'bit' asPParser caseInsensitive trim / "MySQL specific type"
	'varbinary' asPParser caseInsensitive trim / "MySQL specific type"
	'double' asPParser caseInsensitive trim / "MySQL specific type"
	'decimal' asPParser caseInsensitive trim / "MySQL specific type"
	'smallint' asPParser caseInsensitive trim. "MySQL specific type"
]

{ #category : #statements }
PetitSQLiteGrammar >> comment [
	"http://www.sqlite.org/syntaxdiagrams.html#create-table-stmt"
	^'COMMENT ON' asPParser , $; asPParser negate plus
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> complexIdentifier [
	^ (identifier , $. asPParser) optional , identifier
]

{ #category : #tokens }
PetitSQLiteGrammar >> compoundOperator [ 
	"http://www.sqlite.org/syntaxdiagrams.html#compound-operator"

	^(	('UNION' asPParser caseInsensitive trim , all optional ) /
		'INTERSECTION' asPParser caseInsensitive trim /
		'EXCEPT' asPParser caseInsensitive trim )
]

{ #category : #clause }
PetitSQLiteGrammar >> conflictClause [
	^(onConflict , ( rollback / abort / fail / ignore / replace ) ) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> constraint [
	^'CONSTRAINT' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> create [
	^'CREATE' asPParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> createDatabase [
	^create , database , identifier
]

{ #category : #statements }
PetitSQLiteGrammar >> createIndex [
	"http://www.sqlite.org/syntaxdiagrams.html#create-index-stmt"
	^create , 
		unique optional ,  
	index ,  
		ifNotExists optional ,
	complexIdentifier,
	on ,
	complexIdentifier,
	indexedColumnsInRoundParentheses
]

{ #category : #statements }
PetitSQLiteGrammar >> createTable [
	"http://www.sqlite.org/syntaxdiagrams.html#create-table-stmt"
	^create , 
		(temp / temporary) optional,  
	table ,  
		ifNotExists optional ,
	complexIdentifier , 
	( ($( asPParser trim , whitespace optional , tableColumnsDefinition plus , whitespace optional , $) asPParser trim ) | 
	( as , selectStatement ) ) 
]

{ #category : #statements }
PetitSQLiteGrammar >> createView [
	"http://www.sqlite.org/syntaxdiagrams.html#create-view-stmt"
	^create , 
		(temp / temporary) optional,  
	view ,  
		ifNotExists optional ,
	complexIdentifier , 
		( $( asPParser trim , whitespace optional , tableColumnsDefinition plus , whitespace optional , $) asPParser trim ) optional ,
	as,
	selectStatement
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentDate [ 
	^'CURRENT_DATE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentTime [
	^'CURRENT_TIME' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentTimestamp [ 
	^'CURRENT_TIMESTAMP' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> database [
	^'DATABASE' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> date [
	"Oracle format"
	^(#digit asPParser times: 4) flatten , $- asPParser , (#digit asPParser times: 2) flatten , $- asPParser , (#digit asPParser times: 2) flatten
]

{ #category : #tokens }
PetitSQLiteGrammar >> default [
	^'DEFAULT' asPParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> defaultConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^default , ( signedNumber / literalValue / expressionInRoundParentheses )
]

{ #category : #tokens }
PetitSQLiteGrammar >> deferrable [
	^'DEFERRABLE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> deferred [
	^'DEFERRED' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> delete [
	^'DELETE' asPParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> deleteStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#delete-stmt"
	^delete , from , (qualifiedTableName ==> #second) , (where , expression) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> desc [
	^'DESC' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> distinct [
	^'DISTINCT' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> explain [
	^'EXPLAIN' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> expression [
	"Complete implementation of http://www.sqlite.org/lang_expr.html"

	^  PPSQLiteExpressionParser new
		term: expressionTerm;
		group: [ :g |
			g prefix: '-' do: [ :op :a | { op. a } ].
			g prefix: '+' do: [ :op :a | { op. a } ].
			g prefix: '~' do: [ :op :a | { op. a } ].
			"g prefix: ':' do: [ :op :a | { op. a } ]."
			g prefix: 'NOT ' do: [ :op :a | { op. a } ] ];
		group: [ :g |
			g left: '||' asPParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '*' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '/' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '%' asPParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '+' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '-' asPParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '<<' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>>' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '&' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '|' asPParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '==' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '!=' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '=' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<>' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<=' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>=' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<' asPParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>' asPParser trim do: [ :a :op :b | { a. op. b } ]. ];
		group: [ :g |
			g left: 'IS NOT ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'IS ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'IN ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'LIKE ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'GLOB ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'MATCH ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'REGEXP ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: 'AND ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: 'OR ' asPParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g | "Add here the extra functions "
			g prefix: 'NOT EXISTS' asPParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'EXISTS' asPParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'COUNT' asPParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'TRIM' asPParser caseInsensitive trim do: [ :op :b | { op. b } ]. ];
		yourself
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> expressionInRoundParentheses [
	
	^$( asPParser trim , expression , $) asPParser trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> expressionTerm [
	^( 
	($( asPParser trim ,  selectStatement , $) asPParser trim) /
	($( asPParser trim ,  (expressionTerm / $) asPParser negate) star , $) asPParser trim) /
	(literalValue , ($( asPParser trim ,  (expressionTerm / $) asPParser negate) star , $) asPParser trim)) / "In the case we have a function invocation"
	(((literalValue , $. asPParser) min: 0 max: 2), literalValue)) flatten
]

{ #category : #tokens }
PetitSQLiteGrammar >> fail [
	^'FAIL' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> floatingPointLiteral [
	self flag: #TODO.
	^integerLiteral , $. asPParser trim , integerLiteral
]

{ #category : #tokens }
PetitSQLiteGrammar >> foreignKey [
	^'FOREIGN KEY' asPParser caseInsensitive trim
]

{ #category : #clause }
PetitSQLiteGrammar >> foreignKeyClause [
	"http://www.sqlite.org/syntaxdiagrams.html#foreign-key-clause"

	^references , complexIdentifier , indexedColumnsInRoundParentheses optional ,
	(foreignKeyClauseOnPart / ( match , identifier )) star , foreignKeyClauseNotPart optional.
]

{ #category : #'clause-elements' }
PetitSQLiteGrammar >> foreignKeyClauseNotPart [

	^notElem optional , deferrable , ( (initially , deferred) / (initially , immediate) ) optional
]

{ #category : #'clause-elements' }
PetitSQLiteGrammar >> foreignKeyClauseOnPart [

	^on , (delete / update ) ,
	( ( set , null ) /
	( set , default ) /
	cascade /
	restrict /
	noAction )
]

{ #category : #tokens }
PetitSQLiteGrammar >> from [
	^'FROM' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> groupBy [
	^'GROUP BY' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> identifier [
	^ (keyword not , ((#letter asPParser / $_ asPParser / #digit asPParser / $$ asPParser / '://' asPParser / $< asPParser / $% asPParser / $# asPParser / $> asPParser / $@ asPParser / $: asPParser) plus flatten trim)) ==>  #second
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> identifiersInRoundParentheses [
	
	^$( asPParser trim , ( identifier separatedBy: $, asPParser ) , $) asPParser trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> ifNotExists [
	^'IF NOT EXISTS' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> ignore [
	^'IGNORE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> immediate [
	^'IMMEDIATE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> index [
	^'INDEX' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> indexed [
	^'INDEXED' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> indexedColumn [
	^ identifier , ( collate , identifier ) optional , ( asc / desc ) optional.
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> indexedColumnsInRoundParentheses [

	^$( asPParser trim , (indexedColumn separatedBy: $, asPParser trim ) , $) asPParser trim
]

{ #category : #statements }
PetitSQLiteGrammar >> initialize [
	super initialize.

	self initializeKeywords.
]

{ #category : #statements }
PetitSQLiteGrammar >> initializeKeywords [

	| vals |
	keywords := Dictionary new.
	vals := #('CROSS' 'INNER' 'JOIN' 'LEFT' 'NATURAL' 'OUTER' 'WHERE' 'NOT' 'BLOB' 'ORDER BY' 'OR' 'FROM' 'COUNT').
	
	vals do: [:eachKeyword |
		keywords at: eachKeyword 
			put: (PP2UnresolvedNode named: ('keyword', eachKeyword first asUppercase asString , eachKeyword allButFirst))].
	
	keywords keysAndValuesDo:  [:key :value |
		(keywords at: key) def: (key asPParser caseInsensitive ,  (self punctuation optional , #word asPParser) not ) token]
]

{ #category : #tokens }
PetitSQLiteGrammar >> initially [
	^'INITIALLY' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> insert [
	^'INSERT' asPParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> insertStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#insert-stmt"

	^
	(replace / 
	(insert , 
		(or , (rollback / abort / replace / fail / ignore)) optional)) , 
	into , 
	(identifier , $. asPParser trim) optional , identifier , "databaseName . tableName "
	(
	(default , values) /
		(identifiersInRoundParentheses optional ,
	((values , $( asPParser trim , (expression separatedBy: $, asPParser trim) , $) asPParser trim) /
	selectStatement))
	)
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> integerLiteral [
	^#digit asPParser plus flatten trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> into [
	^'INTO' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinConstraint [ 
	"http://www.sqlite.org/syntaxdiagrams.html#join-constraint"
	^(	(on , expression) /
		('USING' asPParser caseInsensitive trim , identifiersInRoundParentheses)) optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinOperator [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"
	^$, asPParser trim /
		('NATURAL' asPParser caseInsensitive trim optional ,
		(('LEFT' asPParser caseInsensitive trim , 'OUTER' asPParser caseInsensitive trim optional ) /
		'INNER' asPParser caseInsensitive trim /
		'CROSS' asPParser caseInsensitive trim) optional ,
	'JOIN' asPParser caseInsensitive trim).
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinSource [
	"http://www.sqlite.org/syntaxdiagrams.html#join-source"
	^singleSource ,
	(joinOperator , singleSource , joinConstraint) star 
]

{ #category : #tokens }
PetitSQLiteGrammar >> keyword [

	| keywordParsers |
	
	keywordParsers := keywords keysSortedSafely 
								collect: [:eachKey | keywords at: eachKey ].
	
	^(keywordParsers reduce: [ :a :b | a / b ]) token trimBlanks
	

]

{ #category : #statements }
PetitSQLiteGrammar >> label [
	^'LABEL ON' asPParser , $; asPParser negate plus
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> literalValue [
	"http://www.sqlite.org/syntaxdiagrams.html#literal-value"
	"It is really important the order how those elements because most of them are prefix for someone else "
	^
	null / 
	currentTimestamp / 
	currentDate / 
	currentTime / 
	$? asPParser trim / 
	($' asPParser trim , $' asPParser trim ) /
	($' asPParser trim optional , (timestamp / date / floatingPointLiteral /  integerLiteral / complexIdentifier / blobLiteral) , $' asPParser trim optional ) "/
	complexIdentifier"

]

{ #category : #tokens }
PetitSQLiteGrammar >> match [
	^'MATCH' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> noAction [
	^'NO ACTION' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> notElem [
	^'NOT' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> notIndexed [
	^notElem , indexed 
]

{ #category : #tokens }
PetitSQLiteGrammar >> notNull [
	^'NOT NULL' asPParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> notNullConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^notNull , 'ENABLE' asPParser caseInsensitive optional , conflictClause
]

{ #category : #tokens }
PetitSQLiteGrammar >> null [
	^'NULL' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> on [
	^'ON' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> onConflict [
	^'ON CONFLICT' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> or [
	^'OR' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> orderingTerm [ 
	"http://www.sqlite.org/syntaxdiagrams.html#ordering-term"
	^
	expression ,
	(collate , identifier) optional ,
	(asc / desc) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> primaryKey [
	^'PRIMARY KEY' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> punctuation [
	^ (PP2PredicateObjectNode anyOf: '.,"''?!;:#$%&()*+-/<>=@[]\^_{}|~')
			predicateMessage: 'punctuation expected';
			yourself.
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> qualifiedTableName [
	^(identifier , $. asPParser) optional , identifier , ((indexed , by , identifier) / notIndexed) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> queryPlan [
	^'QUERY PLAN' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> references [
	^'REFERENCES' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> renameTo [
	^'RENAME TO' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> replace [
	^'REPLACE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> restrict [
	^'RESTRICT' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> resultColumn [
	"http://www.sqlite.org/syntaxdiagrams.html#result-column"

	^(	$* asPParser trim /
		((identifier , $. asPParser , identifier) trim , (as , identifier ) optional) /
		(identifier , $. asPParser , $* asPParser) trim /
		(expression , (as optional , identifier ) optional)
		 ).
]

{ #category : #tokens }
PetitSQLiteGrammar >> rollback [
	^'ROLLBACK' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> select [
	^'SELECT' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> selectCore [
	"http://www.sqlite.org/syntaxdiagrams.html#select-core"
	^ select , 
		(distinct / all) optional ,
	(resultColumn separatedBy: $, asPParser trim) ,
	(from , joinSource) optional ,
	(where , expression ) optional ,
	(groupBy , (orderingTerm separatedBy: $, asPParser trim), ('HAVING' asPParser caseInsensitive trim , expression) optional ) optional 
]

{ #category : #statements }
PetitSQLiteGrammar >> selectStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#select-stmt"
	^	(selectCore separatedBy: compoundOperator) ,
		('ORDER BY' asPParser caseInsensitive trim , (orderingTerm separatedBy: $, asPParser trim)) optional ,
		('LIMIT' asPParser caseInsensitive trim , expression , ( ('OFFSET' asPParser caseInsensitive trim / $, asPParser trim) , expression ) optional ) optional
]

{ #category : #tokens }
PetitSQLiteGrammar >> set [
	^'SET' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> signedNumber [
	^($+ asPParser trim / $- asPParser trim ) optional , ( floatingPointLiteral / integerLiteral ) trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSource [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^
	singleSourceJoinSourceInRBPart /
	singleSourceSelectStmtInRBPart /
	singleSourceIdentifierPart
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceIdentifierPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^complexIdentifier , (as optional , identifier) optional , ((indexed , by , identifier) / notIndexed ) optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceJoinSourceInRBPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^$( asPParser trim , joinSource , $) asPParser trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceSelectStmtInRBPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^$( asPParser trim , selectStatement , $) asPParser trim ,  as optional , identifier optional
]

{ #category : #statements }
PetitSQLiteGrammar >> sqlStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#sql-stmt"
	^(explain optional , queryPlan optional , (
	createTable /
	createDatabase /
	createIndex /
	alterTable /
	selectStatement /
	updateStatement /
	deleteStatement /
	insertStatement /
	createView /
	comment /
	label
	))
]

{ #category : #statements }
PetitSQLiteGrammar >> sqlStatementList [
	^(sqlStatement separatedBy: $; asPParser trim)
]

{ #category : #statements }
PetitSQLiteGrammar >> start [
	^ sqlStatementList end
]

{ #category : #tokens }
PetitSQLiteGrammar >> table [
	^'TABLE' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> tableColumnsDefinition [
	^( ( columnDef separatedBy: $, asPParser trim ) ,  ( $, asPParser trim , tableConstraint ) star )
]

{ #category : #constraints }
PetitSQLiteGrammar >> tableConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"

	^( constraint , identifier ) optional ,
	(tableConstraintPrimaryKeyPart /
	tableConstraintForeignKeyPart /
	tableConstraintCheckPart ).
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintCheckPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^check , expressionInRoundParentheses
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintForeignKeyPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^ foreignKey , identifiersInRoundParentheses , foreignKeyClause
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintPrimaryKeyPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^( primaryKey / unique ) , indexedColumnsInRoundParentheses , conflictClause
]

{ #category : #tokens }
PetitSQLiteGrammar >> temp [
	^'TEMP' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> temporary [
	^'TEMPORARY' asPParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> time [
	"Oracle format"
	^(#digit asPParser times: 2) flatten , $: asPParser , (#digit asPParser times: 2) flatten , $: asPParser , (#digit asPParser times: 2) flatten
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestamp [
	^timestampOracleFormat / timestampDB2Format
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestampDB2Format [
	^date , $- asPParser , ((#digit asPParser times: 2) flatten , $. asPParser , (#digit asPParser times: 2) flatten , $. asPParser , (#digit asPParser times: 2) flatten , ($. asPParser , #digit asPParser plus) optional flatten)
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestampOracleFormat [
	"Oracle format"
	 ^date , whitespace , time
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> typeName [
	"http://www.sqlite.org/syntaxdiagrams.html#type-name"
	^columnTypes , (	($( asPParser trim , signedNumber , $, asPParser trim , signedNumber , $) asPParser trim) /
						($( asPParser trim , signedNumber , $) asPParser trim) / 
						($( asPParser trim , signedNumber , ( char / byte ) , $) asPParser trim) / 
						($( asPParser trim , $* asPParser trim , $, asPParser trim , signedNumber , $) asPParser trim)) optional
]

{ #category : #tokens }
PetitSQLiteGrammar >> unique [
	^'UNIQUE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> unsigned [
	^'UNSIGNED' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> update [
	^'UPDATE' asPParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> updateStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#update-stmt"
	^(update , 
		('or' asPParser caseInsensitive trim , (rollback / abort / replace / fail / ignore)) optional ,
	qualifiedTableName ,
	set , ((identifier , '=' asPParser caseInsensitive trim , expression) separatedBy: $, asPParser trim) ,
		(where , expression) optional)
]

{ #category : #tokens }
PetitSQLiteGrammar >> values [
	^'VALUES' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> view [
	^'VIEW' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> where [
	^'WHERE' asPParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> whitespace [
	^Character space asPParser
]
