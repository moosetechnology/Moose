"
A RTMapBuilder is xxxxxxxxx. 

Instance Variables
	cities:		<Object>
	cityBuilder:		<Object>
	cityElements:		<Object>
	cityNames:		<Object>
	color:		<Object>
	countries:		<Object>
	countryNames:		<Object>
	mapPing:		<Object>
	periodLabel:		<Object>
	popup:		<Object>
	routeBuilder:		<Object>
	scale:		<Object>

cities
	- xxxxx

cityBuilder
	- xxxxx

cityElements
	- xxxxx

cityNames
	- xxxxx

color
	- xxxxx

countries
	- xxxxx

countryNames
	- xxxxx

mapPing
	- xxxxx

periodLabel
	- xxxxx

popup
	- xxxxx

routeBuilder
	- xxxxx

scale
	- xxxxx

"
Class {
	#name : #RTMapBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'color',
		'scale',
		'countries',
		'popup',
		'cities',
		'cityBuilder',
		'countryNames',
		'cityNames',
		'routeBuilder',
		'periodLabel',
		'cityElements'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #population }
RTMapBuilder class >> africanPopulation [

	^ RTMapBuilder countriesPopulation select: [ :c | RTSVGPath africa includes: (c at: 1) ].
]

{ #category : #'list of countries' }
RTMapBuilder class >> countries [
	^ #(#Afghanistan #Albania #Algeria #Angola #Argentina #Armenia #Australia #Austria #Azerbaijan #Bangladesh #Belarus #Belgium #Belize #Benin #Bhutan #Bolivia #BosniaandHerzegovina #Botswana #Brazil #BruneiDarussalam #Bulgaria #BurkinaFaso #Burundi #Cambodia #Cameroon #Canada #CentralAfricanRepublic #Chad #Chile #China #Colombia #Congo #CostaRica #Croatia #Cuba #Cyprus #CzechRepublic #DemocraticRepublicCongo #Denmark #Djibouti #DominicanRepublic #Ecuador #Egypt #ElSalvador #EquatorialGuinea #Eritrea #Estonia #Ethiopia #FalklandIslandsMalvinas #Fiji #Finland #France #FrenchGuyana #GM #Gabon #Georgia #Germany #Ghana #GreatBritian #Greece #Greenland #Guatemala #Guinea #GuineaBissau #Guyana #Haiti #Honduras #Hungary #Iceland #India #Indonesia #Iran #Iraq #Ireland #Israel #Italy #IvoryCoast #Jamaica #Japan #Jordan #Kazakhstan #Kenya #Kuwait #Kyrgyzstan #Laos #Latvia #Lebanon #Liberia #Libya #Lithuania #Luxembourg #Madagascar #Malawi #Malaysia #Mali #Mauritania #Mexico #Moldova #Mongolia #Morocco #Mozambique #MyanmarBurma #Namibia #Nepal #Netherlands #NewZealand #Nicaragua #Niger #Nigeria #NorthKorea #Norway #NewCaledonia #Oman #Pakistan #Palestine #Panama #PapuaNewGuinea #Paraguay #Peru #Philippines #Poland #Portugal #PuertoRico #Qatar #RepublicofMacedonia #RepublicofTurkey #Romania #Russia #Rwanda #SaudiArabia #Senegal #Serbia #SierraLeone #Slovakia #SolomonIslands #Somalia #SouthAfrica #Lesotho #SouthKorea #Spain #SriLanka #Sudan #Suriname #SvalbardJanMayen #Swaziland #Sweden #Switzerland #Syria #Taiwan #Tajikistan #Tanzania #Thailand #TimorLeste #Togo #Tunisia #Turkmenistan #Uganda #Ukraine #UnitedArabEmirates #UnitedStates #Uruguay #Uzbekistan #Vanuatu #Venezuela #Vietnam #WesternSahara #Yemen #Zambia #Zimbabwe)
]

{ #category : #population }
RTMapBuilder class >> countriesPopulation [
	^ #(#(#Aruba 102384) #(#Andorra 78360) #(#Afghanistan 29824536) #(#Angola 20820525) #(#Albania 3162083) #(#ArabWorld 362466629) #(#UnitedArabEmirates 9205651) #(#Argentina 41086927) #(#Armenia 2969081) #(#AmericanSamoa 55128) #(#AntiguaandBarbuda 89069) #(#Australia 22683600) #(#Austria 8462446) #(#Azerbaijan 9297507) #(#Burundi 9849569) #(#Belgium 11142157) #(#Benin 10050702) #(#BurkinaFaso 16460141) #(#Bangladesh 154695368) #(#Bulgaria 7304632) #(#Bahrain 1317827) #(#'Bahamas,The' 371960) #(#BosniaandHerzegovina 3833916) #(#Belarus 9464000) #(#Belize 324060) #(#Bermuda 64806) #(#Bolivia 10496285) #(#Brazil 198656019) #(#Barbados 283221) #(#BruneiDarussalam 412238) #(#Bhutan 741822) #(#Botswana 2003910) #(#CentralAfricanRepublic 4525209) #(#Canada 34880491) #(#Switzerland 7997152) #(#ChannelIslands 161235) #(#Chile 17464814) #(#China 1350695000) #(#IvoryCoast 19839750) #(#Cameroon 21699631) #(#Congo 4337051) #(#Colombia 47704427) #(#Comoros 717503) #(#CapeVerde 494401) #(#CostaRica 4805295) #(#Caribbeansmallstates 6968753) #(#Cuba 11270957) #(#Curacao 151892) #(#CaymanIslands 57570) #(#Cyprus 1128994) #(#CzechRepublic 10514810) #(#Germany 81889839) #(#Djibouti 859652) #(#Dominica 71684) #(#Denmark 5590478) #(#DominicanRepublic 10276621) #(#Algeria 38481705) #(#'EastAsia&Pacific(developingonly)' 1991619000) #(#'EastAsia&Pacific(allincomelevels)' 2233747260) #(#'Europe&CentralAsia(developingonly)' 272058887) #(#'Europe&CentralAsia(allincomelevels)' 899507888) #(#Ecuador 15492264) #(#Egypt 80721874) #(#Euroarea 333791352) #(#Eritrea 6130922) #(#Spain 46217961) #(#Estonia 1339396) #(#Ethiopia 91728849) #(#EuropeanUnion 509036794) #(#Finland 5414293) #(#Fiji 874742) #(#France 65696689) #(#FaeroeIslands 49506) #(#'Micronesia,Fed.Sts.' 103395) #(#Gabon 1632572) #(#GreatBritian 63227526) #(#Georgia 4511800) #(#Ghana 25366462) #(#Guinea 11451273) #(#GM 1791225) #(#GuineaBissau 1663558) #(#EquatorialGuinea 736296) #(#Greece 11280167) #(#Grenada 105483) #(#Greenland 56840) #(#Guatemala 15082831) #(#Guam 162810) #(#Guyana 795369) #(#Highincome 1302107523) #(#'HongKongSAR,China' 7154600) #(#Honduras 7935846) #(#'Heavilyindebtedpoorcountries(HIPC)' 655971763) #(#Croatia 4267000) #(#Haiti 10173775) #(#Hungary 9943755) #(#Indonesia 246864191) #(#IsleofMan 85284) #(#India 1236686732) #(#Ireland 4588798) #(#Iran 76424443) #(#Iraq 32578209) #(#Iceland 320137) #(#Israel 7907900) #(#Italy 60917978) #(#Jamaica 2712100) #(#Jordan 6318000) #(#Japan 127561489) #(#Kazakhstan 16797459) #(#Kenya 43178141) #(#Kyrgyzstan 5582100) #(#Cambodia 14864646) #(#Kiribati 100786) #(#'St.KittsandNevis' 53584) #(#SouthKorea 50004000) #(#Kosovo 1806366) #(#Kuwait 3250496) #(#'LatinAmerica&Caribbean(developingonly)' 581383555) #(#Laos 6645827) #(#Lebanon 4424888) #(#Liberia 4190435) #(#Libya 6154623) #(#'St.Lucia' 180870) #(#'LatinAmerica&Caribbean(allincomelevels)' 608565574) #(#'Leastdevelopedcountries:UNclassification' 878193577) #(#Lowincome 846454901) #(#Liechtenstein 36656) #(#SriLanka 20328000) #(#Lowermiddleincome 2507011903) #(#'Low&middleincome' 5744261290) #(#Lesotho 2051545) #(#Lithuania 2985509) #(#Luxembourg 531441) #(#Latvia 2025473) #(#'MacaoSAR,China' 556783) #(#'St.Martin(Frenchpart)' 30959) #(#Morocco 32521143) #(#Monaco 37579) #(#Moldova 3559541) #(#Madagascar 22293914) #(#Maldives 338442) #(#'MiddleEast&NorthAfrica(allincomelevels)' 395313211) #(#Mexico 120847477) #(#MarshallIslands 52555) #(#Middleincome 4897806389) #(#RepublicofMacedonia 2105575) #(#Mali 14853572) #(#Malta 418366) #(#MyanmarBurma 52797319) #(#'MiddleEast&NorthAfrica(developingonly)' 339560601) #(#Montenegro 621081) #(#Mongolia 2796484) #(#NorthernMarianaIslands 53305) #(#Mozambique 25203395) #(#Mauritania 3796141) #(#Mauritius 1291456) #(#Malawi 15906483) #(#Malaysia 29239927) #(#NorthAmerica 348859337) #(#Namibia 2259393) #(#NewCaledonia 258121) #(#Niger 17157042) #(#Nigeria 168833776) #(#Nicaragua 5991733) #(#Netherlands 16767705) #(#'Highincome:nonOECD' 250285771) #(#Norway 5018869) #(#Nepal 27474377) #(#NewZealand 4433100) #(#'Highincome:OECD' 1051821752) #(#OECDmembers 1256610112) #(#Oman 3314001) #(#Othersmallstates 1.991995691e7) #(#Pakistan 179160111) #(#Panama 3802281) #(#Peru 29987800) #(#Philippines 96706764) #(#Palau 20754) #(#PapuaNewGuinea 7167010) #(#Poland 38542737) #(#PuertoRico 3667084) #(#NorthKorea 24763188) #(#Portugal 10526703) #(#Paraguay 6687361) #(#Pacificislandsmallstates 2252782) #(#FrenchPolynesia 273814) #(#Qatar 2050514) #(#Romania 21326905) #(#Russia 143533000) #(#Rwanda 11457801) #(#SouthAsia 1649249388) #(#SaudiArabia 28287855) #(#Sudan 37195349) #(#Senegal 13726021) #(#Singapore 5312400) #(#SolomonIslands 549598) #(#SierraLeone 5978727) #(#ElSalvador 6297394) #(#SanMarino 31247) #(#Somalia 10195134) #(#Serbia 7223887) #(#'Sub-SaharanAfrica(developingonly)' 9.103898585e8) #(#SouthSudan 10837527) #(#'Sub-SaharanAfrica(allincomelevels)' 9.111261545e8) #(#Smallstates 2.914149191e7) #(#SaoTomeandPrincipe 188098) #(#Suriname 534541) #(#Slovakia 5410267) #(#Slovenia 2058152) #(#Sweden 9516617) #(#Swaziland 1230985) #(#'SintMaarten(Dutchpart)' 39088) #(#Seychelles 87784.90752) #(#Syria 22399254) #(#TurksandCaicosIslands 32427) #(#Chad 12448175) #(#Togo 6642928) #(#Thailand 66785001) #(#Tajikistan 8008990) #(#Turkmenistan 5172931) #(#TimorLeste 1210233) #(#Tonga 104941) #(#TrinidadandTobago 1337439) #(#Tunisia 10777500) #(#RepublicofTurkey 73997128) #(#Tuvalu 9860) #(#Tanzania 47783107) #(#Uganda 36345860) #(#Ukraine 45593300) #(#Uppermiddleincome 2390794486) #(#Uruguay 3395253) #(#UnitedStates 313914040) #(#Uzbekistan 29776850) #(#'St.VincentandtheGrenadines' 109373) #(#Venezuela 29954782) #(#'VirginIslands(U.S.)' 105275) #(#Vietnam 88775500) #(#Vanuatu 247262) #(#Palestine 4046901) #(WesternSahara 513000) #(#World 7046368813) #(#Samoa 188889) #(#Yemen 23852409) #(#SouthAfrica 5.118930661e7) #(#DemocraticRepublicCongo 65705093) #(#Zambia 14075099) #(#Zimbabwe 13724317) #(#SvalbardJanMayen 2642) #(#FrenchGuyana 239450) #(#Taiwan 23340136) #(#FalklandIslandsMalvinas 2932))
]

{ #category : #population }
RTMapBuilder class >> publicationPerPopulation [

^  #(#('Switzerland' 0.04948049) #('Sweden' 0.03949838) #('Denmark' 0.03724673) #('Finland' 0.03512776) #('Iceland' 0.03384176) #('Netherlands' 0.03266005) #('Norway' 0.0323559) #('Monaco' 0.03153357) #('United Kingdom' 0.03034517) #('Australia' 0.03013565) #('New Zealand' 0.0292847) #('Canada' 0.02848185) #('Israel' 0.02841134) #('Singapore' 0.0281434) #('Belgium' 0.02684193) #('Austria' 0.02538793) #('Slovenia' 0.02456816) #('Liechtenstein' 0.02302488) #('Ireland' 0.02280205) #('United States' 0.02250084) #('Germany' 0.02177218) #('France' 0.01953477) #('Spain' 0.01643973) #('Greece' 0.0160182) #('Italy' 0.01575377) #('Czech Republic' 0.01557232) #('Estonia' 0.01429077) #('Japan' 0.01392641) #('Croatia' 0.01346473) #('Portugal' 0.01319425) #('Luxembourg' 0.01267497) #('Korea' 0.01157157) #('Hungary' 0.01128115) #('Greenland' 0.01071429) #('Cyprus' 0.00913291) #('Poland' 0.0089929) #('Lithuania' 0.00829172) #('Bermuda' 0.00745301) #('Faeroe Islands' 0.00668606) #('Bulgaria' 0.00620812) #('New Caledonia' 0.00605143) #('Malta' 0.00601626) #('Grenada' 0.00528995) #('Palau' 0.00510745) #('Latvia' 0.0049776) #('Romania' 0.00432618) #('Kuwait' 0.00423781) #('Barbados' 0.00421932) #('Turkey' 0.00414781) #('Russian Federation' 0.00408719) #('Serbia' 0.00399812) #('Chile' 0.00394931) #('San Marino' 0.00374436) #('Seychelles' 0.0037364) #('Guam' 0.00360543) #('Tunisia' 0.00355685) #('French Polynesia' 0.00341107) #('Malaysia' 0.00339218) #('Brunei Darussalam' 0.00326268) #('Armenia' 0.00315417) #('Jordan' 0.00314134) #('Lebanon' 0.00309093) #('Puerto Rico' 0.00305665) #('Cayman Islands' 0.0029703) #('Argentina' 0.00288041) #('Qatar' 0.00282271) #('Uruguay' 0.00281334) #('Trinidad and Tobago' 0.00279863) #('Macedonia' 0.00273227) #('Iran' 0.00265369) #('Belarus' 0.00262056) #('Oman' 0.00247495) #('Bahrain' 0.00247073) #('South Africa' 0.00244784) #('Ukraine' 0.00241902) #('Brazil' 0.00232119) #('Cuba' 0.00218313) #('Dominica' 0.00216227) #('Saudi Arabia' 0.00208004) #('United Arab Emirates' 0.00206949) #('American Samoa' 0.00204978) #('China' 0.00198446) #('Montenegro' 0.00175661) #('Fiji' 0.00174223) #('Botswana' 0.00172363) #('Georgia' 0.00166009) #('Virgin Islands (U.S.)' 0.00164332) #('Tuvalu' 0.0015213) #('Mexico' 0.00137863) #('Costa Rica' 0.0013508) #('Andorra' 0.00132721) #('Jamaica' 0.00128646) #('Moldova' 0.0012791) #('Thailand' 0.00123095) #('Marshall Islands' 0.00119874) #('Bosnia and Herzegovina' 0.00116017) #('Egypt' 0.00110861) #('Mauritius' 0.00110573) #('Samoa' 0.00093706) #('Panama' 0.00093654) #('Northern Mariana Islands' 0.00091924) #('Gabon' 0.00091696) #('Venezuela' 0.00090597) #('Turks and Caicos Islands' 0.00089432) #('Vanuatu' 0.00086952) #('Antigua and Barbuda' 0.00084204) #('Gambia' 0.00084188) #('Morocco' 0.00083801) #('Azerbaijan' 0.00080366) #('Tonga' 0.00077186) #('Mongolia' 0.00076525) #('Colombia' 0.00075234) #('Belize' 0.00069432) #('Bahamas' 0.00069362) #('Algeria' 0.00066821) #('Namibia' 0.00064132) #('India' 0.00060709) #('Swaziland' 0.00056459) #('Guyana' 0.00053183) #('Albania' 0.00048797) #('Congo' 0.0004729) #('Sri Lanka' 0.0004053) #('Solomon Islands' 0.00040393) #('Maldives' 0.00039889) #('Bhutan' 0.00039767) #('Aruba' 0.00039069) #('Kenya' 0.0003874) #('Zimbabwe' 0.00038282) #('Senegal' 0.00036806) #('Suriname' 0.00035732) #('Cameroon' 0.00034761) #('Kazakhstan' 0.0003366) #('Pakistan' 0.00032448) #('Peru' 0.00029889) #('Ecuador' 0.00029486) #('Ghana' 0.00026906) #('Uzbekistan' 0.00025359) #('Benin' 0.00025232) #('Bolivia' 0.00024428) #('Nigeria' 0.00024256) #('Papua New Guinea' 0.00023985) #('Nepal' 0.00022093) #('Malawi' 0.00021098) #('Burkina Faso' 0.00020486) #('Uganda' 0.0002033) #('Sao Tome and Principe' 0.00020202) #('Guinea-Bissau' 0.00019536) #('Vietnam' 0.00018557) #('Zambia' 0.00018529) #('Iraq' 0.00017914) #('Syrian Arab Republic' 0.00017648) #('Tanzania' 0.00016707) #('Nicaragua' 0.00016106) #('Lesotho' 0.00015549) #('Djibouti' 0.00015471) #('Togo' 0.00015159) #('Equatorial Guinea' 0.00014804) #('Paraguay' 0.00014026) #('Philippines' 0.00013611) #('El Salvador' 0.00012751) #('Bangladesh' 0.00012593) #('Mali' 0.0001191) #('Kiribati' 0.00011906) #('Tajikistan' 0.00010988) #('Sudan' 0.000107) #('Cambodia' 0.00010468) #('Guatemala' 0.00010131) #('Madagascar' 0.00010097) #('Mauritania' 9.194e-5) #('Central African Republic' 8.817e-5) #('Ethiopia' 8.738e-5) #('Honduras' 8.72e-5) #('Comoros' 8.223e-5) #('Indonesia' 8.169e-5) #('Rwanda' 7.864e-5) #('Yemen' 7.203e-5) #('Niger' 6.895e-5) #('Dominican Republic' 6.86e-5) #('Eritrea' 6.035e-5) #('Mozambique' 5.971e-5) #('Sierra Leone' 5.72e-5) #('Haiti' 4.305e-5) #('Turkmenistan' 4.156e-5) #('Timor-Leste' 4.131e-5) #('Guinea' 3.336e-5) #('Burundi' 2.853e-5) #('Liberia' 2.792e-5) #('Chad' 2.249e-5) #('Angola' 2.123e-5) #('Myanmar' 2.04e-5) #('Afghanistan' 1.626e-5) #('Somalia' 5.89e-6))
]

{ #category : #'list of countries' }
RTMapBuilder class >> southAmerica [
	^ #(#Argentina #Brazil #Bolivia #Chile #Colombia #Ecuador #Guyana #FrenchGuyana #Paraguay #Peru #Suriname #Uruguay #Venezuela)
]

{ #category : #adding }
RTMapBuilder >> cities [
	^ cityBuilder
]

{ #category : #adding }
RTMapBuilder >> cities: strings [
	^ self cities: strings named: #yourself
]

{ #category : #adding }
RTMapBuilder >> cities: objects named: aBlockOrSymbol [

	"Not sure why we need to copy each object"
	cities addAll: (objects collect: [ :o | o copy ]).
	cityBuilder name: aBlockOrSymbol.
	^ cityBuilder
]

{ #category : #accessing }
RTMapBuilder >> cityBuilder [
	^ cityBuilder
]

{ #category : #adding }
RTMapBuilder >> cityObjects [
	^ cities
]

{ #category : #accessing }
RTMapBuilder >> color: aColorOrBlock [
	color := aColorOrBlock.

]

{ #category : #adding }
RTMapBuilder >> countries: strings [
	^ self countries: strings named: #yourself
]

{ #category : #adding }
RTMapBuilder >> countries: objects named: aBlockOrSymbol [
	countries := OrderedCollection new.
	objects do: [ :o | countries add: o ].
	countryNames := aBlockOrSymbol.
	 
]

{ #category : #utility }
RTMapBuilder >> geoDistanceBetween: aPoint and: anotherPoint [
	"http://www.movable-type.co.uk/scripts/latlong.html"
	| r lat1 lat2 lon1 lon2 dLat dLon a c |
	r := 6371.
	lat1 := aPoint x degreesToRadians.
	lat2 := anotherPoint x degreesToRadians.
	lon1 := aPoint y degreesToRadians.
	lon2 := anotherPoint y degreesToRadians.	
	dLat := (lat2 - lat1).
	dLon := (lon2 - lon1).
	
	a := ((dLat / 2) sin squared) + (((dLon / 2) sin squared) * (lat1 cos) * (lat2 cos)).
	c := 2 * (a sqrt arcTan: (1 - a) sqrt).
	
	^ r * c
]

{ #category : #initialization }
RTMapBuilder >> initialize [
	super initialize.
	countries := #().
	cities := OrderedCollection new.
	cityBuilder := RTCityBuilder new.
	cityBuilder mapBuilder: self.
	routeBuilder := RTRouteBuilder new.
	routeBuilder mapBuilder: self.
	scale := 1.
]

{ #category : #'public-ui' }
RTMapBuilder >> open [
	super open.
	cityBuilder evolutionPeriod isEmpty ifFalse: [
		
		self view addMenu: '<-' callback: [
			cityBuilder stepBack.
			self refreshView.
		].
		
		self view addMenu: '->' callback: [
			cityBuilder stepForward.
			self refreshView.
		].

		periodLabel := TRLabelShape new
			translateLeftTo: 30@20;
			text: (cityBuilder evolutionPeriod at: cityBuilder step) asString;
			color: Color black.
		self view canvas addFixedShape: periodLabel.
	]
]

{ #category : #utility }
RTMapBuilder >> refreshView [
	cityElements do: [ :c |
		|w h|
		w := cityBuilder shape width rtValue: c.
		h := cityBuilder shape height rtValue: c.
		self view addAnimation: (RTColorTransitionAnimation new
										toColor: (cityBuilder shape color rtValue: c)
										during: 0.4 on: c).
		self view addAnimation: (RTResizeMove new toExtent: w @ h during: 0.4 on: c).
	].
	periodLabel text: (cityBuilder evolutionPeriod at: cityBuilder step) asString.
	self view canvas signalUpdate.
]

{ #category : #hooks }
RTMapBuilder >> renderCities: aView [
	|elems|
	elems := cityBuilder buildCities: cities.
	aView addAll: elems.
	^ elems
]

{ #category : #hooks }
RTMapBuilder >> renderCountries: aView [
	| el name countryElems |
	countryElems := OrderedCollection new.
	countries do: [ :o |
		name := countryNames rtValue: o.
		el := (RTSVGPath new
			path: (RTSVGPath perform: name asSymbol);
			fillColor: (color isNil ifTrue: [nil]
				ifFalse: [ color rtValue: o ]);
			borderWidth: 0.5;
			scale: scale)
			element model: o.
			popup isNotNil ifTrue: [ el @ (RTPopup text: popup) ].
		countryElems add: el.
		aView add: el.
	].
	^ countryElems
]

{ #category : #hooks }
RTMapBuilder >> renderIn: aView [
	|countryElems routeElems|
	countryElems := self renderCountries: aView.
	cityElements := self renderCities: aView.
	routeElems := self renderRoutes: aView.
	routeElems do: [ :e | e trachelShape pushBack ].
	countryElems do: [ :e | e trachelShape pushBack ].
	aView @ RTDraggableView.
]

{ #category : #hooks }
RTMapBuilder >> renderRoutes: aView [
	|routes|
	routes := routeBuilder buildRoutesUsingNames: cityBuilder names.
	aView addAll: routes.
	^ routes
]

{ #category : #accessing }
RTMapBuilder >> routes [
	^ routeBuilder
]

{ #category : #accessing }
RTMapBuilder >> scale [
	^ scale
]

{ #category : #accessing }
RTMapBuilder >> scale: aNumber [
	scale := aNumber.
]

{ #category : #utility }
RTMapBuilder >> translateGeoPositionToPixels: point [
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

{ #category : #utility }
RTMapBuilder >> translatePixelsToGeoPosition: point [
	"From https://github.com/thebyrd/world-news"
	
	| xFactor xoffset yFactor yoffset |
	
	xFactor := 2.6938.
	xoffset := 465.4.
	
	yFactor := -2.6938.
	yoffset := 227.066.
	
	^ (point y - yoffset / yFactor) @ (point x - xoffset / xFactor)
]

{ #category : #accessing }
RTMapBuilder >> withPopup [
	self withPopup: [ :e | e asString ]
]

{ #category : #accessing }
RTMapBuilder >> withPopup: aBlockOrSymbol [
	popup := aBlockOrSymbol
]
