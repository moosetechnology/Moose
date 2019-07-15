Class {
	#name : #RTMapLocationBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'addedElements'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #adding }
RTMapLocationBuilder >> addPoint: geoPoint value: aValue [

	| el |
	el := self elementOn: aValue.
	el translateTo: (self translateGeoPositionToPixels: geoPoint).
	el @ RTPopup.
	view add: el.
	
	"We keep track of the added elements"
	addedElements add: el
]

{ #category : #hooks }
RTMapLocationBuilder >> createView [
	| v |
	v := super createView.
	self renderAllCountriesIn: v.
	v @ RTDraggableView.
	^ v
]

{ #category : #examples }
RTMapLocationBuilder >> example01 [

	"
	self new example01
	"
	| paris london santiago b |
	paris := 48.8567 @ 2.3508.
	london := 51.507222 @ -0.1275.
	santiago := -33.45 @ -70.666667.
	
	b := RTMapLocationBuilder new.
	b shape circle 
		size: #yourself;
		color: (Color red alpha: 0.4).
	b addPoint: paris value: 10. 
	b addPoint: london value: 15.
	b addPoint: santiago value: 20.
	^ b
]

{ #category : #examples }
RTMapLocationBuilder >> example02 [
	"
	self new example02
	"
	| b tab |
	tab := RTTabTable new input: self seismData usingDelimiter: $,.
	tab removeFirstRow.
	tab convertColumnsAsFloat: #(2 3 4 5).
	b := RTMapLocationBuilder new.
	b shape circle
		size: [ :v | (2 raisedTo: v) / 2 ];
		color: (Color red alpha: 0.3).
	tab values do: [ :row | b addPoint: row second @ row third value: row fifth ].
	^ b
]

{ #category : #examples }
RTMapLocationBuilder >> example03Normalizer [

	"
	self new example03Normalizer
	"
	| paris london santiago b newYork |
	paris := 48.8567 @ 2.3508.
	london := 51.507222 @ -0.1275.
	santiago := -33.45 @ -70.666667.
	newYork := 40.7127 @ -74.0059.

	b := RTMapLocationBuilder new.
	b shape circle.
	b addPoint: paris value: 10. 
	b addPoint: london value: 15.
	b addPoint: santiago value: 20.
	b addPoint: newYork value: 30.
	b normalizer normalizeSize: #yourself max: 50; normalizeColor: #yourself; alphaColor: 0.3.
	^ b
]

{ #category : #initialization }
RTMapLocationBuilder >> initialize [
	super initialize.
	addedElements := OrderedCollection new
]

{ #category : #hooks }
RTMapLocationBuilder >> metricNormalizerClass [
	^ RTMetricNormalizer
]

{ #category : #hooks }
RTMapLocationBuilder >> normalizer [
	"
	:: Void->RTMetricNormalizer
	
	This metric normalizer assumes that elements have been already created. Which may not be the case...
	"
	^ super normalizer elements: addedElements; yourself
]

{ #category : #utility }
RTMapLocationBuilder >> renderAllCountriesIn: aView [
	| el shape |
	RTSVGPath countries
		do: [ :name | 
			shape := RTSVGPath new path: (RTSVGPath perform: name).
			shape borderColor: Color lightGray.
			el := shape elementOn: name asString.
			el @ RTPopup.
			aView add: el ]
]

{ #category : #examples }
RTMapLocationBuilder >> seismData [
	^ 'time,latitude,longitude,depth,mag,magType,nst,gap,dmin,rms,net,id,updated,place,type
2014-05-25T01:39:20.040Z,-0.7851,-14.2823,10,4.5,mb,,197,7.1,0.59,us,usb000r36t,2014-05-25T02:09:12.227Z,"North of Ascension Island",earthquake
2014-05-25T01:33:15.400Z,40.3885002,-124.987999,1.11,3.52,ml,65,253,0.5418,0.17,nc,nc72226741,2014-05-25T02:34:10.843Z,"64km WSW of Ferndale, California",earthquake
2014-05-25T01:29:34.680Z,32.5268,141.5741,41.83,4.5,mb,,137,1.594,0.64,us,usb000r36i,2014-05-25T01:58:00.878Z,"177km ESE of Hachijo-jima, Japan",earthquake
2014-05-25T00:08:01.860Z,40.0084,24.2593,10,4.5,mb,,40,1.361,1.44,us,usb000r34s,2014-05-25T00:46:22.709Z,"25km ESE of Sarti, Greece",earthquake
2014-05-24T22:02:19.000Z,67.6931,-162.4102,7.2,3.1,ml,,,,0.77,ak,ak11272548,2014-05-25T01:04:55.000Z,"27km ENE of Noatak, Alaska",earthquake
2014-05-24T20:58:07.070Z,-6.2569,104.1452,60.97,5.2,mb,,60,2.225,0.91,us,usb000r2z6,2014-05-25T01:02:08.954Z,"99km SSW of Kotaagung, Indonesia",earthquake
2014-05-24T20:41:18.800Z,38.8083,-122.7987,3.6,2.5,Md,54,21.6,0,0.04,nc,nc72226676,2014-05-25T00:29:21.707Z,"5km NW of The Geysers, California",earthquake
2014-05-24T20:10:04.000Z,63.1515,-150.4677,100,2.7,ml,,,,0.85,ak,ak11272450,2014-05-24T20:33:00.118Z,"80km WSW of Cantwell, Alaska",earthquake
2014-05-24T19:06:29.000Z,59.3773,-155.7452,100,2.7,ml,,,,3.52,ak,ak11272262,2014-05-24T19:29:44.199Z,"62km SW of Old Iliamna, Alaska",earthquake
2014-05-24T18:40:48.700Z,18.516,-64.8404,20,3,Md,7,316.8,0.19493442,0.25,pr,pr14144010,2014-05-24T19:08:10.866Z,"21km NNE of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-24T16:50:02.480Z,40.0003,24.3356,10,4.5,mb,,40,1.42,0.86,us,usb000r2sa,2014-05-24T22:02:25.397Z,"29km SSE of Karyes, Greece",earthquake
2014-05-24T16:26:20.000Z,19.1648,-64.612,24,3,Md,8,295.2,0.87136583,0.1,pr,pr14144009,2014-05-25T00:30:43.182Z,"82km N of Road Town, British Virgin Islands",earthquake
2014-05-24T15:08:44.100Z,18.8752,-67.3619,10,2.7,Md,7,280.8,0.46892058,0.23,pr,pr14144007,2014-05-24T23:11:10.272Z,"50km NNW of San Antonio, Puerto Rico",earthquake
2014-05-24T14:49:16.100Z,40.4133,25.9081,10,4.8,mb,,38,2.635,1.01,us,usb000r2nx,2014-05-24T19:52:52.473Z,"23km N of Gokceada, Turkey",earthquake
2014-05-24T13:46:52.300Z,18.1404,-67.287,21,2.6,Md,11,194.4,0.1940361,0.1,pr,pr14144006,2014-05-24T21:49:26.175Z,"12km NW of Puerto Real, Puerto Rico",earthquake
2014-05-24T12:37:26.000Z,18.805,-68.1386,68,3.3,Md,11,241.2,0.3701059,0.25,pr,pr14144004,2014-05-24T20:39:54.439Z,"37km NE of Punta Cana, Dominican Republic",earthquake
2014-05-24T11:49:26.320Z,0.7273,-26.3481,10,5.2,mb,,48,11.55,0.57,us,usb000r2j9,2014-05-24T21:56:34.000Z,"Central Mid-Atlantic Ridge",earthquake
2014-05-24T11:33:08.650Z,40.3041,25.6303,10,4.5,mb,,37,0.671,0.78,us,usb000r2iq,2014-05-24T18:41:22.739Z,"24km SE of Kamariotissa, Greece",earthquake
2014-05-24T11:09:29.610Z,53.6116,-164.9217,26.87,4.2,mb,,158,0.727,1.16,us,usb000r2ih,2014-05-24T19:12:10.715Z,"80km SE of Akutan, Alaska",earthquake
2014-05-24T09:25:03.410Z,40.3046,25.4532,10,6.9,mwc,,25,0.745,0.74,us,usb000r2hc,2014-05-25T01:53:19.385Z,"19km S of Kamariotissa, Greece",earthquake
2014-05-24T08:24:47.560Z,16.5405,-98.1544,12,5.6,mwb,,99,2.94,1.25,us,usb000r2gj,2014-05-24T19:32:07.996Z,"8km S of San Juan Cacahuatepec, Mexico",earthquake
2014-05-24T07:50:15.790Z,-15.2933,-71.9734,115.26,4.1,mb,,114,3.435,1.44,us,usb000r2fk,2014-05-24T15:52:57.600Z,"39km E of Orcopampa, Peru",earthquake
2014-05-24T07:27:29.910Z,30.5448,35.1641,10,4.1,mb,,186,4.666,1.11,us,usb000r2f5,2014-05-24T20:36:28.015Z,"35km ESE of Mizpe Ramon, Israel",earthquake
2014-05-24T07:01:29.000Z,67.707,-162.4206,4.3,2.8,ml,,,,0.67,ak,ak11271031,2014-05-24T15:04:39.337Z,"27km ENE of Noatak, Alaska",earthquake
2014-05-24T06:58:48.200Z,19.1189,-64.817,45,3,Md,6,291.6,0.7231438,0.18,pr,pr14144002,2014-05-24T15:01:14.731Z,"80km NNW of Road Town, British Virgin Islands",earthquake
2014-05-24T06:56:56.800Z,18.5505,-64.8421,9,2.7,Md,7,223.2,0.22457882,0.25,pr,pr14144001,2014-05-24T14:59:37.684Z,"24km NNE of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-24T06:47:31.450Z,-15.2899,-73.8308,70.18,5.1,mb,,127,4.398,1.02,us,usb000r2eb,2014-05-24T14:50:04.601Z,"28km S of Coracora, Peru",earthquake
2014-05-24T06:33:42.600Z,36.8057,-121.5345,6.8,2.5,Md,56,39.6,0.04491576,0.07,nc,nc72226416,2014-05-24T17:12:56.370Z,"4km S of San Juan Bautista, California",earthquake
2014-05-24T06:13:44.830Z,-33.48,179.2782,262.14,4.3,mb,,104,4.149,1.12,us,usb000r2ds,2014-05-24T14:16:24.740Z,"284km SW of LEsperance Rock, New Zealand",earthquake
2014-05-24T06:09:48.000Z,52.296,-178.95,62.1,2.8,ml,,,,0.62,ak,ak11271011,2014-05-25T00:48:43.005Z,"71km NW of Tanaga Volcano, Alaska",earthquake
2014-05-24T06:04:10.000Z,63.1787,-150.3954,100,2.7,ml,,,,0.79,ak,ak11270988,2014-05-24T14:08:32.593Z,"76km WSW of Cantwell, Alaska",earthquake
2014-05-24T06:02:23.100Z,25.9181,125.748,41.8,4.7,mb,,101,2.442,0.84,us,usb000r2di,2014-05-24T14:04:56.416Z,"132km NNE of Hirara, Japan",earthquake
2014-05-24T06:02:15.000Z,51.1827,179.4489,62.8,2.9,ml,,,,0.56,ak,ak11270986,2014-05-25T00:48:46.153Z,"86km S of Semisopochnoi Island, Alaska",earthquake
2014-05-24T05:33:14.610Z,35.1357,-97.8269,4.87,2.8,mb_lg,,61,0.369,0.63,us,usa000qd4i,2014-05-24T22:51:57.129Z,"13km NE of Chickasha, Oklahoma",earthquake
2014-05-24T04:12:22.000Z,62.1386,-148.0244,17.2,2.9,ml,,,,0.6,ak,ak11270936,2014-05-24T12:15:44.795Z,"57km NE of Sutton-Alpine, Alaska",earthquake
2014-05-24T03:44:47.700Z,36.809,-121.5383,6.9,3,Ml,66,39.6,0.02694946,0.08,nc,nc72226246,2014-05-24T21:41:30.556Z,"4km S of San Juan Bautista, California",earthquake
2014-05-24T02:39:18.500Z,19.6637,-65.9586,84,3.3,Md,3,349.2,1.38789711,0,pr,pr14144000,2014-05-24T10:42:21.090Z,"133km N of San Juan, Puerto Rico",earthquake
2014-05-23T23:41:49.670Z,45.0087,-27.8674,10,5.2,mb,,28,6.289,0.8,us,usb000r26g,2014-05-24T15:56:37.000Z,"Northern Mid-Atlantic Ridge",earthquake
2014-05-23T23:36:12.230Z,45.0429,-28.0061,10,4.6,mb,,56,6.319,1.21,us,usb000r26c,2014-05-24T07:38:53.605Z,"northern Mid-Atlantic Ridge",earthquake
2014-05-23T23:12:43.250Z,50.0625,-178.6596,31.65,4.3,mb,,206,2.029,0.93,us,usb000r254,2014-05-24T07:15:21.632Z,"137km SSE of Amatignak Island, Alaska",earthquake
2014-05-23T21:55:26.920Z,25.9394,97.6454,43.52,4.2,mb,,97,4.673,0.81,us,usb000r23p,2014-05-24T06:00:52.554Z,"66km NNE of Myitkyina, Burma",earthquake
2014-05-23T21:40:40.020Z,18.9556,145.0559,551.3,4.4,mb,,34,5.338,0.67,us,usb000r226,2014-05-24T05:43:20.921Z,"67km WNW of Agrihan, Northern Mariana Islands",earthquake
2014-05-23T21:33:04.210Z,52.3992,-178.4241,87.2,4.2,mb,,161,1.19,1.34,us,usb000r21e,2014-05-24T05:35:59.159Z,"Andreanof Islands, Aleutian Islands, Alaska",earthquake
2014-05-23T21:20:06.900Z,18.9815,145.0416,557.77,5.5,mb,,23,5.364,0.8,us,usb000r209,2014-05-24T15:56:35.000Z,"Pagan region, Northern Mariana Islands",earthquake
2014-05-23T20:51:46.000Z,59.0724,-154.5241,100,2.6,ml,,,,1.28,ak,ak11270656,2014-05-24T17:12:26.000Z,"88km SSE of Old Iliamna, Alaska",earthquake
2014-05-23T20:49:22.090Z,24.926,97.809,10,5.8,mww,,32,4.477,0.93,us,usb000r1y6,2014-05-24T17:01:05.878Z,"23km NNW of Pingyuan, China",earthquake
2014-05-23T20:25:57.060Z,-16.3105,-174.6314,219.8,4.6,mb,,55,3.646,0.91,us,usb000r1wm,2014-05-24T16:09:38.265Z,"102km WSW of Hihifo, Tonga",earthquake
2014-05-23T19:57:58.510Z,-35.7717,-73.7328,11.32,4.1,mwr,,204,1.212,1.69,us,usb000r24u,2014-05-24T15:58:42.269Z,"117km NW of Tome, Chile",earthquake
2014-05-23T19:49:54.000Z,61.6525,-149.8939,25.5,2.6,ml,,,,0.66,ak,ak11270625,2014-05-24T15:10:44.000Z,"8km WNW of Houston, Alaska",earthquake
2014-05-23T19:42:28.130Z,56.0764,113.9536,10.79,5.4,mww,,27,7.515,0.69,us,usb000r1sc,2014-05-24T15:04:30.820Z,"33km ESE of Severomuysk, Russia",earthquake
2014-05-23T18:00:54.870Z,51.4002,179.2846,73.45,4.2,mb,,204,2.557,0.97,us,usb000r1jx,2014-05-24T13:49:40.812Z,"65km SSW of Semisopochnoi Island, Alaska",earthquake
2014-05-23T15:57:13.900Z,-31.334,-69.2079,204.53,4.3,mb,,172,1.363,0.95,us,usb000r1c0,2014-05-24T00:00:37.378Z,"19km E of Calingasta, Argentina",earthquake
2014-05-23T14:14:57.580Z,32.3316667,-115.1843333,10.99,3.22,ml,9,273,0.1345,0.26,ci,ci15504753,2014-05-23T15:00:43.475Z,"2km SSE of Delta, Mexico",earthquake
2014-05-23T13:20:35.250Z,12.3077,-87.3531,73.54,4.5,mb,,155,0.497,0.79,us,usb000r13u,2014-05-23T21:24:13.415Z,"27km SW of Corinto, Nicaragua",earthquake
2014-05-23T11:55:17.820Z,-7.1962,155.091,10,4.9,mb,,45,4.17,0.59,us,usb000r12e,2014-05-24T10:21:07.760Z,"106km SSW of Panguna, Papua New Guinea",earthquake
2014-05-23T11:46:42.670Z,1.5862,121.5791,48.36,4.3,mb,,112,2.869,1.27,us,usb000r12a,2014-05-24T07:32:10.129Z,"49km NNE of Kali, Indonesia",earthquake
2014-05-23T10:01:24.500Z,18.7231,-64.3312,62,2.7,Md,3,352.8,0.69619435,0.2,pr,pr14143003,2014-05-23T18:03:57.932Z,"45km NE of Road Town, British Virgin Islands",earthquake
2014-05-23T09:54:27.800Z,38.7005,-111.7483,9.5,2.8,Ml,,61.2,0.26949459,0.25,uu,uu60069702,2014-05-23T18:00:00.139Z,"29km SSE of Aurora, Utah",earthquake
2014-05-23T09:34:00.350Z,-11.5002,161.9882,18.14,5.1,mb,,45,2.867,1.06,us,usb000r0zy,2014-05-23T17:36:33.842Z,"115km S of Kirakira, Solomon Islands",earthquake
2014-05-23T09:13:34.400Z,-11.0385,161.5021,37.43,5.3,mb,,59,2.206,1.04,us,usb000r0zd,2014-05-23T17:16:08.633Z,"79km SW of Kirakira, Solomon Islands",earthquake
2014-05-23T09:06:57.500Z,-6.9444,102.5705,29.71,5.2,mb,,82,2.595,1.08,us,usb000r0z7,2014-05-23T17:09:37.754Z,"240km SW of Biha, Indonesia",earthquake
2014-05-23T08:22:25.660Z,-7.0472,102.5498,32.55,4.8,mb,,82,2.699,0.78,us,usb000r0y9,2014-05-23T16:25:01.827Z,"250km SW of Biha, Indonesia",earthquake
2014-05-23T08:22:19.490Z,35.5245,-97.2159,7.03,2.9,mb_lg,,29,0.114,0.66,us,usb000r0y7,2014-05-24T02:58:36.381Z,"5km ENE of Choctaw, Oklahoma",earthquake
2014-05-23T07:50:21.520Z,39.5397,143.6015,35,4.5,mb,,124,2.495,1.13,us,usb000r0xs,2014-05-23T15:52:56.489Z,"142km E of Miyako, Japan",earthquake
2014-05-23T07:28:33.580Z,-6.9608,102.637,29.97,4.6,mb,,106,2.602,0.84,us,usb000r0xa,2014-05-23T15:32:04.216Z,"237km SW of Biha, Indonesia",earthquake
2014-05-23T07:17:40.200Z,19.6439,-65.2289,9,3.3,Md,14,262.8,1.31154031,0.28,pr,pr14143000,2014-05-23T15:20:22.045Z,"147km NNW of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-23T07:05:18.000Z,62.3372,-149.0521,8.2,3.5,ml,,,,1.02,ak,ak11270189,2014-05-23T15:07:52.947Z,"45km ENE of Y, Alaska",earthquake
2014-05-23T07:00:34.940Z,-45.561,167.3252,80.68,4.3,mb,,57,0.547,1.39,us,usb000r0wn,2014-05-23T15:03:06.044Z,"34km WSW of Te Anau, New Zealand",earthquake
2014-05-23T05:58:19.110Z,-4.5434,141.6635,67.39,4.5,mb,,166,7.285,0.92,us,usb000r0u8,2014-05-23T14:00:47.070Z,"135km WSW of Ambunti, Papua New Guinea",earthquake
2014-05-23T05:02:44.800Z,4.2808,125.5354,48.61,4.5,mb,,101,3.936,0.88,us,usb000r0sy,2014-05-23T13:05:12.870Z,"124km S of Sarangani, Philippines",earthquake
2014-05-23T04:44:15.710Z,-7.8461,123.0925,276.45,4.1,mb,,152,1.153,0.6,us,usb000r0sp,2014-05-23T12:47:15.558Z,"80km NNE of Palue, Indonesia",earthquake
2014-05-23T03:21:09.610Z,-17.6555,-178.7237,562.77,4.5,mb,,79,3.074,0.73,us,usb000r0rr,2014-05-23T11:23:50.751Z,"243km SE of Lambasa, Fiji",earthquake
2014-05-23T03:20:36.400Z,18.2031,-66.8531,26,2.5,Md,17,72,0.13564561,0.12,pr,pr14143002,2014-05-23T11:23:12.513Z,"7km NW of Adjuntas, Puerto Rico",earthquake
2014-05-23T03:01:48.660Z,-17.475,-178.6977,546.47,4.5,mb,,55,3.11,0.59,us,usb000r0ri,2014-05-23T11:04:28.818Z,"235km ESE of Lambasa, Fiji",earthquake
2014-05-23T01:35:37.900Z,40.725,-124.2628,24,2.8,Md,17,198,0.3233935,0.06,nc,nc72225856,2014-05-23T09:38:09.776Z,"6km W of Humboldt Hill, California",earthquake
2014-05-22T23:41:43.000Z,67.7074,-162.5553,22,3.7,ml,,,,1.14,ak,ak11270060,2014-05-23T07:44:28.103Z,"23km NE of Noatak, Alaska",earthquake
2014-05-22T20:47:47.000Z,18.648,-67.3984,84,2.9,Md,12,198,0.27218953,0.07,pr,pr14142008,2014-05-23T04:50:18.664Z,"35km NW of Aguadilla, Puerto Rico",earthquake
2014-05-22T20:17:26.940Z,9.193,122.242,42.9,4.7,mb,,122,6.743,0.73,us,usb000r05u,2014-05-23T03:31:25.629Z,"46km SW of Colipapa, Philippines",earthquake
2014-05-22T20:00:01.570Z,2.1686,96.5833,61.13,4.8,mb,,128,1.312,1,us,usb000r03k,2014-05-23T04:03:26.578Z,"41km SSE of Sinabang, Indonesia",earthquake
2014-05-22T18:45:57.130Z,-4.5927,133.6254,30.6,4.5,mb,,134,2.156,0.62,us,usb000qzyc,2014-05-23T02:49:56.498Z,"145km NNW of Dobo, Indonesia",earthquake
2014-05-22T18:01:21.600Z,36.761,-98.362,5,2.5,ml,,,,0.65,us,usb000qzx5,2014-05-22T19:01:15.946Z,"0km NNW of Cherokee, Oklahoma",earthquake
2014-05-22T17:57:11.800Z,19.176,-64.222,24,2.9,Md,3,338.4,1.07348676,0.1,pr,pr14142006,2014-05-23T01:59:41.134Z,"93km NNE of Road Town, British Virgin Islands",earthquake
2014-05-22T16:22:13.710Z,-11.4625,161.5948,33.02,4.9,mb,,44,2.582,0.51,us,usb000qzny,2014-05-23T20:45:15.138Z,"117km SSW of Kirakira, Solomon Islands",earthquake
2014-05-22T13:34:28.000Z,67.7042,-162.3999,5.3,2.7,ml,,,,0.59,ak,ak11269668,2014-05-22T21:37:05.376Z,"28km ENE of Noatak, Alaska",earthquake
2014-05-22T11:24:00.060Z,-16.2299,-172.656,13.57,4.8,mb,,64,3.844,1.36,us,usb000qzfb,2014-05-22T19:26:41.501Z,"121km ESE of Hihifo, Tonga",earthquake
2014-05-22T10:21:36.900Z,19.4456,-67.0309,79,2.8,Md,3,306,1.43281288,0.25,pr,pr14142005,2014-05-22T18:24:04.862Z,"104km N of Isabela, Puerto Rico",earthquake
2014-05-22T08:50:29.180Z,19.0258,121.5326,34.3,4.6,mb,,124,1.787,1.14,us,usb000qzbp,2014-05-22T16:57:28.254Z,"60km NE of Namuac, Philippines",earthquake
2014-05-22T08:38:01.060Z,-55.3955,-28.3273,35,5.5,mb,,55,4.847,0.62,us,usb000qzb9,2014-05-22T16:43:51.693Z,"161km NNW of Visokoi Island, ",earthquake
2014-05-22T08:31:11.460Z,32.203,-115.2391667,10.54,2.58,ml,9,231,0.223,0.13,ci,ci15504337,2014-05-23T15:01:52.855Z,"7km WSW of Alberto Oviedo Mota, Mexico",earthquake
2014-05-22T06:33:42.800Z,35.5797,-120.8742,4.2,2.9,Md,88,43.2,0.05389892,0.07,nc,nc72225491,2014-05-22T22:38:29.592Z,"15km WNW of Templeton, California",earthquake
2014-05-22T06:30:19.040Z,37.0807,-97.8918,7.91,2.5,mb_lg,,67,0.031,0.29,us,usb000qz8a,2014-05-22T09:20:13.152Z,"14km ESE of Anthony, Kansas",earthquake
2014-05-22T05:31:59.000Z,67.6712,-162.2512,5.5,3,ml,,,,0.65,ak,ak11269452,2014-05-22T13:34:32.564Z,"32km ENE of Noatak, Alaska",earthquake
2014-05-22T05:22:54.450Z,-11.1601,161.402,28.86,5.1,mb,,61,2.23,0.67,us,usb000qz7b,2014-05-22T14:56:33.000Z,"96km SW of Kirakira, Solomon Islands",earthquake
2014-05-22T05:22:03.660Z,35.7918,0.247,9.98,4.9,mb,,50,2.053,0.91,us,usb000qz78,2014-05-22T06:27:51.801Z,"21km SE of Mostaganem, Algeria",earthquake
2014-05-22T05:15:40.500Z,18.916,-68.088,50,2.9,Md,7,255.6,0.48688688,0.31,pr,pr14142004,2014-05-22T13:18:18.380Z,"49km NE of Punta Cana, Dominican Republic",earthquake
2014-05-22T04:17:37.900Z,18.2315,-67.97,81,3,Md,8,198,0.48059868,0.18,pr,pr14142003,2014-05-22T12:20:10.763Z,"60km SE of Punta Cana, Dominican Republic",earthquake
2014-05-22T04:01:38.800Z,19.0911,-66.7957,11,2.9,Md,9,284.4,0.66026173,0.25,pr,pr14142002,2014-05-22T12:04:08.059Z,"67km N of Hatillo, Puerto Rico",earthquake
2014-05-22T03:46:58.800Z,19.059,-66.8135,40,3,Md,10,270,0.63780385,0.28,pr,pr14142001,2014-05-22T11:49:37.402Z,"63km N of Hatillo, Puerto Rico",earthquake
2014-05-22T03:04:13.800Z,19.3343,-155.1227,7,2.6,Ml,,140.4,0.03593261,0.1,hv,hv60698741,2014-05-22T18:47:30.102Z,"16km SE of Volcano, Hawaii",earthquake
2014-05-22T02:46:10.350Z,35.7869,-97.4833,10.93,3.6,mb_lg,,70,0.025,0.28,us,usb000qz4x,2014-05-24T17:15:50.535Z,"11km SSW of Guthrie, Oklahoma",earthquake
2014-05-22T02:25:10.330Z,36.6235,-97.7089,4.92,2.7,mb_lg,,71,0.25,0.37,us,usb000qz4l,2014-05-22T10:29:48.792Z,"20km S of Medford, Oklahoma",earthquake
2014-05-22T02:06:46.900Z,45.1526,-113.6125,12.2,2.7,mc,36,100.799991936001,0.6306173,0.28,mb,mb14319042,2014-05-22T23:16:19.389Z,"22km E of Salmon, Idaho",earthquake
2014-05-22T01:47:16.000Z,37.5298,-78.0702,9.9,3.2,mblg,14,75.5999939520005,0.08084838,0.31,se,se052214a,2014-05-24T12:57:51.633Z,"12km WSW of Powhatan, Virginia",earthquake
2014-05-21T23:37:38.800Z,19.6567,-66.6453,35,3.1,Md,15,273.6,1.17769134,0.15,pr,pr14141009,2014-05-22T07:40:17.925Z,"130km N of Hatillo, Puerto Rico",earthquake
2014-05-21T22:29:59.650Z,-8.9032,-74.47,127.7,4.7,mb,,103,3.851,1.01,us,usa000qcbm,2014-05-22T00:08:03.394Z,"58km S of Pucallpa, Peru",earthquake
2014-05-21T21:42:26.500Z,18.7994,-64.4229,89,2.7,Md,3,338.4,0.67193983,0.12,pr,pr14141008,2014-05-22T05:45:04.272Z,"47km NNE of Road Town, British Virgin Islands",earthquake
2014-05-21T20:17:16.850Z,18.7082,-68.601,98.65,3.2,md,,327,0.287,0.79,us,usb000qyvb,2014-05-22T04:19:56.935Z,"9km NE of Otra Banda, Dominican Republic",earthquake
2014-05-21T18:55:46.100Z,36.0493,-120.6083,9.3,2.5,Md,102,39.6,0.01796631,0.07,nc,nc72225176,2014-05-22T04:28:08.343Z,"24km WSW of Coalinga, California",earthquake
2014-05-21T18:14:29.070Z,-2.8837,128.0056,33.55,5.3,mb,,25,3.686,0.97,us,usb000qyej,2014-05-22T02:17:00.071Z,"29km NW of Piru, Indonesia",earthquake
2014-05-21T17:58:43.760Z,37.1279,-97.6415,8.53,2.7,mb_lg,,39,0.097,0.67,us,usb000qyd1,2014-05-22T02:01:10.722Z,"11km NNW of Caldwell, Kansas",earthquake
2014-05-21T17:30:06.600Z,18.8885,-64.5375,9,2.7,Md,5,316.8,0.47520879,0.07,pr,pr14141006,2014-05-22T01:32:34.776Z,"52km N of Road Town, British Virgin Islands",earthquake
2014-05-21T16:25:11.500Z,20.1438,-155.8133,25.3,2.5,Ml,,136.8,0.03593261,0.14,hv,hv60698126,2014-05-21T20:55:01.000Z,"10km S of Kapaau, Hawaii",earthquake
2014-05-21T16:21:54.050Z,18.2013,88.0192,44.3,5.9,mww,,38,7.948,0.62,us,usb000qy82,2014-05-23T13:40:03.989Z,"274km SE of Konarka, India",earthquake
2014-05-21T15:09:06.540Z,13.9307,-92.1238,50.35,4.8,mb,,156,0.719,1.03,us,usb000qy4p,2014-05-21T23:11:45.925Z,"46km SSW of Champerico, Guatemala",earthquake
2014-05-21T14:55:30.130Z,40.3008333,-124.5136667,20.62,2.94,md,30,232,0.1767,0.12,nc,nc72225101,2014-05-22T07:59:07.101Z,"37km SW of Ferndale, California",earthquake
2014-05-21T14:47:57.880Z,36.674,70.7588,67.59,4.6,mb,,69,0.473,0.67,us,usb000qy3c,2014-05-21T22:50:30.504Z,"22km SSW of Jarm, Afghanistan",earthquake
2014-05-21T14:03:17.700Z,18.9377,-64.364,43.47,2.9,md,,330,0.577,0.32,us,usb000qymz,2014-05-21T22:06:39.130Z,"63km NNE of Road Town, British Virgin Islands",earthquake
2014-05-21T13:32:32.800Z,-15.4035,-173.7676,62.49,4.7,mb,,79,2.432,0.34,us,usb000qy1b,2014-05-21T21:35:00.184Z,"60km N of Hihifo, Tonga",earthquake
2014-05-21T13:25:20.480Z,29.5364,50.8372,10,4.4,mb,,71,6.612,0.38,us,usb000qy04,2014-05-21T21:27:49.597Z,"31km E of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T12:49:54.500Z,35.5941,-97.3831,5.832,2.5,ml,,51,,0.43,us,usb000qy1t,2014-05-22T12:16:32.961Z,"7km N of Spencer, Oklahoma",earthquake
2014-05-21T10:51:27.870Z,29.6719,50.8345,10,5,mb,,61,6.705,0.8,us,usb000qxxr,2014-05-21T11:34:22.948Z,"32km ENE of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T10:29:47.900Z,29.4599,50.8924,10,4.5,mb,,60,6.525,0.71,us,usb000qxxc,2014-05-21T18:32:36.869Z,"38km NW of Borazjan, Iran",earthquake
2014-05-21T10:06:14.990Z,17.1865,-94.9135,127.51,5.6,mwp,,79,2.808,1.16,us,usb000qxx2,2014-05-24T19:53:56.366Z,"16km ENE of Palomares, Mexico",earthquake
2014-05-21T09:46:28.140Z,29.5,50.8799,10,5.2,mb,,42,6.56,0.81,us,usb000qxww,2014-05-21T12:48:19.000Z,"36km ESE of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T09:00:55.130Z,-30.4516,-71.3157,49.83,5.3,mb,,129,0.526,0.85,us,usb000qxwk,2014-05-21T17:38:14.000Z,"19km NW of Ovalle, Chile",earthquake
2014-05-21T08:21:56.890Z,-8.8151,125.235,28.06,4.8,mb,,45,1.336,1.22,us,usb000qxw1,2014-05-21T11:11:41.178Z,"35km WNW of Ainaro, East Timor",earthquake
2014-05-21T07:38:14.000Z,19.0967,-64.8271,10,2.8,Md,7,273.6,0.7051775,0.11,pr,pr14141002,2014-05-21T15:40:42.035Z,"78km NNW of Road Town, British Virgin Islands",earthquake
2014-05-21T05:00:47.500Z,19.6075,-67.6873,36,3.1,Md,8,316.8,1.2576414,0.23,pr,pr14141001,2014-05-21T13:03:21.007Z,"136km NNE of Punta Cana, Dominican Republic",earthquake
2014-05-21T04:57:47.700Z,19.3933,-155.2728,2.3,2.5,Ml,,39.6,0,0.26,hv,hv60697896,2014-05-21T13:00:29.756Z,"5km SW of Volcano, Hawaii",earthquake
2014-05-21T04:01:17.400Z,19.1493,-156.1947,22.5,2.6,Ml,,270,0.3233935,0.06,hv,hv60697866,2014-05-21T17:47:22.996Z,"46km WNW of Hawaiian Ocean View, Hawaii",earthquake
2014-05-21T03:54:46.390Z,40.3536667,-125.2483333,3.45,2.75,md,23,300,0.706,0.3,nc,nc72224881,2014-05-22T09:10:09.946Z,"87km WSW of Ferndale, California",earthquake
2014-05-21T01:58:48.130Z,19.4705,-70.6703,26.7,3.3,ml,,112,0.069,1.32,us,usb000qxv9,2014-05-21T06:42:37.264Z,"3km NE of Santiago de los Caballeros, Dominican Republic",earthquake
2014-05-21T01:48:46.000Z,58.0839,-152.8139,66.4,3.4,ml,,,,0.56,ak,ak11267570,2014-05-21T09:51:19.349Z,"37km NNW of Kodiak Station, Alaska",earthquake
2014-05-21T01:28:25.620Z,-57.8441,-25.9645,105.36,5.1,mb,,48,6.886,0.77,us,usb000qxqm,2014-05-21T09:30:52.695Z,"136km NNE of Bristol Island, South Sandwich Islands",earthquake
2014-05-21T00:40:26.220Z,-7.7614,104.6756,51.4,4.5,mb,,113,3.118,0.59,us,usb000qxp9,2014-05-21T08:42:56.403Z,"148km SW of Tugu Hilir, Indonesia",earthquake
2014-05-21T00:21:13.290Z,23.7323,121.471,11.69,5.6,mb,,22,0.374,1.26,us,usb000qxnd,2014-05-22T08:22:19.943Z,"30km SSW of Hualian, Taiwan",earthquake
2014-05-21T00:09:22.700Z,18.8878,-64.4449,39,3.3,Md,8,302.4,0.49587004,0.31,pr,pr14141000,2014-05-21T01:43:34.371Z,"55km NNE of Road Town, British Virgin Islands",earthquake
2014-05-20T23:59:58.700Z,18.9584,-64.5391,38,2.7,Md,5,331.2,0.71955054,0.05,pr,pr14140010,2014-05-21T08:02:28.050Z,"60km N of Road Town, British Virgin Islands",earthquake
2014-05-20T23:30:46.550Z,39.5224,24.1875,17.18,4.4,mb,,46,1.429,0.97,us,usb000qxle,2014-05-21T04:45:19.604Z,"49km NNE of Patitirion, Greece",earthquake
2014-05-20T23:25:02.660Z,-56.867,-24.8899,41.89,4.6,mb,,79,7.066,0.6,us,usb000qxm0,2014-05-21T07:27:39.160Z,"142km E of Visokoi Island, ",earthquake
2014-05-20T21:57:47.000Z,63.3716,-149.0106,97.2,3,ml,,,,0.62,ak,ak11267442,2014-05-21T06:00:23.312Z,"3km SW of Cantwell, Alaska",earthquake
2014-05-20T21:43:14.000Z,60.2706,-151.8511,55.7,2.7,ml,,,,0.63,ak,ak11267433,2014-05-21T05:46:16.819Z,"32km WSW of Cohoe, Alaska",earthquake
2014-05-20T21:19:07.730Z,17.6225,-94.3974,167.13,4.8,mb,,152,2.541,1.11,us,usb000qxe7,2014-05-21T11:02:11.186Z,"30km SE of Hidalgotitlan, Mexico",earthquake
2014-05-20T21:11:16.390Z,-17.8122,-69.3731,152,4.5,mb,,69,0.535,1.13,us,usb000qxe5,2014-05-21T05:13:55.873Z,"47km NNE of Putre, Chile",earthquake
2014-05-20T21:10:07.100Z,35.4931,-97.2362,7.42,2.6,ml,,71,,0.55,us,usb000qxgq,2014-05-21T02:34:06.401Z,"3km E of Choctaw, Oklahoma",earthquake
2014-05-20T21:07:08.940Z,19.0543,-69.6393,80.99,3.9,ml,,81,0.36,0.72,us,usb000qxcr,2014-05-21T06:21:59.665Z,"16km NE of Gonzalo, Dominican Republic",earthquake
2014-05-20T20:16:15.700Z,-19.1832,-177.4709,575.46,4.6,mb,,88,4.482,0.78,us,usb000qx8p,2014-05-21T15:14:06.902Z,"207km NE of Ndoi Island, Fiji",earthquake
2014-05-20T20:05:08.930Z,-68.7324,170.6679,15.7,5,mb,,43,9.177,0.82,us,usb000qx7z,2014-05-21T14:40:54.291Z,"Balleny Islands region",earthquake
2014-05-20T17:29:41.000Z,60.0743,-152.6402,99.8,2.9,ml,,,,0.67,ak,ak11267355,2014-05-21T13:55:55.000Z,"46km SSE of Redoubt Volcano, Alaska",earthquake
2014-05-20T17:16:30.900Z,19.1998,-66.8133,17,2.8,Md,13,234,0.76716125,0.28,pr,pr14140008,2014-05-21T13:27:40.000Z,"78km N of Hatillo, Puerto Rico",earthquake
2014-05-20T15:48:33.900Z,-57.143,-25.5071,53.4,5,mb,,115,6.833,0.74,us,usb000qwmp,2014-05-20T23:51:00.880Z,"114km ESE of Visokoi Island, ",earthquake
2014-05-20T15:05:25.860Z,-4.2728,122.848,13.49,4.5,mb,,55,3.172,0.85,us,usb000qwkd,2014-05-20T23:08:02.271Z,"53km SE of Kendari, Indonesia",earthquake
2014-05-20T13:59:28.200Z,35.4984,-97.2409,6.884,3.1,ml,,70,,0.64,us,usb000qwfv,2014-05-20T22:18:57.642Z,"2km E of Choctaw, Oklahoma",earthquake
2014-05-20T13:24:37.800Z,19.1669,-66.7703,40,2.8,Md,12,255.6,0.7231438,0.23,pr,pr14140005,2014-05-20T21:27:08.251Z,"75km N of Hatillo, Puerto Rico",earthquake
2014-05-20T13:15:34.400Z,19.0639,-66.7553,15,3.2,Md,21,216,0.62073586,0.43,pr,pr14140004,2014-05-20T21:18:07.128Z,"64km N of Hatillo, Puerto Rico",earthquake
2014-05-20T12:54:46.500Z,18.7991,-64.2505,20,2.8,Md,12,320.4,0.51383634,0.2,pr,pr14140003,2014-05-20T20:57:22.105Z,"57km NE of Road Town, British Virgin Islands",earthquake
2014-05-20T10:32:19.200Z,19.1576,-66.8356,28,2.9,Md,14,277.2,0.73302527,0.34,pr,pr14140001,2014-05-20T18:34:52.600Z,"74km N of Hatillo, Puerto Rico",earthquake
2014-05-20T07:59:47.000Z,63.1923,-150.3887,100,2.9,ml,,,,0.92,ak,ak11267040,2014-05-20T16:02:47.768Z,"75km WSW of Cantwell, Alaska",earthquake
2014-05-20T07:39:34.560Z,-20.1896,-177.6313,511.44,4.4,mb,,96,4.753,0.81,us,usb000qw4w,2014-05-20T15:42:01.870Z,"122km ENE of Ndoi Island, Fiji",earthquake
2014-05-20T07:30:19.580Z,35.5261,-97.2197,8.15,3.6,mb_lg,,32,0.11,0.43,us,usb000qw49,2014-05-21T05:24:25.111Z,"5km NE of Choctaw, Oklahoma",earthquake
2014-05-20T05:42:38.600Z,35.4815,-97.2476,7.552,3.3,ml,,107,,0.7,us,usb000qwiq,2014-05-21T16:26:22.315Z,"2km SE of Choctaw, Oklahoma",earthquake
2014-05-20T05:39:49.200Z,35.4842,-97.2451,7.595,2.7,ml,,106,,0.57,us,usb000qw2d,2014-05-21T06:03:20.376Z,"2km SE of Choctaw, Oklahoma",earthquake
2014-05-20T04:43:26.740Z,40.9129,19.8857,10,4.5,mb,,62,0.434,0.82,us,usb000qw19,2014-05-20T05:01:15.030Z,"12km NNW of Kucove, Albania",earthquake
2014-05-20T03:58:32.310Z,35.4727,-97.2715,7.03,3,mb_lg,,41,0.121,0.49,us,usb000qw05,2014-05-21T06:02:55.117Z,"2km S of Choctaw, Oklahoma",earthquake
2014-05-20T02:30:07.000Z,67.7078,-162.391,4,3.1,ml,,,,0.73,ak,ak11266747,2014-05-20T10:32:38.882Z,"28km ENE of Noatak, Alaska",earthquake
2014-05-20T02:20:47.000Z,60.7278,-149.4964,18.9,2.5,ml,,,,0.77,ak,ak11266736,2014-05-20T10:23:21.101Z,"44km W of Whittier, Alaska",earthquake
2014-05-20T02:00:30.000Z,59.9031,-152.968,100,2.5,ml,,,,1.06,ak,ak11266725,2014-05-20T10:03:01.602Z,"65km WNW of Anchor Point, Alaska",earthquake
2014-05-20T01:39:14.490Z,18.1568,-99.9519,62.74,4.9,mb,,126,1.378,1.01,us,usb000qvxw,2014-05-21T01:01:23.262Z,"9km W of Apaxtla de Castrejon, Mexico",earthquake
2014-05-19T22:47:21.120Z,-57.085,-25.3856,62.81,5.4,mb,,69,6.876,1.37,us,usb000qvt4,2014-05-20T21:40:26.000Z,"118km ESE of Visokoi Island, ",earthquake
2014-05-19T22:41:10.740Z,34.1605,-116.4348333,11.78,2.79,ml,86,20,0.04346,0.12,ci,ci15503417,2014-05-20T18:00:50.776Z,"5km N of Yucca Valley, California",earthquake
2014-05-19T21:50:28.900Z,17.5643,-67.9606,68,3.2,Md,8,309.6,0.92167148,0.2,pr,pr14139008,2014-05-20T05:53:05.055Z,"93km WSW of Pole Ojea, Puerto Rico",earthquake
2014-05-19T20:33:47.500Z,19.4135,-155.3153,5.1,2.5,Ml,,79.2,0.01796631,0.09,hv,hv60697006,2014-05-21T22:40:11.000Z,"8km WSW of Volcano, Hawaii",earthquake
2014-05-19T20:08:51.620Z,34.2533333,-116.8248333,7.53,3.84,ml,112,18,0.04125,0.15,ci,ci15503377,2014-05-21T22:58:40.000Z,"2km ESE of Big Bear City, California",earthquake
2014-05-19T20:01:15.000Z,63.3536,-145.0138,2.2,3.2,ml,,,,0.96,ak,ak11266575,2014-05-24T00:17:42.940Z,"58km S of Deltana, Alaska",earthquake
2014-05-19T19:33:05.610Z,12.7759,-89.5982,63.54,4.6,mb,,206,0.973,0.36,us,usb000qvc1,2014-05-21T23:24:38.243Z,"84km SSW of La Libertad, El Salvador",earthquake
2014-05-19T19:27:22.420Z,15.3598,-91.3355,22.06,4.7,mb,,74,0.167,0.99,us,usb000qvbi,2014-05-22T15:27:13.531Z,"3km NW of Aguacatan, Guatemala",earthquake
2014-05-19T18:50:54.680Z,52.803,159.4736,72.5,4.6,mb,,161,0.545,0.79,us,usb000qv82,2014-05-22T15:48:08.144Z,"61km ESE of Petropavlovsk-Kamchatskiy, Russia",earthquake
2014-05-19T18:21:04.470Z,-49.4572,126.0391,10,4.8,mb,,127,16.1,1.61,us,usb000qv5e,2014-05-22T15:59:32.395Z,"Western Indian-Antarctic Ridge",earthquake
2014-05-19T18:20:53.000Z,60.2515,-150.7875,58.6,2.7,ml,,,,0.71,ak,ak11266564,2014-05-24T00:18:12.121Z,"30km SSE of Soldotna, Alaska",earthquake
2014-05-19T18:07:30.500Z,35.774,-97.487,7.6,2.5,ml,,,,0.26,us,usb000qvlt,2014-05-22T18:52:12.227Z,"12km SSW of Guthrie, Oklahoma",earthquake
2014-05-19T16:58:31.000Z,19.1837,-66.4172,8,2.8,Md,9,295.2,0.70966907,0.2,pr,pr14139005,2014-05-20T01:01:01.906Z,"79km N of Brenas, Puerto Rico",earthquake
2014-05-19T15:50:32.100Z,19.3878,-155.2787,2.8,2.7,Ml,,43.2,0,0.23,hv,hv60696836,2014-05-19T23:54:59.471Z,"6km SW of Volcano, Hawaii",earthquake
2014-05-19T15:26:52.000Z,51.334,-172.1642,25.3,2.6,ml,,,,0.43,ak,ak11266416,2014-05-24T00:15:57.166Z,"Andreanof Islands, Aleutian Islands, Alaska",earthquake
2014-05-19T15:26:22.000Z,53.9488,-164.7404,46.4,2.7,ml,,,,0.38,ak,ak11266414,2014-05-24T00:15:07.755Z,"Unimak Island region, Alaska",earthquake
2014-05-19T14:16:47.520Z,-35.3854,-175.5756,10,4.6,mb,,167,8.338,0.69,us,usb000qupk,2014-05-19T22:19:20.729Z,"East of the North Island of New Zealand",earthquake
2014-05-19T13:53:11.000Z,52.1779,-172.8898,74.8,3.6,ml,,,,0.64,ak,ak11266404,2014-05-24T00:17:19.542Z,"89km E of Atka, Alaska",earthquake
2014-05-19T13:12:15.190Z,30.042,140.3414,137.13,4.7,mb,,98,3.096,0.62,us,usb000qumd,2014-05-19T21:14:53.159Z,"Izu Islands, Japan region",earthquake
2014-05-19T12:02:30.390Z,41.0504,142.0779,74.74,4.5,mb,,137,1.259,0.54,us,usb000qula,2014-05-19T21:18:57.829Z,"72km NE of Misawa, Japan",earthquake
2014-05-19T10:05:27.600Z,18.2443,-67.9937,96,3.3,Md,8,198,0.45544585,0.5,pr,pr14139002,2014-05-19T18:07:57.065Z,"57km SE of Punta Cana, Dominican Republic",earthquake
2014-05-19T10:05:27.400Z,18.236,-68.0008,98,3.4,Md,8,201.6,0.45364922,0.52,pr,pr14139004,2014-05-19T18:08:00.713Z,"57km SE of Punta Cana, Dominican Republic",earthquake
2014-05-19T09:29:47.300Z,-32.0422,57.0823,10,4.7,mb,,61,15.712,0.81,us,usb000quh2,2014-05-19T17:32:14.515Z,"Southwest Indian Ridge",earthquake
2014-05-19T09:28:44.000Z,63.4532,-152.7059,16.3,2.6,ml,,,,0.74,ak,ak11266263,2014-05-24T00:18:57.601Z,"155km ENE of McGrath, Alaska",earthquake
2014-05-19T08:53:12.480Z,-21.1469,-178.4064,455.48,4.3,mb,,103,4.755,1.26,us,usb000qug1,2014-05-19T16:55:39.208Z,"62km SSE of Ndoi Island, Fiji",earthquake
2014-05-19T06:29:08.620Z,36.137,-97.1345,4.26,3,ml,,55,0.427,0.95,us,usb000qud6,2014-05-21T05:12:26.360Z,"7km WNW of Stillwater, Oklahoma",earthquake
2014-05-19T05:28:48.880Z,26.4569,142.3864,34.17,4.7,mb,,102,7.001,0.6,us,usb000quch,2014-05-19T13:31:27.214Z,"71km SSE of Chichi-shima, Japan",earthquake
2014-05-19T05:06:02.000Z,19.4701,-65.3677,74,3,Md,4,316.8,1.15882672,0.21,pr,pr14139001,2014-05-19T13:08:42.669Z,"125km NNE of Vieques, Puerto Rico",earthquake
2014-05-19T04:16:03.840Z,36.1213,-97.4487,3.78,3.1,mb_lg,,67,0.324,0.32,us,usb000quau,2014-05-19T18:58:06.373Z,"22km NE of Crescent, Oklahoma",earthquake
2014-05-19T03:56:47.530Z,-57.0825,-25.0162,35,5,mb,,69,7.065,1.07,us,usb000quai,2014-05-19T13:56:36.000Z,"139km ESE of Visokoi Island, ",earthquake
2014-05-19T03:51:05.890Z,-19.2711,-177.6298,557.16,4.4,mb,,129,4.368,1.05,us,usb000quad,2014-05-19T11:53:40.238Z,"189km NE of Ndoi Island, Fiji",earthquake
2014-05-19T02:43:26.410Z,-5.5361,146.4665,126.73,4.7,mb,,68,3.904,1.02,us,usb000qu9b,2014-05-19T10:46:04.073Z,"81km ESE of Madang, Papua New Guinea",earthquake
2014-05-19T02:39:21.700Z,32.9404,-100.8942,5,2.7,mb_lg,,97,1.1,0.64,us,usb000qu93,2014-05-19T10:41:52.959Z,"24km N of Snyder, Texas",earthquake
2014-05-19T01:53:56.990Z,-4.6699,-105.4588,10,5.2,ms_20,,149,15.665,0.73,us,usb000qu81,2014-05-19T13:56:34.000Z,"Central East Pacific Rise",earthquake
2014-05-19T01:37:23.380Z,36.1014,-97.0333,1.03,3,mb_lg,,45,0.438,0.53,us,usb000qu7c,2014-05-20T02:53:06.533Z,"2km SE of Stillwater, Oklahoma",earthquake
2014-05-19T01:08:41.700Z,17.9757,-65.4048,13,2.5,Md,9,158.4,0.18505295,0.2,pr,pr14139000,2014-05-19T09:11:17.082Z,"15km SSE of Esperanza, Puerto Rico",earthquake
2014-05-19T00:59:19.980Z,40.9774,19.8788,10,5.1,mb,,33,0.369,1,us,usb000qu5r,2014-05-20T02:52:43.228Z,"10km SW of Cerrik, Albania",earthquake
2014-05-18T23:47:04.600Z,-4.385,-105.8958,10,5.3,mb,,106,16.022,0.84,us,usb000qu45,2014-05-20T23:09:41.000Z,"Central East Pacific Rise",earthquake
2014-05-18T21:16:45.610Z,-19.1194,169.6317,271.23,4.9,mb,,88,4.188,0.84,us,usb000qty5,2014-05-19T05:19:17.085Z,"61km NE of Isangel, Vanuatu",earthquake
2014-05-18T19:09:14.150Z,-17.6915,-174.8876,265.23,4.7,mb,,98,4.806,0.86,us,usb000qtt2,2014-05-19T03:11:53.647Z,"142km NW of Neiafu, Tonga",earthquake
2014-05-18T18:53:47.570Z,36.5811,-97.815,3.44,3,mb_lg,,81,0.835,0.79,us,usb000qts5,2014-05-19T18:54:34.572Z,"21km NNE of Enid, Oklahoma",earthquake
2014-05-18T16:46:38.000Z,67.71,-162.3479,22.4,2.8,ml,,,,0.98,ak,ak11265635,2014-05-19T03:48:44.573Z,"30km ENE of Noatak, Alaska",earthquake
2014-05-18T15:57:03.000Z,60.8224,-151.6884,73.1,3.2,ml,,,,0.87,ak,ak11265561,2014-05-18T23:59:37.589Z,"26km NW of Nikiski, Alaska",earthquake
2014-05-18T15:22:12.960Z,-18.2831,-178.2533,634.25,4.9,mb,,39,3.555,0.67,us,usb000qtji,2014-05-18T23:25:28.203Z,"266km N of Ndoi Island, Fiji",earthquake
2014-05-18T14:31:20.000Z,51.9618,-171.5207,27.8,2.9,ml,,,,0.5,ak,ak11265539,2014-05-18T22:34:02.104Z,"61km SSW of Amukta Island, Alaska",earthquake
2014-05-18T13:59:36.000Z,36.0925,-97.068,4.371,2.5,ml,,71,,0.44,us,usb000qti1,2014-05-20T02:52:20.065Z,"2km SSW of Stillwater, Oklahoma",earthquake
2014-05-18T13:09:18.100Z,18.4353,-66.3097,125,3,Md,16,169.2,0.21290072,0.2,pr,pr14138003,2014-05-18T21:11:51.717Z,"1km SSW of San Antonio, Puerto Rico",earthquake
2014-05-18T12:08:06.800Z,34.9249,26.0714,10,4.3,mb,,144,1.034,1.1,us,usb000qtfv,2014-05-20T02:51:59.491Z,"16km SE of Makry Gialos, Greece",earthquake
2014-05-18T12:00:29.500Z,13.6955,-92.0638,35,4.2,mb,,192,0.895,1.3,us,usb000qtfl,2014-05-18T20:03:09.819Z,"68km SSW of Champerico, Guatemala",earthquake
2014-05-18T11:57:53.140Z,-57.0358,-24.9233,48.93,4.7,mb,,115,7.099,0.89,us,usb000qtfn,2014-05-18T20:00:24.907Z,"143km ESE of Visokoi Island, ",earthquake
2014-05-18T10:59:21.840Z,3.1118,93.7744,10,5.1,mb,,130,3.799,1.24,us,usb000qteu,2014-05-18T19:01:58.438Z,"285km WSW of Meulaboh, Indonesia",earthquake
2014-05-18T08:50:47.900Z,19.0428,-67.1958,12,2.8,Md,7,302.4,0.57761673,0.05,pr,pr14138001,2014-05-18T16:53:18.734Z,"61km N of San Antonio, Puerto Rico",earthquake
2014-05-18T08:29:26.020Z,35.8416,-96.9292,3.64,3,mb_lg,,56,0.299,0.45,us,usb000qtc7,2014-05-20T02:51:36.678Z,"16km NNW of Chandler, Oklahoma",earthquake
2014-05-18T07:48:16.000Z,55.2714,-163.2957,86.8,3,ml,,,,0.91,ak,ak11265355,2014-05-18T17:40:36.203Z,"37km WNW of Cold Bay, Alaska",earthquake
2014-05-18T06:38:48.980Z,-14.7235,-176.1437,78.63,4.9,mb,,78,6.332,0.65,us,usb000qt9y,2014-05-18T17:56:33.000Z,"159km S of Mata-Utu, Wallis and Futuna",earthquake
2014-05-18T06:29:51.500Z,18.6895,-66.8884,24,2.9,Md,14,234,0.3054272,0.18,pr,pr14138000,2014-05-18T14:32:49.259Z,"23km NNW of Hatillo, Puerto Rico",earthquake
2014-05-18T04:47:09.810Z,32.9253,-100.8292,5,2.5,mb_lg,,94,1.043,0.76,us,usb000qt87,2014-05-18T12:49:41.938Z,"24km NNE of Snyder, Texas",earthquake
2014-05-18T04:35:39.000Z,51.8092,-173.4377,15.8,2.5,ml,,,,0.57,ak,ak11265270,2014-05-18T12:38:50.952Z,"67km SE of Atka, Alaska",earthquake
2014-05-18T04:19:21.160Z,-21.3071,169.7352,89.33,5.3,mb,,50,3.154,0.8,us,usb000qt7u,2014-05-18T16:56:36.000Z,"193km E of Tadine, New Caledonia",earthquake
2014-05-18T04:04:56.270Z,-18.7257,-177.7427,425.25,4.4,mb,,79,4.113,0.75,us,usb000qt7n,2014-05-18T12:07:28.734Z,"235km NNE of Ndoi Island, Fiji",earthquake
2014-05-18T03:56:34.490Z,24.4223,141.7353,113.15,4.7,mb,,99,8.823,0.95,us,usb000qt7b,2014-05-18T11:59:06.727Z,"57km SE of Iwo Jima, Japan",earthquake
2014-05-18T03:27:39.600Z,51.218,178.7704,66.81,4.3,mb,,90,2.914,1.21,us,usb000qt6z,2014-05-18T11:30:20.341Z,"83km SSE of Little Sitkin Island, Alaska",earthquake
2014-05-18T03:24:49.100Z,36.1187,-97.2501,5,2.5,mb_lg,,43,0.361,0.61,us,usb000qt6n,2014-05-20T02:51:14.105Z,"17km W of Stillwater, Oklahoma",earthquake
2014-05-18T02:46:10.380Z,-14.9248,-174.847,10,4.7,mb,,173,3.14,1.33,us,usb000qt6i,2014-05-18T10:48:47.161Z,"163km NW of Hihifo, Tonga",earthquake'
]

{ #category : #examples }
RTMapLocationBuilder >> seismData2 [

"Cut and pasted from 
http://earthquake.usgs.gov/earthquakes/feed/v0.1/
http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/2.5_month.csv"
^ 'DateTime,Latitude,Longitude,Depth,Magnitude,MagType,NbStations,Gap,Distance,RMS,Source,EventID,Version
2014-07-30T23:48:03.510+00:00,35.732,-97.434,6.8,2.9,mb_lg,,72,0.1,0.48,us,usb000ryqu,1406765119414
2014-07-30T23:33:43.300+00:00,18.611,-64.695,105.0,2.7,Md,7,263,0.2,0.10,pr,pr14211009,1406764860120
2014-07-30T23:09:25.000+00:00,62.659,-148.758,47.2,3.3,ml,,,,0.58,ak,ak11344402,1406764735837
2014-07-30T21:36:51.550+00:00,52.287,-170.775,49.8,4.7,mb,,136,1.4,1.04,us,usb000rypl,1406763825908
2014-07-30T21:09:24.500+00:00,49.381,-120.541,,2.5,Ml,,220,0.6,0.07,uw,uw60830347,1406757687137
2014-07-30T20:01:53.000+00:00,51.683,178.552,93.8,2.5,ml,,,,0.39,ak,ak11344225,1406764771302
2014-07-30T19:23:03.630+00:00,33.881,-118.496,11.2,2.9,ml,76,79,0.1,0.20,ci,ci15532889,1406764888905
2014-07-30T18:11:40.000+00:00,67.614,-162.134,20.0,3.2,ml,,,,1.09,ak,ak11344202,1406764754629
2014-07-30T17:40:38.500+00:00,18.991,-64.066,26.0,3.4,Md,12,320,0.8,0.30,pr,pr14211008,1406747118116
2014-07-30T16:46:59.240+00:00,35.742,-97.425,5.0,3.3,mb_lg,,40,0.1,0.42,us,usb000rylj,1406756514803
2014-07-30T16:21:32.320+00:00,35.731,-97.402,4.9,3.4,mb_lg,,19,0.1,0.56,us,usb000ryl6,1406760603022
2014-07-30T16:00:58.730+00:00,-7.185,154.842,10.0,5.7,mwb,,31,4.0,0.95,us,usb000rykv,1406765015322
2014-07-30T15:44:20.000+00:00,51.879,178.367,126.9,2.5,ml,,,,0.62,ak,ak11344013,1406764021744
2014-07-30T15:20:27.000+00:00,67.619,-161.925,20.0,3.3,ml,,,,1.58,ak,ak11344007,1406762575468
2014-07-30T15:15:27.000+00:00,67.584,-161.935,18.0,3.4,ml,,,,1.07,ak,ak11344001,1406762280775
2014-07-30T14:46:43.390+00:00,39.581,-123.454,6.2,2.6,md,22,113,0.1,0.04,nc,nc72268016,1406764863213
2014-07-30T14:12:45.000+00:00,67.614,-161.871,20.0,2.8,ml,,,,1.05,ak,ak11343956,1406758916975
2014-07-30T12:57:47.820+00:00,36.296,-118.351,1.5,2.7,ml,30,143,0.1,0.23,ci,ci15532777,1406759919454
2014-07-30T12:39:58.000+00:00,63.226,-150.497,119.5,3.0,ml,,,,0.39,ak,ak11343886,1406753124158
2014-07-30T12:25:05.760+00:00,-18.795,169.307,232.5,4.6,mb,,76,4.2,0.71,us,usb000ryjq,1406752056298
2014-07-30T12:16:40.000+00:00,67.642,-162.007,24.4,3.4,ml,,,,1.21,ak,ak11343879,1406753104138
2014-07-30T12:01:10.700+00:00,19.086,-64.493,76.0,3.1,Md,4,331,0.8,0.33,pr,pr14211007,1406750624578
2014-07-30T09:15:18.080+00:00,-17.654,-174.827,177.7,4.3,mb,,96,4.7,0.61,us,usb000ryj6,1406740677774
2014-07-30T08:54:30.280+00:00,33.698,-116.734,19.7,2.9,ml,112,16,0.0,0.18,ci,ci15532705,1406757055490
2014-07-30T08:34:27.400+00:00,18.921,-68.046,70.0,2.9,Md,15,241,0.5,0.56,pr,pr14211005,1406738217484
2014-07-30T08:25:50.800+00:00,18.693,-66.610,31.0,2.6,Md,8,234,0.2,0.33,pr,pr14211004,1406737710069
2014-07-30T07:21:38.230+00:00,32.598,-109.111,5.0,2.8,ml,,82,1.1,1.24,us,usb000ryif,1406715203879
2014-07-30T05:40:30.000+00:00,50.187,178.836,32.4,3.1,ml,,,,0.46,ak,ak11343713,1406744673780
2014-07-30T03:57:21.500+00:00,18.532,-68.980,156.0,3.4,Md,6,342,0.6,0.27,pr,pr14211003,1406721599877
2014-07-30T03:46:51.000+00:00,53.515,-165.344,25.6,2.7,ml,,,,0.28,ak,ak11343746,1406720963539
2014-07-30T03:43:34.700+00:00,51.814,178.359,126.1,4.1,mb,,165,0.7,0.77,us,usb000ryhi,1406720762318
2014-07-30T02:56:27.500+00:00,19.483,-155.884,10.9,2.5,Ml,,104,0.0,0.23,hv,hv60743496,1406717949952
2014-07-30T02:24:26.960+00:00,-19.088,-12.289,9.1,5.5,mb,,36,26.5,0.66,us,usb000ryhe,1406728568000
2014-07-30T01:32:09.330+00:00,26.399,53.550,5.2,5.3,mwb,,35,2.8,0.79,us,usb000ryha,1406729419918
2014-07-29T23:17:53.000+00:00,59.956,-150.207,11.5,2.5,ml,,,,0.81,ak,ak11343221,1406704821889
2014-07-29T22:38:26.180+00:00,32.127,-115.140,26.5,3.2,ml,13,244,0.2,0.38,ci,ci15532569,1406752736641
2014-07-29T22:17:37.000+00:00,59.934,-153.325,137.8,3.4,ml,,,,0.66,ak,ak11342984,1406701204241
2014-07-29T22:08:51.000+00:00,52.324,-173.622,4.8,2.7,ml,,,,0.51,ak,ak11342978,1406700687743
2014-07-29T22:04:44.580+00:00,35.437,-36.405,10.0,5.1,mb,,81,7.3,0.74,us,usb000ryg1,1406737972000
2014-07-29T21:09:03.860+00:00,-56.143,-27.582,108.4,4.8,mb,,69,5.4,0.63,us,usb000ryfg,1406697098779
2014-07-29T20:17:00.000+00:00,51.844,178.528,108.2,2.8,ml,,,,0.48,us,usb000ryh0,1406733003978
2014-07-29T18:04:54.190+00:00,-10.734,161.696,51.0,5.0,mb,,28,2.1,0.99,us,usb000ryd5,1406732596000
2014-07-29T17:19:48.000+00:00,18.752,-66.722,58.0,2.8,Md,19,216,0.3,0.33,pr,pr14210007,1406728975000
2014-07-29T16:50:13.780+00:00,-23.582,-176.529,35.0,5.1,mb,,82,5.8,0.86,us,usb000ryc4,1406681561009
2014-07-29T13:34:53.000+00:00,61.463,-146.480,35.7,3.3,ml,9,104,,0.46,ak,ak11341457,1406660456886
2014-07-29T13:27:40.050+00:00,-3.469,146.678,6.9,5.8,mb,,20,5.5,1.20,us,usb000ry9u,1406744198000
2014-07-29T10:46:35.400+00:00,18.670,-65.101,66.0,3.3,Md,14,212,0.3,0.23,pr,pr14210006,1406659741318
2014-07-29T10:46:15.210+00:00,17.842,-95.524,95.1,6.3,mwp,,46,2.9,1.12,us,usb000ry8m,1406738171610
2014-07-29T08:20:15.320+00:00,31.495,105.196,11.7,4.7,mb,,41,3.9,1.02,us,usb000ry8h,1406707803484
2014-07-29T07:39:52.650+00:00,36.739,-98.034,5.0,2.7,mb_lg,,82,0.2,0.42,us,usb000ry86,1406699940578
2014-07-29T07:16:41.190+00:00,-10.235,87.703,10.0,5.1,mb,,74,9.2,1.12,us,usb000ry7w,1406647210044
2014-07-29T07:07:07.330+00:00,14.410,93.073,10.0,5.5,mb,,44,2.8,1.50,us,usb000ry7u,1406647820000
2014-07-29T03:33:01.430+00:00,14.806,-92.417,82.5,5.4,mb,,124,0.8,1.31,us,usb000ry71,1406670562025
2014-07-29T02:46:36.100+00:00,36.732,-97.987,7.6,4.3,mwr,,80,0.2,0.73,us,usb000ry6y,1406761094128
2014-07-29T02:39:51.300+00:00,18.951,-64.400,33.0,3.0,Md,4,335,0.8,0.31,pr,pr14210003,1406630542175
2014-07-29T01:31:25.100+00:00,19.112,-64.614,62.0,3.0,Md,4,328,0.8,0.27,pr,pr14210002,1406626435037
2014-07-29T01:22:05.010+00:00,-23.577,-63.735,543.6,4.4,mb,,45,4.9,0.84,us,usb000ry6q,1406625884479
2014-07-29T01:20:03.700+00:00,19.443,-68.093,47.0,3.6,Md,10,331,1.3,0.18,pr,pr14210000,1406625759528
2014-07-29T00:47:17.610+00:00,-20.116,-70.487,24.6,4.7,mb,,137,0.5,1.39,us,usb000ry6b,1406648106000
2014-07-29T00:41:35.460+00:00,-11.412,-77.727,50.6,4.0,mb,,187,10.1,0.67,us,usb000ry6f,1406646899464
2014-07-28T23:50:57.700+00:00,-6.885,143.940,10.0,4.8,mb,,56,4.1,0.83,us,usb000ry65,1406620406285
2014-07-28T23:00:48.530+00:00,-6.905,143.846,10.0,5.8,mb,,16,4.1,0.95,us,usb000ry5u,1406658095000
2014-07-28T22:47:30.910+00:00,-6.823,143.880,10.0,4.9,mb,,100,4.1,0.73,us,usb000ry5n,1406616603604
2014-07-28T22:26:51.360+00:00,36.732,-98.394,5.0,3.0,mb_lg,,97,0.4,0.61,us,usb000ry5e,1406681663535
2014-07-28T20:01:14.800+00:00,40.590,-124.090,18.3,3.3,Ml,25,130,0.2,0.09,nc,nc72266491,1406760425042
2014-07-28T17:46:58.000+00:00,53.894,-163.986,52.4,2.5,ml,,,,0.30,ak,ak11340160,1406598620348
2014-07-28T15:53:44.800+00:00,18.786,-63.925,15.0,2.8,Md,3,356,1.1,0.23,pr,pr14209006,1406591784714
2014-07-28T15:05:54.940+00:00,28.011,127.945,57.4,4.8,mb,,114,5.7,1.16,us,usb000rxz1,1406588916197
2014-07-28T14:14:47.000+00:00,58.347,-136.915,3.4,3.2,ml,,,,0.62,ak,ak11340054,1406585861899
2014-07-28T12:51:29.000+00:00,45.340,-112.608,9.8,3.9,mc,72,34,0.4,0.26,mb,mb30664,1406696297103
2014-07-28T11:04:34.700+00:00,47.458,-122.798,26.6,3.5,Ml,,25,0.1,0.39,uw,uw60828527,1406711202757
2014-07-28T08:05:31.700+00:00,34.741,139.332,20.8,4.5,mb,,114,1.7,0.37,us,usb000rxvv,1406563683103
2014-07-28T08:03:10.760+00:00,-17.326,66.834,10.0,4.9,mb,,66,18.7,1.45,us,usb000rxvu,1406566962000
2014-07-28T06:45:40.120+00:00,32.988,-117.745,10.0,3.3,ml,43,146,0.4,0.16,ci,ci15531937,1406660030568
2014-07-28T05:02:12.000+00:00,51.422,178.833,40.0,3.1,ml,,,,0.55,ak,ak11339842,1406568656255
2014-07-28T04:59:53.000+00:00,62.391,-149.778,46.5,3.0,ml,,,,0.75,ak,ak11339835,1406552539111
2014-07-28T03:38:45.950+00:00,-24.087,-66.945,196.7,4.3,mb,,85,2.3,0.74,us,usb000rxub,1406547681087
2014-07-28T03:36:47.620+00:00,7.596,136.731,10.0,5.4,mb,,74,10.0,0.94,us,usb000rxuc,1406567293000
2014-07-28T03:33:41.400+00:00,18.892,-64.806,37.0,2.7,Md,3,338,0.7,0.18,pr,pr14209000,1406547378073
2014-07-28T00:00:46.960+00:00,26.909,54.200,39.6,4.5,mb,,80,2.7,0.47,us,usb000rxtm,1406534595626
2014-07-27T23:35:06.750+00:00,-10.051,119.898,52.0,4.5,mb,,78,2.7,1.03,us,usb000rxtl,1406533058912
2014-07-27T22:19:22.100+00:00,36.146,-96.838,4.5,3.2,mb_lg,,19,0.6,0.78,us,usb000rxt7,1406611996407
2014-07-27T22:01:24.000+00:00,65.182,-151.736,8.6,2.7,ml,,,,1.05,ak,ak11339724,1406527444558
2014-07-27T22:00:10.000+00:00,51.438,-174.585,3.9,3.2,ml,,,,0.35,ak,ak11339722,1406527371252
2014-07-27T21:34:21.930+00:00,36.079,-117.857,1.5,2.8,ml,35,52,0.0,0.13,ci,ci15531785,1406563604623
2014-07-27T20:39:10.450+00:00,36.806,-97.858,2.7,2.9,mb_lg,,85,0.4,0.36,us,usb000rxsh,1406506856810
2014-07-27T20:34:32.730+00:00,12.875,-70.036,41.7,4.9,mb,,130,0.4,0.41,us,usb000rxsf,1406496899896
2014-07-27T20:11:54.450+00:00,27.614,66.053,33.0,4.4,mb,,134,7.4,0.72,us,usb000rxsd,1406520869892
2014-07-27T18:09:11.300+00:00,35.497,140.598,65.6,4.6,mb,,122,2.2,0.66,us,usb000rxrz,1406519908701
2014-07-27T16:47:17.000+00:00,17.785,-68.222,49.0,2.9,Md,10,266,0.7,0.27,pr,pr14208008,1406490502280
2014-07-27T13:41:09.000+00:00,58.943,-155.821,100.0,3.4,ml,,,,2.48,ak,ak11339397,1406497423938
2014-07-27T13:29:06.380+00:00,16.238,-98.710,35.0,4.7,mb,,178,1.3,0.82,us,usb000rxr5,1406496696142
2014-07-27T13:07:56.000+00:00,58.319,-136.942,10.5,2.5,ml,,,,0.91,ak,ak11339384,1406502943096
2014-07-27T12:52:08.000+00:00,51.337,-174.458,7.6,2.6,ml,,,,0.38,ak,ak11339379,1406502939591
2014-07-27T11:20:54.700+00:00,19.148,-64.342,52.0,3.2,Md,6,320,0.8,0.25,pr,pr14208005,1406489002668
2014-07-27T10:46:39.610+00:00,36.077,-117.858,1.3,2.6,ml,30,52,0.0,0.13,ci,ci15531617,1406557045080
2014-07-27T10:26:59.800+00:00,19.214,-64.360,48.0,3.2,Md,8,306,0.8,0.07,pr,pr14208004,1406485774561
2014-07-27T10:15:31.810+00:00,-2.948,136.459,40.4,4.7,mb,,40,4.2,1.01,us,usb000rxqg,1406485085954
2014-07-27T09:28:06.380+00:00,36.293,-97.475,5.0,2.8,mb_lg,,32,0.2,0.51,us,usb000rxq9,1406506840647
2014-07-27T09:24:17.230+00:00,39.699,142.150,55.8,4.5,mb,,140,2.4,1.30,us,usb000rxqa,1406482042064
2014-07-27T08:50:11.100+00:00,19.303,-155.388,2.9,2.5,Ml,,94,0.0,0.27,hv,hv60741681,1406479992238
2014-07-27T06:56:12.600+00:00,17.870,-66.902,124.0,3.1,Md,5,274,0.2,0.18,pr,pr14208003,1406473128516
2014-07-27T05:00:17.000+00:00,54.190,-162.555,22.7,2.5,ml,,,,0.68,ak,ak11339180,1406500364070
2014-07-27T04:46:40.000+00:00,51.725,178.502,96.5,2.5,ml,,,,0.32,ak,ak11339158,1406500367477
2014-07-27T04:02:11.880+00:00,-24.766,-177.376,166.9,5.1,mb,,97,4.5,0.95,us,usb000rxp3,1406462681647
2014-07-27T03:40:59.790+00:00,40.192,143.095,47.6,4.2,mb,,170,1.8,0.69,us,usb000rxp1,1406461416601
2014-07-27T03:38:45.000+00:00,51.840,178.430,113.6,3.5,ml,,,,0.34,ak,ak11339107,1406500361104
2014-07-27T02:20:41.190+00:00,37.489,72.088,190.9,4.1,mb,,130,1.3,0.49,us,usb000rxnr,1406456601357
2014-07-27T02:11:55.660+00:00,-4.463,152.033,10.0,4.4,mb,,133,0.3,1.10,us,usb000rxns,1406456067053
2014-07-27T02:10:21.300+00:00,18.922,-64.635,4.0,2.6,Md,7,295,0.5,0.27,pr,pr14208001,1406455970688
2014-07-27T01:28:38.050+00:00,23.761,-45.646,10.0,6.0,mwb,,60,16.9,1.18,us,usb000rxni,1406505367000
2014-07-27T01:27:12.000+00:00,67.630,-161.975,27.9,3.7,ml,,,,1.00,ak,ak11339033,1406500280947
2014-07-26T22:44:29.000+00:00,63.532,-149.552,100.0,2.6,ml,,,,0.57,ak,ak11338987,1406443615968
2014-07-26T21:55:56.850+00:00,25.290,127.100,42.0,4.4,mb,,136,1.9,0.94,us,usb000rxn2,1406440743637
2014-07-26T21:25:13.510+00:00,-22.973,-69.942,56.4,4.5,mwr,,97,0.4,1.19,us,usb000rxmi,1406487667000
2014-07-26T21:22:07.680+00:00,-52.038,-74.376,12.9,4.7,mb,,152,1.5,1.09,us,usb000rxmj,1406438681041
2014-07-26T21:08:33.850+00:00,-21.197,-179.091,603.4,4.7,mb,,51,8.1,0.80,us,usb000rxmv,1406437868441
2014-07-26T21:07:21.090+00:00,-21.248,-179.181,627.6,4.6,mb,,72,4.4,0.78,us,usb000rxmf,1406437795338
2014-07-26T20:53:09.740+00:00,58.255,-137.083,10.0,4.0,ml,,113,1.2,0.51,us,usb000rxm6,1406486293000
2014-07-26T20:49:11.480+00:00,-50.107,120.019,13.5,4.8,mb,,135,16.9,0.58,us,usb000rxm7,1406436709093
2014-07-26T20:38:31.410+00:00,36.993,142.589,24.5,4.6,mb,,129,3.5,0.72,us,usb000rxm5,1406436070729
2014-07-26T20:37:33.000+00:00,58.309,-153.920,83.2,2.6,ml,,,,0.68,ak,ak11338830,1406436014230
2014-07-26T17:52:44.100+00:00,51.761,178.510,98.6,3.0,ml,,164,0.6,0.63,us,usb000rxma,1406649566896
2014-07-26T17:43:54.590+00:00,-6.823,150.417,27.7,4.9,mb,,41,3.1,1.16,us,usb000rxlg,1406648871000
2014-07-26T17:11:16.540+00:00,-21.178,-15.190,14.7,5.1,mb,,32,29.5,0.50,us,usb000rxlb,1406647131000
2014-07-26T17:09:10.750+00:00,0.558,98.662,79.7,4.5,mb,,166,1.3,1.02,us,usb000rxl8,1406646593313
2014-07-26T16:32:03.300+00:00,46.265,-111.387,9.4,3.0,mc,56,144,0.2,0.23,mb,mb14956348,1406557279516
2014-07-26T15:59:51.150+00:00,-60.083,-18.655,10.0,4.9,mb,,93,13.2,1.39,us,usb000rxkq,1406419351083
2014-07-26T15:52:58.000+00:00,59.490,-152.796,99.9,2.8,ml,,,,0.74,ak,ak11338611,1406418937825
2014-07-26T15:33:14.300+00:00,18.315,-68.296,84.0,3.0,Md,7,230,0.2,0.28,pr,pr14207004,1406417763419
2014-07-26T15:26:58.500+00:00,19.294,-155.383,4.0,2.6,Ml,,101,0.0,0.12,hv,hv60740861,1406595510639
2014-07-26T14:46:19.600+00:00,38.802,-122.771,1.7,2.5,Md,55,29,0.0,0.04,nc,nc72264991,1406590088953
2014-07-26T14:12:20.560+00:00,27.879,128.229,64.1,4.8,mb,,122,1.0,1.32,us,usb000rxkc,1406412892070
2014-07-26T13:49:38.000+00:00,60.064,-153.275,100.0,3.1,ml,,,,1.00,ak,ak11338535,1406411537182
2014-07-26T12:17:04.500+00:00,17.918,-67.104,6.0,2.5,Md,10,281,0.1,0.31,pr,pr14207003,1406405982834
2014-07-26T11:13:48.490+00:00,-60.060,-18.761,10.0,5.4,mb,,74,11.2,1.02,us,usb000rxjy,1406595367000
2014-07-26T10:59:29.800+00:00,-60.121,-18.600,10.0,5.1,mb,,76,11.3,0.67,us,usb000rxjv,1406401330466
2014-07-26T10:57:10.860+00:00,37.117,-97.804,2.8,3.4,mb_lg,,56,0.1,0.22,us,usb000rxjs,1406612016700
2014-07-26T10:33:15.900+00:00,19.386,-65.322,86.0,3.1,Md,8,288,1.1,0.07,pr,pr14207002,1406399753770
2014-07-26T10:31:41.590+00:00,51.722,178.452,105.7,4.5,mb,,110,0.6,1.14,us,usb000rxjn,1406406128322
2014-07-26T09:56:01.270+00:00,6.762,-72.967,161.1,4.5,mb,,49,0.8,1.22,us,usb000rxjg,1406397517018
2014-07-26T08:54:59.100+00:00,37.562,-118.847,10.4,2.8,Ml,31,130,0.0,0.03,nc,nc72264796,1406586607719
2014-07-26T08:40:05.880+00:00,20.297,120.267,18.7,4.6,mb,,126,2.6,0.84,us,usb000rxj9,1406392962876
2014-07-26T08:38:13.070+00:00,33.058,-115.905,0.9,2.8,ml,51,36,0.1,0.19,ci,ci15531225,1406558381240
2014-07-26T08:05:51.680+00:00,45.566,150.919,75.6,4.9,mb,,48,5.8,0.91,us,usb000rxj3,1406390904095
2014-07-26T07:33:00.500+00:00,18.415,-68.239,95.0,3.4,Md,12,194,0.2,0.31,pr,pr14207000,1406388939484
2014-07-26T07:31:43.730+00:00,-30.293,-72.349,10.0,4.9,mb,,93,1.3,1.42,us,usb000rxiu,1406651319000
2014-07-26T07:29:03.040+00:00,4.860,123.186,585.5,4.4,mb,,87,3.2,0.94,us,usb000rxix,1406388689941
2014-07-26T07:22:42.410+00:00,74.554,9.622,10.0,4.2,mb,,132,4.0,1.10,us,usb000rxiv,1406388319400
2014-07-26T06:24:12.200+00:00,18.279,-67.143,118.0,2.6,Md,8,194,0.1,0.34,pr,pr14207001,1406377897207
2014-07-26T06:21:25.000+00:00,51.800,178.204,134.8,2.6,ml,,,,0.41,ak,ak11338313,1406406159012
2014-07-26T05:49:51.250+00:00,9.798,-83.973,6.8,3.9,mb,,185,0.2,1.31,us,usb000rxie,1406392865535
2014-07-26T05:34:46.710+00:00,-4.366,136.402,65.1,4.0,mb,,182,4.4,1.23,us,usb000rxid,1406381835194
2014-07-26T04:37:56.000+00:00,60.041,-153.033,100.0,2.6,ml,,,,0.64,ak,ak11338277,1406378429607
2014-07-25T23:22:10.310+00:00,43.523,147.303,51.7,5.1,mb,,126,3.4,0.81,us,usb000rxg5,1406359481641
2014-07-25T23:22:09.830+00:00,18.528,145.578,183.6,5.0,mb,,80,0.5,0.81,us,usb000rxg7,1406359475872
2014-07-25T21:49:42.000+00:00,58.320,-136.885,10.2,2.8,ml,,,,0.87,ak,ak11337849,1406353929466
2014-07-25T20:03:47.490+00:00,37.280,99.035,15.0,4.5,mb,,45,8.7,1.05,us,usb000rxc9,1406397512278
2014-07-25T19:40:35.160+00:00,-2.790,138.732,59.6,4.8,mb,,37,6.5,0.91,us,usb000rxbu,1406396958000
2014-07-25T18:28:53.000+00:00,65.654,-144.825,17.7,3.6,ml,,,,0.58,ak,ak11337197,1406390886000
2014-07-25T17:35:32.400+00:00,35.548,-121.251,3.5,2.7,Md,62,191,0.2,0.10,nc,nc72264461,1406588230608
2014-07-25T17:05:46.190+00:00,28.789,143.660,34.2,5.0,mb,,41,2.1,0.72,us,usb000rxa3,1406389249000
2014-07-25T16:43:24.000+00:00,67.590,-161.871,18.7,3.9,ml,,,,0.89,ak,ak11337003,1406335553472
2014-07-25T16:01:36.300+00:00,18.279,-67.246,81.0,2.8,Md,15,140,0.2,0.23,pr,pr14206002,1406333051123
2014-07-25T16:00:40.110+00:00,58.278,-137.039,10.0,3.8,ml,,146,1.2,0.93,us,usb000rx93,1406321659103
2014-07-25T15:12:53.100+00:00,58.516,-136.730,10.0,3.7,ml,,167,1.0,1.01,us,usb000rx7j,1406315077615
2014-07-25T13:52:33.200+00:00,36.137,-120.198,10.9,2.7,md,46,138,0.1,0.08,nc,nc72264361,1406326086295
2014-07-25T13:19:49.000+00:00,58.455,-136.780,14.8,2.5,ml,,,,0.95,ak,ak11336678,1406323343276
2014-07-25T13:06:30.690+00:00,58.202,-136.913,10.0,3.8,ml,,147,1.1,0.73,us,usb000rx72,1406322550122
2014-07-25T12:48:44.160+00:00,17.883,145.395,323.6,4.4,mb,,89,4.3,0.91,us,usb000rx6z,1406321483051
2014-07-25T12:11:49.000+00:00,58.265,-137.064,5.6,3.8,ml,,,,0.72,ak,ak11336580,1406319260719
2014-07-25T11:59:55.280+00:00,58.334,-137.039,10.0,3.8,mb,,118,1.2,1.35,us,usb000rx6n,1406311128877
2014-07-25T11:53:19.830+00:00,58.267,-137.025,10.0,3.9,ml,,140,1.2,0.68,us,usb000rx6l,1406318149640
2014-07-25T11:33:55.670+00:00,58.298,-137.000,10.0,4.0,mb,,118,1.2,0.85,us,usb000rx69,1406316992819
2014-07-25T11:19:36.760+00:00,58.480,-137.055,10.0,4.4,mb,,83,1.2,1.31,us,usb000rx63,1406309170613
2014-07-25T11:09:06.090+00:00,-29.609,-177.409,39.2,4.9,mb,,129,0.6,0.65,us,usb000rx6j,1406315501551
2014-07-25T11:08:39.490+00:00,58.283,-137.121,10.0,4.5,mb,,128,1.2,0.86,us,usb000rx5r,1406308992695
2014-07-25T10:59:35.000+00:00,57.808,-154.798,77.6,4.3,ml,,,,0.70,ak,ak11336425,1406314929712
2014-07-25T10:54:49.780+00:00,58.358,-137.130,10.0,5.9,mwp,,56,1.2,1.11,us,usb000rx5i,1406439600231
2014-07-25T10:54:47.000+00:00,19.333,-155.193,7.8,2.5,Ml,,83,0.0,0.07,hv,hv60738871,1406323803863
2014-07-25T10:54:06.050+00:00,58.278,-137.076,10.0,4.7,mb,,84,1.2,0.98,us,usb000rx5g,1406292660952
2014-07-25T10:43:53.850+00:00,-15.205,-72.078,165.1,4.6,mb,,127,3.6,1.10,us,usb000rx5e,1406313993070
2014-07-25T10:01:05.700+00:00,47.739,-121.996,0.1,2.9,Ml,,50,0.0,0.43,uw,uw60826997,1406546227589
2014-07-25T09:58:01.580+00:00,36.731,71.289,186.9,4.5,mb,,75,0.7,1.25,us,usb000rx57,1406311234592
2014-07-25T08:32:37.130+00:00,-25.478,-175.028,10.0,5.1,mb,,52,4.6,1.19,us,usb000rx37,1406306108724
2014-07-25T07:38:31.600+00:00,19.104,-66.506,23.0,2.6,Md,15,252,0.6,0.37,pr,pr14206001,1406302872934
2014-07-25T07:10:29.120+00:00,14.429,-89.927,253.9,4.3,mb,,114,0.5,0.87,us,usb000rx2t,1406301178069
2014-07-25T07:05:21.200+00:00,17.953,-68.366,55.0,3.1,Md,9,270,0.6,0.40,pr,pr14206000,1406300882017
2014-07-25T04:56:52.300+00:00,36.641,-98.242,5.0,3.3,mb_lg,,54,0.2,0.73,us,usb000rx2d,1406350880057
2014-07-25T04:52:57.900+00:00,-23.196,-66.150,176.1,4.5,mb,,175,2.6,1.36,us,usb000rx2c,1406292930539
2014-07-25T04:18:17.240+00:00,41.589,142.045,69.7,5.1,mb,,116,0.9,0.74,us,usb000rx2a,1406301332389
2014-07-25T03:50:21.000+00:00,63.246,-151.559,12.1,3.2,ml,,,,1.22,ak,ak11336251,1406289178346
2014-07-25T03:22:36.000+00:00,62.881,-148.279,58.8,3.7,ml,,,,0.86,ak,ak11336230,1406308512867
2014-07-25T01:41:38.000+00:00,62.692,-149.420,14.8,2.9,ml,,,,0.97,ak,ak11336204,1406281447568
2014-07-25T00:02:39.650+00:00,-21.408,-179.298,615.9,4.6,mb,,53,4.4,0.63,us,usb000rx1k,1406275520759
2014-07-24T23:57:28.400+00:00,10.413,125.267,38.0,5.3,mb,,87,3.3,0.97,us,usb000rx1j,1406383955000
2014-07-24T23:09:04.010+00:00,28.496,-43.739,10.0,4.7,mb,,134,24.0,0.53,us,usb000rx1f,1406272290643
2014-07-24T21:51:10.400+00:00,-36.625,-73.689,13.0,4.6,mb,,124,0.6,0.62,us,usb000rx12,1406267629918
2014-07-24T19:20:14.640+00:00,32.904,-116.268,8.8,3.5,ml,58,47,0.0,0.21,ci,ci15530681,1406316081121
2014-07-24T18:48:27.300+00:00,10.054,-84.240,10.0,4.0,mb,,177,0.1,0.71,us,usb000rx2l,1406691331456
2014-07-24T18:06:01.000+00:00,62.093,-149.705,26.0,2.8,ml,,,,0.61,ak,ak11335668,1406254123676
2014-07-24T17:12:43.200+00:00,17.749,-63.596,136.0,3.6,Md,11,158,0.4,0.17,pr,pr14205002,1406250912050
2014-07-24T17:10:20.440+00:00,-5.609,145.391,75.2,5.4,mb,,32,4.2,1.07,us,usb000rwxu,1406223732295
2014-07-24T16:51:15.720+00:00,42.302,144.823,53.8,4.4,mb,,115,1.3,0.88,us,usb000rwxf,1406300619000
2014-07-24T16:04:30.000+00:00,60.116,-153.306,100.0,3.1,ml,,,,0.95,ak,ak11335609,1406296652000
2014-07-24T15:44:53.100+00:00,35.731,-121.116,6.5,3.0,Ml,72,97,0.0,0.07,nc,nc72263841,1406295695000
2014-07-24T15:20:51.800+00:00,35.729,-121.118,6.5,2.7,Md,62,50,0.0,0.07,nc,nc72263801,1406244205165
2014-07-24T14:49:48.630+00:00,-9.326,115.402,65.3,4.0,mb,,71,1.5,0.77,us,usb000rx2g,1406265086000
2014-07-24T14:39:46.000+00:00,51.429,-174.641,26.5,3.7,ml,,,,0.50,ak,ak11335546,1406241735857
2014-07-24T14:30:35.000+00:00,60.080,-153.300,100.0,3.0,ml,,,,0.98,ak,ak11335536,1406241184252
2014-07-24T11:20:38.000+00:00,63.189,-152.864,1.4,2.7,ml,,,,0.80,ak,ak11335497,1406229784369
2014-07-24T11:15:58.000+00:00,59.871,-152.873,97.3,2.6,ml,,,,0.54,ak,ak11335475,1406229519329
2014-07-24T11:08:17.700+00:00,18.679,-67.995,90.0,3.2,Md,11,209,0.4,0.28,pr,pr14205001,1406229049960
2014-07-24T10:58:08.400+00:00,18.966,-67.850,50.0,3.3,Md,9,241,0.7,0.28,pr,pr14205000,1406228446420
2014-07-24T10:27:28.000+00:00,35.785,-97.507,6.4,2.7,mb_lg,,107,0.0,0.51,us,usb000rx2j,1406265787861
2014-07-24T10:14:39.200+00:00,19.430,-155.617,44.7,2.5,Ml,,65,0.0,0.23,hv,hv60738091,1406239997805
2014-07-24T08:41:06.770+00:00,-9.205,111.534,36.4,5.0,mb,,89,1.6,0.99,us,usb000rwt6,1406214441262
2014-07-24T08:16:51.650+00:00,-9.316,113.020,37.0,4.5,mb,,79,1.4,1.32,us,usb000rwt4,1406218774222
2014-07-24T05:21:56.620+00:00,-18.351,-71.426,28.5,4.2,mwr,,155,1.0,0.87,us,usb000rwsh,1406208263533
2014-07-24T04:49:16.460+00:00,-19.559,168.628,41.8,4.7,mb,,82,3.2,1.16,us,usb000rwsb,1406206304322
2014-07-24T03:08:18.740+00:00,39.230,81.155,10.0,4.6,mb,,95,3.9,0.56,us,usb000rwrz,1406200254633
2014-07-24T02:40:49.066+00:00,41.933,-119.647,1.4,3.1,ml,7,119,0.5,0.13,nn,nn00453018,1406221957055
2014-07-24T02:11:25.900+00:00,37.967,-122.042,12.8,2.5,Md,50,76,0.1,0.10,nc,nc72263481,1406708940490
2014-07-24T02:05:51.000+00:00,51.837,178.382,111.5,2.6,ml,,,,0.31,ak,ak11335358,1406220730995
2014-07-24T01:49:46.092+00:00,41.878,-119.638,1.0,2.8,ml,5,123,0.5,0.16,nn,nn00453012,1406226804692
2014-07-23T23:55:59.500+00:00,46.271,-111.379,9.7,3.6,mc,61,80,0.2,0.20,mb,mb30652,1406642596229
2014-07-23T22:25:05.500+00:00,19.203,-66.625,25.0,2.8,Md,9,284,0.7,0.15,pr,pr14204006,1406183267494
2014-07-23T22:13:08.000+00:00,62.394,-147.734,18.9,2.7,ml,,,,0.75,ak,ak11335283,1406156413907
2014-07-23T21:39:08.040+00:00,-20.244,-68.702,115.0,5.5,mb,,34,0.4,1.20,us,usb000rwqe,1406217259000
2014-07-23T21:00:46.980+00:00,-21.174,-68.754,135.0,4.2,mb,,46,0.7,0.90,us,usb000rwq1,1406178205473
2014-07-23T17:57:50.200+00:00,18.783,-67.835,21.0,2.8,Md,4,331,0.5,0.07,pr,pr14204005,1406167223381
2014-07-23T17:23:59.980+00:00,-6.484,152.682,29.3,4.9,mb,,49,2.3,0.96,us,usb000rwmx,1406165190499
2014-07-23T16:26:42.700+00:00,48.983,-2.333,2.0,4.0,ml,,,,0.28,us,usb000rwp1,1406238200409
2014-07-23T15:34:33.400+00:00,18.871,-64.428,29.0,2.7,Md,4,324,0.5,0.10,pr,pr14204004,1406158632650
2014-07-23T14:20:38.910+00:00,14.185,-91.661,69.5,4.3,mb,,236,0.3,0.92,us,usb000rwke,1406154200909
2014-07-23T14:03:47.500+00:00,35.879,-97.305,5.1,3.2,ml,,60,,0.36,us,usb000rwk6,1406176718919
2014-07-23T13:57:23.480+00:00,13.655,144.789,110.3,4.6,mb,,66,0.1,0.54,us,usb000rwsa,1406400627372
2014-07-23T12:29:07.700+00:00,-19.601,-178.286,597.4,4.3,mb,,123,3.9,1.02,us,usb000rwjh,1406147506564
2014-07-23T09:57:47.530+00:00,-5.605,-80.878,34.2,4.6,mb,,117,7.5,0.70,us,usb000rwgu,1406111522929
2014-07-23T06:54:39.716+00:00,41.872,-119.636,0.8,2.6,ml,4,221,0.5,0.18,nn,nn00452926,1406152096697
2014-07-23T05:52:28.760+00:00,0.389,67.105,10.0,5.0,mb,,131,12.7,0.76,us,usb000rwdr,1406131898000
2014-07-23T03:48:51.000+00:00,51.258,-174.963,25.7,2.5,ml,,,,0.45,ak,ak11334893,1406135770510
2014-07-23T03:13:33.000+00:00,51.451,-175.675,27.8,2.5,ml,,,,0.82,ak,ak11334873,1406135774069
2014-07-23T02:47:23.200+00:00,18.877,-64.527,10.0,2.6,Md,7,306,0.5,0.23,pr,pr14204001,1406112599869
2014-07-23T02:02:26.580+00:00,35.902,-97.308,5.0,3.3,mb_lg,,41,0.2,0.41,us,usb000rwcu,1406135910015
2014-07-23T00:28:19.720+00:00,16.905,-100.203,36.1,5.0,mb,,151,1.7,0.80,us,usb000rwc3,1406082673292
2014-07-23T00:27:01.380+00:00,-20.595,-177.616,472.7,5.0,mb,,87,5.0,0.84,us,usb000rwc5,1406104171102
2014-07-23T00:25:14.700+00:00,35.834,-97.436,5.0,2.5,mb_lg,,68,0.0,0.39,us,usb000rwdj,1406603982934
2014-07-22T23:48:34.000+00:00,64.122,-150.147,5.2,2.8,ml,,,,0.74,ak,ak11334697,1406101863742
2014-07-22T23:46:51.970+00:00,25.748,-110.416,10.0,4.1,mb,,146,2.1,1.34,us,usb000rwbv,1406101774048
2014-07-22T23:35:14.620+00:00,26.132,89.604,14.7,4.0,mb,,170,2.1,0.80,us,usb000rwbx,1406101071038
2014-07-22T22:58:31.040+00:00,26.216,89.676,15.0,4.2,mb,,188,2.1,0.89,us,usb000rwbn,1406073869205
2014-07-22T22:37:12.000+00:00,59.921,-153.501,100.0,2.9,ml,,,,0.98,ak,ak11334633,1406097584822
2014-07-22T21:56:14.410+00:00,16.844,-100.086,14.5,4.5,mb,,254,1.6,0.84,us,usb000rwb2,1406070734898
2014-07-22T20:50:13.150+00:00,53.126,-168.530,80.8,3.7,mb,,164,0.2,1.48,us,usb000rwa2,1406124016000
2014-07-22T20:15:12.010+00:00,51.680,-173.477,36.2,4.1,mb,,177,0.7,1.10,us,usb000rw98,1406123539000
2014-07-22T17:50:29.800+00:00,36.655,-98.214,4.2,2.6,ml,,101,,1.32,us,usb000rw7l,1406122953000
2014-07-22T17:28:09.700+00:00,35.814,-97.414,4.2,2.6,ml,,52,,1.04,us,usb000rw7t,1406121788000
2014-07-22T17:05:43.000+00:00,61.746,-152.113,0.4,2.7,ml,,,,0.82,ak,ak11334458,1406077697353
2014-07-22T16:14:36.560+00:00,32.286,-115.250,9.7,3.0,ml,13,277,0.1,0.22,ci,ci37249624,1406074637038
2014-07-22T15:34:36.800+00:00,35.815,-119.882,10.3,2.6,Md,33,230,0.2,0.13,nc,nc72262511,1406147888089
2014-07-22T15:32:28.000+00:00,51.818,178.400,118.6,2.5,ml,,,,0.35,ak,ak11334388,1406072108768
2014-07-22T15:30:24.200+00:00,35.827,-119.861,4.8,2.9,Md,63,122,0.3,0.21,nc,nc72262506,1406151364463
2014-07-22T15:22:38.790+00:00,27.536,57.333,10.0,5.1,mb,,76,2.8,0.65,us,usb000rw57,1406071515630
2014-07-22T14:56:56.000+00:00,52.833,-169.771,116.7,2.6,ml,,,,0.31,ak,ak11334374,1406069972545
2014-07-22T14:11:15.300+00:00,-20.298,-176.174,208.2,5.0,mb,,31,6.0,0.84,us,usb000rw4q,1406067228089
2014-07-22T12:32:55.500+00:00,18.157,-64.232,45.0,2.8,Md,5,320,0.4,0.30,pr,pr14203003,1406061327433
2014-07-22T10:49:56.090+00:00,12.001,142.357,59.9,5.0,mb,,53,2.9,0.84,us,usb000rw44,1406055146735
2014-07-22T09:45:09.400+00:00,36.686,-121.316,4.7,2.8,Md,64,29,0.0,0.06,nc,nc72262326,1406061786944
2014-07-22T09:05:31.000+00:00,59.763,-151.901,47.8,2.5,ml,,,,0.55,ak,ak11334230,1406048885693
2014-07-22T08:35:04.350+00:00,31.616,-114.464,10.0,2.9,ml,3,248,0.7,0.31,ci,ci37249432,1406047066548
2014-07-22T08:34:51.040+00:00,31.663,-114.498,10.0,2.5,ml,5,128,0.7,0.20,ci,ci37206365,1406054015082
2014-07-22T08:04:18.280+00:00,34.242,26.146,27.3,4.8,mb,,149,1.5,1.06,us,usb000rw3d,1406045206003
2014-07-22T07:11:06.100+00:00,36.686,-121.316,4.9,2.9,Md,63,29,0.0,0.06,nc,nc72262166,1406065088024
2014-07-22T06:50:31.930+00:00,26.071,-110.144,10.0,4.8,mb,,182,4.1,1.37,us,usb000rw32,1406040779123
2014-07-22T05:08:38.000+00:00,60.360,-140.289,1.7,2.7,ml,,,,0.71,ak,ak11334117,1406034669268
2014-07-22T03:03:58.650+00:00,30.654,31.760,5.8,4.3,mb,,238,4.5,1.13,us,usb000rw2e,1406048073859
2014-07-22T02:16:43.300+00:00,17.794,-68.261,91.0,3.6,Md,12,331,1.1,0.33,pr,pr14203000,1406024366100
2014-07-22T02:15:07.300+00:00,19.346,-65.155,38.0,2.7,Md,3,335,1.0,0.28,pr,pr14203001,1406024259089
2014-07-22T02:08:33.290+00:00,35.591,-97.412,5.0,2.6,mb_lg,,52,0.0,0.44,us,usb000rw2y,1406094561872
2014-07-22T01:23:10.000+00:00,60.345,-140.260,2.2,3.7,ml,,,,0.88,ak,ak11334025,1406021148310
2014-07-22T00:45:35.000+00:00,67.670,-161.995,14.1,2.9,ml,,,,1.02,ak,ak11334011,1406018884143
2014-07-22T00:33:01.000+00:00,67.051,-147.955,,2.8,ml,,,,0.82,ak,ak11334005,1406018132629
2014-07-21T22:04:19.000+00:00,51.905,178.292,119.5,2.7,ml,,,,0.42,ak,ak11333795,1406009209755
2014-07-21T21:52:36.300+00:00,37.985,-122.047,16.3,2.5,Md,49,72,0.0,0.11,nc,nc72261796,1406005610563
2014-07-21T21:45:56.630+00:00,35.817,-97.413,5.0,2.9,mb_lg,,85,0.0,0.50,us,usb000rw2v,1406028598158
2014-07-21T21:27:46.600+00:00,18.770,-64.363,24.0,2.9,Md,5,310,0.7,0.07,pr,pr14202003,1406007028049
2014-07-21T20:39:50.120+00:00,51.400,-175.037,37.8,4.7,mb,,140,0.9,1.19,us,usb000rvap,1406004150701
2014-07-21T20:35:56.330+00:00,51.306,-174.991,36.5,4.6,mb,,143,1.0,1.01,us,usb000rvak,1406003903998
2014-07-21T19:47:28.000+00:00,57.468,-154.446,100.0,2.5,ml,,,,0.96,ak,ak11333674,1406001006569
2014-07-21T19:37:33.000+00:00,51.305,-174.932,25.6,4.2,ml,,,,0.38,ak,ak11333803,1406000412949
2014-07-21T19:36:43.860+00:00,51.282,-174.934,10.0,4.8,mb,,77,1.0,0.72,us,usb000rv9m,1406000373702
2014-07-21T18:50:15.900+00:00,43.666,-121.450,,2.6,Ml,,281,0.1,0.15,uw,uw60823807,1405997562675
2014-07-21T17:48:01.000+00:00,51.039,178.505,1.5,2.7,ml,,,,0.44,ak,ak11333627,1405993839772
2014-07-21T17:21:25.200+00:00,18.868,-65.220,45.0,3.1,Md,9,234,0.6,0.15,pr,pr14202002,1405992240485
2014-07-21T16:49:00.420+00:00,-1.471,-77.647,178.6,4.1,mb,,160,3.5,0.64,us,usb000rv8d,1405990298410
2014-07-21T14:54:41.000+00:00,-19.829,-178.464,616.4,6.9,mww,,15,3.9,0.88,us,usb000ruzk,1405983436259
2014-07-21T13:21:45.000+00:00,63.835,-149.309,119.6,3.3,ml,,,,0.88,ak,ak11333469,1405977865427
2014-07-21T13:02:12.400+00:00,19.067,-66.128,46.0,3.0,Md,5,259,0.9,0.23,pr,pr14202001,1405976687598
2014-07-21T12:21:26.000+00:00,67.595,-160.935,10.0,3.3,ml,,,,0.89,ak,ak11333451,1405974245632
2014-07-21T11:22:20.000+00:00,58.272,-151.457,0.3,2.8,ml,,,,0.57,ak,ak11333437,1405970689103
2014-07-21T10:44:58.000+00:00,61.352,-147.019,12.9,3.0,ml,,,,0.61,ak,ak11333419,1405968452977
2014-07-21T10:04:19.160+00:00,14.078,-89.687,10.0,4.1,mb,,123,0.4,1.22,us,usb000ruy4,1406010044359
2014-07-21T09:44:38.000+00:00,50.953,178.843,53.2,2.7,ml,,,,0.35,ak,ak11333391,1405964832014
2014-07-21T06:01:01.650+00:00,-6.343,152.939,26.9,4.9,mb,,82,2.3,0.73,us,usb000ruxk,1405951411443
2014-07-21T05:49:25.800+00:00,18.851,-64.342,22.0,2.8,Md,6,310,0.5,0.31,pr,pr14202000,1405950721477
2014-07-21T05:25:55.500+00:00,19.840,-155.823,17.3,2.5,ml,,173,0.2,0.15,hv,hv60735786,1405978530092
2014-07-21T03:51:24.238+00:00,41.878,-119.610,,2.7,ml,5,131,0.5,0.14,nn,nn00452622,1405953228434
2014-07-21T03:29:37.000+00:00,57.280,-135.990,1.0,2.7,ml,,,,0.84,ak,ak11333304,1405942331759
2014-07-21T02:55:13.090+00:00,32.470,-117.715,10.0,3.2,ml,7,321,0.5,0.19,ci,ci37248888,1405949599346
2014-07-21T02:40:12.000+00:00,60.426,-150.394,51.8,2.6,ml,,,,1.06,ak,ak11333289,1405939362545
2014-07-21T02:04:21.000+00:00,50.078,-178.465,19.2,2.7,ml,,,,0.65,ak,ak11333278,1405937210823
2014-07-21T02:04:08.430+00:00,-49.560,-114.536,10.0,4.9,mb,,118,31.9,0.59,us,usb000ruwr,1405937205052
2014-07-21T00:21:26.740+00:00,-20.131,-70.632,21.8,4.8,mb,,96,0.6,0.85,us,usb000ruwb,1405931040406
2014-07-20T23:09:10.960+00:00,-20.465,-178.075,540.0,4.4,mb,,115,4.6,0.90,us,usb000ruw4,1405926704725
2014-07-20T22:27:11.800+00:00,37.835,-121.785,15.9,2.5,Md,50,126,0.0,0.16,nc,nc72261151,1405978449032
2014-07-20T21:35:01.000+00:00,50.937,179.584,50.2,3.7,ml,,,,0.47,ak,ak11333151,1405921058776
2014-07-20T19:48:38.640+00:00,35.511,-116.245,0.7,3.0,ml,17,93,0.3,0.13,ci,ci37248784,1405948968970
2014-07-20T19:43:22.240+00:00,35.514,-116.242,2.6,3.2,ml,19,93,0.3,0.10,ci,ci37248768,1405964946520
2014-07-20T18:32:48.460+00:00,44.599,148.748,70.0,6.2,mww,,31,4.4,1.14,us,usb000ruu6,1406037152057
2014-07-20T18:27:18.000+00:00,59.890,-153.628,100.0,2.9,ml,,,,1.23,ak,ak11332893,1405909801101
2014-07-20T17:23:33.500+00:00,19.401,-154.986,2.5,2.5,Ml,,180,0.0,0.12,hv,hv60735321,1405987928730
2014-07-20T16:37:21.000+00:00,63.512,-149.735,100.0,2.7,ml,,,,0.96,ak,ak11332802,1405903215975
2014-07-20T15:39:04.000+00:00,50.506,179.386,11.3,2.9,ml,,,,1.49,ak,ak11332784,1405912782947
2014-07-20T15:24:13.980+00:00,-4.781,144.892,93.8,4.9,mb,,59,5.1,0.77,us,usb000ruth,1405912664181
2014-07-20T15:12:35.900+00:00,40.986,-125.421,3.7,2.8,Md,36,295,1.1,0.19,nc,nc72260986,1406008023887
2014-07-20T15:03:24.420+00:00,-4.925,144.767,94.4,4.8,mb,,224,5.0,0.73,us,usb000rut8,1405912643729
2014-07-20T14:18:27.000+00:00,59.561,-153.244,100.0,2.5,ml,,,,0.53,ak,ak11332724,1405894853914
2014-07-20T14:10:53.660+00:00,7.512,136.799,137.6,4.8,mb,,59,10.0,1.24,us,usb000rut0,1405912626832
2014-07-20T14:07:49.760+00:00,41.933,35.918,10.0,4.1,mb,,125,1.9,0.93,us,usb000rusy,1405948127828
2014-07-20T13:30:21.180+00:00,32.134,134.374,26.2,4.6,mb,,65,3.1,0.46,us,usb000russ,1405912575059
2014-07-20T13:09:24.600+00:00,18.655,-65.030,57.0,2.6,Md,6,241,0.3,0.25,pr,pr14201014,1405912634209
2014-07-20T12:29:43.600+00:00,-20.473,168.761,51.1,4.8,mb,,88,2.7,0.91,us,usb000rusr,1405912535920
2014-07-20T12:28:15.600+00:00,36.298,-97.544,6.7,2.9,ml,,58,,0.44,us,usb000rv95,1406034342082
2014-07-20T12:24:58.090+00:00,37.341,-98.102,4.6,3.3,mb_lg,,39,0.1,0.82,us,usb000rusq,1405912490656
2014-07-20T12:10:12.370+00:00,-20.465,168.836,44.6,4.8,mb,,91,2.7,1.27,us,usb000rusm,1405912479764
2014-07-20T11:48:32.000+00:00,57.021,-157.844,100.0,3.1,ml,,,,1.15,ak,ak11332617,1405885908759
2014-07-20T11:48:18.600+00:00,17.889,-65.426,7.0,2.5,Md,12,173,0.2,0.25,pr,pr14201011,1405912457719
2014-07-20T11:11:25.200+00:00,40.448,-113.978,9.6,2.5,Ml,,263,0.9,0.24,uu,uu60077902,1405969624909
2014-07-20T10:19:45.000+00:00,60.410,-140.375,0.1,3.1,ml,,,,0.61,ak,ak11332554,1405880556975
2014-07-20T10:04:42.700+00:00,18.760,-64.319,31.0,2.7,Md,4,335,0.4,0.03,pr,pr14201013,1405912471290
2014-07-20T09:51:28.600+00:00,18.858,-64.406,8.0,3.1,Md,6,313,0.5,0.25,pr,pr14201012,1405912461788
2014-07-20T09:40:19.700+00:00,18.178,-66.916,24.0,2.5,Md,13,94,0.2,0.30,pr,pr14201010,1405912374876
2014-07-20T09:38:36.000+00:00,51.523,-177.930,21.5,3.3,ml,,,,0.52,ak,ak11332498,1405912784626
2014-07-20T09:23:30.750+00:00,14.838,-92.500,89.0,5.1,mb,,132,0.8,1.50,us,usb000rurw,1405912360330
2014-07-20T09:22:14.440+00:00,-40.977,174.098,58.7,4.3,mb,,52,0.5,0.89,us,usb000rurv,1405912390899
2014-07-20T09:18:21.790+00:00,32.894,-116.274,6.6,3.1,ml,76,48,0.0,0.20,ci,ci37248544,1406722375000
2014-07-20T08:15:04.210+00:00,37.799,23.972,170.3,4.2,mb,,62,1.7,1.10,us,usb000rurh,1405912241112
2014-07-20T07:32:16.000+00:00,62.136,-152.086,100.0,2.9,ml,,,,0.67,ak,ak11332415,1405870490587
2014-07-20T06:31:45.510+00:00,-28.092,-70.978,44.8,4.7,mb,,100,0.1,0.71,us,usb000rur0,1405912168337
2014-07-20T05:24:03.400+00:00,17.785,-68.362,81.0,2.9,Md,9,338,1.2,0.28,pr,pr14201005,1405912129589
2014-07-20T04:24:41.500+00:00,19.019,-64.924,38.0,3.0,Md,17,256,0.7,0.31,pr,pr14201002,1405912075740
2014-07-20T04:18:47.850+00:00,-29.910,-177.333,10.0,5.5,mb,,58,0.8,1.17,us,usb000rupz,1405954566000
2014-07-20T04:14:03.400+00:00,38.252,-122.328,8.0,2.8,Md,59,76,0.0,0.11,nc,nc72260721,1406085797119
2014-07-20T03:56:38.900+00:00,17.607,-66.590,45.0,2.9,Md,4,328,0.6,0.14,pr,pr14201004,1405912112118
2014-07-20T03:06:36.000+00:00,60.281,-140.264,5.0,3.1,ml,,,,0.95,ak,ak11332234,1405912211355
2014-07-20T02:15:44.000+00:00,60.293,-140.281,13.6,4.8,ml,,,,0.92,ak,ak11332039,1405911908926
2014-07-20T01:25:33.310+00:00,36.537,140.596,53.3,4.6,mb,,119,1.9,0.66,us,usb000runx,1406159941538
2014-07-20T00:44:26.400+00:00,18.598,-67.249,82.0,2.8,Md,7,292,0.2,0.14,pr,pr14201000,1405911959122
2014-07-20T00:24:58.450+00:00,37.224,-97.947,5.5,3.0,mb_lg,,28,0.0,0.92,us,usb000rung,1405911752012
2014-07-20T00:07:05.630+00:00,36.580,70.321,208.2,4.2,mb,,78,0.6,0.83,us,usb000rune,1405911722930
2014-07-19T22:21:54.720+00:00,9.819,124.146,10.0,4.7,mb,,94,3.1,1.14,us,usb000run2,1405812859706
2014-07-19T21:08:15.000+00:00,50.165,178.773,16.9,2.7,ml,,,,0.60,ak,ak11331818,1405912676264
2014-07-19T19:38:40.500+00:00,19.012,-65.361,31.0,2.6,Md,10,263,0.7,0.12,pr,pr14200009,1405827668113
2014-07-19T19:28:11.000+00:00,59.621,-154.850,100.0,2.8,ml,,,,1.81,ak,ak11331666,1405827052646
2014-07-19T18:28:16.800+00:00,19.042,-65.558,33.0,2.6,Md,4,317,0.8,0.09,pr,pr14200008,1406041730000
2014-07-19T17:06:39.000+00:00,67.580,-161.826,19.3,3.2,ml,,,,0.79,ak,ak11331572,1406041241000
2014-07-19T16:31:14.279+00:00,41.882,-119.657,1.9,2.5,ml,6,122,0.5,0.19,nn,nn00452450,1405816425067
2014-07-19T16:26:24.880+00:00,12.547,-89.384,53.0,4.7,mb,,183,1.1,0.99,us,usb000rukz,1405816131504
2014-07-19T15:59:58.000+00:00,67.632,-161.707,14.4,2.9,ml,,,,0.87,ak,ak11331511,1405814556826
2014-07-19T15:16:41.000+00:00,60.343,-140.297,0.1,2.8,ml,,,,0.74,ak,ak11331460,1405811953357
2014-07-19T14:14:01.880+00:00,11.752,57.563,10.0,6.0,mwb,,51,3.6,1.39,us,usb000ruks,1405914490000
2014-07-19T13:40:12.000+00:00,51.638,178.383,62.9,2.7,ml,,,,0.49,ak,ak11331345,1405806158960
2014-07-19T13:13:38.270+00:00,-20.667,168.856,46.0,4.8,mb,,102,2.6,1.80,us,usb000ruke,1405804579104
2014-07-19T13:04:21.370+00:00,-20.607,168.712,35.0,4.7,mb,,101,2.6,0.58,us,usb000ruka,1405804009711
2014-07-19T12:27:09.270+00:00,-15.799,-174.404,219.8,6.0,mwp,,47,3.2,1.04,us,usb000rujq,1405819592000
2014-07-19T12:14:59.070+00:00,21.478,103.977,13.0,4.5,mb,,74,0.2,0.72,us,usb000rujk,1405848069467
2014-07-19T12:04:54.920+00:00,31.901,-115.021,15.0,2.7,ml,7,194,0.6,0.05,ci,ci37206349,1405976745660
2014-07-19T10:53:55.600+00:00,19.008,-65.590,34.0,3.1,Md,11,256,0.8,0.10,pr,pr14200005,1405796187757
2014-07-19T10:47:29.200+00:00,19.099,-65.504,33.0,2.7,Md,4,317,0.8,0.02,pr,pr14200007,1405795807110
2014-07-19T10:45:48.200+00:00,18.983,-65.542,47.0,2.8,Md,6,274,0.7,0.07,pr,pr14200006,1405795700808
2014-07-19T09:48:00.410+00:00,-20.357,168.647,35.0,4.9,mb,,47,2.7,0.84,us,usb000ruj0,1405792228614
2014-07-19T09:27:46.220+00:00,48.327,154.681,35.0,4.7,mb,,130,5.2,0.68,us,usb000ruiu,1405791014249
2014-07-19T09:16:21.160+00:00,41.624,42.058,10.0,4.1,mb,,166,1.1,0.54,us,usb000ruiq,1405790331114
2014-07-19T09:15:40.000+00:00,51.669,178.450,89.4,2.9,ml,,,,0.41,ak,ak11331180,1405793014994
2014-07-19T08:44:27.600+00:00,17.966,-68.371,44.0,3.4,Md,19,270,0.5,0.33,pr,pr14200004,1405788423282
2014-07-19T08:42:28.000+00:00,67.529,-162.036,3.5,3.2,ml,,,,0.85,ak,ak11331172,1405788309640
2014-07-19T08:30:54.230+00:00,51.823,178.409,107.4,4.4,mb,,41,0.7,1.03,us,usb000ruif,1405792978402
2014-07-19T07:43:44.590+00:00,-1.202,151.896,18.4,4.7,mb,,114,3.0,1.25,us,usb000rui3,1405784786229
2014-07-19T07:17:56.420+00:00,36.872,71.129,85.8,5.3,mb,,43,0.5,1.25,us,usb000ruhx,1405815769000
2014-07-19T06:15:24.450+00:00,-31.788,179.423,428.8,5.1,mb,,58,3.4,1.20,us,usb000ruhg,1405779476131
2014-07-19T06:09:50.000+00:00,19.615,-65.314,13.0,3.0,Md,3,335,1.3,0.14,pr,pr14200003,1405779139996
2014-07-19T06:01:25.000+00:00,61.494,-146.526,17.7,2.8,ml,,,,1.03,ak,ak11331078,1405778641455
2014-07-19T05:37:04.000+00:00,17.539,-94.351,168.8,4.3,mb,,126,2.5,1.10,us,usb000ruhb,1405777181698
2014-07-19T05:32:55.150+00:00,13.985,-91.446,63.9,4.2,mb,,147,0.6,0.99,us,usb000ruha,1405752209391
2014-07-19T04:56:50.400+00:00,18.504,-64.810,5.0,2.8,Md,9,212,0.2,0.51,pr,pr14200002,1405774763115
2014-07-19T03:50:42.100+00:00,18.096,-64.590,127.0,3.0,Md,4,270,0.3,0.07,pr,pr14200001,1405770803744
2014-07-19T02:45:45.780+00:00,-7.766,126.892,203.6,4.5,mb,,93,3.3,0.79,us,usb000rugn,1405766903131
2014-07-19T02:24:33.190+00:00,38.492,43.306,10.0,4.0,mb,,157,2.9,1.23,us,usb000rugg,1405765626289
2014-07-19T01:42:53.160+00:00,36.015,140.239,64.9,4.7,mb,,135,1.7,0.51,us,usb000rufw,1406160238781
2014-07-18T23:09:33.300+00:00,18.195,-67.323,30.0,2.8,Md,15,263,0.2,0.25,pr,pr14199000,1405753929745
2014-07-18T21:56:32.500+00:00,35.591,-97.391,6.4,2.7,ml,,46,,0.57,us,usb000ruef,1405735485854
2014-07-18T21:52:38.087+00:00,41.942,-119.657,0.2,2.6,ml,7,81,0.5,0.19,nn,nn00452413,1405987979447
2014-07-18T21:32:41.000+00:00,60.381,-140.342,3.0,2.8,ml,,,,0.63,ak,ak11330690,1406324282307
2014-07-18T21:12:05.000+00:00,57.779,-155.934,8.7,2.7,ml,,,,0.62,ak,ak11330624,1406324078183
2014-07-18T20:44:40.540+00:00,13.025,-89.820,54.2,4.3,mb,,171,0.9,1.15,us,usb000rudf,1405786995363
2014-07-18T20:01:28.890+00:00,30.203,32.376,10.0,4.2,mb,,194,4.8,1.24,us,usb000rud7,1406000675477
2014-07-18T19:11:28.000+00:00,51.706,178.245,109.5,2.5,ml,,,,0.56,ak,ak11330520,1406324079682
2014-07-18T18:44:26.410+00:00,-20.478,168.743,20.4,5.1,mb,,88,2.7,0.95,us,usb000ru9p,1405783709668
2014-07-18T18:35:20.000+00:00,51.740,178.515,97.4,2.9,ml,,,,0.31,ak,ak11330609,1406324155058
2014-07-18T18:23:07.470+00:00,-34.627,-179.590,43.5,5.4,mwb,,24,3.4,0.94,us,usb000ru8u,1405786140475
2014-07-18T17:49:25.350+00:00,-5.292,151.954,70.2,4.7,mb,,48,1.1,0.90,us,usb000ru87,1405777417000
2014-07-18T17:19:00.000+00:00,51.810,178.370,103.8,2.5,ml,,,,1.35,us,usb000ru82,1406324067369
2014-07-18T16:02:12.000+00:00,18.657,-65.186,74.0,2.7,Md,4,230,0.4,0.27,pr,pr14199002,1405746655945
2014-07-18T14:04:45.000+00:00,57.744,-155.935,1.1,3.9,ml,,,,0.80,ak,ak11330251,1406324063074
2014-07-18T13:41:13.520+00:00,36.654,-98.141,5.0,3.2,mb_lg,,42,0.2,0.69,us,usb000ru53,1405719878649
2014-07-18T13:12:54.100+00:00,19.029,-65.127,19.0,3.0,Md,7,252,0.7,0.37,pr,pr14199003,1405748975142
2014-07-18T12:12:01.000+00:00,67.711,-162.128,10.9,2.9,ml,,,,0.71,ak,ak11330154,1406324132842
2014-07-18T11:41:45.690+00:00,42.108,144.043,44.8,4.5,mb,,134,0.7,0.71,us,usb000ru49,1405712663366
2014-07-18T11:05:32.000+00:00,61.691,-152.298,8.0,2.7,ml,,,,0.62,ak,ak11330083,1406324231690
2014-07-18T10:45:43.200+00:00,18.947,-66.476,68.0,2.7,Md,4,281,0.7,0.09,pr,pr14199007,1405754001515
2014-07-18T09:18:02.000+00:00,54.394,-161.702,9.9,2.5,ml,,,,0.84,ak,ak11330005,1406324124428
2014-07-18T09:15:06.700+00:00,19.119,-66.471,42.0,2.6,Md,9,284,0.6,0.14,pr,pr14199006,1405753380930
2014-07-18T09:01:45.880+00:00,-24.355,-67.944,112.6,4.3,mb,,63,1.7,0.94,us,usb000ru3a,1405703053818
2014-07-18T08:58:35.360+00:00,-16.199,168.470,35.0,5.2,mb,,59,1.4,0.95,us,usb000ru3d,1405702877767
2014-07-18T08:56:45.270+00:00,51.602,178.413,104.9,4.1,mb,,173,0.6,0.77,us,usb000ru39,1406324211593
2014-07-18T08:40:44.000+00:00,49.935,-178.354,46.4,2.5,ml,,,,0.59,ak,ak11337585,1406324367225
2014-07-18T08:33:37.230+00:00,-17.496,-63.481,42.5,4.5,mb,,93,4.6,0.95,us,usb000ru31,1405701373917
2014-07-18T08:25:14.000+00:00,63.127,-151.391,8.0,2.8,ml,,,,0.79,ak,ak11329961,1406324120322
2014-07-18T07:21:20.000+00:00,50.005,178.600,41.3,2.7,ml,,,,0.85,ak,ak11337577,1406324348560
2014-07-18T06:05:21.700+00:00,40.596,-124.097,17.1,2.5,Md,19,158,0.2,0.10,nc,nc72259481,1405729683781
2014-07-18T05:46:48.440+00:00,-20.195,-70.890,15.0,4.7,mb,,142,0.8,1.20,us,usb000ru22,1405725290000
2014-07-18T05:33:26.000+00:00,67.592,-161.764,13.4,4.6,ml,,,,0.77,ak,ak11329859,1406324043060
2014-07-18T05:30:01.000+00:00,67.586,-161.891,17.3,2.8,ml,,,,0.82,ak,ak11329857,1406324111474
2014-07-18T05:24:10.300+00:00,-20.157,-70.868,14.4,4.8,mb,,113,0.8,1.19,us,usb000ru1u,1405724860000
2014-07-18T04:56:53.670+00:00,39.691,143.552,27.7,4.6,mb,,236,2.3,0.38,us,usb000ru1k,1405688364213
2014-07-18T04:38:50.030+00:00,37.009,142.693,10.0,4.7,mb,,129,3.6,1.01,us,usb000ru1d,1405687277627
2014-07-18T04:31:53.000+00:00,67.593,-161.997,21.7,3.7,ml,,,,0.82,ak,ak11329811,1405686874493
2014-07-18T04:29:35.000+00:00,67.617,-161.812,8.5,3.6,ml,,,,0.71,ak,ak11329808,1406324059667
2014-07-18T03:58:58.770+00:00,38.300,26.628,10.5,4.2,mb,,,,0.94,us,usb000ru16,1405684894072
2014-07-18T03:42:35.000+00:00,67.636,-161.857,16.4,3.5,ml,,,,0.65,ak,ak11329771,1406324076008
2014-07-18T03:33:48.200+00:00,18.882,-65.352,77.0,2.8,Md,7,252,0.6,0.15,pr,pr14199005,1405758552625
2014-07-18T03:29:05.000+00:00,19.390,-66.839,32.0,2.8,Md,3,349,1.0,0.09,pr,pr14199004,1405751760651
2014-07-18T03:17:22.000+00:00,59.825,-153.371,135.3,2.6,ml,,,,0.55,ak,ak11329741,1406324172848
2014-07-18T02:58:04.400+00:00,40.592,-124.097,18.2,2.8,Md,24,133,0.2,0.08,nc,nc72259386,1405842365154
2014-07-18T02:45:49.500+00:00,19.062,-65.409,12.0,3.0,Md,12,245,0.8,0.28,pr,pr14199001,1405741644601
2014-07-18T02:29:24.000+00:00,67.652,-161.672,7.0,3.0,ml,,,,0.65,ak,ak11329722,1406323995934
2014-07-18T02:16:10.000+00:00,67.610,-161.501,9.7,2.7,ml,,,,0.66,ak,ak11337511,1406324331801
2014-07-18T02:01:45.000+00:00,67.632,-161.830,21.2,4.2,ml,,,,0.68,ak,ak11329686,1406324156645
2014-07-18T02:00:44.000+00:00,67.602,-161.750,8.9,4.2,ml,,,,0.65,ak,ak11329682,1406323998900
2014-07-18T01:59:37.100+00:00,35.870,-97.317,4.6,2.9,ml,,58,,0.75,us,usb000ru0b,1405735690596
2014-07-18T01:37:28.390+00:00,36.133,-97.308,3.1,2.8,mb_lg,,31,0.3,0.37,us,usb000ru06,1405724787908
2014-07-18T01:22:39.610+00:00,38.456,144.417,21.3,4.3,mb,,140,3.7,1.03,us,usb000ru01,1405723840000
2014-07-18T01:04:57.630+00:00,35.369,-118.555,7.2,2.7,ml,52,49,0.1,0.16,ci,ci15527809,1405700074975
2014-07-18T00:58:43.000+00:00,51.796,178.389,107.3,2.8,ml,,,,0.45,ak,ak11329504,1406324089960
2014-07-17T23:54:28.000+00:00,62.363,-149.149,36.5,3.0,ml,,,,0.75,ak,ak11329459,1405646124401
2014-07-17T23:44:01.000+00:00,60.327,-140.295,13.9,2.6,ml,,,,0.72,ak,ak11329449,1406233841134
2014-07-17T23:31:52.710+00:00,43.789,-111.086,5.0,3.1,ml,,81,0.2,0.87,us,usb000rtz3,1406131432431
2014-07-17T23:31:25.000+00:00,19.789,-155.389,23.4,2.6,Ml,,76,0.1,0.11,hv,hv60733846,1405668848233
2014-07-17T22:53:30.897+00:00,41.943,-119.652,,2.6,ml,7,118,0.5,0.13,nn,nn00452320,1405666563406
2014-07-17T22:32:49.560+00:00,46.217,150.587,123.7,5.0,mb,,125,5.4,1.39,us,usb000rtyk,1405665318193
2014-07-17T22:32:32.000+00:00,60.350,-140.345,2.9,2.6,ml,,,,0.87,ak,ak11329361,1406233824575
2014-07-17T20:51:00.000+00:00,51.771,178.415,102.4,2.7,ml,,,,0.28,ak,ak11329251,1406234233295
2014-07-17T19:44:35.000+00:00,60.366,-140.269,5.0,3.1,ml,,,,0.87,ak,ak11329151,1406233831652
2014-07-17T18:45:04.000+00:00,60.374,-140.321,19.7,2.5,ml,,,,0.80,ak,ak11328839,1406233818744
2014-07-17T18:09:49.000+00:00,60.342,-140.314,1.4,2.6,ml,,,,0.76,ak,ak11328785,1406233801087
2014-07-17T18:08:38.050+00:00,-6.109,154.366,57.8,5.1,mb,,20,6.4,0.97,us,usb000rtu5,1405649467482
2014-07-17T17:45:33.000+00:00,65.153,-148.938,15.0,2.8,ml,,,,0.67,ak,ak11328768,1406233785364
2014-07-17T17:07:42.000+00:00,60.328,-140.284,1.4,3.2,ml,,,,0.90,ak,ak11328731,1405646284968
2014-07-17T16:08:00.000+00:00,60.311,-140.248,17.2,2.5,ml,,,,0.91,ak,ak11328694,1406233765672
2014-07-17T15:45:53.190+00:00,32.255,-115.322,20.5,3.1,ml,19,168,0.2,0.36,ci,ci15527633,1405691284000
2014-07-17T15:35:24.900+00:00,36.677,-98.214,5.0,2.5,ml,,102,,1.08,us,usb000rttd,1405690627000
2014-07-17T14:36:51.000+00:00,60.315,-140.346,10.0,2.6,ml,,,,0.94,ak,ak11328592,1406233731187
2014-07-17T14:25:01.000+00:00,60.361,-140.314,18.2,2.6,ml,,,,0.72,ak,ak11328564,1406234484301
2014-07-17T14:24:34.320+00:00,33.428,-116.425,13.9,3.4,ml,104,21,0.1,0.18,ci,ci15527617,1405826640280
2014-07-17T14:14:02.000+00:00,60.318,-140.308,16.1,2.7,ml,,,,0.79,ak,ak11328537,1406233712658
2014-07-17T13:55:55.370+00:00,-3.796,140.068,56.4,5.2,mb,,45,7.9,1.19,us,usb000rtr7,1405634316504
2014-07-17T13:29:18.000+00:00,51.181,-174.931,28.5,2.5,ml,,,,0.41,ak,ak11335874,1406234306580
2014-07-17T13:09:26.000+00:00,60.329,-140.349,1.2,3.6,ml,,,,0.88,ak,ak11328363,1406233842987
2014-07-17T12:17:08.000+00:00,60.335,-140.160,10.0,2.5,ml,,,,1.12,ak,ak11328222,1406233860710
2014-07-17T12:15:51.000+00:00,61.462,-141.648,10.8,3.0,ml,,,,0.89,ak,ak11328219,1405628314152
2014-07-17T12:14:16.150+00:00,14.590,-91.995,24.2,4.7,mb,,169,0.3,0.78,us,usb000rtpp,1405628251407
2014-07-17T12:09:09.000+00:00,60.382,-140.207,10.0,2.6,ml,,,,0.87,ak,ak11335813,1406234409051
2014-07-17T12:08:26.000+00:00,60.308,-140.373,6.0,3.1,ml,,,,0.97,ak,ak11328175,1406233866110
2014-07-17T12:05:46.000+00:00,60.391,-140.251,5.6,2.5,ml,,,,0.89,ak,ak11328156,1406233782394
2014-07-17T11:56:50.000+00:00,60.315,-140.290,8.3,2.8,ml,,,,0.60,ak,ak11335802,1406234468003
2014-07-17T11:54:50.000+00:00,60.360,-140.302,19.6,3.4,ml,,,,0.77,ak,ak11335801,1406234444998
2014-07-17T11:53:01.000+00:00,60.374,-140.331,11.6,4.9,ml,,,,0.72,ak,ak11335800,1406234288578
2014-07-17T11:49:33.000+00:00,60.349,-140.333,10.0,6.0,mb,,,,1.15,ak,ak11328120,1406233903242
2014-07-17T11:08:16.240+00:00,-21.593,-176.030,108.9,4.7,mb,,43,6.3,1.44,us,usb000rtp3,1405624251850
2014-07-17T10:40:43.260+00:00,37.102,-97.808,5.0,3.6,mb_lg,,35,0.1,0.49,us,usb000rtnr,1406227264823
2014-07-17T09:12:27.640+00:00,32.528,-109.062,5.0,3.0,ml,,72,1.1,1.29,us,usb000rtn9,1405660633958
2014-07-17T08:56:14.000+00:00,51.492,-178.412,25.6,2.5,ml,,,,0.45,ak,ak11328059,1406234212361
2014-07-17T08:45:56.000+00:00,52.657,-164.144,20.0,2.5,ml,,,,1.19,ak,ak11328044,1406233749545
2014-07-17T07:34:34.730+00:00,36.302,-97.574,5.9,2.5,mb_lg,,62,0.4,0.56,us,usb000rtmm,1405631304394
2014-07-17T06:40:35.000+00:00,51.902,178.245,127.7,2.7,ml,,,,0.51,ak,ak11327990,1406233812357
2014-07-17T06:11:51.000+00:00,22.098,121.494,10.0,5.1,mb,,95,0.8,0.96,us,usb000rtmc,1405590860994
2014-07-17T04:42:58.910+00:00,14.969,-60.510,53.4,4.4,mb,,109,0.7,0.81,us,usb000rtm0,1406010325689
2014-07-17T03:48:04.000+00:00,59.875,-153.406,137.0,3.1,ml,,,,0.74,ak,ak11327953,1406233659932
2014-07-17T03:14:49.000+00:00,53.751,-161.273,20.0,2.8,ml,,,,0.97,ak,ak11335731,1406234251113
2014-07-17T02:47:04.000+00:00,54.053,-163.488,41.5,2.8,ml,,,,0.65,ak,ak11327940,1406234194755
2014-07-17T01:01:29.600+00:00,19.343,-155.053,8.4,2.8,Ml,,184,0.1,0.09,hv,hv60733436,1405604651742
2014-07-17T00:42:43.660+00:00,53.451,161.620,35.0,4.4,mb,,112,1.8,1.24,us,usb000rtkp,1405586720988
2014-07-17T00:41:04.600+00:00,40.983,-123.914,,2.6,Md,21,148,0.2,0.30,nc,nc72258726,1405890219719
2014-07-17T00:09:58.600+00:00,35.860,-97.322,5.0,2.6,ml,,57,,0.40,us,usb000rtk5,1405806157000
2014-07-16T23:36:56.310+00:00,51.905,178.619,94.2,3.9,mb,,147,0.7,0.68,us,usb000rtjr,1405807330897
2014-07-16T23:02:13.500+00:00,35.524,-97.156,6.8,2.8,ml,,52,,0.19,us,usb000rtjj,1405581243118
2014-07-16T22:10:06.810+00:00,9.705,-83.639,13.0,4.4,mwr,,197,0.6,1.04,us,usb000rtm8,1405575711547
2014-07-16T21:15:43.820+00:00,32.086,-115.155,27.3,3.0,ml,12,247,0.2,0.24,ci,ci15527401,1405551578051
2014-07-16T21:10:45.620+00:00,51.356,179.340,75.0,4.1,mb,,122,0.0,0.62,us,usb000rtic,1405574041462
2014-07-16T20:03:54.000+00:00,60.219,-153.855,100.0,2.8,ml,,,,3.81,ak,ak11327647,1405569986820
2014-07-16T19:30:15.600+00:00,36.969,-121.456,5.2,2.8,Md,74,43,0.0,0.08,nc,nc72258416,1405625574479
2014-07-16T18:55:02.000+00:00,59.821,-152.545,61.0,2.5,ml,,,,0.56,ak,ak11327627,1405565854098
2014-07-16T18:24:18.240+00:00,-10.032,160.847,10.0,5.2,mwb,,59,1.1,0.65,us,usb000rtfq,1405564013064
2014-07-16T16:56:10.710+00:00,-10.036,160.798,19.9,5.2,mwb,,40,1.0,0.82,us,usb000rtf2,1405558718163
2014-07-16T16:52:34.000+00:00,51.820,178.360,102.6,2.5,ml,,,,0.51,ak,ak11327576,1405558516820
2014-07-16T15:47:11.000+00:00,60.379,-140.358,0.4,3.0,ml,42,65,,0.73,ak,ak11327523,1405554577562
2014-07-16T15:30:13.830+00:00,43.373,-126.893,27.1,4.6,mwr,,88,2.9,0.85,us,usb000rtdy,1405553566995
2014-07-16T13:29:51.070+00:00,-24.268,-64.906,50.3,4.0,mb,,88,4.0,0.70,us,usb000rtm5,1405574034304
2014-07-16T13:09:58.000+00:00,60.345,-140.319,5.0,3.1,ml,,,,0.86,ak,ak11327463,1405545396338
2014-07-16T11:11:16.120+00:00,-4.182,151.378,10.0,4.8,mb,,51,0.8,0.96,us,usb000rtdf,1405538133948
2014-07-16T10:58:27.460+00:00,-21.934,-175.543,23.8,5.3,mb,,43,7.3,0.78,us,usb000rtdb,1405548879000
2014-07-16T09:40:15.120+00:00,29.390,51.287,10.0,4.2,mb,,127,6.2,1.03,us,usb000rtd4,1405532566409
2014-07-16T09:18:06.340+00:00,36.786,-97.657,4.2,2.5,mb_lg,,64,0.3,0.57,us,usb000rtd2,1405559541140
2014-07-16T08:33:19.000+00:00,63.344,-149.377,95.0,3.0,ml,75,36,,0.68,ak,ak11327316,1405528628225
2014-07-16T07:34:31.000+00:00,51.709,178.018,120.4,2.9,ml,14,184,0.4,0.44,ak,ak11327283,1405532204782
2014-07-16T07:23:41.100+00:00,18.062,-66.376,7.0,2.7,Md,6,194,0.2,0.28,pr,pr14197002,1405497686713
2014-07-16T05:35:29.100+00:00,18.887,-65.828,46.0,2.9,Md,12,241,0.6,0.27,pr,pr14197001,1405517875867
2014-07-16T04:53:58.600+00:00,19.016,-65.360,19.0,3.1,Md,14,245,0.7,0.25,pr,pr14197000,1405489696654
2014-07-16T04:24:08.550+00:00,-20.494,168.863,9.3,5.1,mb,,105,2.7,1.36,us,usb000rtca,1405513598847
2014-07-16T04:06:36.900+00:00,37.217,86.016,14.3,4.0,mb,,122,7.8,0.48,us,usb000rtc6,1405512551539
2014-07-16T02:54:17.380+00:00,35.730,-97.181,5.9,2.5,mb_lg,,31,0.1,0.46,us,usb000rtc0,1405539372105
2014-07-16T02:48:13.710+00:00,-19.415,-177.773,520.4,4.3,mb,,121,4.3,1.04,us,usb000rtc1,1405507855631
2014-07-16T02:24:28.910+00:00,-17.894,-178.588,584.7,4.4,mb,,81,3.2,0.82,us,usb000rtbr,1405506426937
2014-07-16T02:08:57.470+00:00,12.200,-87.633,51.5,4.3,mb,,188,0.8,0.69,us,usb000rtbm,1405505489473
2014-07-16T00:28:54.950+00:00,62.554,-127.802,14.0,4.6,mb,,44,3.9,0.96,us,usb000rtbe,1405499513806
2014-07-16T00:20:08.620+00:00,62.566,-127.708,15.7,4.5,mb,,57,3.9,1.39,us,usb000rtba,1405498956442
2014-07-15T23:13:52.710+00:00,52.924,-173.218,195.0,4.2,mb,,141,0.9,0.70,us,usb000rtar,1405495013680
2014-07-15T22:40:20.000+00:00,18.508,-64.163,14.0,2.7,Md,5,353,0.4,0.23,pr,pr14196003,1405492966329
2014-07-15T22:29:03.400+00:00,44.587,-114.315,5.3,2.9,mc,48,54,0.0,0.22,mb,mb14983852,1405521556024
2014-07-15T22:13:20.530+00:00,53.033,-167.616,49.6,5.0,mb,,134,1.1,0.92,us,usb000rta6,1405491447321
2014-07-15T21:10:09.400+00:00,36.976,-121.461,4.3,3.3,Ml,38,58,0.0,0.06,nc,nc72257966,1405634102525
2014-07-15T21:09:34.900+00:00,36.975,-121.462,5.1,3.2,Ml,72,43,0.0,0.09,nc,nc72257961,1405633085235
2014-07-15T18:52:30.000+00:00,59.127,-152.346,84.0,2.6,ml,,,,0.36,ak,ak11326888,1405518559000
2014-07-15T16:39:00.330+00:00,-4.181,151.326,2.0,5.6,mwb,,34,0.8,0.75,us,usb000rt5g,1405722419000
2014-07-15T15:27:06.000+00:00,63.584,-147.516,0.4,2.6,ml,,,,0.69,ak,ak11326749,1405467222871
2014-07-15T15:23:43.050+00:00,28.911,142.131,6.6,5.0,mb,,127,1.8,0.62,us,usb000rt4z,1405466772383
2014-07-15T13:51:15.590+00:00,35.548,-97.242,6.1,2.7,ml,,,,0.24,us,usb000rtdv,1405521157330
2014-07-15T12:55:05.850+00:00,56.030,163.100,35.0,4.7,mb,,110,4.0,0.76,us,usb000rt43,1405457867909
2014-07-15T11:12:23.180+00:00,-19.941,-70.160,36.3,4.4,mb,,139,0.3,0.62,us,usb000rt3l,1405445150000
2014-07-15T10:56:54.000+00:00,51.811,178.390,107.0,2.5,ml,,,,0.37,ak,ak11326647,1405450765674
2014-07-15T10:47:54.330+00:00,36.731,-97.727,1.9,3.0,mb_lg,,72,0.3,0.42,us,usb000rt3f,1406033144704
2014-07-15T10:30:29.890+00:00,-4.144,151.371,10.0,5.8,mb,,35,0.8,1.06,us,usb000rt3b,1405537978000
2014-07-15T10:03:02.490+00:00,-4.310,151.485,10.0,4.7,mb,,58,0.7,0.83,us,usb000rt31,1405447538877
2014-07-15T09:44:58.850+00:00,-4.119,151.363,10.0,5.5,mb,,35,0.8,0.95,us,usb000rt2u,1405724424000
2014-07-15T09:42:56.100+00:00,36.269,-120.358,8.0,2.8,Md,48,112,0.0,0.09,nc,nc72257716,1405548551008
2014-07-15T09:08:41.040+00:00,35.556,-97.123,11.6,3.9,mb,,18,0.1,0.94,us,usb000rt2i,1406537755863
2014-07-15T07:19:17.640+00:00,35.530,-97.138,9.5,3.8,mb_lg,,27,0.1,0.49,us,usb000rt1u,1406032940273
2014-07-15T06:34:44.000+00:00,57.781,-156.202,121.7,3.5,ml,,,,0.72,ak,ak11326562,1405435348337
2014-07-15T06:07:14.190+00:00,33.592,-115.913,10.0,3.0,ml,79,66,0.0,0.19,ci,ci15526857,1405475442992
2014-07-15T05:48:11.200+00:00,52.051,160.682,10.0,4.9,mb,,149,1.6,0.87,us,usb000rt1l,1405432253884
2014-07-15T04:34:54.940+00:00,35.827,-119.845,3.7,2.7,md,50,220,0.2,0.13,nc,nc72257606,1405555624541
2014-07-15T02:38:00.240+00:00,-0.333,119.775,37.1,4.8,mb,,40,3.0,0.93,us,usb000rt0x,1405420984579
2014-07-15T02:34:34.000+00:00,51.782,178.427,97.1,2.7,ml,,,,0.45,ak,ak11326560,1405420633648
2014-07-15T00:20:14.000+00:00,51.788,178.264,127.7,2.6,ml,,,,0.35,ak,ak11326464,1405412561619
2014-07-14T23:14:30.800+00:00,19.586,-64.563,33.0,3.3,Md,9,317,1.2,0.25,pr,pr14195005,1405408630783
2014-07-14T22:39:35.464+00:00,41.879,-119.641,13.2,2.7,ml,3,129,0.5,0.04,nn,nn00451935,1405534045956
2014-07-14T22:35:06.600+00:00,44.096,-121.356,,2.5,Ml,,133,0.0,0.30,uw,uw60817807,1405533989611
2014-07-14T22:05:50.000+00:00,35.844,-119.780,4.4,2.7,Md,38,90,0.2,0.24,nc,nc72257396,1405578068867
2014-07-14T21:50:25.200+00:00,18.607,-65.690,75.0,2.6,Md,12,212,0.4,0.11,pr,pr14195004,1405403581511
2014-07-14T21:03:16.860+00:00,13.560,146.379,15.8,4.8,mb,,67,1.5,0.76,us,usb000rsy6,1405413263867
2014-07-14T20:50:05.460+00:00,35.825,-119.783,8.5,2.5,md,20,196,0.3,0.17,nc,nc72257371,1405574587470
2014-07-14T18:20:40.100+00:00,39.317,-123.227,6.4,2.5,Md,26,40,0.1,0.04,nc,nc72257306,1405475708285
2014-07-14T16:50:14.400+00:00,35.872,-97.309,5.1,3.3,ml,,59,,0.48,us,usb000rsug,1405434642171
2014-07-14T16:01:35.400+00:00,35.816,-97.415,4.3,2.8,ml,,55,,0.44,us,usb000rstu,1405434748209
2014-07-14T15:31:04.000+00:00,60.168,-153.891,100.0,2.9,ml,,,,2.81,ak,ak11325841,1405380820675
2014-07-14T14:50:59.740+00:00,-17.649,-178.439,529.7,4.7,mb,,74,3.3,0.80,us,usb000rssy,1405431090069
2014-07-14T11:24:39.290+00:00,-17.919,-73.421,33.2,5.5,mb,,138,3.0,1.11,us,usb000rss6,1405455464000
2014-07-14T10:49:10.670+00:00,35.349,-117.779,2.6,2.7,ml,50,34,0.2,0.13,ci,ci15526481,1405525272690
2014-07-14T10:37:59.000+00:00,51.732,178.432,98.0,2.5,ml,,,,0.41,ak,ak11325659,1405363315666
2014-07-14T08:40:55.310+00:00,5.697,126.473,42.3,4.9,mb,,62,1.6,0.91,us,usb000rsri,1405356216753
2014-07-14T08:17:23.000+00:00,19.752,-64.762,34.0,3.3,Md,4,331,1.4,0.28,pr,pr14195003,1405354804417
2014-07-14T08:15:10.900+00:00,18.770,-64.625,14.0,2.7,Md,4,288,0.4,0.20,pr,pr14195002,1405354669531
2014-07-14T08:00:00.590+00:00,5.681,126.570,44.9,6.3,mwc,,51,1.7,1.40,us,usb000rsr5,1405784963000
2014-07-14T07:29:12.790+00:00,41.976,-119.680,2.1,2.8,ml,3,154,0.5,0.04,nn,nn00451832,1405455509399
2014-07-14T07:15:51.100+00:00,36.713,-97.888,5.0,3.9,mwr,,88,,0.31,us,usb000rsqv,1406603207475
2014-07-14T06:40:03.500+00:00,19.176,-64.840,38.0,2.7,Md,4,317,0.8,0.23,pr,pr14195001,1405349049653
2014-07-14T06:25:34.500+00:00,19.670,-64.832,40.0,3.4,Md,16,277,1.3,0.34,pr,pr14195000,1405348090522
2014-07-14T06:04:10.000+00:00,61.559,-151.295,4.1,3.3,ml,,,,0.96,ak,ak11325471,1405346849827
2014-07-14T05:44:15.130+00:00,-26.707,-114.315,10.0,5.2,mb,,176,38.2,1.16,us,usb000rsqm,1405356906000
2014-07-14T05:05:04.110+00:00,-8.909,111.248,59.5,5.7,mb,,25,1.2,1.40,us,usb000rsqi,1406151129000
2014-07-14T04:39:08.740+00:00,-6.965,154.752,54.2,4.8,mb,,126,3.8,0.91,us,usb000rsqe,1405341725714
2014-07-14T03:18:18.310+00:00,-17.753,-176.649,305.3,4.4,mb,,54,6.0,0.81,us,usb000rsq6,1405337125646
2014-07-14T00:14:35.200+00:00,19.489,-155.126,12.6,2.5,Ml,,83,0.1,0.11,hv,hv60731816,1405528288840
2014-07-13T23:51:13.490+00:00,36.657,71.004,208.8,4.1,mb,,70,0.6,0.72,us,usb000rspq,1405324422098
2014-07-13T23:01:31.000+00:00,63.118,-151.515,10.2,3.3,ml,,,,1.49,ak,ak11325292,1405321443270
2014-07-13T21:57:30.200+00:00,19.430,-155.622,3.7,3.2,Ml,,115,0.0,0.10,hv,hv60731696,1405317608663
2014-07-13T21:47:25.660+00:00,33.497,-116.505,14.4,2.8,ml,96,25,0.1,0.18,ci,ci15526321,1405438848391
2014-07-13T21:35:44.600+00:00,18.830,-64.296,15.0,3.0,Md,13,317,0.5,0.10,pr,pr14194003,1405316292258
2014-07-13T20:54:14.510+00:00,-20.255,-70.351,32.5,5.5,mww,,89,0.3,1.23,us,usb000rsnz,1405452540082
2014-07-13T20:00:40.940+00:00,-4.139,151.191,35.0,5.6,mb,,59,6.6,1.02,us,usb000rsns,1406213406000
2014-07-13T19:24:21.000+00:00,60.695,-152.544,125.5,3.3,ml,,,,0.73,ak,ak11325015,1405308417730
2014-07-13T17:23:56.900+00:00,36.978,-121.465,4.9,3.4,Ml,75,40,0.0,0.08,nc,nc72253275,1405461206174
2014-07-13T17:19:25.600+00:00,17.963,-68.335,84.0,3.2,Md,7,266,0.5,0.28,pr,pr14194002,1405300956719
2014-07-13T16:23:43.660+00:00,36.469,67.658,26.1,5.0,mb,,68,2.2,0.80,us,usb000rsmy,1405320143935
2014-07-13T16:20:50.000+00:00,59.953,-152.653,94.5,2.7,ml,,,,0.62,ak,ak11324859,1405297405235
2014-07-13T15:22:02.750+00:00,-7.456,155.335,43.9,4.7,mb,,76,4.5,0.80,us,usb000rsn7,1405293869779
2014-07-13T15:18:56.000+00:00,60.876,-150.029,34.9,2.6,ml,,,,0.86,ak,ak11324799,1405268335036
2014-07-13T15:17:21.000+00:00,60.837,-150.113,43.9,2.5,ml,,,,0.86,ak,ak11324794,1405293587539
2014-07-13T15:07:00.470+00:00,-2.187,99.998,41.5,4.9,mb,,179,2.7,0.84,us,usb000rsm9,1405293065833
2014-07-13T14:51:02.200+00:00,35.859,-97.324,4.8,3.0,ml,,52,,0.43,us,usb000rsm4,1405519858516
2014-07-13T14:39:26.500+00:00,35.867,-97.316,4.8,2.8,ml,,58,,0.36,us,usb000rsm3,1405519650350
2014-07-13T14:08:19.470+00:00,2.010,128.304,103.6,4.6,mb,,140,1.5,0.89,us,usb000rsm1,1405289447633
2014-07-13T13:26:47.980+00:00,37.025,143.447,10.0,4.7,mb,,114,4.2,0.56,us,usb000rslu,1405286968202
2014-07-13T12:07:05.090+00:00,50.310,178.782,34.9,4.1,mb,,91,1.1,1.09,us,usb000rsll,1405282178400
2014-07-13T11:55:03.800+00:00,35.520,-97.157,6.7,2.5,ml,,90,,0.60,us,usb000rsus,1405497608077
2014-07-13T11:43:23.940+00:00,-20.782,-178.133,491.5,4.3,mb,,123,4.7,1.04,us,usb000rslb,1405280924398
2014-07-13T11:34:50.500+00:00,36.285,-96.955,5.0,2.7,ml,,90,,0.63,us,usb000rsv2,1405497234083
2014-07-13T11:18:09.380+00:00,40.820,21.165,10.0,4.5,mb,,69,0.2,1.48,us,usb000rsl5,1405397014000
2014-07-13T08:46:41.760+00:00,-24.072,-69.039,94.7,4.9,mb,,46,0.9,1.07,us,usb000rskf,1405916241000
2014-07-13T07:18:26.200+00:00,-30.748,-70.670,86.2,5.3,mb,,75,0.1,0.72,us,usb000rsk9,1405464355000
2014-07-13T07:03:53.950+00:00,35.592,-97.258,5.0,2.8,mb_lg,,36,0.0,0.42,us,usb000rsk5,1405281130600
2014-07-13T06:46:49.900+00:00,40.664,-122.450,26.0,2.6,Md,14,122,0.1,0.06,nc,nc72253090,1405569548104
2014-07-13T06:43:10.760+00:00,-34.857,-70.896,92.2,4.5,mb,,57,0.1,0.77,us,usb000rsjz,1405292253380
2014-07-13T06:08:05.279+00:00,41.952,-119.658,,2.7,ml,6,152,0.5,0.22,nn,nn00451779,1405330321873
2014-07-13T05:24:38.000+00:00,58.470,-156.188,100.0,2.9,ml,,,,1.63,ak,ak11324539,1405258026864
2014-07-13T05:20:50.020+00:00,35.528,-97.153,5.0,2.8,mb_lg,,52,0.1,0.58,us,usb000rsjp,1405420849257
2014-07-13T04:46:12.600+00:00,17.846,-66.761,4.0,2.6,Md,12,230,0.2,0.20,pr,pr14194000,1405255724435
2014-07-13T04:17:01.800+00:00,19.515,-156.517,40.8,3.2,ml,,284,0.5,1.02,us,usb000rsja,1405466130968
2014-07-13T03:19:46.000+00:00,36.159,-121.627,10.8,2.5,Md,36,155,0.0,0.09,nc,nc72252975,1405468925399
2014-07-13T03:16:50.930+00:00,-32.951,-71.466,44.0,5.0,mb,,64,0.4,0.89,us,usb000rsj2,1405456176000
2014-07-13T03:16:15.000+00:00,19.958,-155.242,15.6,2.9,Ml,,122,0.0,0.09,hv,hv60731231,1405465550000
2014-07-13T02:08:22.840+00:00,35.892,-97.272,5.0,2.7,mb_lg,,34,0.2,1.01,us,usb000rsiq,1405279130864
2014-07-13T01:57:44.600+00:00,35.871,-97.312,5.0,2.9,ml,,59,,0.61,us,usb000rsim,1405465188005
2014-07-13T00:57:57.020+00:00,35.907,-97.272,5.5,2.6,mb_lg,,55,0.2,0.75,us,usb000rsik,1405242034707
2014-07-13T00:43:44.510+00:00,37.445,-118.536,7.5,2.6,md,30,83,0.1,0.07,nc,nc72252900,1405571105987
2014-07-12T23:45:15.000+00:00,17.895,-63.936,44.0,2.8,Md,3,349,1.3,0.28,pr,pr14193010,1405237880273
2014-07-12T23:22:30.310+00:00,-18.596,169.323,264.4,4.9,mb,,29,3.7,0.77,us,usb000rsi5,1405236601586
2014-07-12T23:20:26.900+00:00,41.846,-119.630,0.1,2.6,Ml,,184,0.5,0.57,uw,uw60815772,1405311958752
2014-07-12T22:37:11.480+00:00,6.897,-73.053,152.3,4.4,mb,,48,1.0,0.79,us,usb000rshr,1405208228768
2014-07-12T21:51:46.000+00:00,18.849,-67.076,41.0,2.5,Md,11,256,0.4,0.27,pr,pr14193008,1405230867114
2014-07-12T21:11:27.910+00:00,24.202,-108.709,10.0,4.3,mb,,184,3.9,1.12,us,usb000rsgy,1405228445376
2014-07-12T19:58:39.000+00:00,12.804,-88.387,41.9,4.2,mb,,,,1.45,us,usb000rt36,1405420746941
2014-07-12T18:20:39.960+00:00,-55.294,-27.874,26.7,5.2,mb,,79,5.1,0.79,us,usb000rsf0,1406228395000
2014-07-12T18:06:22.700+00:00,19.046,-65.044,30.0,2.9,Md,15,256,0.7,0.07,pr,pr14193005,1405217362151
2014-07-12T17:59:57.000+00:00,67.593,-149.971,6.5,3.1,ml,,,,0.61,ak,ak11323934,1405216959749
2014-07-12T17:49:17.550+00:00,-55.385,-28.008,5.5,5.5,mwb,,47,5.0,0.73,us,usb000rsej,1406239849000
2014-07-12T17:34:27.400+00:00,35.856,-97.330,5.0,3.0,mb_lg,,29,0.1,1.16,us,usb000rseb,1405198418410
2014-07-12T17:11:47.000+00:00,35.874,-97.273,6.2,4.3,mb_lg,,29,0.2,0.69,us,usb000rsdy,1406670212821
2014-07-12T16:51:43.522+00:00,41.931,-119.664,4.7,3.0,ml,3,150,0.5,0.07,nn,nn00451743,1405379225977
2014-07-12T16:47:16.900+00:00,35.865,-97.322,4.0,2.9,ml,,54,,0.77,us,usb000rsee,1405212591603
2014-07-12T16:00:22.960+00:00,39.433,-123.538,4.9,2.8,md,24,128,0.0,0.11,nc,nc72252670,1405448709202
2014-07-12T14:38:56.110+00:00,37.144,-97.543,5.0,2.7,mb_lg,,141,0.1,0.70,us,usb000rsd2,1405342408078
2014-07-12T11:27:26.550+00:00,35.873,-97.305,5.0,3.2,mb_lg,,53,0.1,0.43,us,usb000rsc9,1405188488350
2014-07-12T11:15:33.000+00:00,61.173,-140.155,6.8,4.7,ml,,,,2.15,ak,ak11323596,1405192690606
2014-07-12T10:59:42.590+00:00,-31.781,-179.976,361.5,4.5,mb,,41,3.1,0.67,us,usb000rsbx,1405192532148
2014-07-12T10:32:23.000+00:00,57.619,-155.702,14.2,2.6,ml,,,,0.68,ak,ak11323587,1405190103670
2014-07-12T10:19:23.700+00:00,-8.581,109.239,35.0,4.3,mb,,92,1.4,1.05,us,usb000rsci,1405189596684
2014-07-12T08:22:25.000+00:00,61.159,-140.316,0.5,2.7,ml,,,,0.58,ak,ak11323535,1405182293437
2014-07-12T07:59:28.330+00:00,38.159,142.304,35.0,4.4,mb,,138,3.6,1.84,us,usb000rsbi,1405180921674
2014-07-12T07:16:33.420+00:00,34.274,-117.018,7.3,2.7,ml,101,38,0.0,0.14,ci,ci15525633,1405355468690
2014-07-12T07:12:53.180+00:00,32.581,-109.085,5.0,3.0,ml,,136,1.1,0.95,us,usb000rsb9,1405213497527
2014-07-12T06:55:28.980+00:00,-19.720,-69.173,111.1,4.5,mb,,49,0.1,1.04,us,usb000rsb8,1405177088105
2014-07-12T06:30:33.270+00:00,1.274,97.137,32.9,4.5,mb,,154,0.4,0.47,us,usb000rsb4,1405175595532
2014-07-12T06:10:06.000+00:00,60.832,-151.083,5.6,2.6,ml,,,,0.69,ak,ak11323486,1405148588216
2014-07-12T05:10:30.140+00:00,13.692,-91.595,43.6,4.3,mb,,150,0.8,1.18,us,usb000rsaz,1405170783158
2014-07-12T04:42:33.190+00:00,32.510,-109.171,5.0,2.9,ml,,138,1.2,1.45,us,usb000rsjg,1405228635536
2014-07-12T04:24:24.000+00:00,60.322,-153.200,24.2,2.5,ml,,,,0.71,ak,ak11323461,1405168024510
2014-07-12T04:04:18.600+00:00,17.976,-68.990,112.0,3.4,Md,12,317,0.8,0.28,pr,pr14193003,1405166814242
2014-07-12T02:48:58.960+00:00,32.555,-109.102,5.0,4.1,ml,,101,1.1,0.67,us,usb000rsah,1405198249077
2014-07-12T01:46:39.000+00:00,59.839,-151.845,35.4,2.5,ml,,,,0.45,ak,ak11323109,1405150290643
2014-07-12T01:30:30.200+00:00,19.011,-64.985,26.0,3.1,Md,8,256,0.7,0.20,pr,pr14193000,1405157668413
2014-07-12T00:48:54.000+00:00,67.747,-162.488,10.7,2.9,ml,,,,0.57,ak,ak11323098,1405155095108
2014-07-11T23:05:26.050+00:00,30.896,86.325,46.6,4.2,mb,,150,4.3,0.65,us,usb000rs8i,1405148883318
2014-07-11T22:12:13.000+00:00,51.884,178.406,110.3,3.0,ml,,,,0.29,ak,ak11323080,1406331818975
2014-07-11T21:02:27.800+00:00,36.677,-97.723,5.2,2.5,ml,,152,,0.94,us,usb000rs78,1405141494379
2014-07-11T19:59:14.650+00:00,37.162,142.217,19.9,4.6,mb,,126,3.3,0.73,us,usb000rs5j,1405174079641
2014-07-11T19:21:59.310+00:00,37.040,142.425,10.5,6.5,mww,,9,3.4,0.73,us,usb000rs50,1406161300225
2014-07-11T19:15:48.000+00:00,51.420,-177.488,17.8,2.8,ml,,,,0.26,ak,ak11323050,1406331821380
2014-07-11T18:36:14.040+00:00,15.716,-92.858,128.6,4.3,mb,,127,0.9,0.95,us,usb000rs3v,1405173448877
2014-07-11T17:42:27.000+00:00,62.850,-149.499,72.7,2.6,ml,,,,0.74,ak,ak11323039,1406331792923
2014-07-11T17:37:43.000+00:00,51.798,178.362,135.3,2.5,ml,,,,0.53,ak,ak11323036,1405129212805
2014-07-11T17:33:21.960+00:00,32.659,-109.130,5.0,3.6,mwr,,80,1.1,0.68,us,usb000rs34,1405172443325
2014-07-11T17:28:00.400+00:00,18.792,-64.728,18.0,2.9,Md,6,277,0.4,0.20,pr,pr14192003,1405172153000
2014-07-11T17:25:02.300+00:00,36.627,-116.936,4.6,3.4,ml,20,81,0.1,0.24,ci,ci15525449,1405171581000
2014-07-11T17:16:39.000+00:00,51.821,178.282,125.5,2.8,ml,,,,0.49,ak,ak11323034,1406331825403
2014-07-11T16:34:37.720+00:00,-15.201,-177.219,364.6,4.9,mb,,43,5.4,0.81,us,usb000rs2l,1405125439586
2014-07-11T14:11:30.600+00:00,36.296,-97.545,5.0,2.8,ml,,70,,0.63,us,usb000rs1d,1405116871768
2014-07-11T13:42:16.000+00:00,61.449,-150.949,70.5,3.6,ml,,,,0.70,ak,ak11323006,1406331848742
2014-07-11T13:11:46.030+00:00,26.299,125.801,117.5,5.3,mb,,33,2.3,1.11,us,usb000rs0m,1405153507447
2014-07-11T12:53:26.160+00:00,8.904,-77.885,31.7,4.4,mb,,91,1.9,0.90,us,usb000rs0d,1405088127306
2014-07-11T12:41:22.590+00:00,32.566,-109.154,5.0,3.5,ml,,81,1.2,0.98,us,usb000rs08,1405090924918
2014-07-11T12:17:05.650+00:00,36.543,-97.816,1.7,3.3,mb_lg,,66,0.1,0.38,us,usb000rs01,1405092273987
2014-07-11T12:14:34.900+00:00,36.002,-120.566,4.9,2.6,Md,66,43,0.0,0.08,nc,nc72252010,1405114867603
2014-07-11T11:54:30.060+00:00,49.106,-2.536,10.3,3.9,mb,,127,3.4,0.73,us,usb000rrzr,1406213232827
2014-07-11T11:28:08.000+00:00,51.932,-174.018,46.7,2.5,ml,,,,0.34,ak,ak11322982,1406331845922
2014-07-11T11:15:30.000+00:00,51.785,178.629,88.0,2.9,ml,,,,0.21,ak,ak11322980,1406331812276
2014-07-11T11:13:56.200+00:00,21.066,-155.898,34.5,3.1,Ml,,241,0.4,0.11,hv,hv60730086,1405112148341
2014-07-11T10:11:34.300+00:00,18.720,-65.409,49.0,2.5,Md,5,263,0.4,0.07,pr,pr14192001,1405102502169
2014-07-11T09:46:06.580+00:00,38.525,23.703,10.0,4.6,mb,,64,1.2,0.74,us,usb000rrzc,1405103126809
2014-07-11T09:30:06.770+00:00,-19.899,-174.420,35.0,4.9,mb,,122,6.5,0.63,us,usb000rrzb,1405099959845
2014-07-11T09:16:38.000+00:00,50.178,178.632,30.7,2.9,ml,,,,0.59,ak,ak11322978,1406331826702
2014-07-11T08:58:57.000+00:00,51.816,178.451,97.0,3.4,ml,,,,0.38,ak,ak11322973,1406331905463
2014-07-11T08:40:54.400+00:00,36.507,71.071,126.1,4.3,mb,,100,0.7,0.77,us,usb000rrz1,1405495827117
2014-07-11T08:38:19.810+00:00,32.489,-109.137,5.0,2.8,ml,,158,1.1,1.12,us,usb000rrz0,1405139555027
2014-07-11T07:31:13.000+00:00,51.310,-176.317,25.6,3.2,ml,,,,0.52,ak,ak11322968,1406331829567
2014-07-11T07:16:32.000+00:00,51.747,178.478,90.6,2.8,ml,,,,0.24,ak,ak11322965,1406331833643
2014-07-11T06:37:36.700+00:00,35.758,-119.774,23.5,3.2,Ml,55,61,0.2,0.15,nc,nc72251875,1405362019861
2014-07-11T06:15:55.670+00:00,32.641,-109.112,5.0,3.2,ml,,134,1.1,0.85,us,usb000rryq,1405184777040
2014-07-11T05:53:26.770+00:00,51.785,178.477,94.3,4.7,mb,,42,0.7,0.93,us,usb000rrym,1405109636191
2014-07-11T05:22:05.810+00:00,10.082,124.193,10.0,4.4,mb,,134,3.3,0.96,us,usb000rtmb,1406371267769
2014-07-11T04:58:28.000+00:00,67.662,-163.383,19.3,2.7,ml,,,,0.91,ak,ak11337999,1406331829474
2014-07-11T04:14:09.610+00:00,36.422,71.125,90.4,4.9,mb,,73,0.8,0.89,us,usb000rryf,1405081072626
2014-07-11T02:31:46.090+00:00,19.009,-69.264,10.0,4.2,mb,,120,0.2,0.91,us,usb000rry9,1405058704650
2014-07-11T02:18:07.000+00:00,51.889,178.317,131.5,2.6,ml,,,,0.39,ak,ak11322897,1406331837616
2014-07-11T00:35:43.500+00:00,19.418,-154.913,48.9,2.7,Ml,,220,0.0,0.10,hv,hv60729851,1405067984154
2014-07-11T00:07:54.000+00:00,54.690,-163.130,77.7,2.5,ml,,,,0.36,ak,ak11337981,1406331862280
2014-07-10T21:59:30.400+00:00,32.499,-109.132,5.0,3.6,ml,,82,1.1,0.87,us,usb000rrqt,1405107088804
2014-07-10T21:53:59.250+00:00,17.759,40.112,14.9,4.5,mb,,85,6.7,0.83,us,usb000rrqs,1405058225667
2014-07-10T20:54:49.920+00:00,34.036,-117.159,7.6,2.9,ml,35,37,0.0,0.19,ci,ci15524921,1405099222404
2014-07-10T20:54:42.070+00:00,34.035,-117.158,8.9,2.8,ml,97,23,0.0,0.14,ci,ci15524913,1405044038713
2014-07-10T20:41:43.650+00:00,33.505,-116.507,15.4,3.2,ml,106,26,0.1,0.19,ci,ci15524873,1405608119683
2014-07-10T20:30:28.000+00:00,19.337,-155.097,8.8,2.8,Ml,,295,0.3,0.13,hv,hv60236383,1405034629182
2014-07-10T20:19:20.000+00:00,62.272,-150.397,23.9,2.5,ml,,,,0.73,ak,ak11322613,1405052507568
2014-07-10T19:24:44.400+00:00,-7.358,156.237,59.8,5.0,mb,,42,4.2,0.58,us,usb000rrmk,1405049234443
2014-07-10T18:22:39.160+00:00,47.259,-66.968,6.6,2.8,mb_lg,,87,0.6,0.39,us,usb000rrzn,1405318194179
2014-07-10T18:03:19.600+00:00,18.173,-67.376,18.0,3.0,Md,25,166,0.2,0.28,pr,pr14191005,1405044351888
2014-07-10T18:01:22.900+00:00,44.563,-114.299,7.0,2.7,mc,32,72,0.0,0.19,mb,mb14124003,1405025838827
2014-07-10T17:48:49.000+00:00,40.462,-124.699,18.2,2.8,Md,40,241,0.4,0.10,nc,nc72251555,1405046526781
2014-07-10T12:55:00.300+00:00,14.993,-61.440,167.0,4.4,mb,,103,0.4,1.10,us,usb000rrim,1405028612405
2014-07-10T11:23:19.100+00:00,18.106,-68.246,68.0,3.3,Md,10,245,0.4,0.40,pr,pr14191004,1405020356407
2014-07-10T10:47:22.100+00:00,19.138,-64.249,24.0,3.1,Md,10,317,0.8,0.27,pr,pr14191001,1405018352229
2014-07-10T10:37:14.370+00:00,34.273,-117.018,7.4,2.5,ml,103,38,0.0,0.14,ci,ci15524689,1405017584573
2014-07-10T10:36:01.200+00:00,19.077,-64.341,30.0,2.9,Md,13,310,0.7,0.23,pr,pr14191000,1405017512242
2014-07-10T08:58:57.140+00:00,36.795,140.440,30.8,4.7,mb,,113,1.8,1.02,us,usb000rrhw,1406161636685
2014-07-10T08:37:17.000+00:00,61.514,-141.171,,2.5,ml,,,,0.59,ak,ak11322439,1405010387934
2014-07-10T07:58:06.590+00:00,36.119,30.183,10.0,4.3,mb,,144,0.7,1.08,us,usb000rrhk,1405008111464
2014-07-10T07:16:19.140+00:00,-19.973,-175.552,235.3,5.2,mb,,39,5.4,1.25,us,usb000rrhg,1405005528977
2014-07-10T07:09:47.800+00:00,38.818,-122.820,2.9,2.7,Md,57,29,0.0,0.04,nc,nc72251355,1405111511216
2014-07-10T05:35:47.130+00:00,36.826,-97.962,1.5,2.7,mb_lg,,83,0.3,0.54,us,usb000rrh4,1404993324759
2014-07-10T02:59:50.050+00:00,10.227,-85.221,42.4,4.3,mb,,176,0.3,0.88,us,usb000rrgd,1405560596766
2014-07-10T01:06:07.000+00:00,59.964,-151.782,35.2,2.5,ml,,,,0.70,ak,ak11322227,1404983362083
2014-07-10T00:40:12.560+00:00,-11.638,164.839,10.0,4.6,mb,,56,4.4,0.50,us,usb000ruag,1405815647000
2014-07-10T00:23:51.110+00:00,-29.255,-176.728,10.0,4.5,mb,,197,1.1,0.64,us,usb000ruaf,1405813690000
2014-07-10T00:06:25.700+00:00,-29.834,-177.027,10.0,4.6,mb,,191,1.0,0.97,us,usb000ruae,1405812647000
2014-07-10T00:02:16.000+00:00,58.350,-154.423,100.0,2.5,ml,,,,0.93,ak,ak11322216,1404979489879
2014-07-09T23:45:03.810+00:00,40.463,26.224,18.0,4.2,mb,,46,0.5,1.02,us,usb000rrfa,1404957408367
2014-07-09T22:37:58.000+00:00,58.175,-151.468,34.8,3.1,ml,,,,0.68,ak,ak11322149,1404974431016
2014-07-09T22:29:23.040+00:00,-41.003,44.567,15.6,4.6,mb,,53,7.6,0.35,us,usb000rucm,1405811653922
2014-07-09T21:48:04.810+00:00,33.251,-115.982,2.9,3.2,ml,72,44,0.0,0.19,ci,ci15524489,1405033519389
2014-07-09T21:34:08.000+00:00,64.676,-150.149,1.1,2.5,ml,,,,1.02,ak,ak11322096,1404970687801
2014-07-09T18:36:23.080+00:00,36.888,-3.922,62.2,4.2,mb,,77,0.2,0.51,us,usb000rrbl,1404969492398
2014-07-09T17:59:37.500+00:00,19.549,-65.286,90.0,3.3,Md,8,292,1.2,0.18,pr,pr14190005,1404957724504
2014-07-09T17:58:11.880+00:00,-62.107,164.899,10.0,5.5,mb,,102,8.2,0.88,us,usb000rrb8,1406311111000
2014-07-09T17:41:41.400+00:00,19.469,-65.322,92.0,3.4,Md,5,274,1.2,0.11,pr,pr14190004,1404956652724
2014-07-09T17:19:39.300+00:00,-16.902,-71.818,49.6,4.9,mb,,132,2.0,1.12,us,usb000rraf,1404928424425
2014-07-09T16:25:26.500+00:00,35.882,-97.266,5.2,2.5,ml,,64,,0.40,us,usb000rrac,1404952077944
2014-07-09T15:17:21.950+00:00,-6.541,147.186,86.6,4.7,mb,,67,2.8,0.42,us,usb000rr92,1404947994856
2014-07-09T13:35:16.650+00:00,55.062,165.301,35.6,4.9,mb,,69,4.4,0.69,us,usb000rr8k,1404944389834
2014-07-09T11:14:10.560+00:00,-25.949,179.577,512.0,4.7,mb,,65,8.3,0.65,us,usb000rr87,1404933411887
2014-07-09T10:08:42.820+00:00,14.797,-92.500,86.5,4.3,mb,,145,1.5,0.69,us,usb000rr7w,1404916246448
2014-07-09T09:07:54.870+00:00,14.861,-92.502,67.8,4.2,mb,,175,1.5,0.99,us,usb000rr7t,1404925828201
2014-07-09T08:33:55.960+00:00,-19.992,-177.800,567.8,4.8,mb,,101,4.5,0.84,us,usb000rr7k,1404923794591
2014-07-09T08:15:21.020+00:00,32.577,-109.092,5.0,3.6,mwr,,55,1.1,0.81,us,usb000rr77,1404955089697
2014-07-09T08:12:34.170+00:00,-55.253,-28.312,10.0,4.8,mb,,117,4.8,0.56,us,usb000rr7d,1404922711422
2014-07-09T07:04:47.700+00:00,36.434,-116.933,8.7,3.6,ml,17,61,0.1,0.16,ci,ci15524177,1405126396373
2014-07-09T06:42:39.800+00:00,35.663,-121.063,5.5,2.6,Md,63,104,0.1,0.08,nc,nc72250745,1404958446948
2014-07-09T06:32:56.000+00:00,59.757,-152.792,4.9,2.6,ml,,,,0.78,ak,ak11321630,1404916524364
2014-07-09T06:03:08.240+00:00,-9.652,111.561,36.7,4.7,mb,,63,2.0,0.74,us,usb000rr6k,1404914734476
2014-07-09T05:27:32.600+00:00,20.050,-155.472,50.0,2.5,Ml,,180,0.2,0.11,hv,hv60728816,1404935568090
2014-07-09T03:23:17.600+00:00,17.949,-68.153,101.0,2.9,Md,6,248,0.6,0.28,pr,pr14190002,1404905155473
2014-07-09T02:22:48.000+00:00,68.705,-146.747,17.1,2.8,ml,,,,0.57,ak,ak11321576,1404901516929
2014-07-09T02:10:04.290+00:00,37.098,-97.774,1.2,3.4,mb_lg,,88,0.1,0.54,us,usb000rr5h,1404959550457
2014-07-09T01:45:32.700+00:00,36.555,-121.152,6.5,2.8,Md,53,32,0.0,0.06,nc,nc72250655,1404935646084
2014-07-09T01:44:43.100+00:00,36.555,-121.152,6.9,2.9,Md,59,32,0.0,0.08,nc,nc72250650,1404933847684
2014-07-09T00:14:35.620+00:00,34.089,-97.418,5.0,2.7,mb_lg,,51,0.6,0.80,us,usb000rr53,1404893848237
2014-07-09T00:01:30.270+00:00,-7.079,104.708,22.6,5.1,mb,,74,3.1,1.10,us,usb000rr51,1404956406000
2014-07-08T23:41:45.000+00:00,58.069,-156.817,,2.5,ml,,,,0.75,ak,ak11321538,1404891867982
2014-07-08T22:57:14.080+00:00,29.859,-116.381,10.0,4.2,mb,,199,2.8,1.16,us,usb000rr4r,1404889347786
2014-07-08T22:56:12.600+00:00,20.080,-155.458,2.2,2.8,Ml,,194,0.2,0.18,hv,hv60728511,1404937479108
2014-07-08T21:52:49.170+00:00,39.326,78.168,15.5,5.0,mb,,66,3.1,1.03,us,usb000rr42,1404885324470
2014-07-08T20:10:00.990+00:00,-3.324,143.308,16.7,5.4,mb,,15,7.2,0.93,us,usb000rr27,1404926657551
2014-07-08T19:56:06.030+00:00,-19.321,-69.468,98.3,4.0,ml,,96,0.2,0.72,us,usb000rr20,1404924301336
2014-07-08T19:38:50.600+00:00,41.512,-108.831,-3.3,3.0,Ml,,104,1.1,0.28,uu,uu60076732,1405007840441
2014-07-08T19:29:35.000+00:00,51.914,178.433,126.9,2.6,ml,,,,0.36,us,usb000rr4x,1404922707862
2014-07-08T19:17:26.600+00:00,35.582,-97.283,4.4,2.9,ml,,52,,0.82,us,usb000rr2b,1404920482019
2014-07-08T18:55:56.360+00:00,12.147,-87.747,71.0,4.2,mb,,193,0.9,0.71,us,usc000rrt9,1404919213658
2014-07-08T18:42:04.700+00:00,18.535,-65.016,40.0,2.6,Md,3,270,0.2,0.20,pr,pr14189006,1404873872402
2014-07-08T18:18:43.370+00:00,36.594,77.308,87.1,4.5,mb,,43,4.4,0.89,us,usc000rrsm,1404916818603
2014-07-08T17:41:50.900+00:00,34.065,-97.471,5.0,2.9,ml,,136,,1.34,us,usc000rrs3,1404919495597
2014-07-08T17:31:16.340+00:00,4.862,96.112,8.0,4.7,mb,,82,0.9,1.38,us,usc000rrrt,1404914474533
2014-07-08T16:20:21.050+00:00,32.885,-115.901,10.0,2.5,ml,50,38,0.1,0.28,ci,ci15523689,1404865375638
2014-07-08T16:04:20.000+00:00,-20.777,-70.521,37.9,4.9,mb,,,,1.28,us,usc000rrr0,1405029135252
2014-07-08T15:49:40.000+00:00,-21.262,-68.909,126.9,4.5,mb,,,,0.86,us,usc000rrqs,1405029889458
2014-07-08T15:46:57.490+00:00,50.974,178.585,164.2,4.2,mb,,215,0.6,0.69,us,usc000rrqq,1405030372129
2014-07-08T15:35:40.970+00:00,36.258,73.972,66.5,4.8,mb,,50,2.7,0.70,us,usc000rrqp,1404842771438
2014-07-08T15:08:33.600+00:00,36.758,-98.051,5.0,2.8,ml,,99,,0.55,us,usc000rrqu,1404861695828
2014-07-08T14:43:31.580+00:00,51.939,178.447,113.3,4.8,mb,,31,0.8,0.74,us,usc000rrq3,1404859569138
2014-07-08T14:35:40.330+00:00,-33.072,-178.507,10.0,4.9,mb,,68,3.8,0.60,us,usc000rrq2,1404859135411
2014-07-08T13:43:02.000+00:00,57.702,-142.800,1.9,3.0,ml,,,,0.80,ak,ak11320817,1404855944329
2014-07-08T13:41:28.900+00:00,-5.547,147.311,191.7,4.3,mb,,62,3.8,0.85,us,usc000rrmx,1404855838343
2014-07-08T13:33:31.860+00:00,-20.616,-178.290,576.4,4.6,mb,,68,4.5,0.73,us,usc000rrmv,1404855463066
2014-07-08T13:25:26.360+00:00,-33.917,-72.410,14.3,4.8,mb,,140,1.2,0.53,us,usc000rrmp,1405026229044
2014-07-08T12:56:26.740+00:00,-17.617,168.359,114.0,6.3,mwp,,56,2.4,0.88,us,usc000rrmg,1406317449000
2014-07-08T12:39:21.080+00:00,33.875,-119.413,15.4,2.6,ml,31,94,0.2,0.40,ci,ci15523569,1404892053598
2014-07-08T12:31:46.080+00:00,33.162,-115.647,1.9,3.2,ml,61,39,0.0,0.23,ci,ci15523545,1404836426967
2014-07-08T11:38:17.200+00:00,18.632,-63.714,12.0,3.1,Md,6,353,0.9,0.17,pr,pr14189004,1404848448265
2014-07-08T11:10:25.550+00:00,-17.578,-174.688,157.7,4.4,mb,,64,4.6,0.75,us,usc000rrln,1404846779359
2014-07-08T09:05:23.110+00:00,42.681,141.411,10.0,5.5,mwb,,59,1.5,1.39,us,usc000rrl0,1404905754500
2014-07-08T09:01:29.700+00:00,36.695,-121.327,4.6,3.1,Ml,64,29,0.0,0.06,nc,nc72249790,1404859267215
2014-07-08T08:18:13.290+00:00,37.652,-118.851,7.2,2.7,md,16,91,0.0,0.04,nc,nc72249590,1404942669128
2014-07-08T08:17:47.100+00:00,36.696,-121.329,5.1,3.2,Ml,64,29,0.0,0.05,nc,nc72249575,1406720896000
2014-07-08T08:16:45.800+00:00,18.901,-65.362,5.0,2.8,Md,5,284,0.6,0.15,pr,pr14189003,1406720618000
2014-07-08T08:15:02.300+00:00,18.918,-67.508,120.0,2.9,Md,6,227,0.8,0.34,pr,pr14189002,1406720459000
2014-07-08T07:44:10.280+00:00,-16.666,-177.238,408.1,4.2,mb,,117,4.6,0.83,us,usb000rv5h,1406720323000
2014-07-08T07:30:59.180+00:00,51.554,179.935,6.6,2.8,ml,,,,0.90,us,usb000ry2l,1406719960000
2014-07-08T07:28:57.060+00:00,-1.175,-77.201,10.0,4.4,mb,,84,3.4,1.45,us,usb000rv6k,1406719811000
2014-07-08T07:18:03.400+00:00,18.551,-66.940,18.0,2.9,Md,13,216,0.2,0.20,pr,pr14189001,1406719098000
2014-07-08T06:25:51.320+00:00,34.277,-117.024,7.4,2.6,ml,97,42,0.0,0.14,ci,ci15523409,1404837767269
2014-07-08T05:31:15.200+00:00,36.768,-121.478,7.0,3.2,Ml,72,29,0.0,0.13,nc,nc72249120,1404882074511
2014-07-08T04:33:33.130+00:00,27.742,142.848,29.7,4.8,mb,,126,0.9,0.75,us,usc000rrj2,1404823039941
2014-07-08T02:13:07.770+00:00,-59.247,148.879,10.0,4.9,mb,,120,16.4,1.06,us,usc000rrim,1404814536624
2014-07-08T01:23:23.220+00:00,-7.069,129.934,132.3,5.0,mb,,70,1.6,1.26,us,usc000rrid,1404811633903
2014-07-08T00:16:47.574+00:00,39.199,-119.730,9.7,3.2,ml,35,64,0.0,0.16,nn,nn00451213,1405209941336
2014-07-07T23:06:05.110+00:00,23.337,122.374,10.0,5.0,mb,,107,1.0,0.84,us,usc000rrhb,1404803316682
2014-07-07T23:02:36.100+00:00,-49.262,164.724,24.8,4.4,mb,,165,3.4,1.16,us,usc000rrha,1404803141856
2014-07-07T22:19:38.410+00:00,34.034,-117.157,8.7,2.5,ml,96,35,0.0,0.15,ci,ci15523137,1405008103902
2014-07-07T22:04:24.000+00:00,60.461,-151.451,43.1,2.7,ml,,,,0.67,ak,ak11320303,1404799613672
2014-07-07T21:49:01.200+00:00,35.569,75.104,48.7,4.3,mb,,83,2.4,0.61,us,usc000rrfn,1405233630728
2014-07-07T20:48:48.480+00:00,53.893,-160.912,10.0,4.8,mb,,159,1.5,0.88,us,usc000rre6,1404795399810
2014-07-07T18:04:35.730+00:00,-5.210,131.683,59.7,5.0,mb,,56,2.3,0.77,us,usc000rrau,1404862275562
2014-07-07T17:45:12.900+00:00,34.277,-117.025,8.2,2.5,ml,89,39,0.0,0.15,ci,ci15523049,1404772728896
2014-07-07T15:50:07.890+00:00,47.481,151.044,85.9,4.5,mb,,160,6.8,0.75,us,usc000rr93,1404777153465
2014-07-07T15:48:39.700+00:00,18.443,-64.109,47.0,2.7,Md,4,349,0.5,0.02,pr,pr14188010,1404777131147
2014-07-07T15:09:25.710+00:00,-24.087,-67.494,227.7,4.3,mb,,130,2.0,0.48,us,usc000rr8g,1404774895172
2014-07-07T14:38:21.500+00:00,34.070,-97.475,7.4,3.2,ml,,136,,0.55,us,usc000rr8a,1404771997464
2014-07-07T14:02:30.700+00:00,19.415,-155.397,10.5,2.5,Ml,,61,0.1,0.08,hv,hv60727266,1405024961000
2014-07-07T13:59:52.050+00:00,34.087,-97.488,7.4,2.5,ml,,,,0.49,us,usb000rrne,1405024530831
2014-07-07T13:59:40.800+00:00,36.211,-97.549,5.0,2.5,ml,,47,,0.39,us,usc000rr7z,1405023746687
2014-07-07T13:48:09.800+00:00,36.091,-97.015,5.0,2.6,ml,,46,,0.55,us,usb000rr6h,1405023663852
2014-07-07T13:28:25.600+00:00,37.652,-118.852,7.2,2.5,Md,28,90,0.0,0.03,nc,nc72251726,1405016045623
2014-07-07T13:23:37.480+00:00,-11.352,161.331,40.0,4.7,mb,,52,2.3,0.71,us,usc000rr81,1404768380074
2014-07-07T12:48:09.600+00:00,19.463,-65.656,54.0,3.1,Md,3,331,1.2,0.15,pr,pr14188009,1404766237560
2014-07-07T12:46:01.200+00:00,37.653,-118.853,7.3,2.6,Md,28,68,0.0,0.03,nc,nc72251611,1404963847116
2014-07-07T12:32:08.100+00:00,37.655,-118.852,7.6,2.6,Md,29,94,0.0,0.03,nc,nc72251536,1404871564926
2014-07-07T12:27:11.620+00:00,37.649,-118.851,7.6,2.9,md,24,112,0.0,0.04,nc,nc72251511,1404850145368
2014-07-07T11:23:55.430+00:00,14.742,-92.409,60.0,6.9,mww,,30,0.7,1.16,us,usc000rr6a,1406004038547
2014-07-07T10:29:56.200+00:00,37.652,-118.853,7.8,2.8,Ml,29,94,0.0,0.04,nc,nc72251181,1404937389414
2014-07-07T10:07:13.500+00:00,19.167,-67.977,64.0,3.9,Md,26,248,0.8,0.36,pr,pr14188004,1404756826656
2014-07-07T10:01:16.900+00:00,19.167,-67.981,65.0,2.9,Md,7,259,0.8,0.60,pr,pr14188008,1404756409026
2014-07-07T09:20:48.900+00:00,19.215,-67.965,24.0,3.3,Md,20,252,0.8,0.28,pr,pr14188006,1404753890992
2014-07-07T09:15:28.710+00:00,-7.318,123.725,551.6,5.2,mb,,30,2.0,0.98,us,usc000rr4d,1404753485830
2014-07-07T08:51:05.540+00:00,34.276,-117.026,8.6,3.0,ml,126,39,0.0,0.16,ci,ci15522785,1404809548056
2014-07-07T07:44:15.420+00:00,36.684,-98.094,11.1,3.0,mb_lg,,57,0.2,0.95,us,usc000rr3x,1404748015990
2014-07-07T07:13:07.000+00:00,19.628,-68.469,93.0,3.7,Md,17,324,1.7,0.36,pr,pr14188005,1404746212863
2014-07-07T06:25:17.200+00:00,37.651,-118.852,7.5,2.7,Md,30,115,0.0,0.04,nc,nc72250641,1404953225879
2014-07-07T05:56:16.500+00:00,44.090,-114.552,10.7,2.8,mc,34,108,0.4,0.22,mb,mb14584805,1404753043219
2014-07-07T05:49:08.600+00:00,18.909,-66.876,5.0,2.6,Md,4,342,0.5,0.15,pr,pr14188003,1404741095157
2014-07-07T03:56:01.990+00:00,36.023,-97.099,8.1,2.6,mb_lg,,51,0.3,0.50,us,usc000rr3k,1404790529588
2014-07-07T03:52:09.910+00:00,36.845,-98.081,2.5,2.5,mb_lg,,52,0.3,0.61,us,usc000rr39,1404734216786
2014-07-07T03:27:10.200+00:00,19.174,-67.667,20.0,2.6,Md,5,274,0.9,0.05,pr,pr14188000,1404756823133
2014-07-07T02:40:41.760+00:00,42.037,142.672,81.7,4.5,mb,,120,0.4,0.47,us,usc000rr31,1404724533126
2014-07-07T01:37:10.390+00:00,-15.589,-71.376,157.2,4.6,mb,,120,2.9,1.12,us,usc000rr2r,1404725978786
2014-07-07T01:13:31.000+00:00,52.846,-162.662,118.2,2.7,ml,,,,0.40,ak,ak11319334,1404724573337
2014-07-07T00:38:16.000+00:00,36.089,-97.016,4.1,2.5,ml,,73,,0.53,us,usc000rraj,1404884042475
2014-07-06T22:11:34.590+00:00,-20.983,174.174,44.0,4.8,mb,,119,4.9,0.97,us,usc000rr1y,1404751010000
2014-07-06T19:28:40.680+00:00,39.080,142.395,66.7,4.4,mb,,189,3.0,0.55,us,usc000rr0x,1404703883625
2014-07-06T19:21:19.000+00:00,52.501,-162.378,11.2,2.9,ml,,,,0.54,ak,ak11319090,1404706946140
2014-07-06T18:54:10.000+00:00,53.434,-166.695,67.2,3.0,ml,,,,0.40,ak,ak11319075,1404701809116
2014-07-06T17:08:38.000+00:00,-10.339,-11.850,10.0,4.9,mb,,132,18.3,0.69,us,usc000rr02,1404695465110
2014-07-06T17:05:21.000+00:00,60.652,-151.199,72.5,2.5,ml,,,,0.88,ak,ak11318964,1404695274598
2014-07-06T16:19:27.480+00:00,47.697,147.534,402.5,4.4,mb,,93,3.3,0.70,us,usc000rqzl,1404912316074
2014-07-06T16:07:54.960+00:00,3.630,122.875,546.6,4.7,mb,,52,4.4,0.60,us,usc000rqzg,1404691820939
2014-07-06T15:54:12.400+00:00,44.592,-110.721,9.4,2.5,Ml,,65,0.1,0.16,uu,uu60076177,1405022942000
2014-07-06T15:46:12.400+00:00,44.584,-110.719,-0.1,2.5,Ml,,79,0.1,0.11,uu,uu60076142,1405022357000
2014-07-06T15:43:56.800+00:00,36.754,-98.042,5.0,2.8,ml,,98,,0.55,us,usb000rrkc,1405018346681
2014-07-06T15:37:43.030+00:00,-19.896,-177.746,552.7,5.0,mb,,75,4.5,0.61,us,usc000rqyz,1404690019683
2014-07-06T15:22:05.600+00:00,36.727,-97.893,5.0,3.1,ml,,89,,0.51,us,usc000rqyv,1404912607157
2014-07-06T14:48:14.140+00:00,30.566,80.265,75.5,4.2,mb,,168,6.7,1.05,us,usc000rqyt,1404687055294
2014-07-06T13:26:25.700+00:00,11.872,-87.146,38.7,4.3,mb,,186,0.8,0.60,us,usc000rqyr,1404682137971
2014-07-06T12:43:26.300+00:00,18.196,-67.695,93.0,3.1,Md,13,184,0.3,0.28,pr,pr14187008,1406718933000
2014-07-06T12:22:34.640+00:00,-18.427,-69.686,132.2,4.1,mb,,74,0.6,1.17,us,usc000rqzx,1406033786000
2014-07-06T12:13:38.120+00:00,-25.170,-175.109,29.6,4.6,mb,,100,4.8,1.39,us,usb000rv1g,1406718832316
2014-07-06T11:42:45.170+00:00,10.334,-85.116,68.8,5.0,mwr,,68,0.2,1.42,us,usc000rqyh,1406033658575
2014-07-06T11:36:58.000+00:00,63.285,-151.132,18.4,2.8,ml,,,,0.65,ak,ak11318763,1406718321000
2014-07-06T11:32:04.160+00:00,-55.372,-28.056,10.0,4.1,mb,,96,5.0,0.26,us,usb000rv24,1406718016000
2014-07-06T10:24:00.060+00:00,-13.336,167.281,195.4,4.2,mb,,164,2.1,0.88,us,usb000rv1m,1406712682528
2014-07-06T10:15:52.000+00:00,19.190,-104.540,54.0,4.0,mb,,,,1.35,us,usc000rqy2,1406720950000
2014-07-06T10:13:37.230+00:00,-15.575,167.413,57.3,4.7,mb,,75,0.2,1.13,us,usc000rqy3,1406032626000
2014-07-06T10:07:54.700+00:00,18.628,-64.305,20.0,2.8,Md,7,335,0.4,0.10,pr,pr14187006,1406712316000
2014-07-06T09:36:14.320+00:00,-29.735,-177.051,7.8,4.4,mb,,199,0.9,1.44,us,usb000rv1e,1406712118000
2014-07-06T08:44:48.500+00:00,18.859,-64.346,15.0,2.6,Md,4,331,0.5,0.17,pr,pr14187005,1404665249726
2014-07-06T08:26:20.000+00:00,18.704,-64.950,59.0,2.6,Md,5,245,0.4,0.09,pr,pr14187007,1404664142101
2014-07-06T08:19:30.300+00:00,19.119,-66.790,23.0,3.2,Md,27,216,0.7,0.25,pr,pr14187004,1404663765951
2014-07-06T06:33:45.230+00:00,12.728,-88.278,68.4,4.2,mb,,87,1.2,0.73,us,usc000rqxf,1404657380414
2014-07-06T05:47:43.400+00:00,12.814,-90.392,35.0,4.2,mb,,211,1.4,1.07,us,usc000rqxe,1404654616333
2014-07-06T05:44:45.400+00:00,18.872,-64.357,5.0,2.8,Md,13,299,0.5,0.28,pr,pr14187003,1404654431224
2014-07-06T05:21:02.260+00:00,-19.036,-172.540,34.6,4.7,mb,,125,5.2,0.68,us,usc000rqx9,1404653011323
2014-07-06T04:24:56.520+00:00,32.531,-109.162,5.0,3.5,ml,,101,1.2,0.65,us,usc000rqwx,1404919398378
2014-07-06T04:20:22.770+00:00,3.381,92.741,28.1,4.2,mb,,209,4.6,0.51,us,usc000rqwy,1404649378927
2014-07-06T04:15:00.280+00:00,38.120,89.802,10.0,4.0,mb,,84,5.9,1.15,us,usc000rqwu,1404649136886
2014-07-06T04:10:46.560+00:00,36.735,-97.742,5.0,3.2,mb_lg,,51,0.3,0.77,us,usc000rqwr,1404623665201
2014-07-06T04:10:27.200+00:00,18.806,-64.229,7.0,3.1,Md,8,324,0.5,0.30,pr,pr14187001,1404648871825
2014-07-06T03:52:03.300+00:00,18.175,-67.902,126.0,3.2,Md,14,202,0.6,0.49,pr,pr14187000,1404647677839
2014-07-06T03:08:47.400+00:00,-14.641,-71.220,61.2,5.0,mb,,114,3.4,1.04,us,usc000rqwm,1404645221709
2014-07-06T02:42:20.800+00:00,18.572,-63.779,31.0,3.1,Md,4,353,0.8,0.23,pr,pr14187002,1404643495762
2014-07-06T01:44:18.870+00:00,36.219,-97.522,5.0,3.3,mb_lg,,30,0.2,0.43,us,usc000rqwg,1404619864748
2014-07-06T00:54:56.800+00:00,36.138,-117.966,4.7,3.4,ml,30,63,0.1,0.10,ci,ci15521601,1404662178846
2014-07-05T23:57:12.430+00:00,3.749,127.668,77.3,4.4,mb,,121,3.0,0.61,us,usc000rqw0,1404633654099
2014-07-05T23:28:39.000+00:00,51.619,-178.293,13.0,2.9,ml,18,184,,0.58,ak,ak11318424,1405734381545
2014-07-05T22:42:44.000+00:00,51.807,178.390,115.6,2.5,ml,8,259,,0.16,ak,ak11318379,1405734378403
2014-07-05T22:22:41.000+00:00,51.756,178.420,98.6,3.2,ml,20,169,,0.70,ak,ak11318362,1405734257480
2014-07-05T21:41:38.630+00:00,33.693,35.217,14.8,4.1,mb,,176,2.0,0.83,us,usc000rqvn,1404648573209
2014-07-05T21:04:19.000+00:00,61.903,-147.525,15.1,2.8,ml,65,40,,0.74,ak,ak11318258,1405734253555
2014-07-05T20:37:26.000+00:00,57.521,-152.121,6.1,2.6,ml,20,202,,0.72,ak,ak11318239,1405734252109
2014-07-05T20:22:56.410+00:00,42.136,142.987,59.3,4.8,mb,,49,0.2,0.73,us,usc000rqvb,1404627723565
2014-07-05T19:30:07.430+00:00,32.630,-109.104,5.0,3.2,ml,,134,1.1,0.57,us,usc000rqv2,1404624762298
2014-07-05T19:05:46.130+00:00,36.133,-117.967,4.6,3.0,ml,30,67,0.1,0.10,ci,ci15521265,1404764946450
2014-07-05T17:20:16.000+00:00,51.796,178.519,106.6,3.6,ml,28,162,,1.12,ak,ak11318060,1405734331871
2014-07-05T17:16:07.000+00:00,51.834,178.428,112.0,2.6,ml,11,252,,0.19,ak,ak11330938,1405734322431
2014-07-05T17:02:30.200+00:00,18.792,-67.359,13.0,3.1,Md,25,212,0.4,0.15,pr,pr14186004,1404609331090
2014-07-05T17:01:23.010+00:00,34.279,-117.019,10.0,2.6,ml,35,61,0.0,0.13,ci,ci15521001,1404665193363
2014-07-05T17:00:26.490+00:00,34.274,-117.018,9.5,3.4,ml,60,42,0.1,0.24,ci,ci15520993,1405042007176
2014-07-05T16:59:34.070+00:00,34.280,-117.028,8.7,4.6,mw,149,37,0.0,0.13,ci,ci15520985,1406753957393
2014-07-05T16:39:24.000+00:00,51.810,178.500,107.9,2.6,ml,13,230,,0.39,ak,ak11318009,1405734297268
2014-07-05T15:42:35.000+00:00,59.758,-152.787,83.8,2.6,ml,63,90,,0.61,ak,ak11317953,1405734234486
2014-07-05T15:31:51.700+00:00,41.488,-108.790,-2.4,2.6,Ml,,101,1.1,0.33,uu,uu60075992,1404931304624
2014-07-05T15:10:57.000+00:00,51.745,178.410,115.7,2.8,ml,13,169,,0.70,ak,ak11317935,1405734287830
2014-07-05T14:59:34.630+00:00,37.381,141.760,44.5,4.9,mb,,85,3.0,0.68,us,usc000rqtn,1404615238496
2014-07-05T14:46:39.570+00:00,41.364,-73.934,5.0,2.5,ml,24,62,0.1,0.45,ld,ld60072806,1405021381664
2014-07-05T13:30:16.100+00:00,39.055,-123.048,7.8,2.8,Md,51,32,0.0,0.06,nc,nc72249391,1404939127522
2014-07-05T12:52:24.000+00:00,51.814,178.647,90.7,2.5,ml,13,191,,0.36,ak,ak11317849,1405734288290
2014-07-05T12:32:57.000+00:00,63.453,-148.527,8.6,2.7,ml,,,,0.67,ak,ak11317827,1405734352880
2014-07-05T11:48:17.000+00:00,52.282,-168.774,62.0,2.5,ml,,,,0.62,ak,ak11317788,1405734397514
2014-07-05T11:00:47.150+00:00,-20.709,-70.806,23.8,4.4,mb,,154,0.6,0.91,us,usc000rqsr,1404592834320
2014-07-05T10:58:38.000+00:00,19.154,-66.896,23.0,2.9,Md,6,313,0.7,0.05,pr,pr14186003,1404592853381
2014-07-05T10:02:13.230+00:00,1.657,97.027,28.1,4.7,mb,,186,0.7,0.73,us,usc000rqsj,1404592849487
2014-07-05T09:39:30.050+00:00,1.995,97.015,30.0,6.0,mwb,,38,0.9,0.92,us,usc000rqs7,1404592839179
2014-07-05T09:33:39.000+00:00,51.771,178.381,112.0,2.8,ml,,,,0.36,ak,ak11317711,1405734402983
2014-07-05T08:54:44.730+00:00,-33.936,-71.380,37.3,4.4,mb,,88,0.7,0.84,us,usc000rqrw,1406032483000
2014-07-05T08:18:26.850+00:00,51.841,178.503,100.4,4.2,mb,,120,0.1,0.71,us,usc000rqri,1406461121175
2014-07-05T08:06:45.880+00:00,-55.424,-28.078,10.0,4.1,mb,,126,5.0,0.79,us,usb000rvf7,1406460705000
2014-07-05T07:55:23.730+00:00,39.396,142.576,50.0,4.4,mb,,135,2.7,1.18,us,usc000rqrg,1406032337000
2014-07-05T07:44:44.000+00:00,51.942,-174.276,55.1,2.7,ml,,,,0.40,us,usc000rqs1,1406460363000
2014-07-05T06:48:06.110+00:00,-17.852,-177.836,571.9,4.2,mb,,123,3.9,0.90,us,usb000rve3,1406453492056
2014-07-05T06:27:46.000+00:00,61.251,-139.534,17.5,2.6,ml,35,68,,0.98,ak,ak11317630,1405734272768
2014-07-05T06:22:34.370+00:00,11.849,-87.132,49.3,4.1,mb,,162,0.8,0.72,us,usc000rqr5,1406032089000
2014-07-05T05:45:28.120+00:00,9.888,126.405,17.6,4.3,mb,,185,9.1,0.89,us,usb000rve1,1406452895000
2014-07-05T05:31:07.070+00:00,-40.128,77.967,10.0,4.6,mb,,148,2.3,0.53,us,usb000rvdz,1406452609285
2014-07-05T05:15:23.550+00:00,46.335,153.126,26.4,4.3,mb,,135,7.4,0.69,us,usb000rve0,1406440290000
2014-07-05T05:06:02.280+00:00,-1.971,152.366,15.9,4.5,mb,,147,10.6,0.31,us,usb000rvdy,1406439935000
2014-07-05T04:13:03.930+00:00,51.758,178.679,101.7,4.9,mb,,117,0.5,0.84,us,usc000rqqx,1405734163841
2014-07-05T03:34:46.200+00:00,-5.054,153.711,55.3,4.8,mb,,99,1.8,0.67,us,usc000rqqs,1404560234817
2014-07-05T03:11:47.970+00:00,28.306,55.036,10.0,4.7,mb,,52,3.5,0.81,us,usc000rqqn,1404558864782
2014-07-05T02:56:44.000+00:00,56.155,-160.537,178.5,3.0,ml,,,,0.34,ak,ak11317556,1405734187275
2014-07-05T02:54:34.000+00:00,17.977,-68.253,119.0,3.4,Md,10,335,1.1,0.41,pr,pr14186001,1404557823548
2014-07-05T01:18:13.270+00:00,-30.694,-178.146,35.0,5.2,mb,,80,12.0,1.44,us,usc000rqq9,1404552138118
2014-07-05T01:16:57.460+00:00,-6.329,152.769,46.5,4.7,mb,,48,2.2,0.71,us,usc000rqq8,1404606337250
2014-07-05T01:05:46.200+00:00,19.302,-66.539,54.0,2.7,Md,6,295,0.8,0.23,pr,pr14186000,1404551292036
2014-07-05T00:34:14.000+00:00,51.842,178.310,124.4,3.0,ml,,,,0.46,ak,ak11317497,1405734254450
2014-07-04T23:09:00.300+00:00,19.419,-155.335,4.8,2.5,Ml,,256,0.0,0.09,hv,hv60725531,1405022821650
2014-07-04T22:44:49.810+00:00,-7.146,154.640,129.4,4.9,mb,,47,3.8,2.33,us,usc000rqiy,1404542843608
2014-07-04T22:42:04.740+00:00,39.675,142.034,44.9,5.7,mb,,49,2.5,0.95,us,usc000rqix,1406326429000
2014-07-04T21:30:36.900+00:00,37.739,-112.961,-0.3,2.6,Ml,,40,0.2,0.17,uu,uu60075967,1404747436007
2014-07-04T21:12:37.000+00:00,19.283,-65.083,63.0,3.0,Md,4,313,0.9,0.10,pr,pr14185004,1404537307631
2014-07-04T21:08:45.430+00:00,35.104,-34.901,10.0,5.2,mb,,28,6.4,0.73,us,usc000rqih,1404751568000
2014-07-04T19:09:39.000+00:00,63.282,-150.479,126.7,2.7,ml,,,,0.61,ak,ak11317244,1404529925630
2014-07-04T18:48:52.500+00:00,18.828,-64.358,38.0,2.8,Md,4,328,0.5,0.07,pr,pr14185002,1404528688435
2014-07-04T15:00:26.430+00:00,-6.205,152.821,10.0,6.6,mwp,,19,2.1,0.92,us,usc000rqgz,1404575795000
2014-07-04T13:57:39.350+00:00,51.910,178.446,110.3,4.5,mb,,170,2.7,1.06,us,usc000rqgt,1404519956978
2014-07-04T13:41:47.000+00:00,36.556,-90.017,7.7,2.8,md,36,65,0.1,0.12,nm,nm60052977,1404566232069
2014-07-04T13:12:18.390+00:00,-7.005,155.848,42.2,5.6,mb,,51,4.7,0.82,us,usc000rqgl,1404572198000
2014-07-04T11:22:17.810+00:00,36.135,-117.968,4.9,2.7,ml,27,68,0.1,0.13,ci,ci15520113,1404752322504
2014-07-04T11:20:36.320+00:00,-3.989,139.492,47.4,4.8,mb,,62,7.3,0.67,us,usc000rqfj,1404501786394
2014-07-04T09:19:35.150+00:00,-25.789,-179.840,453.5,4.6,mb,,90,3.8,0.66,us,usc000rqf1,1404494535140
2014-07-04T09:15:39.430+00:00,63.292,150.887,15.6,4.5,mb,,74,3.7,0.61,us,usc000rqf0,1404494292452
2014-07-04T08:49:10.010+00:00,18.388,145.937,192.1,4.4,mb,,89,4.9,0.60,us,usb000ruzz,1406295732000
2014-07-04T08:33:37.350+00:00,51.729,178.405,101.4,2.7,ml,,,,0.54,us,usb000rxh7,1406370568000
2014-07-04T07:55:45.170+00:00,51.787,-171.777,51.1,4.2,mb,,73,1.6,1.46,us,usc000rqes,1406295360000
2014-07-04T06:52:31.170+00:00,-55.189,-27.829,10.0,4.9,mb,,66,5.1,0.67,us,usc000rqem,1406031712000
2014-07-04T06:16:22.600+00:00,-17.770,-70.032,116.9,4.5,mb,,116,0.7,1.34,us,usb000rv03,1406287447000
2014-07-04T05:47:08.100+00:00,37.904,-118.534,5.2,2.5,Md,28,151,0.2,0.06,nc,nc72248736,1404967148285
2014-07-04T05:40:02.840+00:00,-3.943,138.746,53.6,4.9,mb,,25,2.4,0.92,us,usc000rqeg,1406031512000
2014-07-04T05:34:19.210+00:00,-49.120,-8.296,10.0,5.1,mb,,66,22.8,0.64,us,usc000rqef,1406031365000
2014-07-04T05:33:25.280+00:00,51.794,178.378,102.5,2.6,ml,,,,0.17,us,usb000rxh6,1406370212000
2014-07-04T04:55:10.020+00:00,36.856,-97.399,4.6,3.1,mb_lg,,70,0.2,0.46,us,usc000rqec,1404518999781
2014-07-04T03:41:16.930+00:00,-16.718,-173.410,47.6,4.7,mb,,55,3.2,1.03,us,usc000rqe9,1404605323850
2014-07-04T01:32:04.300+00:00,19.149,-64.273,38.0,3.0,Md,10,324,0.8,0.07,pr,pr14185000,1404466475188
2014-07-04T00:55:04.000+00:00,51.840,178.509,117.9,3.1,ml,18,227,0.1,0.42,ak,ak11316764,1404520914131
2014-07-03T23:50:27.720+00:00,33.164,-115.646,1.8,3.1,ml,50,37,0.0,0.20,ci,ci15519497,1404437021095
2014-07-03T22:56:31.000+00:00,32.579,-109.075,5.0,3.9,ml,,81,1.1,0.89,us,usc000rqda,1404513438298
2014-07-03T22:30:33.590+00:00,-4.063,139.216,65.3,5.1,mb,,31,7.0,0.93,us,usc000rqd3,1404455591468
2014-07-03T20:39:58.480+00:00,35.563,75.100,10.0,4.9,mb,,75,2.4,1.13,us,usc000rqcc,1404552675362
2014-07-03T20:24:20.000+00:00,36.760,-98.052,4.0,3.0,ml,,99,,1.32,us,usc000rqc5,1404429065000
2014-07-03T20:14:54.490+00:00,35.939,-97.050,6.3,3.2,mb_lg,,36,0.3,0.42,us,usc000rqbx,1404433767000
2014-07-03T20:03:39.300+00:00,17.863,-67.068,8.0,2.6,Md,13,256,0.1,0.10,pr,pr14184009,1404446768353
2014-07-03T19:50:05.040+00:00,-30.533,-176.526,20.0,6.3,mwb,,18,1.8,1.10,us,usc000rqbg,1405785711000
2014-07-03T19:14:34.000+00:00,61.376,-150.522,0.5,2.7,ml,8,202,0.1,0.68,ak,ak11316368,1404520910324
2014-07-03T19:06:47.850+00:00,52.071,178.460,104.0,5.7,mwb,,46,0.9,0.99,us,usc000rqae,1404572195000
2014-07-03T17:19:15.900+00:00,19.091,-65.661,73.0,2.8,Md,4,277,0.9,0.18,pr,pr14184008,1404436912235
2014-07-03T17:15:45.200+00:00,41.983,-112.359,10.8,2.5,Ml,,86,0.1,0.28,uu,uu60075847,1404427372887
2014-07-03T16:09:04.410+00:00,36.379,-96.931,2.8,2.9,mb_lg,,56,0.3,0.17,us,usc000rq2e,1404423450138
2014-07-03T13:56:43.050+00:00,-16.774,-71.224,83.7,4.7,mb,,131,1.8,1.10,us,usc000rpxk,1404407680578
2014-07-03T12:30:10.600+00:00,19.175,-66.274,36.0,2.9,Md,12,263,0.7,0.33,pr,pr14184006,1404419572867
2014-07-03T12:16:58.110+00:00,55.204,166.832,10.0,4.6,mb,,122,5.0,1.06,us,usc000rpx7,1404418772330
2014-07-03T12:05:22.800+00:00,55.206,166.920,10.0,5.9,mwp,,76,4.9,1.30,us,usc000rpw8,1404418068972
2014-07-03T10:33:57.600+00:00,18.177,-68.011,97.0,3.3,Md,10,209,0.5,0.30,pr,pr14184007,1404412592858
2014-07-03T09:35:49.180+00:00,-22.063,-179.447,599.2,5.6,mb,,78,4.9,0.96,us,usc000rpvy,1404415344000
2014-07-03T09:06:55.420+00:00,17.480,-95.148,10.0,4.3,mb,,151,3.1,1.06,us,usc000rpvw,1404407531361
2014-07-03T08:23:48.000+00:00,61.602,-149.799,30.9,3.3,ml,80,36,0.3,0.74,ak,ak11315769,1404519802297
2014-07-03T07:50:45.790+00:00,-18.247,-177.373,387.3,4.8,mb,,39,4.4,1.17,us,usc000rpvg,1404402792512
2014-07-03T07:32:44.400+00:00,18.931,-65.774,16.0,2.8,Md,12,245,0.7,0.25,pr,pr14184004,1404401720501
2014-07-03T06:49:26.900+00:00,18.837,-65.728,9.0,2.5,Md,5,295,0.6,0.18,pr,pr14184002,1404399133929
2014-07-03T06:48:09.890+00:00,19.403,121.153,35.0,4.5,mb,,143,3.4,1.07,us,usc000rpv8,1404399047215
2014-07-03T06:42:25.000+00:00,51.805,179.120,91.0,2.9,ml,9,126,0.3,0.25,ak,ak11315684,1404520917630
2014-07-03T06:38:14.400+00:00,18.908,-65.771,13.0,2.6,Md,6,277,0.6,0.23,pr,pr14184001,1404398448983
2014-07-03T05:04:46.920+00:00,40.274,27.996,9.6,4.4,mb,,44,1.6,0.80,us,usc000rpuu,1404409797000
2014-07-03T04:51:32.000+00:00,18.690,-64.638,58.0,2.7,Md,6,281,0.3,0.23,pr,pr14184000,1404392072378
2014-07-03T04:43:42.980+00:00,51.938,178.521,122.9,5.2,mb,,72,0.7,1.39,us,usc000rpum,1404519461481
2014-07-03T04:28:10.350+00:00,-2.909,139.127,47.4,4.7,mb,,133,6.9,0.71,us,usc000rpuj,1404390637524
2014-07-03T03:12:13.900+00:00,36.187,-92.712,6.8,2.7,md,15,54,0.2,0.21,nm,nm60052892,1405831938626
2014-07-03T02:56:41.290+00:00,55.298,166.868,22.7,5.8,mwp,,72,5.0,1.07,us,usc000rpu4,1404413794000
2014-07-03T02:50:20.080+00:00,-34.755,-71.743,41.2,4.8,mb,,68,0.3,1.03,us,usc000rpu3,1404425391507
2014-07-03T02:10:40.690+00:00,-24.041,-67.060,228.2,4.3,mb,,93,2.2,0.72,us,usc000rppb,1404382479315
2014-07-03T01:38:25.000+00:00,51.836,178.560,111.5,3.1,ml,11,227,0.1,0.40,ak,ak11314916,1404520907028
2014-07-03T01:25:33.390+00:00,-32.310,-178.001,10.0,4.8,mb,,73,3.1,1.45,us,usc000rpp6,1404379692225
2014-07-03T00:30:28.900+00:00,35.846,-119.794,7.6,2.9,Md,111,54,0.2,0.23,nc,nc72248081,1404444609002
2014-07-03T00:29:13.700+00:00,35.843,-119.817,12.3,2.9,Md,121,29,0.2,0.28,nc,nc72248076,1404446347056
2014-07-02T19:24:48.230+00:00,26.873,130.027,33.6,4.9,mb,,53,1.6,0.97,us,usc000rpkm,1404358082987
2014-07-02T18:57:40.000+00:00,60.205,-153.139,136.7,2.6,ml,49,180,0.1,0.80,ak,ak11314822,1404356411187
2014-07-02T18:32:17.740+00:00,36.135,-117.964,4.8,3.1,ml,31,67,0.1,0.11,ci,ci37238872,1404409875679
2014-07-02T17:33:48.540+00:00,-55.404,-28.009,36.3,4.7,mb,,126,5.0,0.41,us,usc000rpj9,1404351375246
2014-07-02T17:08:35.800+00:00,36.689,-121.316,3.2,2.5,Md,70,29,0.0,0.08,nc,nc72247896,1404359345532
2014-07-02T16:58:03.100+00:00,19.198,-64.814,15.0,3.0,Md,3,335,0.9,0.14,pr,pr14183012,1404661193000
2014-07-02T16:50:21.500+00:00,18.924,-65.279,37.0,2.6,Md,8,266,0.6,0.27,pr,pr14183011,1404660893000
2014-07-02T16:10:54.190+00:00,31.109,-116.005,18.2,3.8,ml,21,227,0.5,1.71,ci,ci37238816,1404411686007
2014-07-02T15:55:39.100+00:00,35.753,-97.505,5.0,2.7,ml,,71,,0.55,us,usc000rplj,1404660362990
2014-07-02T15:37:52.100+00:00,18.810,-65.321,61.0,2.7,md,,278,0.5,0.61,us,usc000rpis,1404344449574
2014-07-02T15:36:20.600+00:00,18.624,-67.589,12.0,2.5,Md,5,310,0.3,0.23,pr,pr14183010,1404659893000
2014-07-02T15:02:19.990+00:00,-6.908,129.608,194.0,4.2,mb,,127,2.0,0.90,us,usc000rphr,1404342289735
2014-07-02T14:24:37.310+00:00,19.075,-66.530,8.4,2.7,md,,307,0.6,0.81,us,usc000rpir,1404340032598
2014-07-02T14:01:15.800+00:00,19.317,-68.164,68.0,3.7,Md,19,270,0.8,0.50,pr,pr14183007,1404338621286
2014-07-02T13:43:40.600+00:00,36.277,-97.262,5.7,2.6,ml,,60,,0.19,us,usc000rpls,1404659501605
2014-07-02T12:04:41.770+00:00,-8.122,107.892,35.0,4.2,mb,,65,0.6,1.29,us,usc000rqee,1404452073157
2014-07-02T11:42:31.780+00:00,-22.310,170.320,35.0,4.9,mb,,96,3.6,0.97,us,usc000rpgx,1404330305442
2014-07-02T11:20:13.000+00:00,52.022,-173.468,38.8,3.0,ml,12,313,,0.64,ak,ak11314638,1404342504685
2014-07-02T11:01:35.500+00:00,19.124,-66.547,13.0,2.6,Md,5,288,0.6,0.38,pr,pr14183005,1404327901427
2014-07-02T10:55:20.000+00:00,19.981,-155.612,23.4,2.6,Ml,,137,0.1,0.10,hv,hv60724106,1404422555398
2014-07-02T10:02:30.630+00:00,-55.377,-28.439,10.0,5.2,mb,,87,4.8,0.74,us,usc000rpgl,1404324300330
2014-07-02T09:00:37.820+00:00,36.849,-97.873,2.1,2.6,mb_lg,,84,0.3,0.77,us,usc000rpgd,1404307590751
2014-07-02T08:45:21.000+00:00,51.958,-170.606,25.5,3.0,ml,12,223,,0.95,ak,ak11314598,1404328463445
2014-07-02T07:24:29.500+00:00,0.031,124.661,80.5,5.0,mb,,52,2.2,1.15,us,usc000rpg5,1404314818007
2014-07-02T06:35:09.600+00:00,18.903,-64.299,7.0,2.9,Md,3,349,0.8,0.07,pr,pr14183004,1404311855444
2014-07-02T05:53:30.450+00:00,-62.270,155.088,16.1,5.4,mb,,109,8.1,0.99,us,usc000rpfu,1404340899000
2014-07-02T03:10:33.000+00:00,67.667,-162.150,17.1,3.5,ml,,,,0.80,ak,ak11314538,1404299679360
2014-07-02T01:49:46.000+00:00,60.269,-152.936,100.0,2.8,ml,48,126,,0.89,ak,ak11314517,1404294738809
2014-07-02T01:39:57.930+00:00,36.139,-117.962,3.7,2.8,ml,26,67,0.2,0.11,ci,ci37238496,1404337938167
2014-07-02T01:05:05.300+00:00,18.343,-64.796,27.0,2.6,Md,3,184,0.2,0.12,pr,pr14183003,1404292059361
2014-07-02T01:02:00.000+00:00,51.855,178.322,124.8,3.1,ml,13,162,,0.74,ak,ak11314508,1404291879744
2014-07-02T00:06:07.200+00:00,18.448,-64.266,28.0,2.7,Md,7,349,0.3,0.10,pr,pr14183000,1404288551041
2014-07-01T23:14:59.000+00:00,36.658,-97.875,5.6,2.7,ml,,86,,0.81,us,usc000rplw,1404600598239
2014-07-01T23:06:32.300+00:00,19.280,-66.485,41.0,2.6,Md,4,299,0.8,0.17,pr,pr14182004,1404284948753
2014-07-01T21:11:30.860+00:00,51.811,178.383,97.1,2.8,ml,,,,0.39,us,usb000rupl,1406324140000
2014-07-01T18:14:53.220+00:00,-30.265,-176.998,26.8,5.1,mb,,75,1.3,0.86,us,usc000rp9n,1404267450743
2014-07-01T18:11:48.600+00:00,-30.275,-177.131,7.4,5.2,mb,,64,1.2,0.71,us,usc000rp97,1404267260652
2014-07-01T16:28:14.670+00:00,31.153,130.250,169.2,4.7,mb,,65,2.0,0.63,us,usc000rp7q,1404261046264
2014-07-01T16:09:56.670+00:00,52.817,-166.829,24.1,4.5,mb,,171,1.0,1.00,us,usc000rp7f,1404259944947
2014-07-01T14:30:36.300+00:00,36.582,-97.821,6.1,2.5,ml,,80,,0.42,us,usc000rp70,1404253995340
2014-07-01T14:22:09.580+00:00,-33.898,-72.489,16.2,5.1,mb,,133,1.0,0.68,us,usc000rp6f,1404233431533
2014-07-01T14:22:07.200+00:00,36.583,-97.819,5.0,3.1,ml,,79,,0.65,us,usc000rp6g,1404230376367
2014-07-01T14:16:58.400+00:00,36.649,-97.954,5.0,2.8,ml,,89,,0.58,us,usc000rp6w,1404253226661
2014-07-01T13:37:20.000+00:00,62.096,-152.466,4.7,3.3,ml,,,,0.94,ak,ak11314224,1404251179490
2014-07-01T12:39:06.700+00:00,8.691,-39.760,10.0,5.0,mb,,41,14.9,0.50,us,usc000rp5y,1404247297338
2014-07-01T12:14:19.400+00:00,37.325,-122.225,5.8,2.5,Md,110,68,0.0,0.12,nc,nc72247316,1404363991980
2014-07-01T11:31:26.100+00:00,18.841,-64.853,14.0,2.7,Md,5,270,0.5,0.17,pr,pr14182002,1404243237235
2014-07-01T09:11:23.790+00:00,13.828,119.224,34.6,5.1,mb,,90,8.3,0.90,us,usc000rp53,1404207038991
2014-07-01T09:04:43.120+00:00,36.134,-117.965,5.1,3.0,ml,30,67,0.1,0.09,ci,ci37238128,1404319552882
2014-07-01T09:00:58.990+00:00,26.916,129.287,26.3,4.8,mb,,130,0.9,1.33,us,usc000rp4z,1404234209259
2014-07-01T08:57:00.700+00:00,-53.723,9.520,10.0,4.6,mb,,90,18.8,0.85,us,usb000rvvm,1406272264000
2014-07-01T08:24:55.980+00:00,-5.971,153.678,68.4,4.4,mb,,78,2.3,1.04,us,usb000rvub,1406271240640
2014-07-01T08:20:34.500+00:00,36.651,-97.959,5.0,3.2,ml,,89,,0.75,us,usc000rp3j,1406031120629
2014-07-01T08:16:33.580+00:00,38.822,-122.840,2.4,2.9,md,83,24,0.0,0.06,nc,nc72247216,1404241088504
2014-07-01T08:14:46.180+00:00,-55.354,-28.165,21.5,4.4,mb,,126,4.9,0.62,us,usb000rvvk,1406270606000
2014-07-01T08:09:48.840+00:00,-30.035,-177.718,33.3,4.7,mb,,129,0.8,0.91,us,usb000rvue,1406269805000
2014-07-01T07:42:52.800+00:00,35.825,-97.075,5.6,3.0,ml,,81,,0.53,us,usc000rp34,1406030790000
2014-07-01T07:29:43.300+00:00,-55.242,-28.994,20.2,4.8,mb,,44,4.4,0.70,us,usc000rp31,1406030411000
2014-07-01T07:12:55.000+00:00,67.627,-162.420,24.1,3.2,ml,,,,0.91,ak,ak11314112,1406268208000
2014-07-01T07:12:22.520+00:00,-55.307,-27.954,10.0,4.1,mb,,95,5.0,0.40,us,usb000rvvj,1406267827000
2014-07-01T06:14:36.100+00:00,19.406,-155.289,3.5,2.6,Ml,,148,0.0,0.15,hv,hv60723461,1404244866505
2014-07-01T06:11:46.900+00:00,18.911,-64.992,32.0,2.5,Md,11,310,0.7,0.28,pr,pr14182001,1404224375960
2014-07-01T04:52:13.000+00:00,54.223,-161.694,13.2,3.4,ml,,,,0.75,ak,ak11314085,1404219288126
2014-07-01T04:37:49.900+00:00,19.635,-66.087,109.0,3.4,Md,8,284,1.4,0.14,pr,pr14182000,1404200973829
2014-07-01T03:10:49.000+00:00,40.299,-124.466,11.9,3.0,Md,22,259,0.1,0.13,nc,nc72247101,1404679580411
2014-07-01T01:55:22.000+00:00,54.121,-166.231,119.1,2.5,ml,,,,0.27,ak,ak11314041,1404208684041'


]

{ #category : #utility }
RTMapLocationBuilder >> translateGeoPositionToPixels: point [
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
