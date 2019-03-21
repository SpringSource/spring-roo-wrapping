<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
			<xsl:apply-templates/>
		</html>
	</xsl:template>
	
	<xsl:template match="repository">
		
		<head>
			<META HTTP-EQUIV="Content-Type"
				CONTENT="text/html; charset=iso-8859-1"/>
			<title>
				<xsl:value-of select="@name"/>
			</title>
						
			<!-- =========================================================== -->
			<!-- CSS resources			                                     -->
			<!-- =========================================================== -->
			<link href="repository.css" type="text/css" rel="stylesheet"/>
			<link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
			<link href="style.css" type="text/css" rel="stylesheet"/>

		</head>

		<body>

			<xsl:call-template name="header"/>

			<div class="container">
				<h1> <xsl:value-of select="@name"/></h1>
				<p class="text-right"><em>Last modified 	
				<xsl:value-of select="@lastmodified"/></em></p>

				<table class="table table-striped table-hover table-condensed">
					<thead>
						<tr class="info"><th>Link</th><th>Version</th><th>Description</th></tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="resource">
							<xsl:sort select="@presentationname"/>
						</xsl:apply-templates>
					</tbody>
				</table>
			</div>


			<xsl:call-template name="footer"/>

		</body>
	</xsl:template>
	

	<!-- =========================================================== -->
	<!-- Row Resource Templates                                      -->
	<!-- =========================================================== -->

	<xsl:template match="resource">
		<tr>
			<td>
				<a href="{normalize-space(@uri)}"><xsl:value-of select="@presentationname"/></a>
				
			</td>
			<td><xsl:value-of select="@version"/></td>			
			<td>
				<xsl:value-of select="description"/>
			</td>			
		</tr>
		
	</xsl:template>
	

	<!-- =========================================================== -->
	<!-- Header Templates                                            -->
	<!-- =========================================================== -->

	<xsl:template name="header">
	  	<header id="masthead" class="blog-background overlay align-center align-bottom animated from-bottom animation-on"> 
				
	  
			<div class="inner">
			    <div class="container">
			    	<a class="brand light" href="https://projects.spring.io/spring-roo" role="banner" itemprop="url">
			    		<img itemprop="logo" src="https://projects.spring.io/spring-roo/img/project-icon-large.png" alt="Spring Roo Logo" />
			    	</a>
			    	<h2 class="light" itemprop="description">
			    		Spring Roo Wrapping Repository
			    	</h2>
			    	<h3 class="blog-description light">
			    		This Spring Roo OSGi repository contains several standard JARs converted into OSGi bundles for Spring Roo usage.
			    	</h3>
			    </div>
			</div>	    
		</header> 

	</xsl:template>

	<!-- ========================================================== -->
	<!-- Footer Templates                                           -->
	<!-- ========================================================== -->	

	<xsl:template name="footer">

		<a style="display: inline;" class="scrollup" href="#" rel="tooltip" data-original-title="" data-placement="left"></a>

		<footer id="footer" class="blog-background overlay text-center align-middle animated from-top animation-on" style="background-color:#4B731D;">

	        <div class="container">
	            <div>
	                <p class="rss-subscribe text-center">
	                  Spring Roo © 2015 
	                </p>
	                <p class="rss-subscribe text-center">
	                 <a data-original-title="Spring Roo Project Page" href="https://projects.spring.io/spring-roo/" target="_blank" data-toggle="tooltip" title="">Spring Roo</a>
	                </p>
	            </div>
	        </div>
		</footer>

  
	</xsl:template>


	
</xsl:stylesheet>