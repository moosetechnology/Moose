Class {
	#name : #PPXmlResource,
	#superclass : #PPParserResource,
	#category : #'PetitXml-Tests'
}

{ #category : #accessing }
PPXmlResource >> allXmlDefinitions [
	^ (Pragma allNamed: #xml: in: self class)
		collect: [ :each | self perform: each methodSelector ]
]

{ #category : #accessing }
PPXmlResource >> allXsdDefinitions [
	^ (Pragma allNamed: #xsd in: self class) 
		collect: [ :each | self perform: each methodSelector ]
]

{ #category : #'accessing-xml' }
PPXmlResource >> bookstoreXml [
	<xml: #bookstoreXsd>
	
	^ '<?xml version="1.0" encoding="ISO-8859-1"?>
<bookstore>
	<book>
		<title lang="eng">Harry Potter</title>
		<price>29.99</price>
	</book>
	<book>
		<title lang="eng">Learning XML</title>
		<price>39.95</price>
	</book>
</bookstore>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> elementFormXsd [
	<xml: #xsdXsd>
	<xsd>

	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://www.w3.org/2001/XMLSchema"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:tns="http://unqualified-elements.example.com"
    targetNamespace="http://unqualified-elements.example.com">

    <element name="unQualifiedLocals">
        <complexType>
            <sequence>
                <element name="unqualified" type="xsd:string"/>
                <element name="qualified" form="qualified" type="xsd:int"/>
<!--                <element ref="tns:global"/>-->
            </sequence>
        </complexType>
    </element>

    <element name="global" type="xsd:int"/>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> elementReferencesXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

    <complexType name="Struct">
        <sequence>
            <element name="varString" type="xsd:string"/>
            <element name="varInt" type="xsd:int"/>
            <element name="varFloat" type="xsd:float"/>
            <element name="varStruct" type="tns:Struct"/>
        </sequence>
    </complexType>

    <element name="attrTest" type="tns:Struct"/>

    <element name="attTests">
        <complexType>
            <sequence>
                <element ref="tns:attrTest" maxOccurs="5"></element>
            </sequence>
        </complexType>
    </element>



</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> externalAttributesXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema
    xmlns="http://www.w3.org/2001/XMLSchema"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:tns="http://unqualified-elements.example.com"
    xmlns:test="http://test-namespace"
    targetNamespace="http://unqualified-elements.example.com"
    test:level="1">

    <element name="AnyAttContainer" test:level="2">
        <complexType>
            <sequence>
                <element name="chileValue" type="xsd:string"/>
            </sequence>
            <anyAttribute namespace="##other" processContents="lax"></anyAttribute>
        </complexType>
    </element>

    <element name="global" type="xsd:int"/>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> forwardRefXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<!--
 * Copyright 2004,2005 The Apache Software Foundation.
 * Copyright 2006 International Business Machines Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
-->

<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

    <simpleType name="zipCode">
      <restriction base="string">
        <length value="5"/>
        <pattern value="\d{5}"/>
      </restriction>
    </simpleType>
    <element name="myZipCode" type="tns:zipCode"/>

    <simpleType name="age">
      <restriction base="decimal">
        <totalDigits value="3"/>
      </restriction>
    </simpleType>
    <element name="myAge" type="tns:age"/>

    <simpleType name="distance">
      <restriction base="integer">
        <maxInclusive value="100" fixed="true"/>
        <minInclusive value="0"/>
      </restriction>
    </simpleType>
    <element name="myDistance" type="tns:distance"/>

    <simpleType name="weight">
      <restriction base="integer">
        <maxExclusive value="200"/>
        <minExclusive value="1"/>
      </restriction>
    </simpleType>
    <element name="myWeight" type="tns:weight"/>

    <simpleType name="creditCardNumber">
      <restriction base="integer">
        <pattern value="\d{15}"/>
      </restriction>
    </simpleType>
    <element name="myCreditCardNumber" type="tns:creditCardNumber"/>

    <simpleType name="noWhiteSpace">
      <restriction base="normalizedString">
        <whiteSpace value="collapse"/>
      </restriction>
    </simpleType>
    <element name="myWhiteSpace" type="tns:noWhiteSpace"/>

    <simpleType name="petWeight">
      <restriction base="tns:weight">
        <maxExclusive value="50"/>
        <minExclusive value="5"/>
      </restriction>
    </simpleType>

    <simpleType name="fixedDistance">
      <restriction base="tns:distance">
        <minInclusive value="1"/>
      </restriction>
    </simpleType>

    <simpleType name="height">
      <restriction base="decimal">
        <totalDigits value="3"/>
        <fractionDigits value="2"/>
      </restriction>
    </simpleType>
    <element name="myHeight" type="tns:height"/>

    <simpleType name="yardLength">
      <restriction base="nonNegativeInteger">
        <minLength value="45"/>
        <maxLength value="205"/>
      </restriction>
    </simpleType>
    <element name="myYardLength" type="tns:yardLength"/>

    <simpleType name="layoutComponentType">
      <restriction base="string">
        <enumeration value="Field"/>
        <enumeration value="Separator"/>
      </restriction>
    </simpleType>
    <element name="layoutComponent" type="tns:layoutComponentType"/>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> getBalanceXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <xsd:complexType name="cinfoct">
                <xsd:sequence>
                        <xsd:element name="customerSurname" type="xsd:string" />
                        <xsd:element name="customerForname" type="xsd:string" />
                        <xsd:element name="branchCode">
                                <xsd:simpleType>
                                        <xsd:restriction base="xsd:string">
                                                <xsd:pattern
                                                        value="[0-9]{2}[\-][0-9]{2}[\-][0-9]{2}" />
                                        </xsd:restriction>
                                </xsd:simpleType>
                        </xsd:element>
                </xsd:sequence>
        </xsd:complexType>
        <xsd:element name="custInfo" type="cinfoct" />
        <xsd:complexType name="accinfct">
                <xsd:sequence maxOccurs="unbounded" minOccurs="0">
                        <xsd:element name="accName">
                                <xsd:simpleType>
                                        <xsd:restriction base="xsd:string">
                                                <xsd:enumeration value="Cheque" />
                                                <xsd:enumeration value="Credit" />
                                                <xsd:enumeration value="Savings" />
                                                <xsd:enumeration value="Loan" />
                                        </xsd:restriction>
                                </xsd:simpleType>
                        </xsd:element>
                        <xsd:element name="accNumber">
                                <xsd:simpleType>
                                        <xsd:restriction base="xsd:string">
                                                <xsd:pattern value="[0-9]{12}" />
                                        </xsd:restriction>
                                </xsd:simpleType>
                        </xsd:element>
                        <xsd:element name="accBalance">
                                <xsd:simpleType>
                                        <xsd:restriction base="xsd:decimal">
                                                <xsd:fractionDigits value="2" />
                                        </xsd:restriction>
                                </xsd:simpleType>
                        </xsd:element>
                </xsd:sequence>
        </xsd:complexType>
        <xsd:element name="accInfo" type="accinfct" />
</xsd:schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> groupXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <group name="priceGroup">
    <annotation>
      <documentation xml:lang="en">
                A price is any one of the following:
                    * Full Price (with amount)
                    * Sale Price (with amount and authorization)
                    * Clearance Price (with amount and authorization)
                    * Free (with authorization)
      </documentation>
    </annotation>
    <choice id="pg.choice">
      <element name="fullPrice" type="decimal"/>
      <element name="salePrice" type="decimal"/>
      <element name="clearancePrice" type="decimal"/>
      <element name="freePrice" type="decimal"/>
    </choice>
  </group>

  <element name="price">
    <complexType>
      <group ref="tns:priceGroup" />
    </complexType>
  </element>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> importAuxXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://soapinterop.org/xsd2"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd1="http://soapinterop.org/xsd2"
        elementFormDefault="qualified">
    <complexType name="SOAPStruct">
        <all>
            <element name="varFloat" type="xsd:float"/>
            <element name="varInt" type="xsd:int"/>
            <element name="varString" type="xsd:string"/>
        </all>
    </complexType>
</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> importBaseXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://soapinterop.org/xsd"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd1="http://soapinterop.org/xsd"
        xmlns:xsd2="http://soapinterop.org/xsd2"
        elementFormDefault="qualified">
    <import namespace="http://soapinterop.org/xsd2" schemaLocation="importAux.xsd"></import>
    <element name="echoStructParam" type="xsd2:SOAPStruct"/>
</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> includeWithNamespaceXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<xs:schema
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tns="http://tns.demo.org"
    targetNamespace="http://tns.demo.org"
    attributeFormDefault="unqualified"
    elementFormDefault="qualified">
  <xs:include schemaLocation="src/test/test-resources/includedWithoutNamespace.xsd"/>

  <xs:element name="foo" type="tns:XdwsGroupId"/>
</xs:schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> includeWithoutNamespaceXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<xs:schema
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    attributeFormDefault="unqualified"
    elementFormDefault="qualified">
  <xs:simpleType name="XdwsPrincipalId">
    <xs:restriction base="xs:string"/>
  </xs:simpleType>

  <xs:simpleType name="XdwsGroupId">
    <xs:restriction base="XdwsPrincipalId"/>
  </xs:simpleType>
</xs:schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> listXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <element name="workDays">
    <simpleType>
      <restriction base="tns:daysInWeek">
        <length value="5"/>
      </restriction>
    </simpleType>
  </element>

  <simpleType name="daysInWeek">
    <list itemType="xsd:integer"/>
  </simpleType>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> mixedContentXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://soapinterop.org/xsd"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd1="http://soapinterop.org/xsd"
        xmlns:xsd2="http://soapinterop.org/xsd2"
        elementFormDefault="qualified">
     <element name="complexElt">
         <complexType mixed="true">
             <sequence>
                  <element name="name" type="string"/>
                  <element name="age" type="int"/>
             </sequence>
         </complexType>
     </element>
</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> notationXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <notation name="teamLogo"
            system="com/team/graphics/teamLogo"
            public="http://www.team.com/graphics/teamLogo"
            id="notation.teamLogo">
    <annotation>
      <documentation xml:lang="en">Location of the corporate logo.</documentation>
    </annotation>
  </notation>

  <notation name="teamMascot"
            system="com/team/graphics/teamMascot"
            public="http://www.team.com/graphics/teamMascot"
            id="notation.teamMascot">
    <annotation>
      <documentation xml:lang="en">Location of the corporate mascot.</documentation>
    </annotation>
  </notation>

  <element name="demoNotation">
    <simpleType>
      <restriction base="NOTATION">
        <enumeration value="tns:teamLogo"/>
        <enumeration value="tns:teamMascot"/>
      </restriction>
    </simpleType>
  </element>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> restrictionXsd [
	<xml: #xsdXsd>
	<xsd>

	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types"
        attributeFormDefault="qualified">

  <simpleType name="drinksize">
    <restriction base="string">
      <enumeration value="small"/>
      <enumeration value="medium"/>
      <enumeration value="large"/>
    </restriction>
  </simpleType>

  <complexType name="dietdrinksize">
    <simpleContent>
      <restriction base="tns:drinksize">
        <enumeration value="small"/>
        <enumeration value="medium"/>
        <attribute name="units" type="string" use="required"/>
        <attribute name="id" type="integer" use="required" default="001"/>
      </restriction>
    </simpleContent>
  </complexType>

</schema>'
]

{ #category : #'accessing-xml' }
PPXmlResource >> shiporderXml [
	<xml: #shiporderXsd>
	
	^ '<?xml version="1.0"?>
<purchaseOrder orderDate="1999-10-20">
   <shipTo country="US">
      <name>Alice Smith</name>
      <street>123 Maple Street</street>
      <city>Mill Valley</city>
      <state>CA</state>
      <zip>90952</zip>
   </shipTo>
   <billTo country="US">
      <name>Robert Smith</name>
      <street>8 Oak Avenue</street>
      <city>Old Town</city>
      <state>PA</state>
      <zip>95819</zip>
   </billTo>
   <comment>Hurry, my lawn is going wild!</comment>
   <items>
      <item partNum="872-AA">
         <productName>Lawnmower</productName>
         <quantity>1</quantity>
         <USPrice>148.95</USPrice>
         <comment>Confirm this is electric</comment>
      </item>
      <item partNum="926-AA">
         <productName>Baby Monitor</productName>
         <quantity>1</quantity>
         <USPrice>39.98</USPrice>
         <shipDate>1999-05-21</shipDate>
      </item>
   </items>
</purchaseOrder>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> shiporderXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

  <xsd:annotation>
    <xsd:documentation xml:lang="en">
     Purchase order schema for Example.com.
     Copyright 2000 Example.com. All rights reserved.
    </xsd:documentation>
  </xsd:annotation>

  <xsd:element name="purchaseOrder" type="PurchaseOrderType"/>

  <xsd:element name="comment" type="xsd:string"/>

  <xsd:complexType name="PurchaseOrderType">
    <xsd:sequence>
      <xsd:element name="shipTo" type="USAddress"/>
      <xsd:element name="billTo" type="USAddress"/>
      <xsd:element ref="comment" minOccurs="0"/>
      <xsd:element name="items"  type="Items"/>
    </xsd:sequence>
    <xsd:attribute name="orderDate" type="xsd:date"/>
  </xsd:complexType>

  <xsd:complexType name="USAddress">
    <xsd:sequence>
      <xsd:element name="name"   type="xsd:string"/>
      <xsd:element name="street" type="xsd:string"/>
      <xsd:element name="city"   type="xsd:string"/>
      <xsd:element name="state"  type="xsd:string"/>
      <xsd:element name="zip"    type="xsd:decimal"/>
    </xsd:sequence>
    <xsd:attribute name="country" type="xsd:NMTOKEN"
                   fixed="US"/>
  </xsd:complexType>

  <xsd:complexType name="Items">
    <xsd:sequence>
      <xsd:element name="item" minOccurs="0" maxOccurs="unbounded">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name="productName" type="xsd:string"/>
            <xsd:element name="quantity">
              <xsd:simpleType>
                <xsd:restriction base="xsd:positiveInteger">
                  <xsd:maxExclusive value="100"/>
                </xsd:restriction>
              </xsd:simpleType>
            </xsd:element>
            <xsd:element name="USPrice"  type="xsd:decimal"/>
            <xsd:element ref="comment"   minOccurs="0"/>
            <xsd:element name="shipDate" type="xsd:date" minOccurs="0"/>
          </xsd:sequence>
          <xsd:attribute name="partNum" type="SKU" use="required"/>
        </xsd:complexType>
      </xsd:element>
    </xsd:sequence>
  </xsd:complexType>

  <!-- Stock Keeping Unit, a code for identifying products -->
  <xsd:simpleType name="SKU">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="\d{3}-[A-Z]{2}"/>
    </xsd:restriction>
  </xsd:simpleType>

</xsd:schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> simpleContentExtensionXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <element name="ID" type="string"/>

  <element name="Name" substitutionGroup="tns:ID" type="string"/>

  <element name="IDBlock" type="string" block="substitution"/>

  <element name="TestSubstitutionGroup">
    <complexType>
      <sequence>
        <element ref="tns:ID"/>
      </sequence>
    </complexType>
  </element>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> subgroupXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <element name="ID" type="string"/>

  <element name="Name" substitutionGroup="tns:ID" type="string"/>

  <element name="IDBlock" type="string" block="substitution"/>

  <element name="TestSubstitutionGroup">
    <complexType>
      <sequence>
        <element ref="tns:ID"/>
      </sequence>
    </complexType>
  </element>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> unionXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:tns="http://soapinterop.org/types"
        targetNamespace="http://soapinterop.org/types">

  <element name="unionTest">
    <simpleType>
      <union memberTypes="float decimal"/>
    </simpleType>
  </element>

</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> unqualifiedTypesXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://soapinterop.org/xsd"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsd1="http://soapinterop.org/xsd"
        xmlns:xsd2="http://soapinterop.org/xsd2"
        elementFormDefault="qualified">
     <element name="complexElt">
         <complexType>
             <sequence>
                  <element name="name" type="string"/>
                  <element name="age" type="int"/>
             </sequence>
         </complexType>
     </element>
</schema>'
]

{ #category : #'accessing-xsd' }
PPXmlResource >> xsdXsd [
	<xml: #xsdXsd>
	<xsd>
	
	^ '<?xml version=''1.0''?>

<!DOCTYPE xs:schema PUBLIC "-//W3C//DTD XMLSCHEMA 200102//EN" "XMLSchema.dtd" [

<!-- provide ID type information even for parsers which only read the
     internal subset -->
<!ATTLIST xs:schema          id  ID  #IMPLIED>
<!ATTLIST xs:complexType     id  ID  #IMPLIED>
<!ATTLIST xs:complexContent  id  ID  #IMPLIED>
<!ATTLIST xs:simpleContent   id  ID  #IMPLIED>
<!ATTLIST xs:extension       id  ID  #IMPLIED>
<!ATTLIST xs:element         id  ID  #IMPLIED>
<!ATTLIST xs:group           id  ID  #IMPLIED> 
<!ATTLIST xs:all             id  ID  #IMPLIED>
<!ATTLIST xs:choice          id  ID  #IMPLIED>
<!ATTLIST xs:sequence        id  ID  #IMPLIED>
<!ATTLIST xs:any             id  ID  #IMPLIED>
<!ATTLIST xs:anyAttribute    id  ID  #IMPLIED>
<!ATTLIST xs:attribute       id  ID  #IMPLIED>
<!ATTLIST xs:attributeGroup  id  ID  #IMPLIED>
<!ATTLIST xs:unique          id  ID  #IMPLIED>
<!ATTLIST xs:key             id  ID  #IMPLIED>
<!ATTLIST xs:keyref          id  ID  #IMPLIED>
<!ATTLIST xs:selector        id  ID  #IMPLIED>
<!ATTLIST xs:field           id  ID  #IMPLIED>
<!ATTLIST xs:assert          id  ID  #IMPLIED>
<!ATTLIST xs:include         id  ID  #IMPLIED>
<!ATTLIST xs:import          id  ID  #IMPLIED>
<!ATTLIST xs:redefine        id  ID  #IMPLIED>
<!ATTLIST xs:override        id  ID  #IMPLIED>
<!ATTLIST xs:notation        id  ID  #IMPLIED>
]>

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           elementFormDefault="qualified" xml:lang="EN"
           targetNamespace="http://www.w3.org/2001/XMLSchema"
           version="structures.xsd (wd-20091203)">
  <xs:annotation>
    <xs:documentation  source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html">
   The schema corresponding to this document is normative,
   with respect to the syntactic constraints it expresses in the
   XML Schema Definition Language.  The documentation (within &lt;documentation> elements)
   below, is not normative, but rather highlights important aspects of
   the W3C Recommendation of which this is a part.

      See below (at the bottom of this document) for information about
      the revision and namespace-versioning policy governing this
      schema document.

    </xs:documentation>
  </xs:annotation>
  <xs:annotation>
    <xs:documentation>
   The simpleType element and all of its members are defined
   in datatypes.xsd</xs:documentation>
  </xs:annotation>
  <xs:include schemaLocation="datatypes.xsd"/>
  <xs:import namespace="http://www.w3.org/XML/1998/namespace"
             schemaLocation="http://www.w3.org/2001/xml.xsd">
    <xs:annotation>
      <xs:documentation>
       Get access to the xml: attribute groups for xml:lang
       as declared on ''schema'' and ''documentation'' below
     </xs:documentation>
    </xs:annotation>
  </xs:import>
  <xs:complexType name="openAttrs">
    <xs:annotation>
      <xs:documentation>
       This type is extended by almost all schema types
       to allow attributes from other namespaces to be
       added to user schemas.
     </xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:restriction base="xs:anyType">
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="annotated">
    <xs:annotation>
      <xs:documentation>
       This type is extended by all types which allow annotation
       other than &lt;schema> itself
     </xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:extension base="xs:openAttrs">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
        </xs:sequence>
        <xs:attribute name="id" type="xs:ID"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:group name="schemaTop">
    <xs:annotation>
      <xs:documentation>
   This group is for the
   elements which occur freely at the top level of schemas.
   All of their types are based on the "annotated" type by extension.</xs:documentation>
    </xs:annotation>
    <xs:choice>
      <xs:group ref="xs:redefinable"/>
      <xs:element ref="xs:element"/>
      <xs:element ref="xs:attribute"/>
      <xs:element ref="xs:notation"/>
    </xs:choice>
  </xs:group>
  <xs:group name="redefinable">
    <xs:annotation>
      <xs:documentation>
   This group is for the
   elements which can self-redefine (see &lt;redefine> below).</xs:documentation>
    </xs:annotation>
    <xs:choice>
      <xs:element ref="xs:simpleType"/>
      <xs:element ref="xs:complexType"/>
      <xs:element ref="xs:group"/>
      <xs:element ref="xs:attributeGroup"/>
    </xs:choice>
  </xs:group>
  <xs:simpleType name="formChoice">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:NMTOKEN">
      <xs:enumeration value="qualified"/>
      <xs:enumeration value="unqualified"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="reducedDerivationControl">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:derivationControl">
      <xs:enumeration value="extension"/>
      <xs:enumeration value="restriction"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="derivationSet">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
      <xs:documentation>
   #all or (possibly empty) subset of {extension, restriction}</xs:documentation>
    </xs:annotation>
    <xs:union>
      <xs:simpleType>
        <xs:restriction base="xs:token">
          <xs:enumeration value="#all"/>
        </xs:restriction>
      </xs:simpleType>
      <xs:simpleType>
        <xs:list itemType="xs:reducedDerivationControl"/>
      </xs:simpleType>
    </xs:union>
  </xs:simpleType>
  <xs:simpleType name="typeDerivationControl">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:derivationControl">
      <xs:enumeration value="extension"/>
      <xs:enumeration value="restriction"/>
      <xs:enumeration value="list"/>
      <xs:enumeration value="union"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="fullDerivationSet">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
      <xs:documentation>
   #all or (possibly empty) subset of {extension, restriction, list, union}</xs:documentation>
    </xs:annotation>
    <xs:union>
      <xs:simpleType>
        <xs:restriction base="xs:token">
          <xs:enumeration value="#all"/>
        </xs:restriction>
      </xs:simpleType>
      <xs:simpleType>
        <xs:list itemType="xs:typeDerivationControl"/>
      </xs:simpleType>
    </xs:union>
  </xs:simpleType>
  <xs:element name="schema" id="schema">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-schema"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:openAttrs">
          <xs:sequence>
            <xs:choice minOccurs="0" maxOccurs="unbounded">
              <xs:element ref="xs:include"/>
              <xs:element ref="xs:import"/>
              <xs:element ref="xs:redefine"/>
              <xs:element ref="xs:override"/>
              <xs:element ref="xs:annotation"/>
            </xs:choice>
            <xs:sequence minOccurs="0">
              <xs:element ref="xs:defaultOpenContent"/>
              <xs:element ref="xs:annotation" minOccurs="0"
                          maxOccurs="unbounded"/>
            </xs:sequence>
            <xs:sequence minOccurs="0" maxOccurs="unbounded">
              <xs:group ref="xs:schemaTop"/>
              <xs:element ref="xs:annotation" minOccurs="0"
                          maxOccurs="unbounded"/>
            </xs:sequence>
          </xs:sequence>
          <xs:attribute name="targetNamespace" type="xs:anyURI"/>
          <xs:attribute name="version" type="xs:token"/>
          <xs:attribute name="finalDefault" type="xs:fullDerivationSet"
                        default="" use="optional"/>
          <xs:attribute name="blockDefault" type="xs:blockSet" default=""
                        use="optional"/>
          <xs:attribute name="attributeFormDefault" type="xs:formChoice"
                        default="unqualified" use="optional"/>
          <xs:attribute name="elementFormDefault" type="xs:formChoice"
                        default="unqualified" use="optional"/>
          <xs:attribute name="defaultAttributes" type="xs:QName"/>
          <xs:attribute name="xpathDefaultNamespace" type="xs:xpathDefaultNamespace"
                        default="##local" use="optional"/>
          <xs:attribute name="id" type="xs:ID"/>
          <xs:attribute ref="xml:lang"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
    <xs:key name="element">
      <xs:selector xpath="xs:element"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="attribute">
      <xs:selector xpath="xs:attribute"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="type">
      <xs:selector xpath="xs:complexType|xs:simpleType"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="group">
      <xs:selector xpath="xs:group"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="attributeGroup">
      <xs:selector xpath="xs:attributeGroup"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="notation">
      <xs:selector xpath="xs:notation"/>
      <xs:field xpath="@name"/>
    </xs:key>
    <xs:key name="identityConstraint">
      <xs:selector xpath=".//xs:key|.//xs:unique|.//xs:keyref"/>
      <xs:field xpath="@name"/>
    </xs:key>
  </xs:element>
  <xs:simpleType name="allNNI">
    <xs:annotation>
      <xs:documentation>
   for maxOccurs</xs:documentation>
    </xs:annotation>
    <xs:union memberTypes="xs:nonNegativeInteger">
      <xs:simpleType>
        <xs:restriction base="xs:NMTOKEN">
          <xs:enumeration value="unbounded"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:union>
  </xs:simpleType>
  <xs:attributeGroup name="occurs">
    <xs:annotation>
      <xs:documentation>
   for all particles</xs:documentation>
    </xs:annotation>
    <xs:attribute name="minOccurs" type="xs:nonNegativeInteger" default="1"
                  use="optional"/>
    <xs:attribute name="maxOccurs" type="xs:allNNI" default="1" use="optional"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="defRef">
    <xs:annotation>
      <xs:documentation>
   for element, group and attributeGroup,
   which both define and reference</xs:documentation>
    </xs:annotation>
    <xs:attribute name="name" type="xs:NCName"/>
    <xs:attribute name="ref" type="xs:QName"/>
  </xs:attributeGroup>
  <xs:group name="typeDefParticle">
    <xs:annotation>
      <xs:documentation>
   ''complexType'' uses this</xs:documentation>
    </xs:annotation>
    <xs:choice>
      <xs:element name="group" type="xs:groupRef"/>
      <xs:element ref="xs:all"/>
      <xs:element ref="xs:choice"/>
      <xs:element ref="xs:sequence"/>
    </xs:choice>
  </xs:group>
  <xs:group name="nestedParticle">
    <xs:choice>
      <xs:element name="element" type="xs:localElement"/>
      <xs:element name="group" type="xs:groupRef"/>
      
      <xs:element ref="xs:choice"/>
      <xs:element ref="xs:sequence"/>
      <xs:element ref="xs:any"/>
    </xs:choice>
  </xs:group>
  <xs:group name="particle">
    <xs:choice>
      <xs:element name="element" type="xs:localElement"/>
      <xs:element name="group" type="xs:groupRef"/>
      <xs:element ref="xs:all"/>
      <xs:element ref="xs:choice"/>
      <xs:element ref="xs:sequence"/>
      <xs:element ref="xs:any"/>
    </xs:choice>
  </xs:group>
  <xs:complexType name="attribute">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:sequence>
          <xs:element name="simpleType" type="xs:localSimpleType" minOccurs="0"/>
        </xs:sequence>
        <xs:attributeGroup ref="xs:defRef"/>
        <xs:attribute name="type" type="xs:QName"/>
        <xs:attribute name="use" default="optional" use="optional">
          <xs:simpleType>
            <xs:restriction base="xs:NMTOKEN">
              <xs:enumeration value="prohibited"/>
              <xs:enumeration value="optional"/>
              <xs:enumeration value="required"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="default" type="xs:string"/>
        <xs:attribute name="fixed" type="xs:string"/>
        <xs:attribute name="form" type="xs:formChoice"/>
        <xs:attribute name="targetNamespace" type="xs:anyURI"/>
          
        <xs:attribute name="inheritable" type="xs:boolean"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="topLevelAttribute">
    <xs:complexContent>
      <xs:restriction base="xs:attribute">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:element name="simpleType" type="xs:localSimpleType" minOccurs="0"/>
        </xs:sequence>
        <xs:attribute name="ref" use="prohibited"/>
        <xs:attribute name="form" use="prohibited"/>
        <xs:attribute name="use" use="prohibited"/>
        <xs:attribute name="targetNamespace" use="prohibited"/>
        <xs:attribute name="name" type="xs:NCName" use="required"/>
        <xs:attribute name="inheritable" type="xs:boolean"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:group name="attrDecls">
    <xs:sequence>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="attribute" type="xs:attribute"/>
        <xs:element name="attributeGroup" type="xs:attributeGroupRef"/>
      </xs:choice>
      <xs:element ref="xs:anyAttribute" minOccurs="0"/>
    </xs:sequence>
  </xs:group>
  <xs:element name="anyAttribute"  id="anyAttribute">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-anyAttribute"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:wildcard">
          <xs:attribute name="notQName" type="xs:qnameListA"
                        use="optional"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:group name="assertions">
    <xs:sequence>
      <xs:element name="assert" type="xs:assertion"
                  minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="assertion">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:attribute name="test" type="xs:string"/>
        <xs:attribute name="xpathDefaultNamespace" type="xs:xpathDefaultNamespace"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:group name="complexTypeModel">
    <xs:choice>
      <xs:element ref="xs:simpleContent"/>
      <xs:element ref="xs:complexContent"/>
      <xs:sequence>
        <xs:annotation>
          <xs:documentation>
   This branch is short for
   &lt;complexContent>
   &lt;restriction base="xs:anyType">
   ...
   &lt;/restriction>
   &lt;/complexContent></xs:documentation>
        </xs:annotation>
        <xs:element ref="xs:openContent" minOccurs="0"/>
        <xs:group ref="xs:typeDefParticle" minOccurs="0"/>
        <xs:group ref="xs:attrDecls"/>
        <xs:group ref="xs:assertions"/>
      </xs:sequence>
    </xs:choice>
  </xs:group>
  <xs:complexType name="complexType" abstract="true">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:group ref="xs:complexTypeModel"/>
        <xs:attribute name="name" type="xs:NCName">
          <xs:annotation>
            <xs:documentation>
      Will be restricted to required or prohibited</xs:documentation>
          </xs:annotation>
        </xs:attribute>
        <xs:attribute name="mixed" type="xs:boolean" use="optional">
          <xs:annotation>
            <xs:documentation>
      Not allowed if simpleContent child is chosen.
      May be overridden by setting on complexContent child.</xs:documentation>
          </xs:annotation>
        </xs:attribute>
        <xs:attribute name="abstract" type="xs:boolean" default="false"
                      use="optional"/>
        <xs:attribute name="final" type="xs:derivationSet"/>
        <xs:attribute name="block" type="xs:derivationSet"/>
        <xs:attribute name="defaultAttributesApply" type="xs:boolean"
                      default="true" use="optional"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="topLevelComplexType">
    <xs:complexContent>
      <xs:restriction base="xs:complexType">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:complexTypeModel"/>
        </xs:sequence>
        <xs:attribute name="name" type="xs:NCName" use="required"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="localComplexType">
    <xs:complexContent>
      <xs:restriction base="xs:complexType">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:complexTypeModel"/>
        </xs:sequence>
        <xs:attribute name="name" use="prohibited"/>
        <xs:attribute name="abstract" use="prohibited"/>
        <xs:attribute name="final" use="prohibited"/>
        <xs:attribute name="block" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="restrictionType">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:sequence>
          <xs:choice minOccurs="0">
            
            <xs:sequence>
              <xs:element ref="xs:openContent" minOccurs="0"/>
              <xs:group ref="xs:typeDefParticle"/>
            </xs:sequence>
            <xs:group ref="xs:simpleRestrictionModel"/>
          </xs:choice>
          <xs:group ref="xs:attrDecls"/>
          <xs:group ref="xs:assertions"/>
        </xs:sequence>
        <xs:attribute name="base" type="xs:QName" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="complexRestrictionType">
    <xs:complexContent>
      <xs:restriction base="xs:restrictionType">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="0">
            <xs:annotation>
              <xs:documentation>This choice is added simply to
                   make this a valid restriction per the REC</xs:documentation>
            </xs:annotation>
            
            <xs:sequence>
              <xs:element ref="xs:openContent" minOccurs="0"/>
              <xs:group ref="xs:typeDefParticle"/>
            </xs:sequence>
          </xs:choice>
          <xs:group ref="xs:attrDecls"/>
          <xs:group ref="xs:assertions"/>
        </xs:sequence>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="extensionType">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:sequence>
          <xs:element ref="xs:openContent" minOccurs="0"/>
          <xs:group ref="xs:typeDefParticle" minOccurs="0"/>
          <xs:group ref="xs:attrDecls"/>
          <xs:group ref="xs:assertions"/>
        </xs:sequence>
        <xs:attribute name="base" type="xs:QName" use="required"/>
        
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="complexContent" id="complexContent">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-complexContent"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:choice>
            <xs:element name="restriction" type="xs:complexRestrictionType"/>
            <xs:element name="extension" type="xs:extensionType"/>
          </xs:choice>
          <xs:attribute name="mixed" type="xs:boolean">
            <xs:annotation>
              <xs:documentation>
       Overrides any setting on complexType parent.</xs:documentation>
            </xs:annotation>
          </xs:attribute>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="openContent" id="openContent">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-openContent"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:sequence>
            <xs:element name="any" minOccurs="0" type="xs:wildcard"/>
          </xs:sequence>
          <xs:attribute name="mode" default="interleave" use="optional">
            <xs:simpleType>
              <xs:restriction base="xs:NMTOKEN">
                <xs:enumeration value="none"/>
                <xs:enumeration value="interleave"/>
                <xs:enumeration value="suffix"/>
              </xs:restriction>
            </xs:simpleType>
          </xs:attribute>
          
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="defaultOpenContent" id="defaultOpenContent">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-defaultOpenContent"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:sequence>
            <xs:element name="any" type="xs:wildcard"/>
          </xs:sequence>
          <xs:attribute name="appliesToEmpty" type="xs:boolean"
                        default="false" use="optional"/>
          <xs:attribute name="mode" default="interleave" use="optional">
            <xs:simpleType>
              <xs:restriction base="xs:NMTOKEN">
                <xs:enumeration value="interleave"/>
                <xs:enumeration value="suffix"/>
              </xs:restriction>
            </xs:simpleType>
          </xs:attribute>
          
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:complexType name="simpleRestrictionType">
    <xs:complexContent>
      <xs:restriction base="xs:restrictionType">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="0">
            <xs:annotation>
              <xs:documentation>This choice is added simply to
                   make this a valid restriction per the REC</xs:documentation>
            </xs:annotation>
            <xs:group ref="xs:simpleRestrictionModel"/>
          </xs:choice>
          <xs:group ref="xs:attrDecls"/>
          <xs:group ref="xs:assertions"/>
        </xs:sequence>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="simpleExtensionType">
    <xs:complexContent>
      <xs:restriction base="xs:extensionType">
        <xs:sequence>
          <xs:annotation>
            <xs:documentation>
      No typeDefParticle group reference</xs:documentation>
          </xs:annotation>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:attrDecls"/>
          <xs:group ref="xs:assertions"/>
        </xs:sequence>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="simpleContent" id="simpleContent">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-simpleContent"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:choice>
            <xs:element name="restriction" type="xs:simpleRestrictionType"/>
            <xs:element name="extension" type="xs:simpleExtensionType"/>
          </xs:choice>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="complexType" type="xs:topLevelComplexType" id="complexType">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-complexType"/>
    </xs:annotation>
  </xs:element>
  <xs:simpleType name="blockSet">
    <xs:annotation>
      <xs:documentation>
    A utility type, not for public use</xs:documentation>
      <xs:documentation>
    #all or (possibly empty) subset of {substitution, extension,
    restriction}</xs:documentation>
    </xs:annotation>
    <xs:union>
      <xs:simpleType>
        <xs:restriction base="xs:token">
          <xs:enumeration value="#all"/>
        </xs:restriction>
      </xs:simpleType>
      <xs:simpleType>
        <xs:list>
          <xs:simpleType>
            <xs:restriction base="xs:derivationControl">
              <xs:enumeration value="extension"/>
              <xs:enumeration value="restriction"/>
              <xs:enumeration value="substitution"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:list>
      </xs:simpleType>
    </xs:union>
  </xs:simpleType>
  <xs:complexType name="element" abstract="true">
    <xs:annotation>
      <xs:documentation>
   The element element can be used either
   at the top level to define an element-type binding globally,
   or within a content model to either reference a globally-defined
   element or type or declare an element-type binding locally.
   The ref form is not allowed at the top level.</xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:sequence>
          <xs:choice minOccurs="0">
            <xs:element name="simpleType" type="xs:localSimpleType"/>
            <xs:element name="complexType" type="xs:localComplexType"/>
          </xs:choice>
          <xs:element name="alternative" type="xs:altType" 
                    minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xs:identityConstraint" minOccurs="0"
                    maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attributeGroup ref="xs:defRef"/>
        <xs:attribute name="type" type="xs:QName"/>
        
        <xs:attribute name="substitutionGroup">
         <xs:simpleType>
          <xs:list itemType="xs:QName"/>
         </xs:simpleType>
        </xs:attribute>
        <xs:attributeGroup ref="xs:occurs"/>
        <xs:attribute name="default" type="xs:string"/>
        <xs:attribute name="fixed" type="xs:string"/>
        <xs:attribute name="nillable" type="xs:boolean" use="optional"/>
        <xs:attribute name="abstract" type="xs:boolean" default="false"
                      use="optional"/>
        <xs:attribute name="final" type="xs:derivationSet"/>
        <xs:attribute name="block" type="xs:blockSet"/>
        <xs:attribute name="form" type="xs:formChoice"/>
        <xs:attribute name="targetNamespace" type="xs:anyURI"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="topLevelElement">
    <xs:complexContent>
      <xs:restriction base="xs:element">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="0">
            <xs:element name="simpleType" type="xs:localSimpleType"/>
            <xs:element name="complexType" type="xs:localComplexType"/>
          </xs:choice>
          <xs:element name="alternative" type="xs:altType" 
                    minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xs:identityConstraint" minOccurs="0"
                    maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="ref" use="prohibited"/>
        <xs:attribute name="form" use="prohibited"/>
        <xs:attribute name="targetNamespace" use="prohibited"/>
        <xs:attribute name="minOccurs" use="prohibited"/>
        <xs:attribute name="maxOccurs" use="prohibited"/>
        <xs:attribute name="name" type="xs:NCName" use="required"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="localElement">
    <xs:complexContent>
      <xs:restriction base="xs:element">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="0">
            <xs:element name="simpleType" type="xs:localSimpleType"/>
            <xs:element name="complexType" type="xs:localComplexType"/>
          </xs:choice>
          <xs:element name="alternative" type="xs:altType" 
                    minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xs:identityConstraint" minOccurs="0"
                    maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="substitutionGroup" use="prohibited"/>
        <xs:attribute name="final" use="prohibited"/>
        <xs:attribute name="abstract" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="element" type="xs:topLevelElement" id="element">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-element"/>
    </xs:annotation>
  </xs:element>
  <xs:complexType name="altType">
    <xs:annotation>
      <xs:documentation>
        This type is used for ''alternative'' elements.
      </xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:choice minOccurs="0">
          <xs:element name="simpleType" type="xs:localSimpleType"/>
          <xs:element name="complexType" type="xs:localComplexType"/>
        </xs:choice>
        <xs:attribute name="test" type="xs:string" use="optional"/>
        <xs:attribute name="type" type="xs:QName" use="optional"/>
        <xs:attribute name="xpathDefaultNamespace" type="xs:xpathDefaultNamespace"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="group" abstract="true">
    <xs:annotation>
      <xs:documentation>
   group type for explicit groups, named top-level groups and
   group references</xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        
          <xs:group ref="xs:particle" minOccurs="0" maxOccurs="unbounded"/>
          
        <xs:attributeGroup ref="xs:defRef"/>
        <xs:attributeGroup ref="xs:occurs"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="realGroup">
    <xs:complexContent>
      <xs:restriction base="xs:group">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="0" maxOccurs="1">
            <xs:element ref="xs:all"/>
            <xs:element ref="xs:choice"/>
            <xs:element ref="xs:sequence"/>
          </xs:choice>
          
        </xs:sequence>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="namedGroup">
    <xs:complexContent>
      <xs:restriction base="xs:realGroup">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:choice minOccurs="1" maxOccurs="1">
            <xs:element name="all">
              <xs:complexType>
                <xs:complexContent>
                  <xs:restriction base="xs:all">
                    <xs:group ref="xs:allModel"/>
                    <xs:attribute name="minOccurs" use="prohibited"/>
                    <xs:attribute name="maxOccurs" use="prohibited"/>
                    <xs:anyAttribute namespace="##other" processContents="lax"/>
                  </xs:restriction>
                </xs:complexContent>
              </xs:complexType>
            </xs:element>
            <xs:element name="choice" type="xs:simpleExplicitGroup"/>
            <xs:element name="sequence" type="xs:simpleExplicitGroup"/>
          </xs:choice>
        </xs:sequence>
        <xs:attribute name="name" type="xs:NCName" use="required"/>
        <xs:attribute name="ref" use="prohibited"/>
        <xs:attribute name="minOccurs" use="prohibited"/>
        <xs:attribute name="maxOccurs" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="groupRef">
    <xs:complexContent>
      <xs:restriction base="xs:realGroup">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
        </xs:sequence>
        <xs:attribute name="ref" type="xs:QName" use="required"/>
        <xs:attribute name="name" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="explicitGroup">
    <xs:annotation>
      <xs:documentation>
   group type for the three kinds of group</xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:restriction base="xs:group">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:nestedParticle" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="name" use="prohibited"/>
        <xs:attribute name="ref" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="simpleExplicitGroup">
    <xs:complexContent>
      <xs:restriction base="xs:explicitGroup">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:nestedParticle" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="minOccurs" use="prohibited"/>
        <xs:attribute name="maxOccurs" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:group name="allModel">
    <xs:sequence>
      <xs:element ref="xs:annotation" minOccurs="0"/>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:annotation>
          <xs:documentation>This choice with min/max is here to
                          avoid a pblm with the Elt:All/Choice/Seq
                          Particle derivation constraint</xs:documentation>
        </xs:annotation>
        <xs:element name="element" type="xs:localElement"/>
        <xs:element ref="xs:any"/>
        <xs:element name="group">
          <xs:complexType>
            <xs:sequence>
              <xs:element ref="xs:annotation" minOccurs="0"/>
            </xs:sequence>
            <xs:attribute name="ref" type="xs:QName" use="required"/>
            <xs:attribute name="minOccurs" fixed="1" type="xs:nonNegativeInteger"/>
            <xs:attribute name="maxOccurs" fixed="1" type="xs:nonNegativeInteger"/>
            <xs:anyAttribute namespace="##other" processContents="lax"/>
          </xs:complexType>
        </xs:element>
      </xs:choice>
    </xs:sequence>
  </xs:group>
  <xs:complexType name="all">
    <xs:annotation>
      <xs:documentation>
   Only elements allowed inside</xs:documentation>
    </xs:annotation>
    <xs:complexContent>
      <xs:restriction base="xs:explicitGroup">
        <xs:group ref="xs:allModel"/>
        <xs:attribute name="minOccurs" default="1" use="optional">
          <xs:simpleType>
            <xs:restriction base="xs:nonNegativeInteger">
              <xs:enumeration value="0"/>
              <xs:enumeration value="1"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="maxOccurs" default="1" use="optional">
          <xs:simpleType>
            <xs:restriction base="xs:allNNI">
              <xs:enumeration value="0"/>
              <xs:enumeration value="1"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="all" type="xs:all" id="all">
    <xs:annotation>
      <xs:documentation source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-all"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="choice" type="xs:explicitGroup" id="choice">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-choice"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="sequence" type="xs:explicitGroup" id="sequence">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-sequence"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="group" type="xs:namedGroup" id="group">
    <xs:annotation>
      <xs:documentation source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-group"/>
    </xs:annotation>
  </xs:element>
  <xs:attributeGroup name="anyAttrGroup">
    <xs:attribute name="namespace" type="xs:namespaceList"
                  use="optional"/>
    <xs:attribute name="notNamespace" use="optional">
      <xs:simpleType>
        <xs:restriction base="xs:basicNamespaceList">
          <xs:minLength value="1"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="processContents" default="strict" use="optional">
      <xs:simpleType>
        <xs:restriction base="xs:NMTOKEN">
          <xs:enumeration value="skip"/>
          <xs:enumeration value="lax"/>
          <xs:enumeration value="strict"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:attribute>
  </xs:attributeGroup>
  <xs:complexType name="wildcard">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        
         <xs:attributeGroup ref="xs:anyAttrGroup"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="any" id="any">
    <xs:annotation>
      <xs:documentation source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-any"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:wildcard">
          <xs:attribute name="notQName" type="xs:qnameList"
                        use="optional"/>
          <xs:attributeGroup ref="xs:occurs"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:annotation>
    <xs:documentation>
   simple type for the value of the ''namespace'' attr of
   ''any'' and ''anyAttribute''</xs:documentation>
  </xs:annotation>
  <xs:annotation>
    <xs:documentation>
   Value is
              ##any      - - any non-conflicting WFXML/attribute at all

              ##other    - - any non-conflicting WFXML/attribute from
                              namespace other than targetNS

              ##local    - - any unqualified non-conflicting WFXML/attribute 

              one or     - - any non-conflicting WFXML/attribute from
              more URI        the listed namespaces
              references
              (space separated)

    ##targetNamespace or ##local may appear in the above list, to
        refer to the targetNamespace of the enclosing
        schema or an absent targetNamespace respectively</xs:documentation>
  </xs:annotation>
  <xs:simpleType name="namespaceList">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    
    <xs:union memberTypes="xs:specialNamespaceList xs:basicNamespaceList" />
  </xs:simpleType>
  <xs:simpleType name="basicNamespaceList">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    <xs:list>
      <xs:simpleType>
        <xs:union memberTypes="xs:anyURI">
          <xs:simpleType>
            <xs:restriction base="xs:token">
              <xs:enumeration value="##targetNamespace"/>
              <xs:enumeration value="##local"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:union>
      </xs:simpleType>
    </xs:list>
  </xs:simpleType>
  <xs:simpleType name="specialNamespaceList">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:token">
      <xs:enumeration value="##any"/>
      <xs:enumeration value="##other"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="qnameList">
    <xs:annotation>
      <xs:documentation>
        A utility type, not for public use
      </xs:documentation>
    </xs:annotation>
    <xs:list>
      <xs:simpleType>
        <xs:union memberTypes="xs:QName">
          <xs:simpleType>
            <xs:restriction base="xs:token">
              <xs:enumeration value="##defined"/>
              <xs:enumeration value="##definedSibling"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:union>
      </xs:simpleType>
    </xs:list>
  </xs:simpleType>
  <xs:simpleType name="qnameListA">
    <xs:annotation>
      <xs:documentation>
        A utility type, not for public use
      </xs:documentation>
    </xs:annotation>
    <xs:list>
      <xs:simpleType>
        <xs:union memberTypes="xs:QName">
          <xs:simpleType>
            <xs:restriction base="xs:token">
              <xs:enumeration value="##defined"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:union>
      </xs:simpleType>
    </xs:list>
  </xs:simpleType>
  <xs:simpleType name="xpathDefaultNamespace">
    <xs:union memberTypes="xs:anyURI">
      <xs:simpleType>
        <xs:restriction base="xs:token">
          <xs:enumeration value="##defaultNamespace"/>
          <xs:enumeration value="##targetNamespace"/>
          <xs:enumeration value="##local"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:union>
  </xs:simpleType>
  <xs:element name="attribute" type="xs:topLevelAttribute" id="attribute">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-attribute"/>
    </xs:annotation>
  </xs:element>
  <xs:complexType name="attributeGroup" abstract="true">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        
          <xs:group ref="xs:attrDecls"/>
          
        <xs:attributeGroup ref="xs:defRef"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="namedAttributeGroup">
    <xs:complexContent>
      <xs:restriction base="xs:attributeGroup">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
          <xs:group ref="xs:attrDecls"/>
          
        </xs:sequence>
        <xs:attribute name="name" type="xs:NCName" use="required"/>
        <xs:attribute name="ref" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="attributeGroupRef">
    <xs:complexContent>
      <xs:restriction base="xs:attributeGroup">
        <xs:sequence>
          <xs:element ref="xs:annotation" minOccurs="0"/>
        </xs:sequence>
        <xs:attribute name="ref" type="xs:QName" use="required"/>
        <xs:attribute name="name" use="prohibited"/>
        <xs:anyAttribute namespace="##other" processContents="lax"/>
      </xs:restriction>
    </xs:complexContent>
  </xs:complexType>
  <xs:element name="attributeGroup" type="xs:namedAttributeGroup"
              id="attributeGroup">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-attributeGroup"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="include" id="include">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-include"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:attribute name="schemaLocation" type="xs:anyURI" use="required"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="redefine" id="redefine">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-redefine"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:openAttrs">
          <xs:choice minOccurs="0" maxOccurs="unbounded">
            <xs:element ref="xs:annotation"/>
            <xs:group ref="xs:redefinable"/>
          </xs:choice>
          <xs:attribute name="schemaLocation" type="xs:anyURI" use="required"/>
          <xs:attribute name="id" type="xs:ID"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>

  <xs:element name="override" id="override">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-override"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:openAttrs">
          <xs:sequence>
            <xs:element ref="xs:annotation" minOccurs="0"/>
            <xs:group ref="xs:schemaTop" minOccurs="0" maxOccurs="unbounded"/>
          </xs:sequence>
          <xs:attribute name="schemaLocation" type="xs:anyURI" use="required"/>
          <xs:attribute name="id" type="xs:ID"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="import" id="import">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-import"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:attribute name="namespace" type="xs:anyURI"/>
          <xs:attribute name="schemaLocation" type="xs:anyURI"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="selector" id="selector">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-selector"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:attribute name="xpath" use="required">
            <xs:simpleType>
              <xs:annotation>
                <xs:documentation>A subset of XPath expressions for use
in selectors</xs:documentation>
                <xs:documentation>A utility type, not for public
use</xs:documentation>
              </xs:annotation>
              <xs:restriction base="xs:token"/>
                
            </xs:simpleType>
          </xs:attribute>
          <xs:attribute name="xpathDefaultNamespace" type="xs:xpathDefaultNamespace"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="field" id="field">
    <xs:annotation>
      <xs:documentation source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-field"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:attribute name="xpath" use="required">
            <xs:simpleType>
              <xs:annotation>
                <xs:documentation>A subset of XPath expressions for use
in fields</xs:documentation>
                <xs:documentation>A utility type, not for public
use</xs:documentation>
              </xs:annotation>
              <xs:restriction base="xs:token"/>
                
            </xs:simpleType>
          </xs:attribute>
          <xs:attribute name="xpathDefaultNamespace" type="xs:xpathDefaultNamespace"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:complexType name="keybase">
    <xs:complexContent>
      <xs:extension base="xs:annotated">
        <xs:sequence minOccurs="0">
          <xs:element ref="xs:selector"/>
          <xs:element ref="xs:field" minOccurs="1" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="name" type="xs:NCName"/>
        <xs:attribute name="ref" type="xs:QName"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:group name="identityConstraint">
    <xs:annotation>
      <xs:documentation>The three kinds of identity constraints, all with
                     type of or derived from ''keybase''.
   </xs:documentation>
    </xs:annotation>
    <xs:choice>
      <xs:element ref="xs:unique"/>
      <xs:element ref="xs:key"/>
      <xs:element ref="xs:keyref"/>
    </xs:choice>
  </xs:group>
  <xs:element name="unique" type="xs:keybase" id="unique">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-unique"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="key" type="xs:keybase" id="key">
    <xs:annotation>
      <xs:documentation source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-key"/>
    </xs:annotation>
  </xs:element>
  <xs:element name="keyref" id="keyref">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-keyref"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:keybase">
          <xs:attribute name="refer" type="xs:QName"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="notation" id="notation">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-notation"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:annotated">
          <xs:attribute name="name" type="xs:NCName" use="required"/>
          <xs:attribute name="public" type="xs:public"/>
          <xs:attribute name="system" type="xs:anyURI"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="public">
    <xs:annotation>
      <xs:documentation>
   A utility type, not for public use</xs:documentation>
      <xs:documentation>
   A public identifier, per ISO 8879</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:token"/>
  </xs:simpleType>
  <xs:element name="appinfo" id="appinfo">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-appinfo"/>
    </xs:annotation>
    <xs:complexType mixed="true">
      <xs:sequence minOccurs="0" maxOccurs="unbounded">
        <xs:any processContents="lax"/>
      </xs:sequence>
      <xs:attribute name="source" type="xs:anyURI"/>
      <xs:anyAttribute namespace="##other" processContents="lax"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="documentation" id="documentation">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-documentation"/>
    </xs:annotation>
    <xs:complexType mixed="true">
      <xs:sequence minOccurs="0" maxOccurs="unbounded">
        <xs:any processContents="lax"/>
      </xs:sequence>
      <xs:attribute name="source" type="xs:anyURI"/>
      <xs:attribute ref="xml:lang"/>
      <xs:anyAttribute namespace="##other" processContents="lax"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="annotation" id="annotation">
    <xs:annotation>
      <xs:documentation
           source="http://www.w3.org/TR/2009/WD-xmlschema11-1-20091203/structures.html#element-annotation"/>
    </xs:annotation>
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xs:openAttrs">
          <xs:choice minOccurs="0" maxOccurs="unbounded">
            <xs:element ref="xs:appinfo"/>
            <xs:element ref="xs:documentation"/>
          </xs:choice>
          <xs:attribute name="id" type="xs:ID"/>
        </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xs:element>
  <xs:annotation>
    <xs:documentation>
   notations for use within  schema documents</xs:documentation>
  </xs:annotation>
  <xs:notation name="XMLSchemaStructures" public="structures"
               system="http://www.w3.org/2000/08/XMLSchema.xsd"/>
  <xs:notation name="XML" public="REC-xml-19980210"
               system="http://www.w3.org/TR/1998/REC-xml-19980210"/>
  <xs:complexType name="anyType" mixed="true">
    <xs:annotation>
      <xs:documentation>
   Not the real urType, but as close an approximation as we can
   get in the XML representation</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:any minOccurs="0" maxOccurs="unbounded" processContents="lax"/>
    </xs:sequence>
    <xs:anyAttribute processContents="lax"/>
  </xs:complexType>

  <xs:annotation>
    <xs:documentation>
      In keeping with the XML Schema WG''s standard versioning policy, 
      this schema document will persist at the URI
      http://www.w3.org/2009/12/XMLSchema.xsd.

      At the date of issue it can also be found at the URI
      http://www.w3.org/2009/XMLSchema/XMLSchema.xsd.

      The schema document at that URI may however change in the future, 
      in order to remain compatible with the latest version of XSD 
      and its namespace.  In other words, if XSD or the XML Schema 
      namespace change, the version of this document at 
      http://www.w3.org/2009/XMLSchema/XMLSchema.xsd will change accordingly; 
      the version at http://www.w3.org/2009/12/XMLSchema.xsd will not change.

      Previous dated (and unchanging) versions of this schema document 
      include:

        http://www.w3.org/2009/04/XMLSchema.xsd
          (XSD 1.1 Candidate Recommendation)

        http://www.w3.org/2004/10/XMLSchema.xsd
          (XSD 1.0 Recommendation, Second Edition)

        http://www.w3.org/2001/05/XMLSchema.xsd
          (XSD 1.0 Recommendation, First Edition)

    </xs:documentation>
  </xs:annotation>


</xs:schema>'
]
