"
RTTabTable is made to work with CSV file contents.
"
Class {
	#name : #RTTabTable,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'values',
		'firstRow'
	],
	#category : #'Roassal2-Table'
}

{ #category : #data }
RTTabTable class >> countries [

	^ 'Country	Area	Population	Density	Gross Domestic Product	Gross Domestic Product per capita	Literacy Rate	Life Expectancy
Afghanistan	251827	29835392	118	27	917	28	45
Albania	11100	2994667	270	24	7967	99	77
Algeria	919595	34994937	38	251	7175	70	75
American Samoa	77	67242	875	1	8556	97	74
Andorra	181	84825	469	3	38904	100	82
Angola	481354	13338541	28	107	8044	67	39
Anguilla	35	15094	430	0	11621	95	81
Antigua and Barbuda	171	87884	514	1	16215	86	75
Argentina	1073518	41769726	39	596	14269	97	77
Armenia	11484	2967975	258	17	5681	99	73
Aruba	69	106113	1527	2	21279	97	76
Australia	2988902	21766711	7	882	40539	99	82
Austria	32383	8217280	254	332	40403	98	80
Azerbaijan	33436	8372373	250	91	10844	99	67
The Bahamas	5359	313312	58	9	28473	96	71
Bahrain	293	1214705	4140	30	24459	87	78
Bangladesh	55598	158570535	2852	259	1631	48	70
Barbados	166	286705	1727	6	21719	100	74
Belarus	80155	9577552	119	131	13699	100	71
Belgium	11787	10431477	885	394	37799	99	80
Belize	8867	321115	36	3	8256	77	68
Benin	43484	9325032	214	14	1500	35	60
Bermuda	21	68679	3294	5	65522	98	81
Bhutan	14824	708427	48	4	5470	47	67
Bolivia	424164	10118683	24	48	4732	87	68
Bosnia and Herzegovina	19767	4622163	234	30	6562	97	79
Botswana	224607	2065398	9	28	13794	81	58
Brazil	3287612	203429773	62	2172	10677	89	73
Brunei	2226	401890	181	20	50710	93	76
Bulgaria	42811	7093635	166	97	13643	98	74
Burkina Faso	105869	16751455	158	20	1193	22	54
Burma (Myanmar)	261228	53999804	207	76	1416	90	68
Burundi	10745	10216190	951	3	333	59	59
Cambodia	69898	14701717	210	30	2053	74	63
Cameroon	183568	19711291	107	44	2249	68	54
Canada	3855103	34030589	9	1330	39082	99	81
Cape Verde	1557	516100	331	2	3697	77	71
Cayman Islands	102	51384	504	2	43788	98	81
Central African Republic	240535	4950027	21	3	696	49	50
Chad	495755	10758945	22	17	1614	26	48
Chile	291933	16888760	58	258	15271	96	78
China	3705407	1336718015	361	10090	7548	92	75
Colombia	439736	44725543	102	435	9735	90	75
Comoros	863	794683	921	1	1007	57	64
Congo Democratic Republic of the	905355	71712867	79	23	322	67	55
Congo Republic of the	132047	4243929	32	17	4032	84	55
Cook Islands	91	11124	122	0	16469	95	75
Costa Rica	19730	4576562	232	51	11181	95	78
Cote d''Ivoire	124504	21504162	173	37	1722	49	57
Croatia	21851	4483804	205	78	17416	98	76
Cuba	42803	11087330	259	114	10291	100	78
Cyprus	3572	1120489	314	23	20696	98	78
Czech Republic	30451	10190213	335	261	25642	99	77
Denmark	16639	5529888	332	202	36475	99	79
Djibouti	8958	757074	85	2	2780	68	76
Dominica	290	72969	252	1	10388	94	76
Dominican Republic	18792	9956648	530	87	8763	87	77
Ecuador	109484	15007343	137	115	7663	91	76
Egypt	386662	82079636	212	498	6065	71	73
El Salvador	8124	6071774	747	44	7176	81	73
Equatorial Guinea	10831	668225	62	24	35647	87	62
Eritrea	45406	5939484	131	4	610	59	63
Estonia	17463	1282963	73	25	19245	100	73
Ethiopia	426373	90873739	213	86	948	43	56
Faroe Islands	538	49267	92	2	32273	99	80
Fiji	7056	883125	125	4	4381	94	71
Finland	130559	5259250	40	186	35366	100	79
France	248573	65312249	263	2145	32842	99	81
French Polynesia	1609	294935	183	5	15997	98	77
Gabon	103347	1576665	15	22	14258	63	52
The Gambia	4361	1797860	412	3	1943	40	64
Georgia	26911	4585874	170	22	4893	100	77
Germany	137847	81471834	591	2940	36086	99	80
Ghana	92098	24791073	269	62	2500	58	61
Gibraltar	3	28956	11538	1	44032	85	79
Greece	50949	10760136	211	318	29563	96	80
Greenland	836330	57670	0	2	34489	100	71
Grenada	133	108419	816	1	10127	100	73
Guam	210	183286	873	3	13640	99	78
Guatemala	42042	13824463	329	70	5074	69	71
Guinea	94926	10601009	112	11	1020	30	58
Guinea-Bissau	13948	1596677	114	2	1117	42	49
Guyana	83000	744768	9	5	7222	92	67
Haiti	10714	9719932	907	11	1181	53	62
Honduras	43278	8143564	188	34	4130	80	71
Hong Kong	426	7122508	16709	326	45742	94	82
Hungary	35918	9976062	278	188	18805	99	75
Iceland	39769	311058	8	12	37999	99	81
India	1269219	1189172906	937	4060	3414	61	67
Indonesia	735358	245613043	334	1030	4194	90	71
Iran	636372	77891220	122	819	10511	77	70
Iraq	169235	30399572	180	113	3730	74	71
Ireland	27133	4670976	172	172	36887	99	80
Israel	8019	7473052	932	219	29359	97	81
Italy	116348	61016804	524	1774	29074	98	82
Jamaica	4244	2868380	676	24	8269	88	73
Japan	145914	126475664	867	4310	34078	99	82
Jordan	34495	6508271	189	35	5306	90	82
Kazakhstan	1052090	15522373	15	196	12653	100	69
Kenya	224081	41070934	183	66	1608	85	59
Korea North	46540	24457492	526	40	1635	99	69
Korea South	38502	48754657	1266	1459	29925	98	79
Kuwait	6880	2595628	377	137	52588	93	77
Kyrgyzstan	77202	5587443	72	12	2151	99	70
Laos	91429	6477211	71	16	2422	73	62
Latvia	24938	2204708	88	33	14746	100	73
Lebanon	4015	4143101	1032	59	14330	87	75
Lesotho	11720	1924886	164	3	1716	85	52
Liberia	43000	3786764	88	2	447	58	57
Libya	679362	6597960	10	91	13727	83	78
Liechtenstein	62	35236	570	5	142695	100	80
Lithuania	25212	3535547	140	57	16006	100	75
Luxembourg	998	503302	504	41	81641	100	80
Macau	11	573003	52627	18	32234	91	84
Macedonia	9928	2077328	209	20	9628	96	75
Madagascar	226658	21926221	97	19	885	69	64
Malawi	45747	15879252	347	13	817	63	52
Malaysia	127355	28728607	226	414	14425	89	74
Maldives	115	394999	3433	3	6922	94	74
Mali	478841	14159904	30	17	1184	47	53
Malta	122	408333	3347	10	25494	93	80
Marshall Islands	70	67182	961	0	1987	94	72
Mauritania	397955	3281634	8	7	2028	51	61
Mauritius	788	1303717	1655	18	13853	84	74
Mexico	758449	113724226	150	1567	13779	86	76
Micronesia	271	106836	394	0	2229	89	72
Moldova	13070	4314377	330	11	2547	99	71
Monaco	1	30539	39548	1	31969	99	90
Mongolia	603909	3133318	5	11	3517	98	68
Montserrat	39	5140	131	0	5642	97	73
Morocco	172414	31968361	185	151	4736	52	76
Mozambique	308642	22948858	74	22	950	48	52
Namibia	318261	2147585	7	15	6798	85	52
Nepal	56827	29391883	517	36	1218	49	66
Netherlands	16040	16847007	1050	677	40179	99	80
New Caledonia	7172	256275	36	3	12323	96	77
New Zealand	103363	4290347	42	118	27457	99	81
Nicaragua	50336	5666301	113	18	3125	68	72
Niger	489191	16468886	34	11	671	29	53
Nigeria	356669	155215573	435	378	2435	68	48
Northern Mariana Islands	179	46050	257	1	19544	97	77
Norway	125021	4691849	38	255	54414	100	80
Oman	119499	3027959	25	76	25047	81	74
Pakistan	307374	187342721	609	465	2482	50	66
Palau	177	20956	118	0	7826	92	72
Panama	29120	3460462	119	44	12819	92	78
Papua New Guinea	178704	6187591	35	15	2416	57	66
Paraguay	157048	6459058	41	33	5157	94	76
Peru	496225	29248943	59	276	9426	93	72
Philippines	115831	101833938	879	351	3451	93	72
Poland	120728	38441588	318	721	18764	100	76
Portugal	35556	10760305	303	247	22955	95	79
Qatar	4473	848016	190	151	177591	89	96
Romania	92043	21904551	238	254	11605	97	74
Russia	6601668	138739892	21	2223	16023	99	68
Rwanda	10169	11370425	1118	12	1069	70	58
Saint Helena Ascension and Tristan da Cunha	119	7700	65	0	2338	97	79
Saint Kitts and Nevis	101	50314	499	1	13595	98	75
Saint Lucia	238	161557	679	2	11129	90	77
Saint Pierre and Miquelon	93	5888	63	0	8203	99	80
Saint Vincent and the Grenadines	150	103869	692	1	10292	96	74
Samoa	1093	193161	177	1	5462	100	72
San Marino	24	31817	1351	1	35736	96	83
Sao Tome and Principe	372	179506	482	0	1733	85	63
Saudi Arabia	830000	26131703	31	622	23803	79	74
Senegal	75955	12643799	166	24	1889	39	60
Serbia	29913	7310555	244	80	10957	96	74
Seychelles	176	89188	508	2	23019	92	74
Sierra Leone	27699	5363669	194	5	880	35	56
Singapore	269	4740737	17616	292	61573	93	82
Slovakia	18933	5477038	289	120	21946	100	76
Slovenia	7827	2000092	256	57	28289	100	77
Somalia	246201	9925640	40	6	594	38	50
South Africa	470693	49004031	104	524	10693	86	49
Spain	195124	46754784	240	1369	29280	98	81
Sri Lanka	25332	21283913	840	107	5004	91	76
Sudan	718723	45047502	63	100	2220	61	55
Suriname	63251	491989	8	5	9575	90	74
Swaziland	6704	1370424	204	6	4427	82	49
Sweden	173860	9088728	52	355	39026	99	81
Switzerland	15937	7639961	479	325	42474	99	81
Syria	71498	22517750	315	107	4770	80	75
Taiwan	13892	23071779	1661	822	35619	96	78
Tajikistan	55251	7627200	138	15	1933	100	66
Tanzania	365755	42746620	117	58	1367	69	53
Thailand	198117	66720153	337	587	8796	93	68
Timor-Leste	5743	1177834	205	3	2590	59	63
Togo	21925	6771993	309	6	882	61	63
Tonga	288	105916	367	1	7091	99	75
Trinidad and Tobago	1980	1227505	620	26	21263	99	71
Tunisia	63170	10629186	168	100	9408	74	75
Turkey	302535	78785548	260	961	12191	87	73
Turkmenistan	188456	4997503	27	37	7384	99	69
Turks and Caicos Islands	366	44819	122	0	4819	98	79
Uganda	93065	34612250	372	42	1218	67	53
Ukraine	233032	45134707	194	305	6762	99	69
United Arab Emirates	32278	5148664	160	247	47935	78	77
United Kingdom	94058	62698362	667	2173	34658	99	80
United States	3794100	313232044	83	14660	46802	99	78
Uruguay	68037	3308535	49	48	14505	98	76
Uzbekistan	172742	28128600	163	86	3052	99	73
Vanuatu	4706	224564	48	1	5063	74	65
Venezuela	352144	27635743	78	345	12491	93	74
Vietnam	127881	90549390	708	277	3055	94	72
Virgin Islands	737	109666	149	2	14380	93	79
Wallis and Futuna	55	15398	281	0	3897	50	79
West Bank	2263	2568555	1135	13	4979	92	75
Yemen	203850	24133492	118	63	2627	50	64
Zambia	290587	13881336	48	20	1444	81	52
Zimbabwe	150872	12084304	80	5	452	91	50
'
]

{ #category : #data }
RTTabTable class >> euCountries [

	^  #('Russia' 'Ukraine' 'France' 'Spain' 'Sweden' 'Norway' 'Germany' 'Finland' 'Poland' 'Italy' 'United' 'Romania' 'Belarus' 'Kazakhstan' 'Greece' 'Bulgaria' 'Iceland' 'Hungary' 'Portugal' 'Austria' 'Czech' 'Serbia' 'Republic' 'Lithuania' 'Latvia' 'Croatia' 'Bosnia' 'Slovakia' 'Estonia' 'Denmark' 'Netherlands' 'Switzerland' 'Moldova' 'Belgium' 'Albania' 'Republic' 'Turkey' 'Slovenia' 'Montenegro' 'Cyprus' 'Azerbaijan' 'Luxembourg' 'Georgia' 'Andorra' 'Malta' 'Liechtenstein' 'San Marino' 'Monaco')
]

{ #category : #'instance creation' }
RTTabTable class >> openTSVfile [
	| fileName tab stream |
	fileName := TRPlatform current dialogChooseFile:  #('*.csv') label: 'Pick a CSV file'.
	fileName ifNil: [ ^ nil ].
	stream := fileName asFileReference readStream.

	[ tab := self new.
	tab input: stream contents usingDelimiter: Character tab. ]
	ensure: [ stream close ].
	self assert: [tab values first size = 3] description: 'Wrong CSV structure'.
	tab convertColumnsAsInteger: #(1).
	
	^ tab
]

{ #category : #data }
RTTabTable class >> southAmericanCountries [ 

	^ #('Brazil' 'Colombia' 'Argentina' 'Peru' 'Venezuela' 'Chile' 'Ecuador' 'Bolivia' 'Paraguay' 'Uruguay' 'Guyana' 'Suriname' 'French' 'Falkland' 'Islands')
]

{ #category : #accessing }
RTTabTable >> attributes [
	attributes ifNil: [ attributes := Dictionary new ].
	^ attributes
]

{ #category : #updating }
RTTabTable >> breakDown: l usingDelimiters: delimitersAsCharacter [
	^ l subStringsKeepingEmptyFields: delimitersAsCharacter
	

]

{ #category : #accessing }
RTTabTable >> cleanedValuesOfColumn: indexAsNumberOfString [
	"Return the values stored in the column. No nil values may be returned (this happens if a column is has less elements than other columns"
	^ (self valuesOfColumn: indexAsNumberOfString) select: [ :ss | ss notNil and: [ ss ~= 'nil' and: [ ss notEmpty ] ] ]
]

{ #category : #converting }
RTTabTable >> convertColumn: index to: blockForConvertion [
	"Convert a column of the table"
	values do: [ :row | 
		| v i |
		i := (self convertFromNameToIndexIfNecessary: index).
		v := row at: i.
		row at: i put: (blockForConvertion rtValue: v)
		 ]
]

{ #category : #converting }
RTTabTable >> convertColumnAsDateAndTime: integerOrString [
	"Replace each element by an instance of DateAndTime"

	self convertColumnsAsDateAndTime: (Array with: (self convertFromNameToIndexIfNecessary: integerOrString))
]

{ #category : #converting }
RTTabTable >> convertColumnAsInteger: integerOrString [
	"Convert a column as integers"
	self assert: [ integerOrString isCollection not ] description: 'Provide an integer or a string as argument please'.
	^ self convertColumnsAsInteger: (Array with: (self convertFromNameToIndexIfNecessary: integerOrString))
]

{ #category : #converting }
RTTabTable >> convertColumns: collectionOfIntegers to: aBlock [
	"collectionOfIntegers is a collection of integers corresponding to column to convert"
	"block is a one-arg block that takes as input a string and return the wanted value"

	collectionOfIntegers do: [ :index | 
		self convertColumn: index to: aBlock ]
]

{ #category : #converting }
RTTabTable >> convertColumnsAsDateAndTime: collectionOfIntegers [
	"collectionOfIntegers is a collection of integers corresponding to column to convert"
	"Replace each element by an instance of DateAndTime"

	self convertColumns: collectionOfIntegers to: [ :s | (TRPlatform current dateAndTimeFromString: s) ]
]

{ #category : #converting }
RTTabTable >> convertColumnsAsFloat: collectionOfIntegers [
	^ self convertColumns: collectionOfIntegers to: [ :s | Float readFrom: s ]
]

{ #category : #converting }
RTTabTable >> convertColumnsAsInteger: collectionOfIntegers [
	^ self convertColumns: collectionOfIntegers to: [ :s | s asNumber asInteger ]
]

{ #category : #'private-utility' }
RTTabTable >> convertFromNameToIndexIfNecessary: anObject [
	"anObject could be a number (to indicate a column index) or a string"
	"The method return the index"
	^ anObject isNumber
		ifTrue: [ anObject ]
		ifFalse: [ 
			"Then we are surely a string" 
			self indexOfName: anObject ]
]

{ #category : #'private-utility' }
RTTabTable >> detectDelimiterIn: aString [
	| options first second |
	aString lines size = 0
		ifTrue: [ ^ Character tab ].
	options := Array with: Character tab with: $; with: $,.
	first := (options collect: [ :each | each -> (aString lines first occurrencesOf: each) ]) asDictionary.
	second := first.
	aString lines size > 1
		ifTrue: [ second := (options collect: [ :each | each -> (aString lines second occurrencesOf: each) ]) asDictionary ].
	^ (options detect: [ :each | (first at: each) > 0 and: [ (first at: each) = (second at: each) ] ] ifNone: [ Character tab ]) value
]

{ #category : #accessing }
RTTabTable >> dictionaryValues [
	^ self values
		collect: [ :row | 
			(row withIndexCollect: [ :each :i | (firstRow at: i) asSymbol -> each ])
				asOrderedDictionary ]
]

{ #category : #accessing }
RTTabTable >> firstColumn [
	^ self valuesOfColumn: 1
]

{ #category : #accessing }
RTTabTable >> firstRow [
	^ firstRow ifNil: [ self values first ]
]

{ #category : #converting }
RTTabTable >> gather: columnIndex using: twoArgBlock [
	| d key | 
	d := Dictionary new.
	values do: [ :row |
		key := row at: columnIndex.
		(d includesKey: key)
			ifTrue: [ d at: key put: (twoArgBlock value: (d at: key) value: row) ]
			ifFalse: [ d at: key put: row ] ].
	values := d values
]

{ #category : #'gt-inspector-extension' }
RTTabTable >> gtInspectorTableIn: composite [
	<gtInspectorPresentationOrder: 30>
	| tbl titles |
	(tbl := composite table)
		title: 'CSV';
		display: [ firstRow ifNil: [ self values allButFirst ] ifNotNil: [ self values ] ].
	titles := firstRow ifNil: [ self values first ].
	titles
		withIndexDo: [ :heading :i | 
			tbl
				column: heading
				evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: (each at: i) ] ].
	^ tbl
]

{ #category : #converting }
RTTabTable >> indexOfName: aString [
	"Return the index of the column named aString"
	| s |
	s := aString asSymbol.
	firstRow doWithIndex: [ :e :i | e asSymbol = s ifTrue: [ ^ i ] ].
	^ 0
]

{ #category : #updating }
RTTabTable >> input: txt [
	"txt is a large string in which we have one entry per line"
	^ self input: txt usingDelimiter: (self detectDelimiterIn: txt)
]

{ #category : #updating }
RTTabTable >> input: txt usingDelimiter: delimitersAsCharacter [
	"txt is a large string in which we have one entry per line"

	values := (txt lines 
					select: #notEmpty 
					thenCollect: [ :l | self breakDown: l trimBoth usingDelimiters: delimitersAsCharacter asString ])
		select: #notEmpty
]

{ #category : #updating }
RTTabTable >> input: txt usingDelimiters: delimitersAsString [
	"txt is a large string in which we have one entry per line"
	values := txt lines collect: [ :l | l substrings: delimitersAsString ]
]

{ #category : #accessing }
RTTabTable >> maxOfColumn: aBlock [
	| max |
	max := -100000.
	self values do: [ :row | max := max max: (aBlock rtValue: row) ].
	^ max
]

{ #category : #accessing }
RTTabTable >> maximum [
	| max |
	"We initialize the mininum to any value found in the table"
	max := self values last detect: #isNumber ifNone: [ 0 ].
	
	self values do: [ :row |
		row do: [ :value | 
			value isNumber ifTrue: [ max := max max: value ] ] ].
	^ max
]

{ #category : #accessing }
RTTabTable >> minimum [
	"Return the minimum of the whole table"
	| min |
	"We initialize the mininum to any value found in the table"
	min := self values last detect: #isNumber ifNone: [ 0 ].
	
	self values do: [ :row |
		row do: [ :value | 
			value isNumber ifTrue: [ min := min min: value ] ] ].
	^ min
]

{ #category : #accessing }
RTTabTable >> numberOfColumns [
	^ (self values collect: #size) max
]

{ #category : #accessing }
RTTabTable >> numberOfRows [
	^ values size
]

{ #category : #updating }
RTTabTable >> rejectInColumn: nbColumn row: aBlock [
	"Remove rows for which the nbColumn element is evaluated at true"
	self rejectRow: [ :row | aBlock rtValue: (row at: nbColumn) ]

]

{ #category : #updating }
RTTabTable >> rejectRow: aBlock [
	"Remove a row for which the block evaluate to true. The block takes as argument the row"
	values := values reject: [ :v | aBlock rtValue: v ]
]

{ #category : #updating }
RTTabTable >> removeColumn: aNumber [
	values := values collect: [ :v | v copyWithoutIndex: aNumber ].
	firstRow ifNotNil: [ firstRow := firstRow copyWithoutIndex: aNumber ]
]

{ #category : #accessing }
RTTabTable >> removeFirstRow [
	"Remove the first line of the table, typically the header"
	firstRow := values first.
	values := values allButFirst.
	^ firstRow.
]

{ #category : #converting }
RTTabTable >> replaceEmptyValuesWith: aValue inColumns: columns [
	"columns is a collection of integers"
	self convertColumns: columns to: [ :s | s isEmpty ifTrue: [ aValue ] ifFalse: [ s ] ]
]

{ #category : #converting }
RTTabTable >> replaceZeroWithCumulativeValuesInColumns: columns [
	columns
		do: [ :column | 
			| previous |
			previous := 0.
			values
				do: [ :row | 
					(row at: column) = 0 ifTrue: [ row at: column put: previous ].
					previous := row at: column ] ]
]

{ #category : #accessing }
RTTabTable >> values [
	^ values
]

{ #category : #accessing }
RTTabTable >> valuesGroupedBy: aSymbol [
	^ (self dictionaryValues groupedBy: [ :each | each at: aSymbol ]) asDictionary
]

{ #category : #accessing }
RTTabTable >> valuesOfColumn: indexAsNumberOfString [
	"Return the values stored in the column. Note that these values may not be cleaned, ie. nil values may be contained"
	^ values collect: [ :row | row at: (self convertFromNameToIndexIfNecessary: indexAsNumberOfString) ]
]
