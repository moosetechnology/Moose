"
A RTSVGStringConverter is a class used to fix Strings before using them inside SVG elements. Since many characters need to be translated to its HTML standart encoding
"
Class {
	#name : #RTSVGStringConverter,
	#superclass : #RTObject,
	#instVars : [
		'convertions'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #converting }
RTSVGStringConverter >> convertString: aString [
	| array |
	array := (1 to: aString size) collect: [ :n | convertions at: (aString at: n) ifAbsent: [ aString at: n ] ].
	^ array inject: '' into: [ :acc :e | acc, (e asString) ].
	
]

{ #category : #initialization }
RTSVGStringConverter >> initialize [
	super initialize.
	convertions := Dictionary new.
	self initializeValues.
]

{ #category : #initialization }
RTSVGStringConverter >> initializeValues [
	convertions 
		at: $™ put: '&#8482;';
		at: $\ put: '&#92;';
		at: $€ put: '&euro;';
		at: $  put: '&#160;';
		at: $" put: '&quot;';
		at: $& put: '&amp;';
		at: $< put: '&lt;';
		at: $> put: '&gt;';
		at: $¡ put: '&iexcl;';
		at: $¢ put: '&cent;';
		at: $£ put: '&pound;';
		at: $¤ put: '&curren;';
		at: $¥ put: '&yen;';
		at: $¦ put: '&brvbar;';
		at: $§ put: '&sect;';
		at: $¨ put: '&uml;';
		at: $© put: '&copy;';
		at: $ª put: '&ordf;';
		at: $¬ put: '&not;';
		at: $® put: '&reg;';
		at: $¯ put: '&macr;';
		at: $° put: '&deg;';
		at: $± put: '&plusmn;';
		at: $² put: '&sup2;';
		at: $³ put: '&sup3;';
		at: $´ put: '&acute;';
		at: $µ put: '&micro;';
		at: $¶ put: '&para;';
		at: $· put: '&middot;';
		at: $¸ put: '&cedil;';
		at: $¹ put: '&sup1;';
		at: $º put: '&ordm;';
		at: $» put: '&raquo;';
		at: $¼ put: '&frac14;';
		at: $½ put: '&frac12;';
		at: $¾ put: '&frac34;';
		at: $¿ put: '&iquest;';
		at: $À put: '&Agrave;';
		at: $Á put: '&Aacute;';
		at: $Â put: '&Acirc;';
		at: $Ã put: '&Atilde;';
		at: $Ä put: '&#196;';
		at: $Å put: '&Aring;';
		at: $Æ put: '&AElig;';
		at: $Ç put: '&Ccedil;';
		at: $È put: '&Egrave;';
		at: $É put: '&Eacute;';
		at: $Ê put: '&Ecirc;';
		at: $Ë put: '&Euml;';
		at: $Ì put: '&Igrave;';
		at: $Í put: '&Iacute;';
		at: $Î put: '&Icirc;';
		at: $Ï put: '&Iuml;';
		at: $Ð put: '&ETH;';
		at: $Ñ put: '&Ntilde;';
		at: $Ò put: '&Ograve;';
		at: $Ó put: '&Oacute;';
		at: $Ô put: '&Ocirc;';
		at: $Õ put: '&Otilde;';
		at: $Ö put: '&Ouml;';
		at: $× put: '&times;';
		at: $Ø put: '&Oslash;';
		at: $Ù put: '&Ugrave;';
		at: $Ú put: '&Uacute;';
		at: $Û put: '&Ucirc;';
		at: $Ü put: '&Uuml;';
		at: $Ý put: '&Yacute;';
		at: $Þ put: '&THORN;';
		at: $ß put: '&szlig;';
		at: $à put: '&agrave;';
		at: $á put: '&aacute;';
		at: $â put: '&acirc;';
		at: $ã put: '&atilde;';
		at: $ä put: '&#228;';
		at: $å put: '&aring;';
		at: $æ put: '&aelig;';
		at: $ç put: '&ccedil;';
		at: $è put: '&egrave;';
		at: $é put: '&eacute;';
		at: $ê put: '&ecirc;';
		at: $ë put: '&euml;';
		at: $ì put: '&igrave;';
		at: $í put: '&iacute;';
		at: $î put: '&icirc;';
		at: $ï put: '&iuml;';
		at: $ð put: '&eth;';
		at: $ñ put: '&ntilde;';
		at: $ò put: '&ograve;';
		at: $ó put: '&oacute;';
		at: $ô put: '&ocirc;';
		at: $õ put: '&otilde;';
		at: $ö put: '&ouml;';
		at: $÷ put: '&divide;';
		at: $ø put: '&oslash;';
		at: $ù put: '&ugrave;';
		at: $ú put: '&uacute;';
		at: $û put: '&ucirc;';
		at: $ü put: '&uuml;';
		at: $ý put: '&yacute;';
		at: $þ put: '&thorn;';
		at: $⁰ put: '&#8304;';
		at: $¹ put: '&#185;';
		at: $² put: '&#178;';
		at: $³ put: '&#179;';
		at: $⁴ put: '&#8308;';
		at: $⁵ put: '&#8309;';
		at: $⁶ put: '&#8310;';
		at: $⁷ put: '&#8311;';
		at: $⁸ put: '&#8312;';
		at: $⁹ put: '&#8313;';
		
		at: Character cr put: ''.
]
