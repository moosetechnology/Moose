Class {
	#name : #RTScatterplotMap,
	#superclass : #RTBuilder,
	#category : #'Roassal2-Builder-ScatterplotMap'
}

{ #category : #'as yet unclassified' }
RTScatterplotMap >> allData [
	^ 'http://www.gaslampmedia.com/wp-content/uploads/2013/08/zip_codes_states.csv' asZnUrl retrieveContents
]

{ #category : #'as yet unclassified' }
RTScatterplotMap >> allLocalData [
	^ '/Users/alexandrebergel/Desktop/zip_codes_states.csv' asFileReference contents
]

{ #category : #'as yet unclassified' }
RTScatterplotMap >> convert: lat with: lon [
	"
	self new convert: 55 with: -143
	"
	| phi0 lambda0 phi1 phi2 phi lambda n theta c rho rho0 x y |
	phi0 := 0.
	lambda0 := -96 degreesToRadians.
	phi1 := 29.5 degreesToRadians.
	phi2 := 45.5 degreesToRadians.
	
	phi := lat degreesToRadians.
	lambda := lon degreesToRadians.
	
	n := 0.5 * (phi1 sin + phi2 sin).
	theta := n * (lambda - lambda0).
	c := phi1 cos + (2 * n * phi1 sin).
	c := c * c.
	rho := (c - (2 * n * phi sin)) sqrt / n.
	rho0 := (c - (2 * n * phi0 sin)) sqrt / n.
	
	x := rho * theta sin.
	y := rho0 - (rho * theta cos).
	
	^ x @ y
]

{ #category : #'as yet unclassified' }
RTScatterplotMap >> run [
	"
	RTScatterplotMap new run
	"
	| tab allLonLat v shape es |
	tab := RTTabTable new input: 'http://www.gaslampmedia.com/wp-content/uploads/2013/08/zip_codes_states.csv' asZnUrl retrieveContents usingDelimiter: $,.
	tab removeFirstRow.
	tab convertColumns: #(2 3) to: [ :s | | str |
		str := s.
		(str = '') ifTrue: [ str := '0' ]. 
		(str beginsWith: '"+' ) ifTrue: [ str := str allButFirst allButFirst allButLast ].
		(str first = $") ifTrue: [ Float readFrom: str allButFirst allButLast ] ifFalse: [  Float readFrom: str ] ].
	allLonLat := tab values collect: [ :row | (row at: 2) @ (row at: 3) ].
	
	v := RTView new.
	v @ RTDraggableView.
	shape := (RTEllipse new size: 2; color: (Color blue alpha: 0.01)).
	es := shape elementsOn: allLonLat.
	es @ RTPopup.
	v addAll: es.
	es do: [ :el | 
		| p |
		p := RTScatterplotMap new convert: el model x with: el model y.
		el translateTo: (p x * 300) @ (p y negated * 300).
	].
	v canvas camera focusOnCenter.
	^ v
]

{ #category : #'as yet unclassified' }
RTScatterplotMap >> sample [

	^ '"zip_code","latitude","longitude","city","state","county"
"99641",60.314735,"-163.118947","Nunapitchuk","AK","Bethel"
"99643",58.268704,"-155.797078","Old Harbor","AK","Kodiak Island"
"99644",58.268704,"-155.797078","Ouzinkie","AK","Kodiak Island"
"99645",62.257284,"-149.633916","Palmer","AK","Matanuska Susitna"
"99647",58.268704,"-156.648418","Pedro Bay","AK","Lake And Peninsula"
"99648",58.268704,"-156.648418","Perryville","AK","Lake And Peninsula"
"99649",57.528787,"-157.485781","Pilot Point","AK","Lake And Peninsula"
"99650",62.117231,"-163.237636","Pilot Station","AK","Wade Hampton"
"99651",60.314735,"-163.118947","Platinum","AK","Bethel"
"99652",61.523043,"-149.728806","Big Lake","AK","Matanuska Susitna"
"99653",58.268704,"-156.648418","Port Alsworth","AK","Lake And Peninsula"
"99654",61.581305,"-149.374335","Wasilla","AK","Matanuska Susitna"
"99655",60.314735,"-163.118947","Quinhagak","AK","Bethel"
"99656",60.314735,"-163.118947","Red Devil","AK","Bethel"
"99657",62.117231,"-163.237636","Russian Mission","AK","Wade Hampton"
"99658",62.117231,"-163.237636","Saint Marys","AK","Wade Hampton"
"99659",64.755604,"-165.672344","Saint Michael","AK","Nome"
"99660",54.24018,"-176.787412","Saint Paul Island","AK","Aleutians West"
"99661",55.350356,"-160.485506","Sand Point","AK","Aleutians East"
"99662",62.117231,"-163.237636","Scammon Bay","AK","Wade Hampton"
"99663",59.449486,"-151.700915","Seldovia","AK","Kenai Peninsula"
"99664",60.25281,"-149.402123","Seward","AK","Kenai Peninsula"
"99665",65.226375,"-151.025085","Shageluk","AK","Yukon Koyukuk"
"99666",62.117231,"-163.237636","Nunam Iqua","AK","Wade Hampton"
"99667",62.280436,"-149.715167","Skwentna","AK","Matanuska Susitna"
"99668",60.314735,"-163.118947","Sleetmute","AK","Bethel"
"99669",60.110034,"-151.247935","Soldotna","AK","Kenai Peninsula"
"99670",58.745599,"-157.159459","South Naknek","AK","Bristol Bay"
"99671",64.755604,"-165.672344","Stebbins","AK","Nome"
"99672",60.513614,"-150.853238","Sterling","AK","Kenai Peninsula"
"99674",61.732741,"-148.783687","Sutton","AK","Matanuska Susitna"
"99675",65.226375,"-151.025085","Takotna","AK","Yukon Koyukuk"
"99676",62.280436,"-149.715167","Talkeetna","AK","Matanuska Susitna"
"99677",61.470966,"-144.991027","Tatitlek","AK","Valdez Cordova"
"99678",58.962101,"-163.118947","Togiak","AK","Dillingham"
"99679",60.314735,"-163.118947","Tuluksak","AK","Bethel"
"99680",60.314735,"-163.118947","Tuntutuliak","AK","Bethel"
"99681",60.314735,"-163.118947","Tununak","AK","Bethel"
"99682",60.036583,"-151.655567","Tyonek","AK","Kenai Peninsula"
"99683",61.720499,"-150.009239","Trapper Creek","AK","Matanuska Susitna"
"99684",64.755604,"-165.672344","Unalakleet","AK","Nome"
"99685",53.85513,"-166.518069","Unalaska","AK","Aleutians West"
"99686",61.68557,"-145.775152","Valdez","AK","Valdez Cordova"
"99687",61.531298,"-149.478398","Wasilla","AK","Matanuska Susitna"
"99688",61.896608,"-150.003758","Willow","AK","Matanuska Susitna"
"99689",58.331798,"-135.181256","Yakutat","AK","Yakutat"
"99690",60.314735,"-163.118947","Nightmute","AK","Bethel"
"99691",65.226375,"-151.025085","Nikolai","AK","Yukon Koyukuk"
"99692",53.865295,"-166.525333","Dutch Harbor","AK","Aleutians West"
"99693",61.470966,"-144.991027","Whittier","AK","Valdez Cordova"
"99694",62.280436,"-149.715167","Houston","AK","Matanuska Susitna"
"99695",61.108864,"-149.440311","Anchorage","AK","Anchorage"
"99697",58.268704,"-155.797078","Kodiak","AK","Kodiak Island"
"99701",64.644047,"-147.522052","Fairbanks","AK","Fairbanks North Star"
"99702",64.790803,"-147.463336","Eielson Afb","AK","Fairbanks North Star"
"99703",64.832821,"-147.644180","Fort Wainwright","AK","Fairbanks North Star"
"99704",63.543571,"-149.986676","Clear","AK","Denali"
"99705",64.780765,"-147.207748","North Pole","AK","Fairbanks North Star"
"99706",64.852055,"-147.937747","Fairbanks","AK","Fairbanks North Star"
"99707",64.699839,"-147.405134","Fairbanks","AK","Fairbanks North Star"
"99708",64.947462,"-147.856443","Fairbanks","AK","Fairbanks North Star"
"99709",64.860126,"-147.999791","Fairbanks","AK","Fairbanks North Star"
"99710",64.948648,"-147.535549","Fairbanks","AK","Fairbanks North Star"
"99711",64.826445,"-147.388840","Fairbanks","AK","Fairbanks North Star"
"99712",65.036453,"-147.156588","Fairbanks","AK","Fairbanks North Star"
"99714",64.489102,"-146.924788","Salcha","AK","Fairbanks North Star"
"99716",64.874591,"-146.898195","Two Rivers","AK","Fairbanks North Star"
"99720",65.226375,"-151.025085","Allakaket","AK","Yukon Koyukuk"
"99721",66.693255,"-153.993988","Anaktuvuk Pass","AK","North Slope"
"99722",65.226375,"-151.025085","Arctic Village","AK","Yukon Koyukuk"
"99723",70.220472,"-150.238942","Barrow","AK","North Slope"
"99724",66.929746,"-149.193010","Beaver","AK","Yukon Koyukuk"
"99725",64.870974,"-148.094930","Ester","AK","Fairbanks North Star"
"99726",65.226375,"-151.025085","Bettles Field","AK","Yukon Koyukuk"
"99727",66.868442,"-159.843924","Buckland","AK","Northwest Arctic"
"99729",63.543571,"-149.986676","Cantwell","AK","Denali"
"99730",65.226375,"-151.025085","Central","AK","Yukon Koyukuk"
"99732",63.870552,"-144.002648","Chicken","AK","Southeast Fairbanks"
"99733",65.226375,"-151.025085","Circle","AK","Yukon Koyukuk"
"99734",66.693255,"-153.993988","Prudhoe Bay","AK","North Slope"
"99736",66.868442,"-159.843924","Deering","AK","Northwest Arctic"
"99737",63.107461,"-143.422478","Delta Junction","AK","Southeast Fairbanks"
"99738",63.870552,"-144.002648","Eagle","AK","Southeast Fairbanks"
"99739",64.755604,"-165.672344","Elim","AK","Nome"
"99740",65.226375,"-151.025085","Fort Yukon","AK","Yukon Koyukuk"
"99741",65.226375,"-151.025085","Galena","AK","Yukon Koyukuk"
"99742",64.755604,"-165.672344","Gambell","AK","Nome"
"99743",63.543571,"-149.986676","Healy","AK","Denali"
"99744",63.543571,"-149.986676","Anderson","AK","Denali"
"99745",65.226375,"-151.025085","Hughes","AK","Yukon Koyukuk"
"99746",65.226375,"-151.025085","Huslia","AK","Yukon Koyukuk"
"99747",66.693255,"-153.993988","Kaktovik","AK","North Slope"
"99748",65.226375,"-151.025085","Kaltag","AK","Yukon Koyukuk"
"99749",66.868442,"-159.843924","Kiana","AK","Northwest Arctic"
"99750",66.868442,"-159.843924","Kivalina","AK","Northwest Arctic"
"99751",66.868442,"-159.843924","Kobuk","AK","Northwest Arctic"
"99752",66.865256,"-161.780844","Kotzebue","AK","Northwest Arctic"
"99753",64.755604,"-165.672344","Koyuk","AK","Nome"
"99754",65.226375,"-151.025085","Koyukuk","AK","Yukon Koyukuk"
"99755",63.543571,"-149.986676","Denali National Park","AK","Denali"
"99756",65.226375,"-151.025085","Manley Hot Springs","AK","Yukon Koyukuk"
"99757",65.226375,"-151.025085","Lake Minchumina","AK","Yukon Koyukuk"
"99758",65.226375,"-151.025085","Minto","AK","Yukon Koyukuk"
"99759",68.887048,"-164.249713","Point Lay","AK","North Slope"
"99760",64.117464,"-153.451125","Nenana","AK","Yukon Koyukuk"
"99761",66.868442,"-159.843924","Noatak","AK","Northwest Arctic"
"99762",63.888671,"-163.800760","Nome","AK","Nome"
"99763",66.868442,"-159.843924","Noorvik","AK","Northwest Arctic"
"99764",63.870552,"-144.002648","Northway","AK","Southeast Fairbanks"
"99765",65.226375,"-151.025085","Nulato","AK","Yukon Koyukuk"
"99766",66.693255,"-153.993988","Point Hope","AK","North Slope"
"99767",65.509038,"-150.161868","Rampart","AK","Yukon Koyukuk"
"99768",65.226375,"-151.025085","Ruby","AK","Yukon Koyukuk"
"99769",64.755604,"-165.672344","Savoonga","AK","Nome"
"99770",66.868442,"-159.843924","Selawik","AK","Northwest Arctic"
"99771",64.755604,"-165.672344","Shaktoolik","AK","Nome"
"99772",64.755604,"-165.672344","Shishmaref","AK","Nome"
"99773",66.868442,"-159.843924","Shungnak","AK","Northwest Arctic"
"99774",65.226375,"-151.025085","Stevens Village","AK","Yukon Koyukuk"
"99775",64.859078,"-147.826709","Fairbanks","AK","Fairbanks North Star"
"99776",63.870552,"-144.002648","Tanacross","AK","Southeast Fairbanks"
"99777",65.226375,"-151.025085","Tanana","AK","Yukon Koyukuk"
"99778",64.755604,"-165.672344","Teller","AK","Nome"
"99779",63.870552,"-144.002648","Tetlin","AK","Southeast Fairbanks"
"99780",63.870552,"-144.002648","Tok","AK","Southeast Fairbanks"
"99781",65.226375,"-151.025085","Venetie","AK","Yukon Koyukuk"
"99782",66.693255,"-153.993988","Wainwright","AK","North Slope"
"99783",64.755604,"-165.672344","Wales","AK","Nome"
"99784",64.755604,"-165.672344","White Mountain","AK","Nome"
"99785",64.755604,"-165.672344","Brevig Mission","AK","Nome"
"99786",66.868442,"-159.843924","Ambler","AK","Northwest Arctic"
"99788",65.226375,"-151.025085","Chalkyitsik","AK","Yukon Koyukuk"
"99789",66.693255,"-153.993988","Nuiqsut","AK","North Slope"
"99790",64.856055,"-146.275980","Fairbanks","AK","Fairbanks North Star"
"99791",70.494693,"-157.441073","Atqasuk","AK","North Slope"
"99801",58.373561,"-134.523946","Juneau","AK","Juneau"
"99802",58.405657,"-134.589690","Juneau","AK","Juneau"
"99803",58.377074,"-134.617383","Juneau","AK","Juneau"
"99811",58.38348,"-134.197786","Juneau","AK","Juneau"
"99820",57.500525,"-134.585954","Angoon","AK","Skagway Hoonah Angoon"
"99821",58.449413,"-134.700348","Auke Bay","AK","Juneau"
"99824",58.276308,"-134.397642","Douglas","AK","Juneau"
"99825",58.331798,"-135.181256","Elfin Cove","AK","Skagway Hoonah Angoon"
"99826",58.331798,"-135.181256","Gustavus","AK","Skagway Hoonah Angoon"
"99827",59.312688,"-135.681153","Haines","AK","Haines"
"99829",58.097655,"-135.431561","Hoonah","AK","Skagway Hoonah Angoon"
"99830",56.973554,"-133.935996","Kake","AK","Wrangell Petersburg"
"99832",58.331798,"-135.181256","Pelican","AK","Skagway Hoonah Angoon"
"99833",56.767056,"-132.931950","Petersburg","AK","Wrangell Petersburg"
"99835",57.080818,"-135.318348","Sitka","AK","Sitka"
"99836",56.53595,"-132.827948","Port Alexander","AK","Wrangell Petersburg"
"99840",59.456753,"-135.314852","Skagway","AK","Skagway Hoonah Angoon"
"99841",57.798249,"-135.285061","Tenakee Springs","AK","Skagway Hoonah Angoon"
"99850",58.38348,"-134.197786","Juneau","AK","Juneau"
"99901",55.400674,"-131.674090","Ketchikan","AK","Ketchikan Gateway"
"99903",55.517921,"-132.003244","Meyers Chuck","AK","Prince Wales Ketchikan"
"99918",55.517921,"-132.003244","Coffman Cove","AK","Prince Wales Ketchikan"
"99919",55.126774,"-131.580407","Thorne Bay","AK","Prince Wales Ketchikan"
"99921",55.513301,"-133.117022","Craig","AK","Prince Wales Ketchikan"
"99922",55.208706,"-132.825903","Hydaburg","AK","Prince Wales Ketchikan"
"99923",55.517921,"-132.003244","Hyder","AK","Prince Wales Ketchikan"
"99925",55.554393,"-133.090680","Klawock","AK","Prince Wales Ketchikan"
"99926",55.094325,"-131.566827","Metlakatla","AK","Prince Wales Ketchikan"
"99927",55.517921,"-132.003244","Point Baker","AK","Prince Wales Ketchikan"
"99928",55.395359,"-131.675370","Ward Cove","AK","Ketchikan Gateway"
"99929",56.449893,"-132.364407","Wrangell","AK","Wrangell Petersburg"
"99950",55.542007,"-131.432682","Ketchikan","AK","Ketchikan Gateway"
'
]
