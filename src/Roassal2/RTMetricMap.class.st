"
A RTMapBuilder2 is specialized to display metrics
"
Class {
	#name : #RTMetricMap,
	#superclass : #RTBuilder,
	#instVars : [
		'countryData',
		'countryName',
		'pointShapeBuilder'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #public }
RTMetricMap >> africanCountries [
	^ self countries: RTSVGPath africa color: Color white

]

{ #category : #public }
RTMetricMap >> allCountriesColor: aColor [
	^ self countries: RTSVGPath countries color: aColor

]

{ #category : #utility }
RTMetricMap >> convertIntoSVGCountryName: aName [
	| normalizedName |
	aName = 'Mauritius' ifTrue: [ ^ #Mauritania ].
	aName = 'Russian Federation' ifTrue: [ ^ #Russia ].
	aName = 'Turkey' ifTrue: [ ^ #RepublicofTurkey ].
	
	#(
		#('FR' #France) 
		#('UK' #GreatBritian)
		#('DE' #Germany)
		#('US' #UnitedStates)
		#('CH' #Switzerland)
		#('CA' #Canada)
		#('AU' #Austria)
		#('IE' #Israel)
		#('IT' #Italy)) do: [ :arr | arr first = aName ifTrue: [ ^ arr second ] ].
	
	normalizedName := (aName copyWithoutAll: '. ') asSymbol.
	^ (RTSVGPath class methodDict keys includes: normalizedName)
			ifTrue: [ normalizedName ]
			ifFalse: [ nil ]
]

{ #category : #adding }
RTMetricMap >> countries: countryNames [
	^ self countries: countryNames color: [ :c | Color random ]
]

{ #category : #public }
RTMetricMap >> countries: countryNames color: aColor [
	"Display a list of countries"
	countryNames do: [ :country |
		| elem |
		elem := (RTSVGPath new
			path: (RTSVGPath perform: country asSymbol);
			fillColor: aColor;
			scale: 1) elementOn:(country asString).
		elem @ RTPopup.
		view add: elem.
	].
]

{ #category : #adding }
RTMetricMap >> countries: collection named: selectorOrBlockForName [
	"Display a list of countries"
	"E.g., countries: #(#('France' 50) #('Germany' 80)) named: #first"
	collection do: [ :country |
		| elem |
		elem := (RTSVGPath new
			path: (RTSVGPath perform: (selectorOrBlockForName rtValue: country) asSymbol);
			fillColor: Color random;
			scale: 1) elementOn: (country asString).
		elem @ RTPopup.
		view add: elem.
	].
]

{ #category : #public }
RTMetricMap >> countries: collection named: selectorOrBlockForName metric: selectorOrBlockForMetric [
	"Display a list of countries"
	"E.g., countries: #(#('France' 50) #('Germany' 80)) named: #first metric: #second"
	
	"Example:
	RTMapBuilder2 new countries: #(#('France' 20) #('Germany' 80)) named: #first metric: #second; open
	"
	countryData := collection.
	countryName := selectorOrBlockForName.
	self fillViewWithCountries: countryData named: countryName metric: selectorOrBlockForMetric
]

{ #category : #hooks }
RTMetricMap >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #examples }
RTMetricMap >> example01 [

	"self new example01"
	
	| b |
	b := RTMetricMap new.
	b countries: #('France' 'Germany').
	^ b
]

{ #category : #examples }
RTMetricMap >> example02 [

	"self new example02"
	
	| b |
	b := RTMetricMap new.
	b countries: #(#('France' 50) #('Germany' 80)) named: #first.
	^ b
]

{ #category : #examples }
RTMetricMap >> example03 [

	"self new example03"
	
	| b |
	b := RTMetricMap new.
	b countries: #(#('France' 50) #('Germany' 80)) named: #first metric: #second.
	^ b
]

{ #category : #examples }
RTMetricMap >> example04 [

	"self new example04"
	"The data shows the average publication for person in the country"
	| b data |
	b := RTMetricMap new.
	data := RTTabTable new input: 'Switzerland	0.04948049
Sweden	0.03949838
Denmark	0.03724673
Finland	0.03512776
Iceland	0.03384176
Netherlands	0.03266005
Norway	0.03235590
Monaco	0.03153357
United Kingdom	0.03034517
Australia	0.03013565
New Zealand	0.02928470
Canada	0.02848185
Israel	0.02841134
Singapore	0.02814340
Belgium	0.02684193
Austria	0.02538793
Slovenia	0.02456816
Liechtenstein	0.02302488
Ireland	0.02280205
United States	0.02250084
Germany	0.02177218
France	0.01953477
Spain	0.01643973
Greece	0.01601820
Italy	0.01575377
Czech Republic	0.01557232
Estonia	0.01429077
Japan	0.01392641
Croatia	0.01346473
Portugal	0.01319425
Luxembourg	0.01267497
Korea	0.01157157
Hungary	0.01128115
Greenland	0.01071429
Cyprus	0.00913291
Poland	0.00899290
Lithuania	0.00829172
Bermuda	0.00745301
Faeroe Islands	0.00668606
Bulgaria	0.00620812
New Caledonia	0.00605143
Malta	0.00601626
Grenada	0.00528995
Palau	0.00510745
Latvia	0.00497760
Romania	0.00432618
Kuwait	0.00423781
Barbados	0.00421932
Turkey	0.00414781
Russian Federation	0.00408719
Serbia	0.00399812
Chile	0.00394931
San Marino	0.00374436
Seychelles	0.00373640
Guam	0.00360543
Tunisia	0.00355685
French Polynesia	0.00341107
Malaysia	0.00339218
Brunei Darussalam	0.00326268
Armenia	0.00315417
Jordan	0.00314134
Lebanon	0.00309093
Puerto Rico	0.00305665
Cayman Islands	0.00297030
Argentina	0.00288041
Qatar	0.00282271
Uruguay	0.00281334
Trinidad and Tobago	0.00279863
Macedonia	0.00273227
Iran	0.00265369
Belarus	0.00262056
Oman	0.00247495
Bahrain	0.00247073
South Africa	0.00244784
Ukraine	0.00241902
Brazil	0.00232119
Cuba	0.00218313
Dominica	0.00216227
Saudi Arabia	0.00208004
United Arab Emirates	0.00206949
American Samoa	0.00204978
China	0.00198446
Montenegro	0.00175661
Fiji	0.00174223
Botswana	0.00172363
Georgia	0.00166009
Virgin Islands (U.S.)	0.00164332
Tuvalu	0.00152130
Mexico	0.00137863
Costa Rica	0.00135080
Andorra	0.00132721
Jamaica	0.00128646
Moldova	0.00127910
Thailand	0.00123095
Marshall Islands	0.00119874
Bosnia and Herzegovina	0.00116017
Egypt	0.00110861
Mauritius	0.00110573
Samoa	0.00093706
Panama	0.00093654
Northern Mariana Islands	0.00091924
Gabon	0.00091696
Venezuela	0.00090597
Turks and Caicos Islands	0.00089432
Vanuatu	0.00086952
Antigua and Barbuda	0.00084204
Gambia	0.00084188
Morocco	0.00083801
Azerbaijan	0.00080366
Tonga	0.00077186
Mongolia	0.00076525
Colombia	0.00075234
Belize	0.00069432
Bahamas	0.00069362
Algeria	0.00066821
Namibia	0.00064132
India	0.00060709
Swaziland	0.00056459
Guyana	0.00053183
Albania	0.00048797
Congo	0.00047290
Sri Lanka	0.00040530
Solomon Islands	0.00040393
Maldives	0.00039889
Bhutan	0.00039767
Aruba	0.00039069
Kenya	0.00038740
Zimbabwe	0.00038282
Senegal	0.00036806
Suriname	0.00035732
Cameroon	0.00034761
Kazakhstan	0.00033660
Pakistan	0.00032448
Peru	0.00029889
Ecuador	0.00029486
Ghana	0.00026906
Uzbekistan	0.00025359
Benin	0.00025232
Bolivia	0.00024428
Nigeria	0.00024256
Papua New Guinea	0.00023985
Nepal	0.00022093
Malawi	0.00021098
Burkina Faso	0.00020486
Uganda	0.00020330
Sao Tome and Principe	0.00020202
Guinea-Bissau	0.00019536
Vietnam	0.00018557
Zambia	0.00018529
Iraq	0.00017914
Syrian Arab Republic	0.00017648
Tanzania	0.00016707
Nicaragua	0.00016106
Lesotho	0.00015549
Djibouti	0.00015471
Togo	0.00015159
Equatorial Guinea	0.00014804
Paraguay	0.00014026
Philippines	0.00013611
El Salvador	0.00012751
Bangladesh	0.00012593
Mali	0.00011910
Kiribati	0.00011906
Tajikistan	0.00010988
Sudan	0.00010700
Cambodia	0.00010468
Guatemala	0.00010131
Madagascar	0.00010097
Mauritania	0.00009194
Central African Republic	0.00008817
Ethiopia	0.00008738
Honduras	0.00008720
Comoros	0.00008223
Indonesia	0.00008169
Rwanda	0.00007864
Yemen	0.00007203
Niger	0.00006895
Dominican Republic	0.00006860
Eritrea	0.00006035
Mozambique	0.00005971
Sierra Leone	0.00005720
Haiti	0.00004305
Turkmenistan	0.00004156
Timor-Leste	0.00004131
Guinea	0.00003336
Burundi	0.00002853
Liberia	0.00002792
Chad	0.00002249
Angola	0.00002123
Myanmar	0.00002040
Afghanistan	0.00001626
Somalia	0.00000589
'.
	data convertColumn: 2 to: [ :t | Float readFrom: t ].
	b countries: data values named: #first metric: #second.
	^ b
]

{ #category : #examples }
RTMetricMap >> example05 [

	"self new example05"
	"The data shows the average publication for person in the country"
	"Data have been gathered by Aidan Hogan, from University of Chile"
	| b data |
	b := RTMetricMap new.
	data := RTTabTable new input: '	Country	Population	Documents	Citable documents	Citations	Self-Citations	Citations per Document	H index	Docs/Pop
1	Switzerland	7997152	395703	377016	7714443	1077442	22.69	569	0.0494804900544594
2	Sweden	9516617	375891	361569	6810427	1104677	20.11	511	0.0394983847726561
3	Denmark	5590478	208227	198923	3876514	573278	21.56	427	0.037246725593053
4	Finland	5414293	190192	184924	3091345	506506	18.55	372	0.0351277627568364
5	Iceland	320137	10834	10359	199408	19732	23.7	160	0.0338417614958596
6	Netherlands	16767705	547634	519258	1.01E+07	1701502	21.25	576	0.0326600450091411
7	Norway	5018869	162390	154481	2299463	382990	17.23	327	0.032355895322233
8	Monaco	37579	1185	1099	16430	2138	16.72	56	0.0315335692807153
9	United Kingdom	63227526	1918650	1763766	3.14E+07	7513112	18.29	851	0.0303451696022394
10	Australia	22683600	683585	643028	9338061	2016394	16.73	514	0.0301356486624698
11	New Zealand	4433100	129822	122601	1705695	276798	15.73	282	0.0292846991946945
12	Canada	34880491	993461	946493	1.57E+07	3050504	18.5	658	0.0284818525060327
13	Israel	7907900	224674	215590	3663004	530340	17.78	414	0.0284113354999431
14	Singapore	5312400	149509	144653	1616952	230656	12.95	268	0.0281434003463595
15	Belgium	11142157	299077	285735	4696153	701283	18.16	454	0.0268419301576885
16	Austria	8462446	214844	204243	3047983	433709	16.67	378	0.0253879315743935
17	Slovenia	2058152	50565	49471	403209	83402	9.53	153	0.0245681562877766
18	Liechtenstein	36656	844	820	7665	717	12.16	41	0.0230248799650807
19	Ireland	4588798	104634	98785	1329296	162271	16.47	271	0.0228020496870858
20	United States	313914040	7063329	6672307	1.30E+08	6.25E+07	20.45	1380	0.0225008381275333
21	Germany	81889839	1782920	1704566	2.58E+07	6852785	16.16	740	0.0217721761548463
22	France	65696689	1283370	1229376	1.79E+07	4151730	15.6	681	0.0195347744237156
23	Spain	46217961	759811	715452	8688942	2212008	13.89	476	0.0164397343275269
24	Greece	11280167	180688	171529	1827577	324747	12.28	266	0.0160182025673911
25	Italy	60917978	959688	909701	1.27E+07	2976533	15.26	588	0.0157537730487378
26	Czech Republic	10514810	163740	160193	1265709	313836	9.28	239	0.0155723213258252
27	Estonia	1339396	19141	18774	204306	38547	13.58	130	0.0142907698694038
28	Japan	127561489	1776473	1734289	2.03E+07	6073934	12.11	635	0.0139264053275515
29	Croatia	4267000	57454	55909	305003	71781	6.45	143	0.013464729318022
30	Portugal	10526703	138892	134447	1342075	270626	13.06	234	0.0131942546493427
31	Luxembourg	531441	6736	6459	52218	5038	12.97	80	0.0126749723863985
32	Korea	50004000	578625	566953	4640390	1067252	10.55	333	0.0115715742740581
33	Hungary	9943755	112177	109150	1189497	202337	11.76	254	0.0112811508328594
34	Greenland	56840	609	600	6927	951	17.65	36	0.0107142857142857
35	Cyprus	1128994	10311	9938	79318	10252	12.46	86	0.00913290947516107
36	Poland	38542737	346611	339712	2441439	652956	8.25	302	0.00899290053013101
37	Lithuania	2985509	24755	24434	151748	37377	8.61	109	0.00829171843059257
38	Bermuda	64806	483	463	13161	1010	29.08	55	0.00745301360985094
39	Faeroe Islands	49506	331	321	5915	481	26.55	35	0.00668605825556498
40	Bulgaria	7304632	45348	44609	319449	56183	7.8	138	0.00620811561759716
41	New Caledonia	258121	1562	1519	19506	2872	15.38	59	0.00605142549424495
42	Malta	418366	2517	2384	21115	1584	12.5	60	0.006016263271872
43	Grenada	105483	558	502	2791	157	11.81	23	0.00528995193538295
44	Palau	20754	106	102	1314	77	15.01	22	0.00510744916642575
45	Latvia	2025473	10082	9918	67924	10428	8.61	85	0.00497760276241648
46	Romania	21326905	92264	91247	396795	100983	6.34	135	0.00432617859928574
47	Kuwait	3250496	13775	13425	93290	12879	7.67	83	0.00423781478272854
48	Barbados	283221	1195	1083	11744	801	11.28	50	0.00421931989506428
49	Turkey	73997128	306926	291814	1935431	519675	8.24	210	0.00414780962850342
50	Russian Federation	143533000	586646	579814	3132050	938471	5.52	325	0.0040871855252799
51	Serbia	7223887	28882	28312	81010	23288	8.75	68	0.00399812455538133
52	Chile	17464814	68974	66972	685110	134570	13.24	194	0.00394931202817276
53	San Marino	31247	117	114	1381	13	17.61	17	0.00374435945850802
54	Seychelles	87785	328	309	4632	360	17.86	33	0.00373640143532494
55	Guam	162810	587	575	7779	416	14.67	45	0.00360542964191389
56	Tunisia	10777500	38334	36859	169981	39062	6.77	85	0.00355685455810717
57	French Polynesia	273814	934	908	11157	1288	14.27	45	0.00341107467112712
58	Malaysia	29239927	99187	97018	356918	93479	7.85	125	0.00339217673149458
59	Brunei Darussalam	412238	1345	1188	8967	874	9.52	40	0.00326267835570714
60	Armenia	2969081	9365	9194	73659	13718	8.78	105	0.00315417464191782
61	Jordan	6318000	19847	19507	107550	15257	7.24	82	0.00314134219689775
62	Lebanon	4424888	13677	12847	97316	10182	9.7	97	0.00309092569122653
63	Puerto Rico	3667084	11209	10953	150252	11819	15.34	129	0.00305665209741582
64	Cayman Islands	57570	171	165	825	36	7.5	14	0.00297029702970297
65	Argentina	41086927	118347	114659	1167884	259247	11.44	222	0.00288040524422768
66	Qatar	2050514	5788	5542	23880	2554	5.74	50	0.00282270689202805
67	Uruguay	3395253	9552	9263	107649	15598	14.39	104	0.00281333968337558
68	Trinidad and Tobago	1337439	3743	3541	25225	2242	8.38	61	0.00279863231145495
69	Macedonia	2105575	5753	5611	30344	3717	6.98	62	0.00273227028246441
70	Iran	76424443	202807	197571	832211	337637	8.49	135	0.00265369287676719
71	Belarus	9464000	24801	24466	122850	24438	5.08	106	0.00262056213017751
72	Oman	3314001	8202	7816	43277	5405	7.06	63	0.00247495399065963
73	Bahrain	1317827	3256	3071	13287	1404	5.19	39	0.00247073401895696
74	South Africa	51189307	125303	118747	1170454	260828	11.36	231	0.00244783544344525
75	Ukraine	45593300	110291	108782	452610	131479	4.29	142	0.00241901770654899
76	Brazil	198656019	461118	446892	3362480	1151280	10.09	305	0.00232118816394886
77	Cuba	11270957	24606	23847	123183	28193	5.81	93	0.00218313316251672
78	Dominica	71684	155	145	865	77	7.42	15	0.00216226773059539
79	Saudi Arabia	28287855	58840	56534	293556	45641	7.11	124	0.0020800445986449
80	United Arab Emirates	9205651	19051	18331	100247	11207	7.56	87	0.00206948970800653
81	American Samoa	55128	113	107	1199	69	11.25	18	0.00204977506893049
82	China	1350695000	2680395	2655272	1.13E+07	6127507	6.17	385	0.00198445615035223
83	Montenegro	621081	1091	1076	2209	548	1.79	17	0.00175661467666858
84	Fiji	874742	1524	1479	10758	1100	8.48	40	0.00174222799408283
85	Botswana	2003910	3454	3369	27060	3224	9.13	57	0.00172363030275811
86	Georgia	4511800	7490	7309	50895	7781	7.74	78	0.00166009131610444
87	Virgin Islands (U.S.)	105275	173	168	2024	53	12.63	24	0.00164331512704821
88	Tuvalu	9860	15	15	109	2	7.24	7	0.00152129817444219
89	Mexico	120847477	166604	162116	1346721	295320	10	232	0.00137863035402882
90	Costa Rica	4805295	6491	6319	86713	9950	15.67	103	0.00135080156369172
91	Andorra	78360	104	93	921	29	8.18	16	0.00132720775906075
92	Jamaica	2712100	3489	3298	28602	3554	9.69	57	0.00128645698904908
93	Moldova	3559541	4553	4513	27987	5555	6.5	60	0.00127909750161608
94	Thailand	66785001	82209	79537	621817	109600	10.96	167	0.00123095004520551
95	Marshall Islands	52555	63	62	499	24	7.1	13	0.00119874417277138
96	Bosnia and Herzegovina	3833916	4448	4336	14364	2274	6.92	44	0.00116017148002199
97	Egypt	80721874	89489	87658	518096	106783	7.56	132	0.00110860904938852
98	Mauritius	1291456	1428	1387	9101	772	7.85	41	0.00110572872788543
99	Samoa	188889	177	176	1373	104	8.15	19	0.000937058272318663
100	Panama	3802281	3561	3401	74014	7882	29.76	106	0.00093654309084468
101	Northern Mariana Islands	53305	49	48	443	26	10.71	12	0.000919238345370978
102	Gabon	1632572	1497	1419	20417	2496	16.09	61	0.000916958026966039
103	Venezuela	29954782	27138	26445	204691	29729	8.42	130	0.000905965531647001
104	Turks and Caicos Islands	32427	29	28	251	4	11.28	9	0.0008943164646745
105	Vanuatu	247262	215	206	1620	200	9.64	20	0.000869523016072021
106	Antigua and Barbuda	89069	75	71	279	17	5.07	9	0.000842043808732556
107	Gambia	1791225	1508	1410	35029	3232	25.59	80	0.000841881952295217
108	Morocco	32521143	27253	26175	157219	29432	7.11	99	0.000838008676386313
109	Azerbaijan	9297507	7472	7373	18607	4318	3	45	0.000803656291950089
110	Tonga	104941	81	80	747	53	9.54	16	0.000771862284521779
111	Mongolia	2796484	2140	2096	17104	1869	12.97	55	0.000765246645430476
112	Colombia	47704427	35890	34768	228686	36843	10.61	133	0.0007523410772757
113	Belize	324060	225	217	2209	121	13.26	26	0.000694315867431957
114	Bahamas	371960	258	246	2498	206	13.52	25	0.000693622970211851
115	Algeria	38481705	25714	25387	105945	20698	6.49	78	0.000668213635544475
116	Namibia	2259393	1449	1412	16317	1594	12.61	55	0.000641322691537063
117	India	1236686732	750777	716232	4528302	1585248	7.99	301	0.000607087454383719
118	Swaziland	1230985	695	676	4421	287	8.2	28	0.000564588520574987
119	Guyana	795369	423	400	3157	128	9.23	27	0.00053182862294105
120	Albania	3162083	1543	1500	7407	769	7.88	36	0.000487969480877004
121	Congo	4337051	2051	1947	16173	1685	10.17	49	0.000472901978786968
122	Sri Lanka	20328000	8239	7853	61175	6285	9.91	86	0.00040530303030303
123	Solomon Islands	549598	222	209	2345	184	13.16	24	0.000403931600915578
124	Maldives	338442	135	131	895	52	6.57	15	0.000398886663002819
125	Bhutan	741822	295	290	1360	173	6.55	18	0.00039766952179903
126	Aruba	102384	40	40	233	1	7.57	8	0.000390686044694484
127	Kenya	43178141	16727	16044	206886	34874	15.09	131	0.000387395094198243
128	Zimbabwe	13724317	5254	5092	55075	6025	10.71	72	0.000382824150739159
129	Senegal	13726021	5052	4844	44909	5892	10.73	75	0.000368060051780483
130	Suriname	534541	191	187	1632	126	10.62	24	0.000357315902802591
131	Cameroon	21699631	7543	7318	59454	12199	10.42	72	0.000347609597600991
132	Kazakhstan	16797459	5654	5563	21197	3306	4.48	52	0.000336598529575217
133	Pakistan	179160111	58133	55915	243958	72199	6.22	111	0.000324475128283438
134	Peru	29987800	8963	8528	97117	10907	15.04	109	0.00029888821454058
135	Ecuador	15492264	4568	4406	51303	6817	14.47	83	0.000294856839516807
136	Ghana	25366462	6825	6594	52958	6618	10.73	73	0.000269056047311604
137	Uzbekistan	29776850	7551	7414	29026	5687	3.99	53	0.000253586259124118
138	Benin	10050702	2536	2472	18846	3379	10.06	49	0.000252320683669658
139	Bolivia	10496285	2564	2505	31002	3203	14.13	61	0.000244276903685447
140	Nigeria	168833776	40952	40124	174002	42457	6.23	89	0.000242558100459709
141	Papua New Guinea	7167010	1719	1669	18668	2092	11.43	54	0.000239848974677027
142	Nepal	27474377	6070	5582	41907	5494	9.73	71	0.000220933126163334
143	Malawi	15906483	3356	3163	42360	6042	16.51	80	0.000210983156993284
144	Burkina Faso	16460141	3372	3259	31888	5299	12.14	62	0.000204858512451382
145	Uganda	36345860	7389	7014	87647	14831	17.01	99	0.00020329688168061
146	Sao Tome and Principe	188098	38	37	436	56	11.85	14	0.000202022350051569
147	Guinea-Bissau	1663558	325	299	5919	1068	22.77	40	0.000195364393667068
148	Vietnam	88775500	16474	16116	125927	18500	11.79	107	0.000185569216732094
149	Zambia	14075099	2608	2467	30437	3583	14.07	68	0.000185291769528584
150	Iraq	32578209	5836	5526	14909	1831	4.82	41	0.000179138147219818
151	Syrian Arab Republic	22399254	3953	3851	29002	3808	9.93	58	0.000176479091669749
152	Tanzania	47783107	7983	7708	91706	14922	14.46	93	0.000167067411501726
153	Nicaragua	5991733	965	936	9903	840	13.41	45	0.000161055240612357
154	Lesotho	2051545	319	308	1848	112	7.31	22	0.000155492567796466
155	Djibouti	859652	133	122	653	42	6.6	13	0.000154713767896777
156	Togo	6642928	1007	943	5111	516	6.06	31	0.0001515897808918
157	Equatorial Guinea	736296	109	107	896	105	9.07	15	0.00014803828894901
158	Paraguay	6687361	938	904	9364	615	13.45	45	0.000140264597649207
159	Philippines	96706764	13163	12796	141070	15727	13.38	116	0.000136112506049732
160	El Salvador	6297394	803	777	4553	263	7.45	31	0.000127513063340169
161	Bangladesh	154695368	19481	19037	115329	22662	8.37	97	0.000125931372424803
162	Mali	14853572	1769	1717	19599	2135	13.95	55	0.000119095931941489
163	Kiribati	100786	12	11	84	1	7.27	6	0.000119064155735916
164	Tajikistan	8008990	880	870	2429	396	3.14	23	0.000109876526253622
165	Sudan	37195349	3980	3860	24909	3661	9.29	52	0.000107002625516432
166	Cambodia	14864646	1556	1462	15891	1739	12.76	49	0.00010467790487577
167	Guatemala	15082831	1528	1453	15652	1011	12.7	53	0.000101307241326247
168	Madagascar	22293914	2251	2182	22100	3516	11.9	56	0.000100969260041104
169	Mauritania	3796141	349	338	2711	150	8.98	25	0.0000919354681504191
170	Central African Republic	4525209	399	383	4080	236	11.73	32	0.0000881727230720172
171	Ethiopia	91728849	8015	7825	60457	12411	10.42	73	0.000087377091148282
172	Honduras	7935846	692	675	7265	370	12.48	39	0.000087199272768146
173	Comoros	717503	59	56	516	36	9.71	10	0.0000822296213395623
174	Indonesia	246864191	20166	19740	146670	16149	10.94	112	0.0000816886398886423
175	Rwanda	11457801	901	838	6336	506	12.72	36	0.0000786363805759936
176	Yemen	23852409	1718	1676	8972	1069	7.93	37	0.0000720262678708888
177	Niger	17157042	1183	1158	11457	1055	10.83	47	0.0000689512795970308
178	Dominican Republic	10276621	705	678	7234	422	13.02	41	0.0000686023158779525
179	Eritrea	6130922	370	361	3233	261	9.35	25	0.0000603498136169405
180	Mozambique	25203395	1505	1457	15973	1867	12.98	53	0.0000597141773955453
181	Sierra Leone	5978727	342	323	2077	134	7.87	21	0.0000572028125719739
182	Haiti	10173775	438	397	6447	441	21.58	36	0.000043051866195193
183	Turkmenistan	5172931	215	213	1259	119	7.29	16	0.0000415625106926808
184	Timor-Leste	1210233	50	44	216	12	7.23	8	0.000041314358474773
185	Guinea	11451273	382	363	4249	179	14.19	34	0.0000333587366225572
186	Burundi	9849569	281	273	2195	124	9.51	24	0.0000285291671138097
187	Liberia	4190435	117	103	570	39	8.74	14	0.0000279207289935293
188	Chad	12448175	280	266	3013	264	12.02	27	0.0000224932570437032
189	Angola	20820525	442	427	2806	205	8.9	25	0.0000212290516209366
190	Myanmar	52797319	1077	1049	7944	612	11.9	38	0.0000203987630508284
191	Afghanistan	29824536	485	441	2088	241	5.38	21	0.0000162617785570914
192	Somalia	10195134	60	57	323	12	7.96	11	0.00000588516050892514'.
	data removeFirstRow.
	data convertColumn: 3 to: [ :t | Integer readFrom: t ].
	data convertColumn: 4 to: [ :t | Integer readFrom: t ].
	data convertColumn: 5 to: [ :t | Integer readFrom: t ].
	data convertColumn: 9 to: [ :t | Integer readFrom: t ].
	
	b countries: data values named: #second metric: #third.
	
	b makeSelectable: #third as: 'Population'.
	b makeSelectable: #fourth as: 'Documents'.
	b makeSelectable: #fifth as: 'Citable documents'.
	b makeSelectable: [ :row | row at: 9 ] as: 'H index'.
	
	^ b
]

{ #category : #examples }
RTMetricMap >> example06DeepIntoPharo [

	"self new example06DeepIntoPharo"
	"The data shows the country that have bought the book DeepIntoPharo from Sep 2013 until Mar 2014"

	| b data |
	b := RTMetricMap new.
	data := RTTabTable new input: 'Quantité	Région
1	US
1	US
1	US
1	FR
1	US
1	FR
1	DE
2	US
1	DE
1	US
1	IT
1	ES
1	US
-1	US
1	US
1	CA
1	CH
1	US
1	US
2	US
1	EU
1	US
1	FR
3	FR
1	UK
1	ES
2	US
2	UK
1	EU
1	EU
1	US
1	US
1	US
1	US
2	UK
1	FR
5	US
1	UK
1	EU
1	UK
1	DE
1	US
1	NL
1	US
2	DE
1	US
1	US
1	DE
1	US
1	DE
1	DE
1	DE
1	DE
1	US
1	FR
1	AU
1	US
1	US
1	US
1	US
1	US
1	US
1	US
1	NL
1	NL
1	US
1	US
1	US
3	CH
1	US
1	US
1	DE
1	DE
1	IE
1	US
1	UK
1	DE
1	US
1	US
1	US
20	FR
20	FR
1	FR'.
	data removeFirstRow.
	data convertColumn: 1 to: [ :t | Integer readFrom: t ].
	data gather: 2 using: [ :r1 :r2 | Array with: r1 first + r2 first with: r1 second ].
	
	b countries: RTSVGPath countries color: Color white.
	b countries: data values named: #second metric: #first.
	
	^ b
]

{ #category : #examples }
RTMetricMap >> example07GrowthAndDevelopmentBridgeIndex [

	"self new example07GrowthAndDevelopmentBridgeIndex"
	"Data from http://www.gdbridge.org/gdb_index"
| b table |
b := RTMetricMap new.
table := RTTabTable new.
table input: 'Hong Kong, China	1	0.631447
Singapore	2	0.5889286
Netherlands	3	0.515425
Switzerland	4	0.5018929
United States	5	0.4871152
Norway	6	0.4851121
Denmark	7	0.4665922
Sweden	8	0.4567912
Finland	9	0.4460537
Korea, Rep.	10	0.4382369
Ireland	11	0.4324097
Luxembourg	12	0.4227912
Germany	13	0.4190357
Belgium	14	0.4022478
Canada	15	0.3983661
Australia	16	0.3982408
United Kingdom	17	0.3930691
Japan	18	0.3904902
Spain	19	0.3876414
Kuwait	20	0.3800776
France	21	0.377015
Brunei Darussalam	22	0.3627484
Austria	23	0.3621858
Israel	24	0.3585244
China	25	0.3560882' usingDelimiters: String tab.
table convertColumn: 3 to: [ :t | Float readFrom: t ].

b allCountriesColor: Color white.
b countries: table values named: #first metric: #third.

^ b

]

{ #category : #private }
RTMetricMap >> fillViewWithCountries: collection named: selectorOrBlockForName metric: selectorOrBlockForMetric [
	"Display a list of countries"
	"E.g., countries: #(#('France' 50) #('Germany' 80)) named: #first metric: #second"
	
	"Example:
	RTMapBuilder2 new countries: #(#('France' 20) #('Germany' 80)) named: #first metric: #second; open
	"
	| cn maxValue tcountryName svgCountryName normalizedCountries |
	"Initialize the color normalizer"
	cn := RTMultiLinearColor new colors: (Array with:(Color r:0.8 g:0.8 b:1) with: (Color r:0 g:0 b:0.3)).
	
	"Get the maximum, useful since we need value between 0.0 and 1.0"
	maxValue := (collection collect: selectorOrBlockForMetric) max.
	
	"We pick only the country we have the geographical position"
	normalizedCountries := collection select: [ :country | 
										tcountryName := selectorOrBlockForName rtValue: country.
										svgCountryName := self convertIntoSVGCountryName: tcountryName. 
										svgCountryName notNil ].
									
	normalizedCountries do: [ :country |
		| elem |
		tcountryName := selectorOrBlockForName rtValue: country.
		svgCountryName := self convertIntoSVGCountryName: tcountryName.
		elem := (RTSVGPath new
			path: (RTSVGPath perform: svgCountryName);
			fillColor: [ :cc | cn level: (selectorOrBlockForMetric rtValue: cc) / maxValue ];
			scale: 1) elementOn: country.
		elem  when: TRMouseClick do: [ :evt | elem inspect ].
		elem @ RTPopup.
		view add: elem.
	].
]

{ #category : #initialization }
RTMetricMap >> initialize [
	super initialize.
	pointShapeBuilder := RTShapeBuilder new.
	
]

{ #category : #public }
RTMetricMap >> makeSelectable: aBlock as: aTitle [
	"Public method"
	"Add a menu in the visualization. Useful to switch between metrics"
	view canvas addMenu: aTitle callback: [ 
		self cleanView.
		self fillViewWithCountries: countryData named: countryName metric: aBlock ]
]

{ #category : #accessing }
RTMetricMap >> pointShape [
	^ pointShapeBuilder
]

{ #category : #public }
RTMetricMap >> routes: objects from: aPointBlock to: anotherPointBlock [
	| toPixel fromPixel fromElement toElement edge |
	shapeBuilder ensure: RTLine.
	pointShapeBuilder ensure: RTEllipse.
	
	objects do: [ :object |
		toPixel := self translateGeoPositionToPixels: (aPointBlock rtValue: object).
		fromPixel := self translateGeoPositionToPixels: (anotherPointBlock rtValue: object).
		fromElement := pointShapeBuilder elementOn: 'from'.
		toElement := pointShapeBuilder elementOn: 'to'.
		fromElement translateTo: fromPixel.
		toElement translateTo: toPixel.
		view add: fromElement.
		view add: toElement.
		
		edge := shapeBuilder edgeFrom: fromElement to: toElement.
		view add: edge.
	].	
]

{ #category : #utility }
RTMetricMap >> translateGeoPositionToPixels: point [
	"From https://github.com/thebyrd/world-news"
	
	| longitud latitud xFactor xoffset yFactor yoffset |
	latitud := point x.
	longitud := point y.
	
	xFactor := 2.6938.
	xoffset := 465.4.
	
	yFactor := -2.6938.
	yoffset := 227.066.
	^ ((longitud * xFactor) + xoffset) @ ((latitud * yFactor) + yoffset)
]
