<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
    xmlns="http://schemas.microsoft.com/wix/2006/wi">

	<xsl:template match="@*|*">
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates select="*" />
		</xsl:copy>
	</xsl:template>
	<xsl:output method="xml" indent="yes" />

	<xsl:key name="file-search" match="wix:Component[contains(wix:File/@Source, 'logger.db')]" use="@Id"/>

	<!--
  Caution this filters all Files with pattern logger.db. These files must be excluded
  -->

	<xsl:template match="wix:Component[key('file-search', @Id)]" />
	<xsl:template match="wix:ComponentRef[key('file-search', @Id)]" />


</xsl:stylesheet>