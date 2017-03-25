# suman
tuition folder for Suman


# Basic Elements
These are some of the basic html element names and their attributes

- h1(element)
    - color(attribute), size(attribute), font
- h2
- h3
- p
- img
    - src
- a
    -href

- ul
- li

# XSL Template

This means that I am in the root folder about to do/display things with my xml data

<xsl:template match="/"></xsl:template>


# Loop

<xsl:for-each select="/rootfolder/childrenelement">...your suttff</xsl:for-each>

<xsl:for-each select="/students/student">...</xsl:for-each>


# Image
<img src="{personaldetails/photo}" />

# Value of
If you want to pull out some values from your xml and show it here

<xsl:value-of select="path" />
<xsl:value-of select="personaldetails/id" />