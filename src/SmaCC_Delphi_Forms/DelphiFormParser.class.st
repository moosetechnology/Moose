Class {
	#name : #DelphiFormParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #'generated-accessing' }
DelphiFormParser class >> cacheId [
	^'2019-04-15T17:16:13.94025-05:00'
]

{ #category : #generated }
DelphiFormParser class >> definitionComment [
"%glr;
%ignorecase;
%id <bytes>;
%prefix DelphiForm;
%suffix Node;
%root Parse;
%hierarchy Literal (Boolean Float Integer String);
%start Property Object Value Item;
<boolean>
	: true | false
	;
<LETTER> 
	: <isLetter>
	;
<DIGIT> 
	: [0-9] 
	;
<name>
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<positive_integer>
	: \d+
	;
<integer>
	: \-? <positive_integer>
	;
<float>
	: <integer> (\. <positive_integer> | d | (\. <positive_integer>?)? e [\+\-]? <positive_integer>)
	;
<string>
	: (\' [^\']* \' | (\#\d+))+
	;
<bytes>
	: ([0-9a-f]{2,2})+
	;
<whitespace>
	: \s+
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;
Form
	: Object
	;
Object
	: ObjectType 'objectTypeToken' <name> 'nameToken' "":"" 'colonToken' <name> 'typeToken' Index Properties ""end"" 'endToken' {{Object}}
	| ObjectType 'objectTypeToken' <name> 'typeToken' Index Properties ""end"" 'endToken' {{Object}}
	;
ObjectType
	: ""object""
	| ""inherited""
	| ""inline""
	;
Index
	:
	| ""["" 'left' <integer> 'indexToken' ""]"" 'right'
	;
Properties
	:
	| Properties Property 'property'
	;
Property
	: Assignment
	| Object
	;
Assignment
	: QualifiedName 'name' ""="" 'equalsToken' Value 'value' {{Property}}
	;
Value
	: Number
	| String
	| Set
	| QualifiedName 'name' {{NamedValue}}
	| Array
	| ByteArray
	| Boolean
	| ObjectArray
	;
Number
	: <integer> 'value' {{Integer}}
	| <float> 'value' {{Float}}
	;
String
	: <string> 'value' {{String}}
	| String 'left' ""+"" 'plus' <string> 'right' {{CombinedString}}
	;
Set
	: ""["" 'left' SetItems_ ""]"" 'right' {{Set}}
	;
SetItems_
	:
	| SetItems
	;
SetItems
	: <name> 'item' 
	| SetItems "","" 'comma' <name> 'item' 
	;
Array
	: ""("" 'left' Values "")"" 'right' {{Array}}
	;
Values
	: 
	| Values Value 'value'
	;
ByteArray
	: ""{"" 'left' ByteData ""}"" 'right' {{ByteArray}}
	;
ByteData
	: 
	| ByteData <bytes> 'line'
	;
Boolean
	: <boolean> 'value' {{Boolean}}
	;
ObjectArray
	: ""<"" 'left' Items "">"" 'right' {{ObjectArray}}
	;
Items
	: 
	| Items Item 'item' 
	;
Item
	: ""item"" 'itemToken' Properties ""end"" 'endToken' {{Item}}
	;
QualifiedName
	: <name> 'name' {{QualifiedName}}
	| QualifiedName ""."" 'period' <name> 'name' {{QualifiedName}}
	;"
]

{ #category : #'file types' }
DelphiFormParser class >> fileExtension [
	^ '.dfm'
]

{ #category : #'file types' }
DelphiFormParser class >> fileExtensionType [
	^ 'Delphi form files'
]

{ #category : #generated }
DelphiFormParser class >> reduceTable [
^#(
	#(30 1 #liftFirstValue: 872450 false ) 
	#(30 1 #liftFirstValue: 872451 false ) 
	#(30 1 #liftFirstValue: 872449 false ) 
	#(28 1 #liftFirstValue: 610305 false ) 
	#(49 1 #reduceActionForQualifiedName1: 2035713 false ) 
	#(33 1 #liftFirstValue: 1041410 false ) 
	#(33 1 #liftFirstValue: 1041409 false ) 
	#(42 0 #reduceActionForValues1: 1675265 false ) 
	#(47 0 #reduceActionForValues1: 1931265 false ) 
	#(39 0 #reduceActionForSetItems_1: 1522689 false ) 
	#(44 0 #reduceActionForValues1: 1777665 false ) 
	#(45 1 #reduceActionForBoolean1: 1821697 false ) 
	#(36 1 #reduceActionForNumber1: 1289217 false ) 
	#(36 1 #reduceActionForNumber2: 1289218 false ) 
	#(37 1 #reduceActionForString1: 1362945 false ) 
	#(35 1 #liftFirstValue: 1163265 false ) 
	#(35 1 #liftFirstValue: 1163266 false ) 
	#(35 1 #liftFirstValue: 1163267 false ) 
	#(35 1 #liftFirstValue: 1163269 false ) 
	#(35 1 #liftFirstValue: 1163270 false ) 
	#(35 1 #liftFirstValue: 1163271 false ) 
	#(35 1 #liftFirstValue: 1163272 false ) 
	#(35 1 #reduceActionForValue4: 1163268 false ) 
	#(32 0 #reduceActionForValues1: 989185 false ) 
	#(31 0 #reduceActionForIndex1: 926721 false ) 
	#(40 1 #reduceActionForSetItems1: 1551361 false ) 
	#(39 1 #reduceActionForSetItems_2: 1522690 false ) 
	#(49 3 #reduceActionForQualifiedName2: 2035714 false ) 
	#(34 3 #reduceActionForAssignment1: 1078273 false ) 
	#(41 3 #reduceActionForArray1: 1622017 false ) 
	#(42 2 #reduceActionForValues2: 1675266 false ) 
	#(46 3 #reduceActionForObjectArray1: 1866753 false ) 
	#(47 2 #reduceActionForValues2: 1931266 false ) 
	#(38 3 #reduceActionForSet1: 1470465 false ) 
	#(43 3 #reduceActionForByteArray1: 1714177 false ) 
	#(44 2 #reduceActionForValues2: 1777666 false ) 
	#(37 3 #reduceActionForString2: 1362946 false ) 
	#(48 3 #reduceActionForItem1: 1967105 false ) 
	#(32 2 #reduceActionForValues2: 989186 false ) 
	#(40 3 #reduceActionForSetItems2: 1551362 false ) 
	#(31 3 #reduceActionForIndex2: 926722 false ) 
	#(29 5 #reduceActionForObject2: 628738 false ) 
	#(29 7 #reduceActionForObject1: 628737 false )
	).
]

{ #category : #'generated-accessing' }
DelphiFormParser class >> scannerClass [
	^DelphiFormScanner
]

{ #category : #generated }
DelphiFormParser class >> startingStateForForm [
	^ 1
]

{ #category : #generated }
DelphiFormParser class >> startingStateForItem [
	^ 5
]

{ #category : #generated }
DelphiFormParser class >> startingStateForObject [
	^ 3
]

{ #category : #generated }
DelphiFormParser class >> startingStateForProperty [
	^ 2
]

{ #category : #generated }
DelphiFormParser class >> startingStateForValue [
	^ 4
]

{ #category : #generated }
DelphiFormParser class >> symbolNames [
	^ #('"("' '")"' '"+"' '","' '"."' '":"' '"<"' '"="' '">"' '"["' '"]"' '"end"' '"inherited"' '"inline"' '"item"' '"object"' '"{"' '"}"' '<boolean>' '<name>' '<integer>' '<float>' '<string>' '<bytes>' '<whitespace>' '<patternToken>' 'B e g i n' 'Form' 'Object' 'ObjectType' 'Index' 'Properties' 'Property' 'Assignment' 'Value' 'Number' 'String' 'Set' 'SetItems_' 'SetItems' 'Array' 'Values' 'ByteArray' 'ByteData' 'Boolean' 'ObjectArray' 'Items' 'Item' 'QualifiedName' 'E O F' 'error')
]

{ #category : #generated }
DelphiFormParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #DelphiFormObjectNode #DelphiFormObjectNode #DelphiFormObjectNode #SmaCCToken #OrderedCollection #OrderedCollection #DelphiFormParseNode #DelphiFormPropertyNode #DelphiFormParseNode #DelphiFormLiteralNode #DelphiFormParseNode #DelphiFormSetNode #OrderedCollection #OrderedCollection #DelphiFormArrayNode #OrderedCollection #DelphiFormByteArrayNode #OrderedCollection #DelphiFormBooleanNode #DelphiFormObjectArrayNode #OrderedCollection #DelphiFormItemNode #DelphiFormQualifiedNameNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
DelphiFormParser class >> transitionTable [
^#(
#[1 0 45 0 13 0 45 0 14 0 45 0 16 0 37 0 28 0 37 0 29 0 45 0 30] 
#[1 0 45 0 13 0 45 0 14 0 45 0 16 0 49 0 20 0 57 0 29 0 45 0 30 0 57 0 33 0 57 0 34 0 65 0 49] 
#[1 0 45 0 13 0 45 0 14 0 45 0 16 0 69 0 29 0 45 0 30] 
#[1 0 73 0 1 0 77 0 7 0 81 0 10 0 85 0 17 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 105 0 35 0 105 0 36 0 113 0 37 0 105 0 38 0 105 0 41 0 105 0 43 0 105 0 45 0 105 0 46 0 137 0 49] 
#[1 0 141 0 15 0 145 0 48] 
#[0 0 6 0 20] 
#[0 0 10 0 20] 
#[0 0 14 0 20] 
#[0 0 0 0 50] 
#[0 0 18 0 50] 
#[0 0 149 0 20] 
#[0 0 22 0 1 0 2 0 5 0 7 0 8 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 26 0 12 0 13 0 14 0 16 0 20 0 50] 
#[0 0 0 0 50] 
#[0 0 30 0 12 0 13 0 14 0 16 0 20 0 50] 
#[1 0 153 0 5 0 157 0 8] 
#[0 0 0 0 50] 
#[1 0 34 0 1 0 34 0 2 0 34 0 7 0 34 0 10 0 34 0 17 0 34 0 19 0 34 0 20 0 34 0 21 0 34 0 22 0 34 0 23 0 161 0 42] 
#[1 0 38 0 9 0 38 0 15 0 165 0 47] 
#[1 0 42 0 11 0 169 0 20 0 173 0 39 0 177 0 40] 
#[1 0 46 0 18 0 46 0 24 0 181 0 44] 
#[0 0 50 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 54 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 58 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 62 0 1 0 2 0 3 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 0 0 50] 
#[0 0 66 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[1 0 70 0 1 0 70 0 2 0 185 0 3 0 70 0 7 0 70 0 10 0 70 0 12 0 70 0 13 0 70 0 14 0 70 0 16 0 70 0 17 0 70 0 19 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 50] 
#[0 0 74 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 78 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 82 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 86 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 90 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[1 0 94 0 1 0 94 0 2 0 153 0 5 0 94 0 7 0 94 0 10 0 94 0 12 0 94 0 13 0 94 0 14 0 94 0 16 0 94 0 17 0 94 0 19 0 94 0 20 0 94 0 21 0 94 0 22 0 94 0 23 0 94 0 50] 
#[1 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 16 0 98 0 20 0 189 0 32] 
#[0 0 0 0 50] 
#[1 0 193 0 6 0 197 0 10 0 102 0 12 0 102 0 13 0 102 0 14 0 102 0 16 0 102 0 20 0 201 0 31] 
#[0 0 205 0 20] 
#[1 0 73 0 1 0 77 0 7 0 81 0 10 0 85 0 17 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 209 0 35 0 209 0 36 0 113 0 37 0 209 0 38 0 209 0 41 0 209 0 43 0 209 0 45 0 209 0 46 0 137 0 49] 
#[1 0 73 0 1 0 213 0 2 0 77 0 7 0 81 0 10 0 85 0 17 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 217 0 35 0 217 0 36 0 113 0 37 0 217 0 38 0 217 0 41 0 217 0 43 0 217 0 45 0 217 0 46 0 137 0 49] 
#[1 0 221 0 9 0 141 0 15 0 225 0 48] 
#[0 0 106 0 4 0 11] 
#[0 0 229 0 11] 
#[1 0 233 0 4 0 110 0 11] 
#[1 0 237 0 18 0 241 0 24] 
#[0 0 245 0 23] 
#[1 0 249 0 12 0 45 0 13 0 45 0 14 0 45 0 16 0 49 0 20 0 253 0 29 0 45 0 30 0 253 0 33 0 253 0 34 0 65 0 49] 
#[0 1 1 0 20] 
#[0 1 5 0 21] 
#[1 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 16 0 98 0 20 1 9 0 32] 
#[0 0 114 0 1 0 2 0 5 0 7 0 8 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 118 0 12 0 13 0 14 0 16 0 20 0 50] 
#[0 0 122 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 126 0 1 0 2 0 7 0 10 0 17 0 19 0 20 0 21 0 22 0 23] 
#[0 0 130 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 134 0 9 0 15] 
#[0 0 138 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 1 13 0 20] 
#[0 0 142 0 1 0 2 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 146 0 18 0 24] 
#[0 0 150 0 1 0 2 0 3 0 7 0 10 0 12 0 13 0 14 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 50] 
#[0 0 154 0 9 0 15 0 50] 
#[0 0 158 0 12 0 13 0 14 0 16 0 20] 
#[1 0 197 0 10 0 102 0 12 0 102 0 13 0 102 0 14 0 102 0 16 0 102 0 20 1 17 0 31] 
#[0 1 21 0 11] 
#[1 1 25 0 12 0 45 0 13 0 45 0 14 0 45 0 16 0 49 0 20 0 253 0 29 0 45 0 30 0 253 0 33 0 253 0 34 0 65 0 49] 
#[0 0 162 0 4 0 11] 
#[1 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 16 0 98 0 20 1 29 0 32] 
#[0 0 166 0 12 0 13 0 14 0 16 0 20] 
#[0 0 170 0 12 0 13 0 14 0 16 0 20 0 50] 
#[1 1 33 0 12 0 45 0 13 0 45 0 14 0 45 0 16 0 49 0 20 0 253 0 29 0 45 0 30 0 253 0 33 0 253 0 34 0 65 0 49] 
#[0 0 174 0 12 0 13 0 14 0 16 0 20 0 50]
	).
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForArray1: nodes [
	| result |
	result := DelphiFormArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForAssignment1: nodes [
	| result |
	result := DelphiFormPropertyNode new.
	result name: (nodes at: 1).
	result equalsToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForBoolean1: nodes [
	| result |
	result := DelphiFormBooleanNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForByteArray1: nodes [
	| result |
	result := DelphiFormByteArrayNode new.
	result left: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result lines.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForIndex1: nodes [
	| result |
	result := Array new: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForIndex2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForItem1: nodes [
	| result |
	result := DelphiFormItemNode new.
	result itemToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result properties.
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForNumber1: nodes [
	| result |
	result := DelphiFormIntegerNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForNumber2: nodes [
	| result |
	result := DelphiFormFloatNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObject1: nodes [
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result typeToken: (nodes at: 4).
	result left: ((nodes at: 5) at: 1).
	result indexToken: ((nodes at: 5) at: 2).
	result right: ((nodes at: 5) at: 3).
	result addNodes: (nodes at: 6) to: result properties.
	result endToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObject2: nodes [
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result typeToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result indexToken: ((nodes at: 3) at: 2).
	result right: ((nodes at: 3) at: 3).
	result addNodes: (nodes at: 4) to: result properties.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObjectArray1: nodes [
	| result |
	result := DelphiFormObjectArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result items.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForQualifiedName1: nodes [
	| result |
	result := DelphiFormQualifiedNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForQualifiedName2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periods.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSet1: nodes [
	| result |
	result := DelphiFormSetNode new.
	result left: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result items.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems_1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems_2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForString1: nodes [
	| result |
	result := DelphiFormStringNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForString2: nodes [
	| result |
	result := DelphiFormCombinedStringNode new.
	result left: (nodes at: 1).
	result plus: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForValue4: nodes [
	| result |
	result := DelphiFormNamedValueNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForValues1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForValues2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #testing }
DelphiFormParser >> tryAllTokens [
	^ currentToken ids includes: scanner bytesId
]
