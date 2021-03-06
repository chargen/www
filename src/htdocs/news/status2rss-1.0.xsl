<?xml version='1.0'?>
<!-- make sure your changes here validate on www.feedvalidator.org -->
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY % site-entities SYSTEM "../entities.site">
  %site-entities;
]>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="status">
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns="http://purl.org/rss/1.0/"
>
<channel rdf:about="http://www.gstreamer.net/status/">
  <title>GStreamer Status</title>
  <link>&site;/</link>
  <description>GStreamer status newsletters</description>
  <items>
    <rdf:Seq>
      <rdf:li rdf:resource="..."/>
<xsl:for-each select="item">
  <xsl:sort data-type="text" select="date" order="descending" />
  <xsl:variable name="w3cdtf">
    <xsl:value-of select="substring(date,1,10)"/>
    <xsl:text>T</xsl:text>
    <xsl:value-of select="substring(date,12,16)"/>
    <xsl:text>:00Z</xsl:text>
  </xsl:variable>
  <rdf:li rdf:resource="&site;/news/status.html#{$w3cdtf}"/>
</xsl:for-each>
    </rdf:Seq>
  </items>
</channel>

<xsl:for-each select="item">
  <xsl:sort data-type="text" select="date" order="descending" />
  <xsl:variable name="w3cdtf">
    <xsl:value-of select="substring(date,1,10)"/>
    <xsl:text>T</xsl:text>
    <xsl:value-of select="substring(date,12,16)"/>
    <xsl:text>:00Z</xsl:text>
  </xsl:variable>
  <item rdf:about="&site;/news/status.html#{$w3cdtf}">
    <title><xsl:value-of select="title"/></title>
    <link>&site;/news/#<xsl:value-of select="$w3cdtf"/></link>
    <dc:date><xsl:value-of select="$w3cdtf"/></dc:date>
    <content:encoded>
      <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><xsl:copy-of select="content/*"/><xsl:text disable-output-escaping="yes">]]&gt;</xsl:text></content:encoded>
  </item>
</xsl:for-each>
</rdf:RDF>

</xsl:template>

</xsl:stylesheet>
